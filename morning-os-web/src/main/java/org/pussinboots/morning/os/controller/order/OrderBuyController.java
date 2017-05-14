package org.pussinboots.morning.os.controller.order;

import java.util.ArrayList;
import java.util.List;

import org.pussinboots.morning.common.base.BaseController;
import org.pussinboots.morning.common.constant.CommonReturnCode;
import org.pussinboots.morning.common.enums.StatusEnum;
import org.pussinboots.morning.order.common.enums.OrderStatusEnum;
import org.pussinboots.morning.order.entity.Order;
import org.pussinboots.morning.order.entity.OrderProduct;
import org.pussinboots.morning.order.entity.OrderShipment;
import org.pussinboots.morning.order.pojo.vo.OrderShoppingCartVO;
import org.pussinboots.morning.order.service.IOrderProductService;
import org.pussinboots.morning.order.service.IOrderService;
import org.pussinboots.morning.order.service.IOrderShipmentService;
import org.pussinboots.morning.os.common.result.OsResult;
import org.pussinboots.morning.os.common.util.SingletonLoginUtils;
import org.pussinboots.morning.product.pojo.vo.CartVO;
import org.pussinboots.morning.product.pojo.vo.ShoppingCartVO;
import org.pussinboots.morning.product.service.IShoppingCartService;
import org.pussinboots.morning.user.entity.Address;
import org.pussinboots.morning.user.service.IAddressService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 
* 项目名称：morning-os-web Maven Webapp   
* 类名称：OrderBuyController   
* 类描述：商品购买表示层控制器         
* 创建人：陈星星   
* 创建时间：2017年5月10日 下午11:08:49   
*
 */
@Controller
@RequestMapping(value = "/buy")
@Api(value = "商品购买", description = "商品购买")
public class OrderBuyController extends BaseController {
	
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
	 * GET 填写订单信息
	 * @return
	 */
	@ApiOperation(value = "填写订单信息", notes = "填写订单信息")
	@GetMapping(value = "/checkout")
	public String checkout(Model model) {
		// 收获地址
		List<Address> addresses = addressService.listAddress(SingletonLoginUtils.getUserId());
		model.addAttribute("addresses", addresses);

		// 购物车选中商品
		CartVO cartVO = shoppingCartService.list(SingletonLoginUtils.getUserId(), StatusEnum.CHECKED.getStatus());
		model.addAttribute("cartVO", cartVO);

		return "/modules/order/order_buy_checkout";
	}
	
	/**
	 * POST 提交订单
	 * @return
	 */
	@ApiOperation(value = "提交订单", notes = "提交订单")
	@PostMapping(value = "/confirm")
	@ResponseBody
	public Object confirm(Order order, @RequestParam(value = "addressId", required = true) Long addressId) {
		// 收货地址
		Address address = addressService.getAddress(addressId, SingletonLoginUtils.getUserId());
		if (address != null) {
			OrderShipment orderShipment = new OrderShipment();
			BeanUtils.copyProperties(address, orderShipment);

			// 购物车选中商品
			CartVO cartVO = shoppingCartService.list(SingletonLoginUtils.getUserId(), StatusEnum.CHECKED.getStatus());
			if (!cartVO.getShoppingCartVOs().isEmpty()) {
				order.setBuyNumber(cartVO.getTotalNumber());// 订单总数量
				order.setOrderAmount(cartVO.getTotalPrice());// 订单总价格
				order.setOrderScore(cartVO.getTotalScore());// 订单总积分

				// 遍历购物车选中商品列表
				List<OrderShoppingCartVO> orderShoppingCartVOs = new ArrayList<OrderShoppingCartVO>();
				for (ShoppingCartVO vo : cartVO.getShoppingCartVOs()) {
					OrderShoppingCartVO orderShoppingCartVO = new OrderShoppingCartVO();
					BeanUtils.copyProperties(vo, orderShoppingCartVO);
					orderShoppingCartVOs.add(orderShoppingCartVO);
				}
				Long orderNumber = orderService.insertOrder(order, orderShipment, orderShoppingCartVOs,
						SingletonLoginUtils.getUserId());

				if (orderNumber != null) {
					shoppingCartService.deleteCheckStatus(SingletonLoginUtils.getUserId());
					return new OsResult(CommonReturnCode.SUCCESS, orderNumber.toString());
					// TODO Long
					// 17位传送末尾精读损失,例14944366378872495前台接收变成14944366378872494,解决方法toString,原因未知
				} else {
					return new OsResult(CommonReturnCode.UNKNOWN_ERROR.getCode(),
							CommonReturnCode.UNKNOWN_ERROR.getMessage());
				}
			} else {
				return new OsResult(CommonReturnCode.BAD_REQUEST.getCode(), "请选择想要购买的商品!");
			}
		} else {
			return new OsResult(CommonReturnCode.BAD_REQUEST.getCode(), "请选择正确的收货地址!");
		}
	}
	
	/**
	 * GET 确认订单
	 * @return
	 */
	@ApiOperation(value = "确认订单", notes = "确认订单")
	@GetMapping(value = "/confirm/{orderNumber}")
	public String confirmShow(Model model, @PathVariable("orderNumber") Long orderNumber) {

		Order order = orderService.getByOrderNumber(orderNumber, SingletonLoginUtils.getUserId(),
				OrderStatusEnum.SUBMIT_ORDERS.getStatus());

		if (order != null) {

			List<OrderProduct> orderProducts = orderProductService.listByOrderId(order.getOrderId());

			OrderShipment orderShipment = orderShipmentService.getByOrderId(order.getOrderId());

			model.addAttribute("order", order); // 订单信息
			model.addAttribute("orderProducts", orderProducts);// 订单详情表
			model.addAttribute("orderShipment", orderShipment);// 订单配送表
		}

		return "/modules/order/order_buy_confirm";
	}
}
