package org.pussinboots.morning.cms.controller.webfront;

import java.util.List;

import org.pussinboots.morning.administrator.pojo.vo.RoleMenuVO;
import org.pussinboots.morning.administrator.pojo.vo.UserVO;
import org.pussinboots.morning.administrator.service.IRoleMenuService;
import org.pussinboots.morning.administrator.service.IUserService;
import org.pussinboots.morning.cms.common.util.SingletonLoginUtils;
import org.pussinboots.morning.common.base.BaseController;
import org.pussinboots.morning.common.enums.StatusEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 
* 项目名称：morning-cms-web Maven Webapp   
* 类名称：WebFrontController   
* 类描述：后台管理系统首页表示层控制器   
* 创建人：陈星星   
* 创建时间：2017年4月1日 下午11:14:45   
*
 */
@Controller
@Api(value = "后台管理系统首页", description = "后台管理系统首页")
public class WebFrontController extends BaseController {
	
	@Autowired
	private IUserService userService;
	@Autowired
	private IRoleMenuService roleMenuService;
	
	/**
	 * GET 首页
	 * @return
	 */
	@GetMapping("/")
	public String index() {
		return redirectTo("/index");
	}
	
	/**
	 * GET 首页/操作中心
	 * @return
	 */
	@ApiOperation(value = "后台管理系统首页", notes = "管理员信息、系统目录")  
	@GetMapping(value = "/index")
	public String index(Model model) {
		// 管理员信息
		UserVO user = userService.getById(SingletonLoginUtils.getUserId());
		model.addAttribute("user", user);
		// 系统目录
		List<RoleMenuVO> menus = roleMenuService.listByUserId(SingletonLoginUtils.getUserId(), StatusEnum.NORMAL.getStatus());
		model.addAttribute("menus", menus);
		
		return "/modules/webfront/main";
	}
}
