package com.morning.controller.goods;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.morning.common.dto.AjaxResult;
import com.morning.controller.BaseController;
import com.morning.entity.goods.Goods;
import com.morning.entity.goods.GoodsSpec;
import com.morning.entity.goods.QueryGoods;
import com.morning.service.goods.IGoodsService;
import com.morning.service.goods.IGoodsSpecService;


/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：AdminGoodsController   
* 类描述：系统商品管理表示层   
* 创建人：陈星星   
* 创建时间：2016年11月15日 下午2:34:54   
* 修改人：陈星星   
* 修改时间：2016年11月15日 下午2:34:54   
* @version
 */
@Controller
@RequestMapping("/system/goods")
public class AdminGoodsController extends BaseController{
	
	/** 系统商品列表 */
	private static final String SYSTEM_GOODS_LIST = getViewPath("admin/goods/system_goods_list");
	/** 商品规格列表 */
	private static final String SYSTEM_GOODS_SPEC = getViewPath("admin/goods/system_goods_spec");
	
	@Autowired
	private IGoodsService goodsService;
	@Autowired
	private IGoodsSpecService goodsSpecService;
	
	
	@InitBinder("queryGoods")
	public void initBinderQueryGoods(WebDataBinder binder) {
		binder.setFieldDefaultPrefix("queryGoods.");
	}
	
	/**
	 * GET 商品列表
	 * @param request
	 * @return
	 */
	@RequiresPermissions("goods:list:view")
	@RequestMapping(value = "/list")
	public String list(Model model, @ModelAttribute("queryGoods") QueryGoods queryGoods) {
		Integer allGoodsNumber = goodsService.selectAllGoodsNumber(null);
		model.addAttribute("allGoodsNumber", allGoodsNumber);// 商品总数量
		Integer onGoodsNumber = goodsService.selectAllGoodsNumber(1);//上架商品
		model.addAttribute("onGoodsNumber", onGoodsNumber);// 商品总数量		
		Integer outGoodsNumber = goodsService.selectAllGoodsNumber(0);//下架商品
		model.addAttribute("outGoodsNumber", outGoodsNumber);// 商品总数量	
		List<Goods> goodsList = goodsService.selectGoodsListBySystem(queryGoods);
		model.addAttribute("goodsList", goodsList);// 商品列表
//		List<SystemRole> systemRoles = systemRoleService.selectRoleAndNumber();
//		model.addAttribute("systemRoles", systemRoles);// 权限列表
		return SYSTEM_GOODS_LIST;
	}
	
	
	/**
	 * Get 商品规格列表
	 * @param goodsId
	 * @return
	 */
	@RequiresPermissions("sysuser:list:view")
	@RequestMapping(value = "/list/{goodsId}/spec", method = RequestMethod.GET)
	public String goodsSpec(Model model, @PathVariable Integer goodsId){
		List<GoodsSpec> goodsSpecs = goodsSpecService.selectGoodsSpec(goodsId);
		model.addAttribute("goodsSpecs", goodsSpecs);
		return SYSTEM_GOODS_SPEC;
	}
	
	/**
	 * POST 启用/禁止用户
	 * @param request
	 * @return
	 */
	@RequiresPermissions("goods:list:audit")
	@RequestMapping(value = "/list/{goodsId}/audit", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult audit(@PathVariable Integer goodsId) {
		Integer status = Integer.valueOf(getParameter("status"));
		goodsService.updateGoodsStatus(goodsId, status);
		return success(true);
	}

	/**
	 * DELETE 删除产品
	 * @return
	 */
	@RequiresPermissions("goods:list:delete")
	@RequestMapping(value = "/list/{goodsId}/delete", method = RequestMethod.DELETE)
	@ResponseBody
	public AjaxResult delete(@PathVariable Integer goodsId) {
		goodsService.deleteGoods(goodsId);
		return success(true);
	}
}
