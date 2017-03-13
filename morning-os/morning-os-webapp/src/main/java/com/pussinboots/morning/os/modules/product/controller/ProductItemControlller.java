package com.pussinboots.morning.os.modules.product.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.pussinboots.morning.common.controller.BaseController;
import com.pussinboots.morning.common.enums.StatusEnum;
import com.pussinboots.morning.common.model.PageInfo;
import com.pussinboots.morning.os.common.enums.CommonConstantEnum;
import com.pussinboots.morning.os.modules.content.entity.Comment;
import com.pussinboots.morning.os.modules.content.entity.Question;
import com.pussinboots.morning.os.modules.content.service.ICommentService;
import com.pussinboots.morning.os.modules.content.service.IQuestionService;
import com.pussinboots.morning.os.modules.content.vo.CommentVO;
import com.pussinboots.morning.os.modules.product.entity.Category;
import com.pussinboots.morning.os.modules.product.entity.Label;
import com.pussinboots.morning.os.modules.product.entity.Product;
import com.pussinboots.morning.os.modules.product.entity.ProductAttribute;
import com.pussinboots.morning.os.modules.product.entity.ProductImage;
import com.pussinboots.morning.os.modules.product.entity.ProductParameter;
import com.pussinboots.morning.os.modules.product.enums.CommentTypeEnum;
import com.pussinboots.morning.os.modules.product.enums.ProductStatusEnum;
import com.pussinboots.morning.os.modules.product.service.IKindService;
import com.pussinboots.morning.os.modules.product.service.ILabelService;
import com.pussinboots.morning.os.modules.product.service.IProductAttributeService;
import com.pussinboots.morning.os.modules.product.service.IProductCategoryService;
import com.pussinboots.morning.os.modules.product.service.IProductImageService;
import com.pussinboots.morning.os.modules.product.service.IProductParameterService;
import com.pussinboots.morning.os.modules.product.service.IProductService;
import com.pussinboots.morning.os.modules.product.service.IProductSpecificationService;
import com.pussinboots.morning.os.modules.product.vo.KindVO;

/**
 * 
* 项目名称：morning-os-webapp   
* 类名称：ProductItemControlller   
* 类描述：电子商城商品详情表示层控制器   
* 创建人：陈星星   
* 创建时间：2017年3月4日 上午2:00:57   
*
 */
@Controller
@RequestMapping(value="/item")
public class ProductItemControlller extends BaseController{
	
	
	/** 商品详情页  */
	private static final String PRODUCT_ITEM = getViewPath("modules/product/product_item");
	/** 商品详情错误页 */
	private static final String PRODUCT_ITEM_ERROR = getViewPath("modules/product/product_item_error");
	
	@Autowired
	private IProductService productService;
	@Autowired
	private IProductCategoryService productCategoryService;
	@Autowired
	private IProductAttributeService productAttributeService;
	@Autowired
	private ILabelService labelService;
	@Autowired
	private IProductParameterService productParameterService;
	@Autowired
	private ICommentService commentService;
	@Autowired
	private IProductImageService productImageService;
	@Autowired
	private IQuestionService questionService;
	@Autowired
	private IKindService kindService;
	@Autowired
	private IProductSpecificationService productSpecificationService;
	
	@GetMapping(value="/{productNumber}")
	public String item(Model model, @PathVariable("productNumber") Long productNumber) {
		// 根据编号查找商品信息
		Product product = productService.selectProductByNumber(productNumber, ProductStatusEnum.SHELVE.getStatus());
		if (product == null) {
			return PRODUCT_ITEM_ERROR;
		}
		model.addAttribute("product", product);
		
		// 根据商品ID查找上级类目列表
		List<Category> upperCategories = productCategoryService.selectUpperCategories(product.getProductId());
		model.addAttribute("upperCategories", upperCategories);		
		
		// 根据商品ID查找商品属性
		ProductAttribute productAttribute = productAttributeService.selectByProductId(product.getProductId());
		model.addAttribute("productAttribute", productAttribute);
		
		// 根据商品ID查找商品展示图片
		List<ProductImage> productImages = productImageService.selectByProductId(product.getProductId(),
				CommonConstantEnum.ITEM_PRODUCT_NUMBER.getValue(), StatusEnum.SHOW.getStatus());
		model.addAttribute("productImages", productImages);
		
		// 根据商品ID查找商品标签
		if (product.getLabelId() != null) {
			Label label = labelService.selectById(product.getLabelId());
			model.addAttribute("label", label);
		}
		
		// 根据商品ID从查找产品规格
		List<KindVO> kindVOs = kindService.selectByProductId(product.getProductId(), StatusEnum.SHOW.getStatus());
		model.addAttribute("kindVOs", kindVOs);
		
		if (!kindVOs.isEmpty()) {
			// 根据商品ID和产品规格查找规格属性
			Map<String, Object> productSpecifications = productSpecificationService
					.selectByProductId(product.getProductId(), StatusEnum.SHOW.getStatus(), kindVOs);
			model.addAttribute("productSpecifications", JSON.toJSON(productSpecifications));
		}
		
		// 根据商品ID查找商品参数
		List<ProductParameter> productParameters = productParameterService
				.selectParametersByProductId(product.getProductId(), StatusEnum.SHOW.getStatus());
		model.addAttribute("productParameters", productParameters);
		
		// 根据商品ID查找最新评论
		PageInfo newCommentPage = new PageInfo(CommonConstantEnum.NEW_COMMENT_NUMBER.getValue());
		List<Comment> newComments = commentService.selectNewComments(product.getProductId(),
				CommentTypeEnum.COMMON_ADVERT.getType(), StatusEnum.SHOW.getStatus(), newCommentPage);
		model.addAttribute("newComments", newComments);
		
		// 根据商品ID查找有帮助评价
		PageInfo highCommentPage = new PageInfo(CommonConstantEnum.HIGH_COMMENT_NUMBER.getValue());
		List<CommentVO> highCommentVOs = commentService.selectHighComments(product.getProductId(),
				CommentTypeEnum.HIGH_GUALITY.getType(), StatusEnum.SHOW.getStatus(), highCommentPage);
		model.addAttribute("highCommentVOs", highCommentVOs);

		// 根据商品ID查找最新提问
		PageInfo newQuestionPage = new PageInfo(CommonConstantEnum.QUESTION_NUMBER.getValue());
		List<Question> newQuestions = questionService.selectNewQuestions(product.getProductId(),
				StatusEnum.SHOW.getStatus(), newQuestionPage);
		model.addAttribute("newQuestions", newQuestions);
		
		// 根据商品ID查找最有帮助提问
		PageInfo highQuestionPage = new PageInfo(CommonConstantEnum.QUESTION_NUMBER.getValue());
		List<Question> highQuestions = questionService.selectHighQuestions(product.getProductId(),
				StatusEnum.SHOW.getStatus(), highQuestionPage);			
		model.addAttribute("highQuestions", highQuestions);
		
		// TODO 最有用帮助提问
		return PRODUCT_ITEM;
	}
	
}
