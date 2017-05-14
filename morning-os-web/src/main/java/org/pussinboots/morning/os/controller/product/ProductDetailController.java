package org.pussinboots.morning.os.controller.product;

import java.util.List;

import org.pussinboots.morning.common.base.BaseController;
import org.pussinboots.morning.common.enums.StatusEnum;
import org.pussinboots.morning.product.common.constant.ProductConstantEnum;
import org.pussinboots.morning.product.entity.Category;
import org.pussinboots.morning.product.entity.ProductAttribute;
import org.pussinboots.morning.product.entity.ProductImage;
import org.pussinboots.morning.product.entity.ProductParameter;
import org.pussinboots.morning.product.pojo.dto.ProductSpecificationDTO;
import org.pussinboots.morning.product.pojo.vo.ProductVO;
import org.pussinboots.morning.product.service.ICategoryService;
import org.pussinboots.morning.product.service.IProductAttributeService;
import org.pussinboots.morning.product.service.IProductImageService;
import org.pussinboots.morning.product.service.IProductParameterService;
import org.pussinboots.morning.product.service.IProductService;
import org.pussinboots.morning.product.service.IProductSpecificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 
* 项目名称：morning-os-web Maven Webapp   
* 类名称：ProductDetailControlller   
* 类描述：商品详情表示层控制器   
* 创建人：陈星星   
* 创建时间：2017年4月24日 下午11:24:37   
*
 */
@Controller
@RequestMapping(value = "/detail")
@Api(value = "商品详情", description = "商品详情")
public class ProductDetailController extends BaseController {
	
	@Autowired
	private IProductService productService;
	@Autowired
	private ICategoryService categoryService;
	@Autowired
	private IProductAttributeService productAttributeService;
	@Autowired
	private IProductImageService productImageService;
	@Autowired
	private IProductParameterService productParameterService;
	@Autowired
	private IProductSpecificationService productSpecificationService;
	
	/**
	 * GET 商品详情页面
	 * @return
	 */
	@ApiOperation(value = "商品详情页面", notes = "根据传过来的商品编号获取商品详情信息")  
	@GetMapping(value="/{productNumber}")
	public String item(Model model, @PathVariable("productNumber") Long productNumber) {
		// 根据商品编号查找商品信息
		ProductVO product = productService.getByNumber(productNumber, StatusEnum.SHELVE.getStatus());
		if(product != null) {
			
			// 根据类目ID查找上级类目列表
			List<Category> upperCategories = categoryService.listUpperByProductId(product.getProductId(),
					StatusEnum.SHOW.getStatus());		
			
			// 根据商品ID查找商品属性
			ProductAttribute productAttribute = productAttributeService.getByProductId(product.getProductId());
			
			// 根据商品ID查找商品展示图片
			List<ProductImage> productImages = productImageService.listByProductId(product.getProductId(),
					ProductConstantEnum.PRODUCT_PICIMG_NUMBER.getValue(), StatusEnum.SHOW.getStatus());
			model.addAttribute("productImages", productImages);
			
			// 根据商品ID查找商品参数
			List<ProductParameter> productParameters = productParameterService.listByProductId(product.getProductId(),
					StatusEnum.SHOW.getStatus());
			
			// 根据商品ID查找商品类型列表以及商品规格列表
			ProductSpecificationDTO productSpecificationDTO = productSpecificationService
					.getByProductId(product.getProductId(), StatusEnum.SHOW.getStatus());
			
			model.addAttribute("product", product);// 商品信息
			model.addAttribute("upperCategories", upperCategories);// 上级类目列表
			model.addAttribute("productAttribute", productAttribute);// 商品属性
			model.addAttribute("productParameters", productParameters);// 商品参数
			model.addAttribute("kindVOs", productSpecificationDTO.getKindVOs());// 商品类型列表
			model.addAttribute("productSpecifications", JSON.toJSON(productSpecificationDTO.getProductSpecifications()));
		}
		
		return "/modules/product/product_detail";
	}

}
