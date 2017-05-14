package org.pussinboots.morning.os.controller.category;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.pussinboots.morning.common.base.BaseController;
import org.pussinboots.morning.common.base.BasePageDTO;
import org.pussinboots.morning.common.enums.StatusEnum;
import org.pussinboots.morning.common.support.page.PageInfo;
import org.pussinboots.morning.product.common.enums.ProductSortEnum;
import org.pussinboots.morning.product.entity.Category;
import org.pussinboots.morning.product.pojo.vo.ProductVO;
import org.pussinboots.morning.product.service.ICategoryService;
import org.pussinboots.morning.product.service.IProductCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 
* 项目名称：morning-os-web Maven Webapp   
* 类名称：CategoryListController   
* 类描述：电子商城商品分类表示层控制器   
* 创建人：陈星星   
* 创建时间：2017年4月13日 下午1:06:51   
*
 */
@Controller
@Api(value = "商品分类", description = "商品分类")
public class CategoryListController extends BaseController{
	
	@Autowired
	private ICategoryService categoryService;
	@Autowired
	private IProductCategoryService productCategoryService;
	
	/**
	 * GET 类目列表
	 * @return
	 */
	@ApiOperation(value = "类目列表", notes = "类目列表")  
	@GetMapping(value = "/list")
	public String list(Model model,
			@RequestParam(value = "categoryId", required = false, defaultValue = "1") String reqCategoryId,
			@RequestParam(value = "sort", required = false, defaultValue = "0") String reqSort,
			@RequestParam(value = "page", required = false, defaultValue = "1") String reqPage,
			@RequestParam(value = "limit", required = false, defaultValue = "12") Integer limit) {
		
		// 请求参数:类目ID,如果类目ID不存在或者不为Long类型,则默认1/全部商品
		Long categoryId = StringUtils.isNumeric(reqCategoryId) ? Long.valueOf(reqCategoryId) : 1;
		// 请求参数:排序方式,如果排序方式不存在或者不为Integer类型,则默认0/推荐排序
		Integer sort = StringUtils.isNumeric(reqSort) ? Integer.valueOf(reqSort) : ProductSortEnum.RECOMMEND.getType();
		// 请求参数:分页,如果分页不存在或者不为Integer类型,则默认1/默认页数
		Integer page = StringUtils.isNumeric(reqPage) ? Integer.valueOf(reqPage) : 1;
		
		// 查找当前类目信息
		Category category = categoryService.getById(categoryId, StatusEnum.SHOW.getStatus());
		if (category != null) {
			
			// 通过类目ID、排序、分页查找商品列表
			PageInfo pageInfo = new PageInfo(page, limit, ProductSortEnum.typeOf(sort).getSort(),
					ProductSortEnum.typeOf(sort).getOrder());
			BasePageDTO<ProductVO> basePageDTO = productCategoryService.listProducts(categoryId, pageInfo);
			
			// 根据类目ID查找子类目
			List<Category> lowerCategories = categoryService.listLowerCategories(categoryId, StatusEnum.SHOW.getStatus());
			
			// 根据类目ID查找上级类目列表
			List<Category> upperCategories = categoryService.listUpperCategories(categoryId, StatusEnum.SHOW.getStatus());
			
			model.addAttribute("sort", ProductSortEnum.typeOf(sort).getType());// 排序方式
			model.addAttribute("category", category);// 当前类目信息
			model.addAttribute("products", basePageDTO.getList());// 商品列表
			model.addAttribute("pageInfo", basePageDTO.getPageInfo()); // 分页信息
			model.addAttribute("lowerCategories", lowerCategories);// 子类目列表
			model.addAttribute("upperCategories", upperCategories);// 父类目列表
		}
		return "/modules/product/product_list";
	}
	
	/**
	 * GET 搜索列表
	 * @return
	 */
	@ApiOperation(value = "搜索列表", notes = "搜索列表")  
	@GetMapping(value = "/search")
	public String search(Model model,
			@RequestParam(value = "search", required = false, defaultValue = "") String search,
			@RequestParam(value = "sort", required = false, defaultValue = "0") String reqSort,
			@RequestParam(value = "page", required = false, defaultValue = "1") String reqPage,
			@RequestParam(value = "limit", required = false, defaultValue = "12") Integer limit) {
		// 请求参数:排序方式,如果排序方式不存在或者不为Integer类型,则默认0/推荐排序
		Integer sort = StringUtils.isNumeric(reqSort) ? Integer.valueOf(reqSort) : ProductSortEnum.RECOMMEND.getType();
		// 请求参数:分页,如果分页不存在或者不为Integer类型,则默认1/默认页数
		Integer page = StringUtils.isNumeric(reqPage) ? Integer.valueOf(reqPage) : 1;

		// 通过搜索内容、排序、分页查找商品列表
		PageInfo pageInfo = new PageInfo(page, limit, ProductSortEnum.typeOf(sort).getSort(),
				ProductSortEnum.typeOf(sort).getOrder());
		BasePageDTO<ProductVO> basePageDTO = productCategoryService.listBySearch(search, pageInfo);

		// 根据类目ID查找子类目
		List<Category> lowerCategories = categoryService.listLowerCategories(1L, StatusEnum.SHOW.getStatus());

		model.addAttribute("search", search); // 搜索内容
		model.addAttribute("sort", ProductSortEnum.typeOf(sort).getType());// 排序方式
		model.addAttribute("products", basePageDTO.getList());// 商品列表
		model.addAttribute("pageInfo", basePageDTO.getPageInfo()); // 分页信息
		model.addAttribute("lowerCategories", lowerCategories);// 子类目列表

		return "/modules/product/product_search";
	}

}
