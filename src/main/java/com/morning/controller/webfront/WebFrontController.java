package com.morning.controller.webfront;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.morning.controller.BaseController;
import com.morning.entity.goods.Goods;
import com.morning.service.goods.IGoodsService;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：WebFrontController   
* 类描述：电子商城首页表示层    
* 创建人：陈星星   
* 创建时间：2016年11月21日 上午12:00:15   
* 修改人：陈星星   
* 修改时间：2016年11月21日 上午12:00:15   
* @version
 */
@Controller
public class WebFrontController extends BaseController {
	
	/** 电子商城首页 */
	private static final String INDEX = getViewPath("web/front/index");
	
	@Autowired
	private IGoodsService goodsService;
	
    /**
     * 首页获取网站首页数据
     * @param modelAndView
     * @return
     * (value = {"/", "/index"}
     */
	@RequestMapping(value = { "/", "/index" }, method = RequestMethod.GET)
	public String index(Model model) {
		List<Goods> goodsFormByBuyNum = goodsService.selectGoodsList(10, "goodsBuyNum", 1);
		model.addAttribute("goodsFormByBuyNum", goodsFormByBuyNum);// 商品销量top10
		List<Goods> goodsFormByDate = goodsService.selectGoodsList(10, "goodsDate", 1);
		model.addAttribute("goodsFormByDate", goodsFormByDate);// 商品上架时间top10
		List<Goods> goodsFormByReviews = goodsService.selectGoodsList(10, "goodsReviews", 1);
		model.addAttribute("goodsFormByReviews", goodsFormByReviews);// 商品评价数top10
		return INDEX;
	}
}
