package com.pussinboots.morning.os.modules.question.controller;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pussinboots.morning.common.controller.BaseController;
import com.pussinboots.morning.common.enums.StatusEnum;
import com.pussinboots.morning.common.model.PageInfo;
import com.pussinboots.morning.common.result.ResponseResult;
import com.pussinboots.morning.os.common.enums.CommonConstantEnum;
import com.pussinboots.morning.os.common.security.AuthorizingUser;
import com.pussinboots.morning.os.common.util.SingletonLoginUtils;
import com.pussinboots.morning.os.modules.content.dto.QuestionPageDTO;
import com.pussinboots.morning.os.modules.content.entity.Question;
import com.pussinboots.morning.os.modules.content.enums.CommentSortEnum;
import com.pussinboots.morning.os.modules.content.service.IQuestionService;
import com.pussinboots.morning.os.modules.product.entity.Category;
import com.pussinboots.morning.os.modules.product.entity.Product;
import com.pussinboots.morning.os.modules.product.enums.ProductSortEnum;
import com.pussinboots.morning.os.modules.product.enums.ProductStatusEnum;
import com.pussinboots.morning.os.modules.product.service.IProductCategoryService;
import com.pussinboots.morning.os.modules.product.service.IProductService;

/**
 * 
* 项目名称：morning-os-webapp   
* 类名称：QuestionController   
* 类描述：商品提问表示层控制器 
* 创建人：陈星星   
* 创建时间：2017年3月14日 下午3:47:14   
*
 */
@Controller
@RequestMapping(value = "/question")
public class QuestionController extends BaseController {
	
	/** 商品提问列表 */
	private static final String QUESTION_LIST = getViewPath("modules/question/question_list");
	/** 商品详情错误页 */
	private static final String PRODUCT_ITEM_ERROR = getViewPath("modules/product/product_item_error");
	
	@Autowired
	private IProductService productService;
	@Autowired
	private IProductCategoryService productCategoryService;
	@Autowired
	private IQuestionService questionService;
	
	@GetMapping(value = "/gid/{productNumber}")
	public String list(Model model, @PathVariable("productNumber") Long productNumber) {
		// 根据编号查找商品信息
		Product product = productService.selectProductByNumber(productNumber, ProductStatusEnum.SHELVE.getStatus());
		if (product == null) {
			return PRODUCT_ITEM_ERROR;
		}
		model.addAttribute("product", product);

		// 根据商品ID查找上级类目列表
		List<Category> upperCategories = productCategoryService.selectUpperCategories(product.getProductId());
		model.addAttribute("upperCategories", upperCategories);

		// 获取排序方式,如果排序方式不存或者不为Integer类型,则默认0/推荐排序
		Integer sort = StringUtils.isNumeric(getParameter("sort")) ? Integer.valueOf(getParameter("sort"))
				: CommentSortEnum.HELP.getType();
		// 获取当前页数,如果当前页数不存在或者不为Integer类型,则默认1/默认页数
		Integer page = StringUtils.isNumeric(getParameter("page")) ? Integer.valueOf(getParameter("page")) : 1;

		// 根据商品ID查找有帮助评价
		PageInfo pageInfo = new PageInfo(page, CommonConstantEnum.QUESTION_PAGE_NUMBER.getValue(),
				CommentSortEnum.typeOf(sort).getSort(), CommentSortEnum.typeOf(sort).getOrder());
		QuestionPageDTO questionPageDTO = questionService.selectQuestionsByPage(product.getProductId(), pageInfo,
				StatusEnum.SHOW.getStatus());
		model.addAttribute("questions", questionPageDTO.getQuestions());
		model.addAttribute("pageInfo", questionPageDTO.getPageInfo());

		// 返回排序方式（超过规定的排序方式,则返回默认排序）
		model.addAttribute("sort", ProductSortEnum.typeOf(sort).getType());

		return QUESTION_LIST;
	}
	
	@PostMapping(value = "/{productNumber}")
	@ResponseBody
	public ResponseResult create(@PathVariable("productNumber") Long productNumber, Question question) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();

		if (authorizingUser != null) {
			try {
				questionService.insertQuestion(authorizingUser.getUserId(), question);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return success(true);
		}
		return fail(false, "您未登录或者登录已超时,请先登录!");
	}
}
