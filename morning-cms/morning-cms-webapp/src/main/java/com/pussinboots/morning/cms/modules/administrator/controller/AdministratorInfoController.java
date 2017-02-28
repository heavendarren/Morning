package com.pussinboots.morning.cms.modules.administrator.controller;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pussinboots.morning.cms.common.security.AuthorizingUser;
import com.pussinboots.morning.cms.common.util.SingletonLoginUtils;
import com.pussinboots.morning.cms.modules.administrator.entity.Role;
import com.pussinboots.morning.cms.modules.administrator.entity.User;
import com.pussinboots.morning.cms.modules.administrator.entity.UserLoginLog;
import com.pussinboots.morning.cms.modules.administrator.service.IUserLoginLogService;
import com.pussinboots.morning.cms.modules.administrator.service.IUserRoleService;
import com.pussinboots.morning.cms.modules.administrator.service.IUserService;
import com.pussinboots.morning.cms.modules.administrator.vo.UserVO;
import com.pussinboots.morning.common.controller.BaseController;
import com.pussinboots.morning.common.enums.StatusEnum;
import com.pussinboots.morning.common.exception.ValidateException;
import com.pussinboots.morning.common.result.ResponseResult;
import com.pussinboots.morning.common.util.RegexUtils;

/**
 * 
* 项目名称：morning-cms-webapp   
* 类名称：AdministratorInfoController   
* 类描述：个人信息表示层控制器 
* 创建人：陈星星   
* 创建时间：2017年2月17日 上午12:27:26
 */
@Controller
@RequestMapping(value = "/administrator/info")
public class AdministratorInfoController extends BaseController {
	
	private static Logger logger = LoggerFactory.getLogger(AdministratorInfoController.class);
	
	/** 个人信息 */
	private static final String ADMIN_USER_INFO = getViewPath("modules/admin/admin_user_info");
	
	@Autowired
	private IUserService userService;
	@Autowired
	private IUserLoginLogService userLoginLogService;
	@Autowired
	private IUserRoleService userRoleService;
	
	/**
	 * GET 管理员个人信息
	 * @return
	 */
	@RequiresPermissions("administrator:info:view")
	@GetMapping(value = { "", "/view" })
	public String view(Model model) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		
		// 用户信息
		UserVO userVO = userService.selectByUserId(authorizingUser.getUserId());
		model.addAttribute("user", userVO);
		
		// 用户日志
		List<UserLoginLog> userLoginLogs = userLoginLogService.selectUserLoginLog(userVO.getUserId());
		model.addAttribute("userLoginLogs", userLoginLogs);
		
		// 用户权限
		List<Role> roles = userRoleService.selectRolesByUserId(userVO.getUserId(), StatusEnum.NORMAL.getStatus());
		model.addAttribute("roles", roles);
		
		return ADMIN_USER_INFO;
	}
	
	/**
	 * POST 更新管理员信息
	 * @param user
	 * @return
	 */
	@RequiresPermissions("administrator:info:edit")
	@PostMapping(value = "/edit")
	@ResponseBody
	public ResponseResult edit(User user) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			user.setUserId(authorizingUser.getUserId());
			userService.updateUserInfo(user, authorizingUser);
			return success(true);
		} else {
			return fail(false, "您未登录或者登录已超时,请先登录!");
		}
	}
	
	/**
	 * POST 修改管理员密码
	 * @return
	 */
	@RequiresPermissions("administrator:info:edit")
	@PostMapping(value = "/edit/psw")
	@ResponseBody
	public ResponseResult editPwd() {
		String nowPassword = getParameter("nowPassword");// 原密码
		String newPassword = getParameter("newPassword");// 新密码
		String confirmPwd = getParameter("confirmPwd");// 确认密码

		if (!RegexUtils.isPassword(newPassword)) {
			return fail(false, "密码长度8~16位，其中数字，字母和符号至少包含两种!");
		}
		if (!newPassword.equals(confirmPwd)) {
			return fail(false, "两次输入的新密码不一致!");
		}

		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			try {
				userService.updateUserPsw(nowPassword, newPassword, authorizingUser);
			} catch (ValidateException e) {
				logger.error(e.getMessage(), e);
				return fail(false, e.getMessage());
			}
			return success(true, "修改成功!");
		} else {
			return fail(false, "您未登录或者登录已超时,请先登录!");
		}
	}
}
