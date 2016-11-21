package com.morning.controller.goods;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
import com.morning.service.goods.IGoodsClassifyService;
import com.morning.service.goods.IGoodsPictureService;
import com.morning.service.goods.IGoodsService;
import com.morning.service.order.OrderMessageService;
import com.morning.service.order.OrderService;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：GoodsController   
* 类描述：电子商城商品信息表示层   
* 创建人：陈星星   
* 创建时间：2016年11月6日 下午10:26:08     
* 修改人：陈星星   
* 修改时间：2016年11月21日 上午1:01:24   
* @version
 */
@Controller
public class GoodsController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);

	/** 商品列表 */
	private static final String COMMODITY_LIST = getViewPath("web/commodity/commodity_list");
	/** 商品详情 */
	private static final String COMMODITY_DETAIL = getViewPath("web/commodity/commodity_detail");
	/** 添加购物车成功 */
	private static final String COMMODITY_SHOPPING = getViewPath("web/commodity/commodity_shopping");
	
	@Autowired
	private IGoodsService goodsService;
	@Autowired
	private IGoodsClassifyService goodsClassifyService;
	@Autowired
	private IGoodsPictureService goodsPictureService;
	@Autowired
	private OrderMessageService orderMessageService;
	@Autowired
	private OrderService orderService;
	
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
     * @param queryGoods
     * @param pageInfo
     * @return
     */
	@RequestMapping(value = "/front/goodslist", method = RequestMethod.POST)
	public String showGoodsList(Model model,
			@ModelAttribute("queryGoods") QueryGoods queryGoods,
			@ModelAttribute("pageInfo") PageInfo pageInfo) {
		List<Goods> goodsList = goodsService.selectGoodsListByPage(queryGoods, pageInfo);
		model.addAttribute("goodsList", goodsList);// 搜索课程列表
		// 绑定参数返回前台
		if (queryGoods.getClassifyId() != null) {
			GoodsClassify goodsClassify = goodsClassifyService.selectGoodsClassifyById(queryGoods.getClassifyId());
			model.addAttribute("goodsClassify", goodsClassify);
		}
		model.addAttribute("queryGoods", queryGoods);
		model.addAttribute("pageInfo", pageInfo);
		return COMMODITY_LIST;
	}
	
	/**
	 * 商品详情页
	 * @param goodsId
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping(value = "/front/detail/{goodsId}", method = RequestMethod.GET)
	public String showCommodityDetail(Model model, @PathVariable Integer goodsId) {
		Goods goods = goodsService.selectGoodsByGoodsId(goodsId);//通过ID查询商品详情
		if(goods != null){
			model.addAttribute("goods", goods);
			
			List<GoodsPicture> goodsPictureList = goodsPictureService.selectGoodsPictures(goods.getGoodsId());
			model.addAttribute("goodsPictureList",goodsPictureList);
			
			goodsService.updateGoodsViewCount(goodsId);//更新商品的浏览量   
			
			//查询登用户是否已经收藏
//            	int userId = SingletonLoginUtils.getLoginUserId(request);
//            	if(userId>0){
//            		//查询登用户是否已经收藏
//        			boolean isFavorites = courseFavoritesService.checkFavorites(userId, courseId);
//        			model.addObject("isFavorites", isFavorites);
//            	}
		}
		return COMMODITY_DETAIL;
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
		ModelAndView modelAndView = new ModelAndView(COMMODITY_SHOPPING);
		try{
			//通过ID查询商品详情
			Goods goods = goodsService.selectGoodsByGoodsId(orderMessage.getGoodsId());//通过ID查询商品详情
			orderMessage.setGoods(goods);
			orderMessage.setOrderMoney(goods.getGoodsPrice());

			
			//获取购物车信息
			ShoppingCart shoppingCart = SingletonLoginUtils.getShoppingCart(request);
			List<OrderMessage> cartMessageList =shoppingCart.getCartMessageList();
			//更新购物车列表信息
			orderMessageService.updateShoppingCartList(cartMessageList, orderMessage);
			//更新购物车信息
			orderService.updateShoppingCart(shoppingCart,cartMessageList);
			
			modelAndView.addObject("orderMessage", orderMessage);	
			
			List<Goods> goodsFormByRandom = goodsService.selectGoodsList(10, "goodsViewNum", 1);
			modelAndView.addObject("goodsFormByRandom",goodsFormByRandom);
		}catch(Exception e){
			logger.error("CommodityController.showDetailShopping", e);
		}
		return modelAndView;
	}
}
