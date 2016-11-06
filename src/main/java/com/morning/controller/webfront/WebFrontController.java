package com.morning.controller.webfront;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.morning.controller.BaseController;
import com.morning.entity.goods.Goods;
import com.morning.entity.goods.QueryGoods;
import com.morning.service.goods.GoodsService;

/**
 * 
*    
* 项目名称：morning Maven Webapp   
* 类名称：WebFrontController   
* 类描述：前台首页表示层   
* 创建人：陈星星   
* 创建时间：2016年11月6日 下午10:30:34   
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午10:30:34   
* 修改备注：   
* @version    
*
 */
@Controller
public class WebFrontController extends BaseController {
	
	//首页
	private static final String indexpage = getViewPath("/web/front/index");
	
	@Autowired
	private GoodsService goodsService;
	
    /**
     * 首页获取网站首页数据
     * @param modelAndView
     * @return
     * (value = {"/", "/index"}
     */
	@RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
	public ModelAndView getIndexpage(HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView(indexpage);
		QueryGoods queryCourse = new QueryGoods();
		queryCourse.setCount(10);//top10
    	//商品销量top10
		queryCourse.setCondition("goodsBuyNum");
    	List<Goods> goodsFormByBuyNum=goodsService.queryGoods(queryCourse);
    	modelAndView.addObject("goodsFormByBuyNum", goodsFormByBuyNum);
    	//商品上架时间top10
    	queryCourse.setCondition("goodsDate");
    	List<Goods> goodsFormByDate=goodsService.queryGoods(queryCourse);		
    	modelAndView.addObject("goodsFormByDate", goodsFormByDate);
    	//商品评价数top10	
    	queryCourse.setCondition("goodsReviews");
    	List<Goods> goodsFormByReviews=goodsService.queryGoods(queryCourse);					
    	modelAndView.addObject("goodsFormByReviews", goodsFormByReviews);    		
		return modelAndView;
	}
}
