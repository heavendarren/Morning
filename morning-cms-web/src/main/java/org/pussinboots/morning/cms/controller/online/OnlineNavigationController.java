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
* 类名称：OnlineNavigationController   
* 类描述：导航管理表示层控制器    
* 创建人：陈星星   
* 创建时间：2017年4月9日 上午1:41:31   
*
 */
@Controller
@RequestMapping(value = "/online/navigation")
@Api(value = "导航管理", description = "导航管理")
public class OnlineNavigationController extends BaseController {
	
	@Autowired
	private INavigationService navigationService;
	
	/**
	 * GET 导航列表页面
	 * @param model
	 * @return
	 */
	@ApiOperation(value = "导航列表页面", notes = "导航列表页面")
	@RequiresPermissions("online:navigation:view")
	@GetMapping(value = "/view")
	public String getNavigationPage(Model model) {
		return "/modules/navigation/online_navigation_list";
	}
	
	/**
	 * GET 导航列表
	 * @param pageInfo
	 * @param search
	 * @return
	 */
	@ApiOperation(value = "获取广告列表", notes = "根据分页信息/搜索内容获取广告列表")  
	@RequiresPermissions("online:navigation:view")
	@GetMapping(value = "/")
	@ResponseBody
	public Object listNavigation(PageInfo pageInfo, @RequestParam(required = false, value = "search") String search) {
		BasePageDTO<Navigation> basePageDTO = navigationService.listByPage(pageInfo, search);
		return new CmsPageResult(basePageDTO.getList(), basePageDTO.getPageInfo().getTotal());
	}
	
	/**
	 * PUT 启用/冻结导航
	 * @param navigationId 导航ID
	 * @return
	 */
	@ApiOperation(value = "启用/冻结导航", notes = "根据url导航ID启动/冻结导航")
	@RequiresPermissions("online:navigation:audit")
	@PutMapping(value = "/{navigationId}/audit")
	@ResponseBody
	public Object audit(@PathVariable("navigationId") Long navigationId) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			Integer count = navigationService.updateStatus(navigationId);
			return new CmsResult(CommonReturnCode.SUCCESS, count);
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
	
	/**
	 * DELETE 删除导航
	 * @param navigationId 导航ID
	 * @return
	 */
	@ApiOperation(value = "删除导航", notes = "根据url导航ID删除导航")
	@RequiresPermissions("online:navigation:delete")
	@DeleteMapping(value = "/{navigationId}")
	@ResponseBody
	public Object delete(@PathVariable("navigationId") Long navigationId) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			Integer count = navigationService.deleteByNavigationId(navigationId);
			return new CmsResult(CommonReturnCode.SUCCESS, count);
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
	
	/**
	 * GET 创建导航页面
	 * @return
	 */
	@ApiOperation(value = "创建导航页面", notes = "创建导航页面")
	@RequiresPermissions("online:navigation:create")
	@GetMapping(value = "/create")
	public String getInsertPage(Model model) {
		return "/modules/navigation/online_navigation_create";
	}
	
	/**
	 * POST 创建导航
	 * @return
	 */
	@ApiOperation(value = "创建导航", notes = "创建导航")
	@RequiresPermissions("online:navigation:create")
	@PostMapping(value = "")
	@ResponseBody
	public Object insert(Navigation navigation) {

		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			Integer count = navigationService.insertNavigation(navigation, authorizingUser.getUserName());
			return new CmsResult(CommonReturnCode.SUCCESS, count);
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
	
	/**
	 * GET 更新导航页面
	 * @return
	 */
	@ApiOperation(value = "更新导航页面", notes = "更新导航页面")
	@RequiresPermissions("online:navigation:edit")
	@GetMapping(value = "/{navigationId}/edit")
	public String getUpdatePage(Model model, @PathVariable("navigationId") Long navigationId) {
		
		// 导航信息
		Navigation navigation = navigationService.selectById(navigationId);
		model.addAttribute("navigation", navigation);
		
		return "/modules/navigation/online_navigation_update";
	}
	
	/**
	 * PUT 更新导航信息
	 * @return
	 */
	@ApiOperation(value = "更新导航信息", notes = "根据url导航ID来指定更新对象,并根据传过来的导航信息来更新导航信息")
	@RequiresPermissions("online:navigation:edit")
	@PutMapping(value = "/{navigationId}")
	@ResponseBody
	public Object update(Navigation navigation, @PathVariable("navigationId") Long navigationId) {
		
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			// 更新用户及导航记录
			Integer count = navigationService.updateNavigation(navigation, authorizingUser.getUserName());
			return new CmsResult(CommonReturnCode.SUCCESS, count);
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}

}
