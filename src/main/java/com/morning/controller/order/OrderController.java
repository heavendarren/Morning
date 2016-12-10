package com.morning.controller.order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.morning.common.dto.AjaxResult;
import com.morning.common.util.MD5Utils;
import com.morning.common.util.ServletUtils;
import com.morning.common.util.SingletonLoginUtils;
import com.morning.controller.BaseController;
import com.morning.entity.PageInfo;
import com.morning.entity.ShoppingCart;
import com.morning.entity.order.Order;
import com.morning.entity.order.OrderMessage;
import com.morning.entity.order.OrderShip;
import com.morning.entity.order.QueryOrder;
import com.morning.entity.user.User;
import com.morning.entity.user.UserAddress;
import com.morning.service.order.IOrderShipService;
import com.morning.service.order.OrderService;
import com.morning.service.user.UserAddressService;
import com.morning.service.user.UserService;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：OrderController   
* 类描述：前台订单表示层   
* 创建人：陈星星   
* 创建时间：2016年8月19日  下午11:39:57  
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午10:27:24   
* @version    
*
 */
@Controller
public class OrderController extends BaseController {
	
	/** 我的订单列表 */
	private static final String USER_ORDER = getViewPath("web/usercentre/user_order");
	//ajax:全部订单、待付款、待收货订单
	private static final String AJAXORDERRECOMMEND = getViewPath("web/usercentre/ajax-order-recommend");
	/** 购物车 */
	private static final String PAY_CART = getViewPath("web/pay/pay_cart");
	/** 订单 */
	private static final String PAY_ORDER = getViewPath("web/pay/pay_order");
	/** 订单支付页面 */
	private static final String PAY_CONFIRM = getViewPath("web/pay/pay_confirm");
	/** 订单详情 */
	private static final String USER_ORDER_VIEW = getViewPath("web/usercentre/user_order_view");
	//顶部导航栏购物车
	private static final String AJAX_CART = getViewPath("web/common/ajax-cart");
	
	@Autowired
	private UserAddressService userAddressService;
	@Autowired
	private UserService userService;
	@Autowired 
	private OrderService orderService;
	@Autowired
	private IOrderShipService orderShipService;
	
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
    	return PAY_CART;
    }
    
	@RequestMapping(value="/cart/update")
	@ResponseBody
	public AjaxResult cartUpdate(Integer cartId, Integer count, HttpServletRequest request) {
		// 获取购物车信息
		ShoppingCart shoppingCartInfo = SingletonLoginUtils.getShoppingCart(request);
		List<OrderMessage> cartMessageList = shoppingCartInfo.getCartMessageList();
		for (int i = 0; i < cartMessageList.size(); i++) {
			if (cartId.equals(cartMessageList.get(i).getCartId())) {
				if (count > cartMessageList.get(i).getGoods().getGoodsSaveInfo()) {
					return fail(false, "对不起,商品库存不足,请您修改数量!");
				} else {
					cartMessageList.get(i).setOrderNumber(count);
					// 更新购物车信息
					orderService.updateShoppingCart(shoppingCartInfo,cartMessageList);
				}
			} else {
				return fail(false, "该商品不存在,请刷新后重试!");
			}
		}
		return success(true);
	}
	
	/**
	 * 操作：删除购物车商品
	 * @param order
	 * @param session
	 */
	@RequestMapping(value = "/cart/delete")
	public AjaxResult cartDelate(Integer cartId, HttpServletRequest request){
		//获取购物车信息
		ShoppingCart shoppingCartInfo = SingletonLoginUtils.getShoppingCart(request);
		List<OrderMessage> cartMessageList =shoppingCartInfo.getCartMessageList();
		for(int i=0;i<cartMessageList.size();i++){
			if(cartId.equals(cartMessageList.get(i).getCartId())){
				cartMessageList.remove(i);
			}else{
				return fail(false, "该商品不存在,请刷新后重试!");
			}
		}
		return success(true);
	}
    
    /**
     * 跳转填写订单信息页面
     * @param session
     * @return
     */
    @RequestMapping(value="/buy")
 	public String getBuyPage(Model model, HttpServletRequest request){
		int accountId = SingletonLoginUtils.getLoginUserId(request);
		List<UserAddress> userAddressList = userAddressService.queryAddressByUser(accountId);
		model.addAttribute("userAddressList", userAddressList);
		return PAY_ORDER;
 	}
    
	@RequestMapping(value = "/order/creatOrder", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult creatOrder(HttpServletRequest request,@ModelAttribute("order") Order order) {
		Integer addressId = Integer.valueOf(getParameter("addressId"));
		// 获取购物车信息
		ShoppingCart shoppingCartInfo = SingletonLoginUtils.getShoppingCart(getRequest());
		List<OrderMessage> orderMessageList = shoppingCartInfo.getCartMessageList();

		// 插入订单和详情
		Map<String, Object> returnMap = orderService.createOrderAndMessage(order,addressId,shoppingCartInfo);
		if (Boolean.parseBoolean(returnMap.get("flag").toString())) {
			orderMessageList.clear(); // 清空购物车
			shoppingCartInfo.setTotalMoney(null);
			shoppingCartInfo.setTotalNumber(null);
		}
		return success(true, String.valueOf(returnMap.get("orderNumber")));
	}
    
	@RequestMapping(value = "/order/{orderNumber}/payment", method = RequestMethod.GET)
	public String orderConfirm(Model model, HttpServletRequest request, @PathVariable String orderNumber) {
		int accountId = SingletonLoginUtils.getLoginUserId(request);
		Order order = orderService.queryOrderByNumber(orderNumber, accountId, 1);
		model.addAttribute("order", order);
		OrderShip orderShip = orderShipService.selectByOrderId(order.getOrderId());
		model.addAttribute("orderShip", orderShip);
		return PAY_CONFIRM;
	}
    
	@RequestMapping(value = "/order/{orderNumber}/confirmation", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult confirmation(HttpServletRequest request,
			@PathVariable String orderNumber) {
		int accountId = SingletonLoginUtils.getLoginUserId(request);
		Order order = orderService
				.queryOrderByNumber(orderNumber, accountId, 1);
		if (order != null) {
			String payment = getParameter("order.payment");
			orderService.updateOrder(order, payment, 1, 2);
		} else {
			return fail(false, "抱歉,该订单不存在!");
		}
		return success(true);
	}
	
	@RequestMapping(value = "/order/{orderNumber}/delete", method = RequestMethod.DELETE)
	@ResponseBody
	public AjaxResult orderDelete(HttpServletRequest request,
			@PathVariable String orderNumber) {
		int accountId = SingletonLoginUtils.getLoginUserId(request);
		Order order = orderService
				.queryOrderByNumber(orderNumber, accountId, 1);
		if (order != null) {
			orderService.updateOrder(order, null, null, 0);
		} else {
			return fail(false, "抱歉,该订单不存在!");
		}
		return success(true);
	}
	
	@RequestMapping(value = "/order/{orderNumber}/receiving", method = RequestMethod.POST)
	@ResponseBody
	public AjaxResult orderReceiving(@PathVariable String orderNumber) {
		String loginPassword = getParameter("loginPassword");
		int accountId = SingletonLoginUtils.getLoginUserId(ServletUtils.getRequest());
		User user = new User();
		user.setLoginPassword(MD5Utils.getMD5(loginPassword));
		user.setAccountId(accountId);
		if(userService.selectByUser(user)){
			Order order = orderService.queryOrderByNumber(orderNumber, accountId, 3);
			if(order !=null){
				orderService.updateOrder(order, null, null , 5 );
			}else{
				return fail(false, "抱歉,该订单不存在!");
			}
		}else{
			return fail(false, "密码不正确,请重新输入!");
		}
		return success(true);
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
	public String getMyorderList() {
		return USER_ORDER;
	}
	
	/**
	 * 全部订单、待付款、待收货订单
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/user/ajax/myorder")
	public String getorderList(Model model, HttpServletRequest request, @ModelAttribute("pageInfo") PageInfo pageInfo, @ModelAttribute("queryOrder") QueryOrder queryOrder){
		int accountId = SingletonLoginUtils.getLoginUserId(request);
		if(accountId >= 0){
			pageInfo.setpageNumber(8);//单页订单数量
			queryOrder.setAccountId(accountId);//账户ID
			//搜索订单列表
			List<Order> orderList = orderService.queryOrder(queryOrder,pageInfo);//全部订单
			model.addAttribute("orderList", orderList);
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("queryOrder", queryOrder);
		}
		return AJAXORDERRECOMMEND;
	}

}
