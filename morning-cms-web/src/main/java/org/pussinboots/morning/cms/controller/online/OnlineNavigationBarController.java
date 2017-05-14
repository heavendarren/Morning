package org.pussinboots.morning.cms.controller.online;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.pussinboots.morning.cms.common.result.CmsPageResult;
import org.pussinboots.morning.cms.common.result.CmsResult;
import org.pussinboots.morning.cms.common.security.AuthorizingUser;
import org.pussinboots.morning.cms.common.util.SingletonLoginUtils;
import org.pussinboots.morning.common.base.BaseController;
import org.pussinboots.morning.common.base.BasePageDTO;
import org.pussinboots.morning.common.constant.CommonReturnCode;
import org.pussinboots.morning.common.support.page.PageInfo;
import org.pussinboots.morning.online.entity.Navigation;
import org.pussinboots.morning.online.entity.NavigationBar;
import org.pussinboots.morning.online.service.INavigationBarService;
import org.pussinboots.morning.online.service.INavigationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 
* 项目名称：morning-cms-web Maven Webapp   
* 类名称：OnlineNavigationBarController   
* 类描述：导航栏管理表示层控制器      
* 创建人：陈星星   
* 创建时间：2017年4月9日 上午2:49:03   
*
 */
@Controller
@RequestMapping(value = "/online/navigation/{navigationId}/bar")
@Api(value = "导航栏管理", description = "导航栏管理")
public class OnlineNavigationBarController extends BaseController {
	
	@Autowired
	private INavigationBarService navigationBarService;
	@Autowired
	private INavigationService navigationService;
	
	/**
	 * GET 导航栏列表页面
	 * @param model
	 * @return
	 */
	@ApiOperation(value = "导航栏列表页面", notes = "导航栏列表页面")
	@RequiresPermissions("online:navigation:view")
	@GetMapping(value = "/view")
	public String getNavigationBarPage(Model model, @PathVariable("navigationId") Long navigationId) {
		Navigation navigation = navigationService.selectById(navigationId);
		model.addAttribute("navigation", navigation);
		return "/modules/navigation/online_navigation_bar_list";
	}
	
	/**
	 * GET 导航栏列表
	 * @param pageInfo
	 * @param search
	 * @return
	 */
	@ApiOperation(value = "获取导航栏列表", notes = "根据分页信息/搜索内容获取导航栏列表")  
	@RequiresPermissions("online:navigation:view")
	@GetMapping(value = "/")
	@ResponseBody
	public Object listNavigationBar(PageInfo pageInfo, @RequestParam(required = false, value = "search") String search,
			@PathVariable("navigationId") Long navigationId) {
		BasePageDTO<NavigationBar> basePageDTO = navigationBarService.listByPage(navigationId, pageInfo, search);
		return new CmsPageResult(basePageDTO.getList(), basePageDTO.getPageInfo().getTotal());
	}
	
	/**
	 * PUT 启用/冻结导航栏
	 * @param navigationBarId 导航栏ID
	 * @return
	 */
	@ApiOperation(value = "启用/冻结导航栏", notes = "根据url导航栏ID启动/冻结导航栏")
	@RequiresPermissions("online:navigation:audit")
	@PutMapping(value = "/{navigationBarId}/audit")
	@ResponseBody 
	public Object audit(@PathVariable("navigationBarId") Long navigationBarId) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			Integer count = navigationBarService.updateStatus(navigationBarId);
			return new CmsResult(CommonReturnCode.SUCCESS, count);
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
	
	/**
	 * DELETE 删除导航栏
	 * @param navigationBarId 导航栏ID
	 * @return
	 */
	@ApiOperation(value = "删除导航栏", notes = "根据url导航栏ID删除导航栏")
	@RequiresPermissions("online:navigation:delete")
	@DeleteMapping(value = "/{navigationBarId}")
	@ResponseBody
	public Object delete(@PathVariable("navigationBarId") Long navigationBarId) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			Integer count = navigationBarService.deleteByNavigationBarId(navigationBarId);
			return new CmsResult(CommonReturnCode.SUCCESS, count);
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
	
	/**
	 * GET 创建导航栏页面
	 * @return
	 */
	@ApiOperation(value = "创建导航栏页面", notes = "创建导航栏页面")
	@RequiresPermissions("online:navigation:create")
	@GetMapping(value = "/create")
	public String getInsertPage(Model model, @PathVariable("navigationId") Long navigationId) {
		Navigation navigation = navigationService.selectById(navigationId);
		model.addAttribute("navigation", navigation);
		return "/modules/navigation/online_navigation_bar_create";
	}
	
	/**
	 * POST 创建导航栏
	 * @return
	 */
	@ApiOperation(value = "创建导航栏", notes = "创建导航栏")
	@RequiresPermissions("online:navigation:create")
	@PostMapping(value = "")
	@ResponseBody
	public Object insert(NavigationBar navigationBar) {

		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			Integer count = navigationBarService.insertNavigationBar(navigationBar, authorizingUser.getUserName());
			return new CmsResult(CommonReturnCode.SUCCESS, count);
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
	
	/**
	 * GET 更新导航栏页面
	 * @return
	 */
	@ApiOperation(value = "更新导航栏页面", notes = "更新导航栏页面")
	@RequiresPermissions("online:navigation:edit")
	@GetMapping(value = "/{navigationBarId}/edit")
	public String getUpdatePage(Model model, @PathVariable("navigationId") Long navigationId,
			@PathVariable("navigationBarId") Long navigationBarId) {
		
		// 导航信息
		Navigation navigation = navigationService.selectById(navigationId);
		model.addAttribute("navigation", navigation);
		
		// 导航栏信息
		NavigationBar navigationBar = navigationBarService.selectById(navigationBarId);
		model.addAttribute("navigationBar", navigationBar);		
		
		return "/modules/navigation/online_navigation_bar_update";
	}
	
	/**
	 * PUT 更新导航栏信息
	 * @return
	 */
	@ApiOperation(value = "更新导航栏信息", notes = "根据url导航栏ID来指定更新对象,并根据传过来的导航栏信息来更新导航栏信息")
	@RequiresPermissions("online:navigation:edit")
	@PutMapping(value = "/{navigationBarId}")
	@ResponseBody
	public Object update(NavigationBar navigationBar, @PathVariable("navigationBarId") Long navigationId) {

		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			// 更新用户及导航栏记录
			Integer count = navigationBarService.updateNavigationBar(navigationBar, authorizingUser.getUserName());
			return new CmsResult(CommonReturnCode.SUCCESS, count);
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
}
