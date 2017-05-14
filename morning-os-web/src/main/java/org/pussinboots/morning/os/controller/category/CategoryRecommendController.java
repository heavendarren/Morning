package org.pussinboots.morning.os.controller.category;

import java.util.List;

import org.pussinboots.morning.common.base.BaseController;
import org.pussinboots.morning.product.common.constant.CategoryConstantEnum;
import org.pussinboots.morning.product.common.enums.CommentTypeEnum;
import org.pussinboots.morning.product.pojo.vo.CategoryVO;
import org.pussinboots.morning.product.service.ICategoryService;
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
* 类名称：CategoryRecommendController   
* 类描述：分类推荐表示层控制器      
* 创建人：陈星星   
* 创建时间：2017年4月12日 下午4:32:33   
*
 */
@Controller
@RequestMapping(value = "/recommend")
@Api(value = "分类推荐", description = "分类推荐")
public class CategoryRecommendController extends BaseController {
	
	@Autowired
	private ICategoryService categoryService;
	
	/**
	 * GET 主商品区置顶推荐
	 * @return
	 */
	@ApiOperation(value = "主商品区置顶分类", notes = "主商品区置顶分类")  
	@GetMapping(value = "/top")
	public Object listStar(Model model) {
		List<CategoryVO> categorys = categoryService.listTop(CategoryConstantEnum.CATEGORY_RECOMMEND_PRODUCT.getValue(),
				CategoryConstantEnum.CATEGORY_RECOMMEND_ADVERT.getValue());
		model.addAttribute("categorys", categorys);
		return "/modules/recommend/recommend_top";
	}
	
	/**
	 * GET 主商品区置顶推荐
	 * @return
	 */
	@ApiOperation(value = "分类商品区热门分类", notes = "分类商品区热门分类")  
	@GetMapping(value = "/hot")
	public Object listHot(Model model) {
		List<CategoryVO> categorys = categoryService.listHot(CategoryConstantEnum.CATEGORY_RECOMMEND_PRODUCT.getValue(),
				CategoryConstantEnum.CATEGORY_RECOMMEND_ADVERT.getValue(), CommentTypeEnum.HIGH_GUALITY.getType());
		model.addAttribute("categorys", categorys);
		return "/modules/recommend/recommend_hot";
	}
}
