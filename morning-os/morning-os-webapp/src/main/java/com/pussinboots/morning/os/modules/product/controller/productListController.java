package com.pussinboots.morning.os.modules.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pussinboots.morning.common.controller.BaseController;
import com.pussinboots.morning.common.enums.StatusEnum;
import com.pussinboots.morning.os.modules.product.entity.Category;
import com.pussinboots.morning.os.modules.product.service.ICategoryService;

/**
 * 
* 项目名称：morning-os-webapp   
* 类名称：productListController   
* 类描述：电子商城商品分类表示层控制器   
* 创建人：陈星星   
* 创建时间：2017年3月1日 下午9:03:53   
*
 */
@Controller
@RequestMapping(value = "/list")
public class productListController extends BaseController {
	
	/** 商品分类页面  */
	private static final String PRODUCT_LIST = getViewPath("modules/product/product_list");
	
	@Autowired
	private ICategoryService categoryService;
	
	@GetMapping(value = "/{categoryId}")
	public String list(Model model, @PathVariable Long categoryId) {
		// 根据类目ID查找子类目
		List<Category> lowerCategories = categoryService.selectLowerCategories(categoryId, StatusEnum.SHOW.getStatus());
		model.addAttribute("lowerCategories", lowerCategories);
		
		// 根据类目ID查找上级类目列表
		List<Category> upperCategories = categoryService.selectUpperCategories(categoryId, StatusEnum.SHOW.getStatus());
		model.addAttribute("upperCategories", upperCategories);
		
		return PRODUCT_LIST;
	}
}
