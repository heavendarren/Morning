package com.morning.controller.goods;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.morning.common.util.SingletonLoginUtils;
import com.morning.controller.BaseController;
import com.morning.entity.PageInfo;
import com.morning.entity.ShoppingCart;
import com.morning.entity.goods.Goods;
import com.morning.entity.goods.GoodsClassify;
import com.morning.entity.goods.GoodsPicture;
import com.morning.entity.goods.QueryGoods;
import com.morning.entity.order.OrderMessage;
import com.morning.service.goods.GoodsClassifyService;
import com.morning.service.goods.GoodsPictureService;
import com.morning.service.goods.GoodsService;
import com.morning.service.order.OrderMessageService;
import com.morning.service.order.OrderService;

/**
 * 
 * @description：前台商品controller
 * @author CXX
 * @version 创建时间：2016年7月31日  下午2:19:06
 */
@Controller
public class GoodsController extends BaseController {
	
	private static final Logger logger=Logger.getLogger(GoodsController.class);
	//商品列表
	private static final String commoditylist = getViewPath("/web/commodity/commodity-list");
	//商品详情
	private static final String commoditydetail = getViewPath("/web/commodity/commodity-detail");
	//添加购物车成功
	private static final String commodityshopping = getViewPath("/web/commodity/commodity-shopping");
	
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private GoodsClassifyService goodsClassifyService;
	@Autowired
	private GoodsPictureService goodsPictureService;
	@Autowired
	private OrderMessageService orderMessageService;
	@Autowired
	private OrderService orderSerivce;

	
    // 绑定变量名字和属性，参数封装进类
    @InitBinder("queryGoods")
    public void initBinderQueryGoods(WebDataBinder binder) {
        binder.setFieldDefaultPrefix("queryGoods.");
    }
    @InitBinder("pageInfo")
    public void initBinderQueryPageInfo(WebDataBinder binder) {
        binder.setFieldDefaultPrefix("pageInfo.");
    }
	
    /**
     * 商品列表展示,搜索商品
     * @param request
     * @param queryGoods
     * @param pageInfo
     * @return
     */
    @RequestMapping(value="/front/goodslist")
	public ModelAndView showGoodsList(HttpServletRequest request, @ModelAttribute("queryGoods") QueryGoods queryGoods , @ModelAttribute("pageInfo") PageInfo pageInfo){
		ModelAndView modelAndView = new ModelAndView(commoditylist);
		try{
            //单页商品数量
			pageInfo.setpageNumber(12);
			// 搜索课程列表
			List<Goods> goodsList = goodsService.queryWebGoodsListPage(queryGoods, pageInfo);
			modelAndView.addObject("goodsList", goodsList);
			
			//绑定参数返回前台
			if(queryGoods.getClassifyId() != null){
				GoodsClassify goodsClassify = goodsClassifyService.queryClassifyById(queryGoods.getClassifyId());
				modelAndView.addObject("goodsClassify", goodsClassify);
			}
			modelAndView.addObject("queryGoods", queryGoods);
			modelAndView.addObject("pageInfo", pageInfo);
			
		}catch(Exception e){
			logger.error("GoodsController.showGoodsList", e);
		}
		return modelAndView;
	}
	
	/**
	 * 商品详情页
	 * @param goodsId
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping("/front/detail/{goodsId}")
	public ModelAndView showCommodityDetail(@PathVariable Integer goodsId){
		ModelAndView modelAndView = new ModelAndView(commoditydetail);
		try{
			//通过ID查询商品详情
			Goods goods = goodsService.queryGoodsById(goodsId);
			if(goods != null){
				GoodsClassify classify = goodsClassifyService.queryClassifyById(goods.getClassifyId());
				GoodsPicture goodsPicture = new GoodsPicture();
				goodsPicture.setGoodsId(goodsId);
				List<GoodsPicture> goodsPictureList = goodsPictureService.queryPictureByGoods(goodsPicture);
				
				modelAndView.addObject("goods",goods);
				modelAndView.addObject("classify",classify);
				modelAndView.addObject("goodsPictureList",goodsPictureList);
				
				//更新商品的浏览量   
				goodsService.updateGoodsCount("pageViewcount", goodsId);
				
				//查询登用户是否已经收藏
//            	int userId = SingletonLoginUtils.getLoginUserId(request);
//            	if(userId>0){
//            		//查询登用户是否已经收藏
//        			boolean isFavorites = courseFavoritesService.checkFavorites(userId, courseId);
//        			model.addObject("isFavorites", isFavorites);
//            	}
			}
		}catch(Exception e){
			logger.error("CommodityController.showCommodityDetail", e);
		}
		return modelAndView;
	}
	
	/***
	 * 操作：购买商品
	 * @param orderMessageForm
	 * @param modelAndView
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/detail/shopping")
	public ModelAndView showDetailShopping(OrderMessage orderMessage,HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView(commodityshopping);
		try{
			//通过ID查询商品详情
			Goods goods = goodsService.queryGoodsById(orderMessage.getGoodsId());
			orderMessage.setGoods(goods);
			orderMessage.setOrderMoney(goods.getGoodsPrice());
			
			//获取购物车信息
			ShoppingCart shoppingCart = SingletonLoginUtils.getShoppingCart(request);
			List<OrderMessage> cartMessageList =shoppingCart.getCartMessageList();
			//更新购物车列表信息
			orderMessageService.updateShoppingCartList(cartMessageList, orderMessage);
			//更新购物车信息
			orderSerivce.updateShoppingCart(shoppingCart,cartMessageList);
			
			modelAndView.addObject("orderMessage", orderMessage);	
			
			//商品随机10个商品
    		QueryGoods queryCourse = new QueryGoods();
    		queryCourse.setCount(10);//top10
    		queryCourse.setCondition("goodsViewNum");
			List<Goods> goodsFormByRandom=goodsService.queryGoods(queryCourse);	
			modelAndView.addObject("goodsFormByRandom",goodsFormByRandom);
		}catch(Exception e){
			logger.error("CommodityController.showDetailShopping", e);
		}
		return modelAndView;
	}
}
