package org.pussinboots.morning.cms.controller.administrator;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.pussinboots.morning.administrator.common.constant.UserReturnCode;
import org.pussinboots.morning.administrator.entity.Role;
import org.pussinboots.morning.administrator.entity.User;
import org.pussinboots.morning.administrator.entity.UserLoginLog;
import org.pussinboots.morning.administrator.pojo.vo.UserVO;
import org.pussinboots.morning.administrator.service.IUserLoginLogService;
import org.pussinboots.morning.administrator.service.IUserRoleService;
import org.pussinboots.morning.administrator.service.IUserService;
import org.pussinboots.morning.cms.common.result.CmsPageResult;
import org.pussinboots.morning.cms.common.result.CmsResult;
import org.pussinboots.morning.cms.common.security.AuthorizingUser;
import org.pussinboots.morning.cms.common.util.SingletonLoginUtils;
import org.pussinboots.morning.common.base.BaseController;
import org.pussinboots.morning.common.base.BasePageDTO;
import org.pussinboots.morning.common.constant.CommonReturnCode;
import org.pussinboots.morning.common.enums.StatusEnum;
import org.pussinboots.morning.common.exception.ValidateException;
import org.pussinboots.morning.common.support.page.PageInfo;
import org.pussinboots.morning.common.util.RegexUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 
* 项目名称：morning-cms-web Maven Webapp   
* 类名称：AdministratorInfoController   
* 类描述：管理员个人信息表示层控制器         
* 创建人：陈星星   
* 创建时间：2017年4月2日 上午1:49:53   
*
 */
@Controller
@RequestMapping(value = "/administrator/info")
@Api(value = "管理员个人信息", description = "管理员个人信息")
public class AdministratorInfoController extends BaseController {
	
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
	@ApiOperation(value = "管理员个人信息", notes = "管理员信息/管理员日志列表/管理员权限")  
	@RequiresPermissions("administrator:info:view")
	@GetMapping(value = "/view")
	public String getInfoPage(Model model) {
		
		// 管理员信息
		UserVO userVO = userService.getById(SingletonLoginUtils.getUserId());
		model.addAttribute("user", userVO);

		// 管理员权限
		List<Role> roles = userRoleService.listByUserId(SingletonLoginUtils.getUserId(), StatusEnum.NORMAL.getStatus());
		model.addAttribute("roles", roles);
		
		return "/modules/admin/admin_user_info";
	}
	
	/**
	 * GET 管理员个人登录日志
	 * @param pageInfo
	 * @param search
	 * @return
	 */
	@ApiOperation(value = "管理员个人登录日志", notes = "管理员个人登录日志")  
	@RequiresPermissions("administrator:info:view")
	@GetMapping(value = "/logs")
	@ResponseBody
	public Object listLogs(PageInfo pageInfo, @RequestParam(required = false, value = "search") String search) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();

		if (authorizingUser != null) {
			// 管理员日志
			BasePageDTO<UserLoginLog> basePageDTO = userLoginLogService.listByUserId(authorizingUser.getUserId(),
					pageInfo, search);
			return new CmsPageResult(basePageDTO.getList(), basePageDTO.getPageInfo().getTotal());
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
	
	/**
	 * PUT 更新管理员信息
	 * @param user
	 * @return
	 */
	@ApiOperation(value = "更新管理员个人信息", notes = "管理员名/真实姓名/性别/年龄/电话/电子邮箱")  
	@RequiresPermissions("administrator:info:edit")
	@PutMapping(value = "/edit")
	@ResponseBody
	public Object updateUser(User user) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			user.setUserId(authorizingUser.getUserId());
			user.setUpdateBy(authorizingUser.getUserName());
			int count = userService.updateByUserId(user);
			return new CmsResult(CommonReturnCode.SUCCESS, count);
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
	
	/**
	 * POST 修改管理员密码
	 * @return
	 */
	@ApiOperation(value = "更新管理员密码", notes = "原密码/新密码/确认密码")  
	@RequiresPermissions("administrator:info:edit")
	@PutMapping(value = "/edit/psw")
	@ResponseBody
	public Object updatePwd(@RequestParam("nowPassword") String nowPassword,
			@RequestParam("newPassword") String newPassword, @RequestParam("confirmPwd") String confirmPwd) {

		if (!RegexUtils.isPassword(newPassword)) {
			return new CmsResult(UserReturnCode.PASSWORD_AUTHENTICATION_ERROR);
		}
		if (!newPassword.equals(confirmPwd)) {
			return new CmsResult(UserReturnCode.ENTERED_PASSWORDS_DIFFER);
		}

		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			try {
				Integer count = userService.updatePsw(nowPassword, newPassword, authorizingUser.getUserId(),
						authorizingUser.getUserName());
				return new CmsResult(CommonReturnCode.SUCCESS, count);
			} catch (ValidateException e) {
				logger.error(e.getMessage(), e);
				return new CmsResult(e.getCode(), e.getMessage());
			}
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
	
	/**
	 * GET 管理员头像页面
	 * @param model
	 * @return
	 */
	@ApiOperation(value = "管理员头像页面", notes = "管理员头像页面")
	@RequiresPermissions("administrator:info:view")
	@GetMapping(value = "/avatar")
	public String avatar(Model model) {
		// 管理员信息
		UserVO userVO = userService.getById(SingletonLoginUtils.getUserId());
		model.addAttribute("user", userVO);
		return "/modules/admin/admin_user_avatar";
	}
	
	/**
	 * PUT 修改管理员头像
	 * @return
	 */
	@ApiOperation(value = "修改管理员头像", notes = "根据传过来的图片地址修改管理员头像")
	@RequiresPermissions("administrator:info:edit")
	@PutMapping(value = "/avatar")
	@ResponseBody
	public Object avatar(@RequestParam("picImg") String picImg) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		Integer count = userService.updateAvatar(authorizingUser.getUserId(), picImg);
		return new CmsResult(CommonReturnCode.SUCCESS, count);
	}
}
