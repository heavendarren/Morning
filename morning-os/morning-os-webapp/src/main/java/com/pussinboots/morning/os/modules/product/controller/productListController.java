package com.pussinboots.morning.os.modules.product.controller;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.pussinboots.morning.common.controller.BaseController;
import com.pussinboots.morning.common.enums.StatusEnum;
import com.pussinboots.morning.common.model.PageInfo;
import com.pussinboots.morning.os.common.enums.CommonConstantEnum;
import com.pussinboots.morning.os.modules.product.dto.ProductPageDTO;
import com.pussinboots.morning.os.modules.product.entity.Category;
import com.pussinboots.morning.os.modules.product.enums.ProductSortEnum;
import com.pussinboots.morning.os.modules.product.service.ICategoryService;
import com.pussinboots.morning.os.modules.product.service.IProductCategoryService;

/**
 * 
 * 项目名称：morning-os-webapp 类名称：productListController 类描述：电子商城商品分类表示层控制器 创建人：陈星星
 * 创建时间：2017年3月1日 下午9:03:53
 *
 */
@Controller
public class ProductListController extends BaseController {

	/** 商品分类页面 */
	private static final String PRODUCT_LIST = getViewPath("modules/product/product_list");
	/** 分类错误提示 */
	private static final String PRODUCT_LIST_ERROR = getViewPath("modules/product/product_list_error");
	/** 商品搜索页面 */
	private static final String PRODUCT_SEARCH = getViewPath("modules/product/product_search");
	/** 搜索错误提示 */
	private static final String PRODUCT_SEARCH_ERROR = getViewPath("modules/product/product_search_error");

	@Autowired
	private ICategoryService categoryService;
	@Autowired
	private IProductCategoryService productCategoryService;

	/**
	 * GET 类目列表
	 * 
	 * @param model
	 * @return
	 */
	@GetMapping(value = "/list")
	public String list(Model model) {

		// 获取类目ID,如果类目ID不存在或者不为Long类型,则默认1/全部商品
		Long categoryId = StringUtils.isNumeric(getParameter("categoryId")) ? Long.valueOf(getParameter("categoryId"))
				: 1;
		// 获取排序方式,如果排序方式不存或者不为Integer类型,则默认0/推荐排序
		Integer sort = StringUtils.isNumeric(getParameter("sort")) ? Integer.valueOf(getParameter("sort"))
				: ProductSortEnum.RECOMMEND.getType();
		// 获取当前页数,如果当前页数不存在或者不为Integer类型,则默认1/默认页数
		Integer page = StringUtils.isNumeric(getParameter("page")) ? Integer.valueOf(getParameter("page")) : 1;

		// 查找当前类目信息
		Category category = categoryService.selectCategoryById(categoryId, StatusEnum.SHOW.getStatus());
		if (category == null) {
			return PRODUCT_LIST_ERROR;
		}
		model.addAttribute("category", category);

		// 通过类目ID、排序、分页查找商品列表
		PageInfo pageInfo = new PageInfo(page, CommonConstantEnum.CATEGORY_PRODUCT_NUMBER.getValue(),
				ProductSortEnum.typeOf(sort).getSort(), ProductSortEnum.typeOf(sort).getOrder());
		ProductPageDTO productPageDTO = productCategoryService.selectProductVOs(categoryId, pageInfo);
		if (productPageDTO.getProductVOs() == null || productPageDTO.getProductVOs().isEmpty()) {
			return PRODUCT_LIST_ERROR;
		}
		model.addAttribute("productVOs", productPageDTO.getProductVOs());
		model.addAttribute("pageInfo", productPageDTO.getPageInfo());

		// 根据类目ID查找子类目
		List<Category> lowerCategories = categoryService.selectLowerCategories(categoryId, StatusEnum.SHOW.getStatus());
		model.addAttribute("lowerCategories", lowerCategories);

		// 根据类目ID查找上级类目列表
		List<Category> upperCategories = categoryService.selectUpperCategories(categoryId, StatusEnum.SHOW.getStatus());
		model.addAttribute("upperCategories", upperCategories);

		// 查找上级类目信息
		Category upperCategory = categoryService.selectUpperCategoryById(categoryId);
		model.addAttribute("upperCategory", upperCategory);

		// 返回排序方式（超过规定的排序方式,则返回默认排序）
		model.addAttribute("sort", ProductSortEnum.typeOf(sort).getType());
		return PRODUCT_LIST;
	}

	/**
	 * GET 搜索列表
	 * 
	 * @param model
	 * @return
	 */
	@GetMapping(value = "/search")
	public String search(Model model) {

		// 获取类目ID,如果类目ID不存在或者不为Long类型,则默认1/全部商品
		Long categoryId = StringUtils.isNumeric(getParameter("categoryId")) ? Long.valueOf(getParameter("categoryId"))
				: 1;
		// 获取排序方式,如果排序方式不存或者不为Integer类型,则默认0/推荐排序
		Integer sort = StringUtils.isNumeric(getParameter("sort")) ? Integer.valueOf(getParameter("sort"))
				: ProductSortEnum.RECOMMEND.getType();
		// 获取当前页数,如果当前页数不存在或者不为Integer类型,则默认1/默认页数
		Integer page = StringUtils.isNumeric(getParameter("page")) ? Integer.valueOf(getParameter("page")) : 1;
		// 获取搜索内容,如果搜索内容不存在,则默认空。
		String search = StringUtils.isNotBlank(getParameter("search")) ? getParameter("search").trim() : null;

		// 通过搜索内容、排序、分页查找商品列表
		PageInfo pageInfo = new PageInfo(page, CommonConstantEnum.CATEGORY_PRODUCT_NUMBER.getValue(),
				ProductSortEnum.typeOf(sort).getSort(), ProductSortEnum.typeOf(sort).getOrder());
		ProductPageDTO productPageDTO = productCategoryService.selectProductVOsBySearch(search, pageInfo);

		// 返回搜索结果
		model.addAttribute("search", search);
		if (productPageDTO.getProductVOs() == null || productPageDTO.getProductVOs().isEmpty()) {
			return PRODUCT_SEARCH_ERROR;
		}
		model.addAttribute("productVOs", productPageDTO.getProductVOs());
		model.addAttribute("pageInfo", productPageDTO.getPageInfo());

		// 根据类目ID查找子类目
		List<Category> lowerCategories = categoryService.selectLowerCategories(categoryId, StatusEnum.SHOW.getStatus());
		model.addAttribute("lowerCategories", lowerCategories);

		// 根据类目ID查找上级类目列表
		List<Category> upperCategories = categoryService.selectUpperCategories(categoryId, StatusEnum.SHOW.getStatus());
		model.addAttribute("upperCategories", upperCategories);

		// 查找上级类目信息
		Category upperCategory = categoryService.selectUpperCategoryById(categoryId);
		model.addAttribute("upperCategory", upperCategory);

		// 返回排序方式（超过规定的排序方式,则返回默认排序）
		model.addAttribute("sort", ProductSortEnum.typeOf(sort).getType());
		return PRODUCT_SEARCH;
	}
}
