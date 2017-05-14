package org.pussinboots.morning.os.controller.question;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.pussinboots.morning.common.base.BaseController;
import org.pussinboots.morning.common.base.BasePageDTO;
import org.pussinboots.morning.common.constant.CommonReturnCode;
import org.pussinboots.morning.common.enums.StatusEnum;
import org.pussinboots.morning.common.support.page.PageInfo;
import org.pussinboots.morning.os.common.result.OsResult;
import org.pussinboots.morning.os.common.security.AuthorizingUser;
import org.pussinboots.morning.os.common.util.SingletonLoginUtils;
import org.pussinboots.morning.product.common.enums.QuestionSortEnum;
import org.pussinboots.morning.product.entity.Category;
import org.pussinboots.morning.product.entity.Question;
import org.pussinboots.morning.product.pojo.vo.ProductVO;
import org.pussinboots.morning.product.service.ICategoryService;
import org.pussinboots.morning.product.service.IProductService;
import org.pussinboots.morning.product.service.IQuestionService;
import org.pussinboots.morning.user.pojo.vo.UserVO;
import org.pussinboots.morning.user.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 
* 项目名称：morning-os-web Maven Webapp   
* 类名称：QuestionController   
* 类描述：商品提问表示层控制器      
* 创建人：陈星星   
* 创建时间：2017年4月25日 下午2:46:22   
*
 */
@Controller
@RequestMapping(value = "/question")
@Api(value = "商品提问", description = "商品提问")
public class QuestionController extends BaseController {
	
	@Autowired
	private IQuestionService questionService;
	@Autowired
	private IProductService productService;
	@Autowired
	private ICategoryService categoryService;
	@Autowired
	private IUserService userService;
	
	/**
	 * GET 商品详情页面商品提问
	 * @return
	 */
	@ApiOperation(value = "商品详情页面商品提问列表", notes = "商品详情页面商品提问列表")
	@GetMapping(value = "/askList")
	public String askList(Model model, @RequestParam(value = "productId", required = true) Long productId,
			@RequestParam(value = "sort", required = false, defaultValue = "1") Integer sort,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			@RequestParam(value = "limit", required = false, defaultValue = "6") Integer limit) {

		// 根据商品ID查找提问列表
		PageInfo pageInfo = new PageInfo(page, limit, QuestionSortEnum.typeOf(sort).getSort(),
				QuestionSortEnum.typeOf(sort).getOrder());
		BasePageDTO<Question> basePageDTO = questionService.listByProductId(productId, StatusEnum.SHOW.getStatus(),
				pageInfo);
		model.addAttribute("questions", basePageDTO.getList());// 提问列表
		model.addAttribute("pageInfo", basePageDTO.getPageInfo());// 分页信息

		return "/modules/question/product_detail_question";
	}
	
	
	/**
	 * GET 商品提问页面
	 * @return
	 */
	@ApiOperation(value = "商品提问页面提问列表", notes = "商品提问页面提问列表")
	@GetMapping(value = "/asklist")
	public String asklist(Model model, @RequestParam(value = "productNumber", required = true) Long productNumber,
			@RequestParam(value = "sort", required = false, defaultValue = "1") String reqSort,
			@RequestParam(value = "page", required = false, defaultValue = "1") String reqPage,
			@RequestParam(value = "limit", required = false, defaultValue = "8") Integer limit) {

		ProductVO product = productService.getByNumber(productNumber, StatusEnum.SHELVE.getStatus());
		if (product != null) {
			// 根据类目ID查找上级类目列表
			List<Category> upperCategories = categoryService.listUpperByProductId(product.getProductId(),
					StatusEnum.SHOW.getStatus());

			// 请求参数:排序方式,如果排序方式不存在或者不为Integer类型,则默认0/推荐排序
			Integer sort = StringUtils.isNumeric(reqSort) ? Integer.valueOf(reqSort) : QuestionSortEnum.HELP.getType();
			// 请求参数:分页,如果分页不存在或者不为Integer类型,则默认1/默认页数
			Integer page = StringUtils.isNumeric(reqPage) ? Integer.valueOf(reqPage) : 1;

			// 根据商品ID查找提问列表
			PageInfo pageInfo = new PageInfo(page, limit, QuestionSortEnum.typeOf(sort).getSort(),
					QuestionSortEnum.typeOf(sort).getOrder());
			BasePageDTO<Question> basePageDTO = questionService.listByProductId(product.getProductId(),
					StatusEnum.SHOW.getStatus(), pageInfo);

			model.addAttribute("product", product);// 商品信息
			model.addAttribute("upperCategories", upperCategories);// 上级类目列表
			model.addAttribute("questions", basePageDTO.getList());// 提问列表
			model.addAttribute("pageInfo", basePageDTO.getPageInfo());// 分页信息
			model.addAttribute("sort", QuestionSortEnum.typeOf(sort).getType());// 排序方式
		}
		return "/modules/question/question_list";
	}
	
	/**
	 * POST 商品提问
	 * @return
	 */
	@ApiOperation(value = "商品提问", notes = "商品提问")
	@PostMapping(value = "/ask")
	@ResponseBody
	public Object create(@RequestParam(value = "productId", required = true) Long productId,
			@RequestParam(value = "content", required = true) String content) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			// 根据ID查找用户信息
			UserVO userVO = userService.getById(SingletonLoginUtils.getUserId());
			Question question = new Question();
			question.setUserId(authorizingUser.getUserId());
			question.setUserName(userVO.getUserName());
			question.setPicImg(userVO.getPicImg());
			question.setContent(content);
			Integer count = questionService.insertQuestion(question, productId);
			return new OsResult(CommonReturnCode.SUCCESS, count);
		} else {
			return new OsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
	
	/**
	 * PUT 点赞商品提问
	 * @return
	 */
	@ApiOperation(value = "点赞商品提问", notes = "点赞商品提问")
	@PutMapping(value = "/like")
	@ResponseBody
	public Object like(@RequestParam(value = "questionId", required = true) Long questionId) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			// TODO 用户只要登录,就可以无限点赞,会不会导致恶意攻击
			Integer goodCount = questionService.updateLike(questionId);
			return new OsResult(CommonReturnCode.SUCCESS, goodCount);
		} else {
			return new OsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
}
