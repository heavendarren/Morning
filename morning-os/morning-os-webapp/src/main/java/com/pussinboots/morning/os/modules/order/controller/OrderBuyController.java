package com.pussinboots.morning.os.modules.order.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pussinboots.morning.common.controller.BaseController;
import com.pussinboots.morning.common.enums.StatusEnum;
import com.pussinboots.morning.common.result.ResponseResult;
import com.pussinboots.morning.os.common.security.AuthorizingUser;
import com.pussinboots.morning.os.common.util.SingletonLoginUtils;
import com.pussinboots.morning.os.modules.order.entity.Order;
import com.pussinboots.morning.os.modules.order.entity.OrderProduct;
import com.pussinboots.morning.os.modules.order.entity.OrderShipment;
import com.pussinboots.morning.os.modules.order.enums.OrderStatusEnum;
import com.pussinboots.morning.os.modules.order.service.IOrderProductService;
import com.pussinboots.morning.os.modules.order.service.IOrderService;
import com.pussinboots.morning.os.modules.order.service.IOrderShipmentService;
import com.pussinboots.morning.os.modules.product.service.IShoppingCartService;
import com.pussinboots.morning.os.modules.product.vo.CartVO;
import com.pussinboots.morning.os.modules.user.entity.Address;
import com.pussinboots.morning.os.modules.user.service.IAddressService;

@Controller
@RequestMapping(value = "/buy")
public class OrderBuyController extends BaseController {
	
	/** 确认订单  */
	private static final String ORDER_BUY_CHECKOUT = getViewPath("modules/order/order_buy_checkout");
	/** 支付订单  */
	private static final String ORDER_BUY_CONFIRM = getViewPath("modules/order/order_buy_confirm");
	
	@Autowired
	private IAddressService addressService;
	@Autowired
	private IShoppingCartService shoppingCartService;
	@Autowired
	private IOrderService orderService;
	@Autowired
	private IOrderProductService orderProductService;
	@Autowired
	private IOrderShipmentService orderShipmentService;
	
	/**
	 * GET 选择购买商品
	 * @param model
	 * @return
	 */
	@GetMapping(value = "/checkout")
	public String checkout(Model model) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		
		// 收获地址
		List<Address> addresses = addressService.selectAddress(authorizingUser.getUserId());
		model.addAttribute("addresses", addresses);
		
		// 购物车选中商品
		CartVO cartVO = shoppingCartService.selectCartVOs(authorizingUser.getUserId(), StatusEnum.CHECKED.getStatus());
		model.addAttribute("cartVO", cartVO);
		
		return ORDER_BUY_CHECKOUT;
	}

	/**
	 * POST 提交订单
	 * @param order
	 * @param addressId
	 * @return
	 */
	@PostMapping(value = "/confirm")
	@ResponseBody
	public ResponseResult confirm(Order order, @RequestParam(value = "addressId", required = true) Long addressId) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		Long orderNumber = orderService.insertOrder(order, addressId, authorizingUser.getUserId());
		return success(true, "订单提交成功!", orderNumber);
	}
	
	/**
	 * GET 确认订单
	 * @param model
	 * @param orderNumber
	 * @return
	 */
	@GetMapping(value = "/confirm/{orderNumber}")
	public String confirmShow(Model model, @PathVariable("orderNumber") Long orderNumber) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		
		Order order = orderService.selectByOrderNumber(orderNumber, authorizingUser.getUserId(),
				OrderStatusEnum.SUBMIT_ORDERS.getStatus());
		model.addAttribute("order", order);
		
		List<OrderProduct> orderProducts = orderProductService.selectByOrderId(order.getOrderId());
		model.addAttribute("orderProducts", orderProducts);
		
		OrderShipment orderShipment = orderShipmentService.selectByOrderId(order.getOrderId());
		model.addAttribute("orderShipment", orderShipment);
		return ORDER_BUY_CONFIRM;
	}
}
