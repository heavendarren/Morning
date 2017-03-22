package com.pussinboots.morning.os.modules.order.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pussinboots.morning.common.controller.BaseController;
import com.pussinboots.morning.common.enums.StatusEnum;
import com.pussinboots.morning.os.common.security.AuthorizingUser;
import com.pussinboots.morning.os.common.util.SingletonLoginUtils;
import com.pussinboots.morning.os.modules.product.service.IShoppingCartService;
import com.pussinboots.morning.os.modules.product.vo.CartVO;
import com.pussinboots.morning.os.modules.user.entity.Address;
import com.pussinboots.morning.os.modules.user.service.IAddressService;

@Controller
@RequestMapping(value = "/buy")
public class OrderBuyController extends BaseController {
	
	/** 确认订单  */
	private static final String ORDER_BUY_CHECKOUT = getViewPath("modules/order/order_buy_checkout");
	
	@Autowired
	private IAddressService addressService;
	@Autowired
	private IShoppingCartService shoppingCartService;
	
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
	
	@GetMapping(value = "/confirm")
	public String confirm(Model model) {
		return null;
	}
	
}
