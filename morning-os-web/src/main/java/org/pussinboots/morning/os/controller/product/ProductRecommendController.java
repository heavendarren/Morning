package org.pussinboots.morning.os.controller.product;

import java.util.List;

import org.pussinboots.morning.common.base.BaseController;
import org.pussinboots.morning.product.common.enums.CommentTypeEnum;
import org.pussinboots.morning.product.common.enums.ProductRecommendTypeEnum;
import org.pussinboots.morning.product.pojo.vo.ProductVO;
import org.pussinboots.morning.product.service.IProductRecommendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 
* 项目名称：morning-os-web Maven Webapp   
* 类名称：ProductRecommendController   
* 类描述：商品推荐表示层控制器   
* 创建人：陈星星   
* 创建时间：2017年4月11日 下午3:37:59   
*
 */
@Controller
@RequestMapping(value = "/recommend")
@Api(value = "商品推荐", description = "商品推荐")
public class ProductRecommendController extends BaseController {
	
	@Autowired
	private IProductRecommendService productRecommendService;
	
	/**
	 * GET 明星商品
	 * @return
	 */
	@ApiOperation(value = "明星商品", notes = "明星商品")  
	@GetMapping(value = "/star")
	public Object listStar(Model model) {
		List<ProductVO> products = productRecommendService.listByRecommendId(ProductRecommendTypeEnum.STAR.getType());
		model.addAttribute("products", products);
		return "/modules/recommend/recommend_star";
	}
	
	/**
	 * GET 为你推荐
	 * @return
	 */
	@ApiOperation(value = "为你推荐", notes = "为你推荐")  
	@GetMapping(value = "/popular")
	public Object listPopular(Model model) {
		List<ProductVO> products = productRecommendService.listByRecommendId(ProductRecommendTypeEnum.POPULAR.getType());
		model.addAttribute("products", products);
		return "/modules/recommend/recommend_popular";
	}
	
	/**
	 * GET 热评商品
	 * @return
	 */
	@ApiOperation(value = "热评商品", notes = "热评商品")  
	@GetMapping(value = "/comment")
	public Object listComment(Model model) {
		List<ProductVO> products = productRecommendService.listComment(ProductRecommendTypeEnum.COMMENT.getType(),
				CommentTypeEnum.HIGH_GUALITY.getType());
		model.addAttribute("products", products);
		return "/modules/recommend/recommend_comment";
	}
	
	/**
	 * GET 新品推荐
	 * @return
	 */
	@ApiOperation(value = "新品推荐", notes = "新品推荐")  
	@GetMapping(value = "/new")
	public Object listNew(Model model) {
		List<ProductVO> products = productRecommendService.listByRecommendId(ProductRecommendTypeEnum.NEW.getType());
		model.addAttribute("products", products);
		return "/modules/recommend/recommend_new";
	}
}
