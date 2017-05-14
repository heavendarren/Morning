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
import org.pussinboots.morning.online.entity.AdvertDetail;
import org.pussinboots.morning.online.service.IAdvertDetailService;
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
* 类名称：OnlineAdvertDetailController   
* 类描述：广告详情管理表示层控制器   
* 创建人：陈星星   
* 创建时间：2017年4月10日 下午3:05:23   
*
 */
@Controller
@RequestMapping(value = "/online/advert/{advertId}/detail")
@Api(value = "广告详情管理", description = "广告详情管理")
public class OnlineAdvertDetailController extends BaseController {
	
	@Autowired
	private IAdvertDetailService advertDetailService;
	@Autowired
	private IAdvertService advertService;
	
	/**
	 * GET 广告详情列表页面
	 * @param model
	 * @return
	 */
	@ApiOperation(value = "广告详情列表页面", notes = "广告详情列表页面")
	@RequiresPermissions("online:advert:view")
	@GetMapping(value = "/view")
	public String getNavigationBarPage(Model model, @PathVariable("advertId") Long advertId) {
		Advert advert = advertService.selectById(advertId);
		model.addAttribute("advert", advert);
		return "/modules/advert/online_advert_detail_list";
	}
	
	/**
	 * GET 广告详情列表
	 * @param pageInfo
	 * @param search
	 * @return
	 */
	@ApiOperation(value = "获取广告详情列表", notes = "根据分页信息/搜索内容获取广告详情列表")  
	@RequiresPermissions("online:advert:view")
	@GetMapping(value = "/")
	@ResponseBody
	public Object listNavigation(PageInfo pageInfo, @RequestParam(required = false, value = "search") String search,
			@PathVariable("advertId") Long advertId) {
		BasePageDTO<AdvertDetail> basePageDTO = advertDetailService.listByPage(advertId, pageInfo, search);
		return new CmsPageResult(basePageDTO.getList(), basePageDTO.getPageInfo().getTotal());
	}
	
	/**
	 * PUT 启用/冻结广告详情
	 * @param advertDetailId 广告详情ID
	 * @return
	 */
	@ApiOperation(value = "启用/冻结广告详情", notes = "根据url广告详情ID启动/冻结广告详情")
	@RequiresPermissions("online:advert:audit")
	@PutMapping(value = "/{advertDetailId}/audit")
	@ResponseBody 
	public Object audit(@PathVariable("advertDetailId") Long advertDetailId) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			Integer count = advertDetailService.updateStatus(advertDetailId);
			return new CmsResult(CommonReturnCode.SUCCESS, count);
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
	
	/**
	 * DELETE 删除广告详情
	 * @param advertDetailId 广告详情ID
	 * @return
	 */
	@ApiOperation(value = "删除广告详情", notes = "根据url广告详情ID删除广告详情")
	@RequiresPermissions("online:advert:delete")
	@DeleteMapping(value = "/{advertDetailId}")
	@ResponseBody
	public Object delete(@PathVariable("advertDetailId") Long advertDetailId) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			Integer count = advertDetailService.deleteByadvertDetailId(advertDetailId);
			return new CmsResult(CommonReturnCode.SUCCESS, count);
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
	
	/**
	 * GET 创建广告详情页面
	 * @return
	 */
	@ApiOperation(value = "创建广告详情页面", notes = "创建广告详情页面")
	@RequiresPermissions("online:advert:create")
	@GetMapping(value = "/create")
	public String getInsertPage(Model model, @PathVariable("advertId") Long advertId) {
		Advert advert = advertService.selectById(advertId);
		model.addAttribute("advert", advert);
		return "/modules/advert/online_advert_detail_create";
	}
	
	/**
	 * POST 创建广告详情
	 * @return
	 */
	@ApiOperation(value = "创建广告详情", notes = "创建广告详情")
	@RequiresPermissions("online:advert:create")
	@PostMapping(value = "")
	@ResponseBody
	public Object insert(AdvertDetail advertDetail) {

		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			Integer count = advertDetailService.insertAdvertDetail(advertDetail, authorizingUser.getUserName());
			return new CmsResult(CommonReturnCode.SUCCESS, count);
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
	
	/**
	 * GET 更新广告详情页面
	 * @return
	 */
	@ApiOperation(value = "更新广告详情页面", notes = "更新广告详情页面")
	@RequiresPermissions("online:advert:edit")
	@GetMapping(value = "/{advertDetailId}/edit")
	public String getUpdatePage(Model model, @PathVariable("advertId") Long advertId,
			@PathVariable("advertDetailId") Long advertDetailId) {
		
		// 导航信息
		Advert advert = advertService.selectById(advertId);
		model.addAttribute("advert", advert);
		
		// 广告详情信息
		AdvertDetail advertDetail = advertDetailService.selectById(advertDetailId);
		model.addAttribute("advertDetail", advertDetail);	
		
		return "/modules/advert/online_advert_detail_update";
	}
	
	/**
	 * PUT 更新广告详情信息
	 * @return
	 */
	@ApiOperation(value = "更新广告详情信息", notes = "根据url广告详情ID来指定更新对象,并根据传过来的广告详情信息来更新广告详情信息")
	@RequiresPermissions("online:advert:edit")
	@PutMapping(value = "/{advertDetailId}")
	@ResponseBody
	public Object update(AdvertDetail advertDetail, @PathVariable("advertDetailId") Long advertId) {

		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			// 更新用户及广告详情记录
			Integer count = advertDetailService.updateNavigationBar(advertDetail, authorizingUser.getUserName());
			return new CmsResult(CommonReturnCode.SUCCESS, count);
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
	
}
