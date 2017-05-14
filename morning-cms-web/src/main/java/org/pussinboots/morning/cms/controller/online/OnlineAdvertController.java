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
import org.pussinboots.morning.online.entity.Advert;
import org.pussinboots.morning.online.service.IAdvertService;
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
* 类名称：OnlineAdvertController   
* 类描述：广告管理表示层控制器       
* 创建人：陈星星   
* 创建时间：2017年4月10日 下午2:05:50   
*
 */
@Controller
@RequestMapping(value = "/online/advert")
@Api(value = "广告管理", description = "广告管理")
public class OnlineAdvertController extends BaseController {
	
	@Autowired
	private IAdvertService advertService;
	
	/**
	 * GET 广告列表页面
	 * @return
	 */
	@ApiOperation(value = "广告列表页面", notes = "广告列表页面")
	@RequiresPermissions("online:advert:view")
	@GetMapping(value = "/view")
	public String getAdvertPage(Model model) {
		return "/modules/advert/online_advert_list";
	}
	
	/**
	 * GET 广告列表
	 * @return
	 */
	@ApiOperation(value = "获取广告列表", notes = "根据分页信息/搜索内容获取广告列表")  
	@RequiresPermissions("online:advert:view")
	@GetMapping(value = "/")
	@ResponseBody
	public Object listAdvert(PageInfo pageInfo, @RequestParam(required = false, value = "search") String search) {
		BasePageDTO<Advert> basePageDTO = advertService.listByPage(pageInfo, search);
		return new CmsPageResult(basePageDTO.getList(), basePageDTO.getPageInfo().getTotal());
	}
	
	/**
	 * PUT 启用/冻结广告
	 * @return
	 */
	@ApiOperation(value = "启用/冻结广告", notes = "根据url广告ID启动/冻结广告")
	@RequiresPermissions("online:advert:audit")
	@PutMapping(value = "/{advertId}/audit")
	@ResponseBody
	public Object audit(@PathVariable("advertId") Long advertId) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			Integer count = advertService.updateStatus(advertId);
			return new CmsResult(CommonReturnCode.SUCCESS, count);
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
	
	/**
	 * DELETE 删除广告
	 * @param advertId 广告ID
	 * @return
	 */
	@ApiOperation(value = "删除广告", notes = "根据url广告ID删除广告")
	@RequiresPermissions("online:advert:delete")
	@DeleteMapping(value = "/{advertId}")
	@ResponseBody
	public Object delete(@PathVariable("advertId") Long advertId) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			Integer count = advertService.deleteByAdvertId(advertId);
			return new CmsResult(CommonReturnCode.SUCCESS, count);
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
	
	/**
	 * GET 创建广告页面
	 * @return
	 */
	@ApiOperation(value = "创建广告页面", notes = "创建广告页面")
	@RequiresPermissions("online:advert:create")
	@GetMapping(value = "/create")
	public String getInsertPage(Model model) {
		return "/modules/advert/online_advert_create";
	}
	
	/**
	 * POST 创建广告
	 * @return
	 */
	@ApiOperation(value = "创建广告", notes = "创建广告")
	@RequiresPermissions("online:advert:create")
	@PostMapping(value = "")
	@ResponseBody
	public Object insert(Advert advert) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			Integer count = advertService.insertAdvert(advert, authorizingUser.getUserName());
			return new CmsResult(CommonReturnCode.SUCCESS, count);
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
	
	/**
	 * GET 更新广告页面
	 * @return
	 */
	@ApiOperation(value = "更新广告页面", notes = "更新广告页面")
	@RequiresPermissions("online:advert:edit")
	@GetMapping(value = "/{advertId}/edit")
	public String getUpdatePage(Model model, @PathVariable("advertId") Long advertId) {
		
		// 广告信息
		Advert advert = advertService.selectById(advertId);
		model.addAttribute("advert", advert);
		
		return "/modules/advert/online_advert_update";
	}
	
	/**
	 * PUT 更新广告信息
	 * @return
	 */
	@ApiOperation(value = "更新广告信息", notes = "根据url广告ID来指定更新对象,并根据传过来的广告信息来更新广告信息")
	@RequiresPermissions("online:advert:edit")
	@PutMapping(value = "/{advertId}")
	@ResponseBody
	public Object update(Advert advert, @PathVariable("advertId") Long advertId) {

		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			// 更新用户及广告记录
			Integer count = advertService.updateAdvert(advert, authorizingUser.getUserName());
			return new CmsResult(CommonReturnCode.SUCCESS, count);
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
}
