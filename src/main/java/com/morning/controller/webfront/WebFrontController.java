package com.morning.controller.webfront;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
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
 * @description：前台controller
 * @author CXX
 * @version 创建时间：2016年7月15日  上午11:07:48
 */
@Controller
public class WebFrontController extends BaseController {
	
	//提供一个logger，完成日志信息
	private static final Logger logger=Logger.getLogger(WebFrontController.class);
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
    	try{
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
    	}catch(Exception e){
    		logger.error("WebFrontController.getIndexpage", e);
    	}
		return modelAndView;
	}
}
