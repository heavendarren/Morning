package com.morning.controller.order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.morning.common.util.MD5Utils;
import com.morning.common.util.ServletUtils;
import com.morning.common.util.SingletonLoginUtils;
import com.morning.controller.BaseController;
import com.morning.entity.PageInfo;
import com.morning.entity.ShoppingCart;
import com.morning.entity.order.Order;
import com.morning.entity.order.OrderMessage;
import com.morning.entity.order.QueryOrder;
import com.morning.entity.user.User;
import com.morning.entity.user.UserAddress;
import com.morning.service.order.OrderService;
import com.morning.service.user.UserAddressService;
import com.morning.service.user.UserService;

/**
 * 
*    
* 项目名称：morning Maven Webapp   
* 类名称：OrderController   
* 类描述：前台订单表示层   
* 创建人：陈星星   
* 创建时间：2016年8月19日  下午11:39:57  
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午10:27:24   
* 修改备注：   
* @version    
*
 */
@Controller
public class OrderController extends BaseController {
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	private UserAddressService userAddressService;
	@Autowired
	private UserService userService;
	@Autowired 
	private OrderService orderService;
	
	// 我的订单列表
	private static final String myorderlist = getViewPath("/web/usercentre/user-order");
	//ajax:全部订单、待付款、待收货订单
	private static final String ajaxorderrecommend = getViewPath("/web/usercentre/ajax-order-recommend");
	//购物车
	private static final String cartpage = getViewPath("/web/pay/pay-cart");
	//订单
	private static final String ordermessage = getViewPath("/web/pay/pay-order");
	/**订单支付页面*/
	private static final String PAY_CONFIRM = getViewPath("/web/pay/pay_confirm");
	/**订单详情*/
	private static final String USER_ORDER_VIEW = getViewPath("/web/usercentre/user_order_view");
	//顶部导航栏购物车
	private static final String shoppingCart = getViewPath("/web/common/ajax-cart");
	
    // 绑定变量名字和属性，参数封装进类
    @InitBinder("order")
    public void initBinderQueryGoods(WebDataBinder binder) {
        binder.setFieldDefaultPrefix("order.");
    }
    @InitBinder("pageInfo")
    public void initBinderQueryPageInfo(WebDataBinder binder) {
        binder.setFieldDefaultPrefix("pageInfo.");
    }
    @InitBinder("queryOrder")
    public void initBinderQueryOrder(WebDataBinder binder) {
        binder.setFieldDefaultPrefix("queryOrder.");
    }
	
    
	/**
	 * 跳转购物车页面
	 * @return
	 */
    @RequestMapping(value="/cart")
    public String getCartPage(){
    	return cartpage;
    }
    
	@RequestMapping(value="/cart/update")
	@ResponseBody
	public Map<String, Object> cartUpdate(Integer cartId, Integer count, HttpServletRequest request) {
		//获取购物车信息
		Map<String, Object> json = new HashMap<String, Object>();
		ShoppingCart shoppingCart = SingletonLoginUtils.getShoppingCart(request);
		List<OrderMessage> cartMessageList =shoppingCart.getCartMessageList();
		for(int i=0;i<cartMessageList.size();i++){
			if(cartId.equals(cartMessageList.get(i).getCartId())){
				if(count>cartMessageList.get(i).getGoods().getGoodsSaveInfo()){
					json = this.setJson(false,"对不起,商品库存不足,请您修改数量!");
				}else{
					cartMessageList.get(i).setOrderNumber(count);
					//更新购物车信息
					orderService.updateShoppingCart(shoppingCart,cartMessageList);
				}
			}else{
				json = this.setJson(false, "该商品不存在,请刷新后重试!");
			}
		}
		return json;
	}
	
	/**
	 * 操作：删除购物车商品
	 * @param order
	 * @param session
	 */
	@RequestMapping(value = "/cart/delete")
	public Map<String, Object> cartDelate(Integer cartId, HttpServletRequest request){
		//获取购物车信息
		Map<String, Object> json = new HashMap<String, Object>();
		ShoppingCart shoppingCart = SingletonLoginUtils.getShoppingCart(request);
		List<OrderMessage> cartMessageList =shoppingCart.getCartMessageList();
		for(int i=0;i<cartMessageList.size();i++){
			if(cartId.equals(cartMessageList.get(i).getCartId())){
				cartMessageList.remove(i);
			}else{
				json = this.setJson(false, "该商品不存在,请刷新后重试!");
			}
		}
		return json;
	}
    
    /**
     * 跳转填写订单信息页面
     * @param session
     * @return
     */
    @RequestMapping(value="/buy")
 	public ModelAndView getBuyPage(HttpServletRequest request){
 		ModelAndView modelAndView = new ModelAndView(ordermessage);
 		try{
 			int accountId = SingletonLoginUtils.getLoginUserId(request);
 			List<UserAddress> userAddressList = userAddressService.queryAddressByUser(accountId);
 			modelAndView.addObject("userAddressList", userAddressList);
 		}catch(Exception e){
 			logger.error("OrderController.getBuyPage", e);
 		}
		return modelAndView;
 	}
    
    @RequestMapping(value="/order/creatOrder", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> creatOrder(HttpServletRequest request, @ModelAttribute("order") Order order){
    	Map<String, Object> json = new HashMap<String, Object>();
    	try{
    		//获取购物车信息
    		ShoppingCart shoppingCart = SingletonLoginUtils.getShoppingCart(request);
    		List<OrderMessage> orderMessageList =shoppingCart.getCartMessageList();
    		
    		//插入订单和详情
    		Map<String, Object> returnMap = orderService.createOrderAndMessage(shoppingCart, order, orderMessageList);
    		if (Boolean.parseBoolean(returnMap.get("flag").toString()) == true) {
    			orderMessageList.clear(); // 清空购物车
    			shoppingCart.setTotalMoney(null);
    			shoppingCart.setTotalNumber(null);
    		}
    		json = this.setJson(true, String.valueOf(returnMap.get("orderNumber")));
    	}catch(Exception e){
    		logger.error("OrderController.creatOrder", e);
    	}
    	return json;
    	
    }
    
	@RequestMapping(value = "/order/{orderNumber}/payment", method = RequestMethod.GET)
	public ModelAndView orderConfirm(HttpServletRequest request, @PathVariable String orderNumber) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName(PAY_CONFIRM);
		int accountId = SingletonLoginUtils.getLoginUserId(request);
		Order order = orderService.queryOrderByNumber(orderNumber, accountId, 1);
		modelAndView.addObject("order", order);
		return modelAndView;
	}
    
	@RequestMapping(value = "/order/{orderNumber}/confirmation", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> confirmation(HttpServletRequest request,
			@PathVariable String orderNumber) {
		Map<String, Object> json = new HashMap<String, Object>();
		int accountId = SingletonLoginUtils.getLoginUserId(request);
		Order order = orderService
				.queryOrderByNumber(orderNumber, accountId, 1);
		if (order != null) {
			String payment = getParameter("order.payment");
			orderService.updateOrder(order, payment, 1, 2);
			json = this.setJson(true);
		} else {
			json = this.setJson(false, "抱歉,该订单不存在!");
		}
		return json;
	}
	
	@RequestMapping(value = "/order/{orderNumber}/delete", method = RequestMethod.DELETE)
	@ResponseBody
	public Map<String, Object> orderDelete(HttpServletRequest request,
			@PathVariable String orderNumber) {
		Map<String, Object> json = new HashMap<String, Object>();
		int accountId = SingletonLoginUtils.getLoginUserId(request);
		Order order = orderService
				.queryOrderByNumber(orderNumber, accountId, 1);
		if (order != null) {
			orderService.updateOrder(order, null, null, 0);
			json = this.setJson(true);
		} else {
			json = this.setJson(false, "抱歉,该订单不存在!");
		}
		return json;
	}
	
	@RequestMapping(value = "/order/{orderNumber}/receiving", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> orderReceiving(@PathVariable String orderNumber) {
		Map<String, Object> json = new HashMap<String, Object>();
		String loginPassword = getParameter("loginPassword");
		int accountId = SingletonLoginUtils.getLoginUserId(ServletUtils.getRequest());
		User user = new User();
		user.setLoginPassword(MD5Utils.getMD5(loginPassword));
		user.setAccountId(accountId);
		if(userService.selectByUser(user)){
			Order order = orderService.queryOrderByNumber(orderNumber, accountId, 3);
			if(order !=null){
				orderService.updateOrder(order, null, null , 5 );
				json = this.setJson(true);
			}else{
				json = this.setJson(false, "抱歉,该订单不存在!");
			}
		}else{
			json = this.setJson(false, "密码不正确,请重新输入!");
		}
		return json;
	}
	
	@RequestMapping(value="/order/{orderNumber}/view",method = RequestMethod.GET)
	public ModelAndView orderView(@PathVariable String orderNumber){
		ModelAndView modelAndView  = new ModelAndView();
		modelAndView.setViewName(USER_ORDER_VIEW);
		return modelAndView;
	}
	
	
	/**
	 * 跳转我的订单页面
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/user/myorder/list")
	public ModelAndView getMyorderList(HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView(myorderlist);
		return modelAndView;
	}
	
	/**
	 * 全部订单、待付款、待收货订单
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/user/ajax/myorder")
	public ModelAndView getorderList(HttpServletRequest request, @ModelAttribute("pageInfo") PageInfo pageInfo, @ModelAttribute("queryOrder") QueryOrder queryOrder){
		ModelAndView modelAndView = new ModelAndView(ajaxorderrecommend);
		try{
			int accountId = SingletonLoginUtils.getLoginUserId(request);
			if(accountId >= 0){
				pageInfo.setpageNumber(8);//单页订单数量
				queryOrder.setAccountId(accountId);//账户ID
				//搜索订单列表
				List<Order> orderList = orderService.queryOrder(queryOrder,pageInfo);//全部订单
				modelAndView.addObject("orderList", orderList);
				modelAndView.addObject("pageInfo", pageInfo);
				modelAndView.addObject("queryOrder", queryOrder);
			}
		}catch(Exception e){
			logger.error("OrderController.getorderList", e);
		}
		return modelAndView;
	}

}
