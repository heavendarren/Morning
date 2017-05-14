package org.pussinboots.morning.os.controller.order;

import org.pussinboots.morning.common.base.BaseController;
import org.pussinboots.morning.common.constant.CommonReturnCode;
import org.pussinboots.morning.order.entity.OrderShipment;
import org.pussinboots.morning.order.service.IOrderService;
import org.pussinboots.morning.order.service.IOrderShipmentService;
import org.pussinboots.morning.os.common.result.OsResult;
import org.pussinboots.morning.os.common.util.SingletonLoginUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 
* 项目名称：morning-os-web Maven Webapp   
* 类名称：OrderOperationController   
* 类描述：订单操作表示层控制器   
* 创建人：陈星星   
* 创建时间：2017年5月11日 下午12:31:58   
*
 */
@Controller
@RequestMapping(value = "/order")
@Api(value = "订单操作", description = "订单操作")
public class OrderOperationController extends BaseController {
	
	@Autowired
	private IOrderService orderService;
	@Autowired
	private IOrderShipmentService orderShipmentService;
	
	/**
	 * PUT 取消订单
	 * @return
	 */
	@ApiOperation(value = "取消订单", notes = "根据URL传过来的订单编号取消订单")
	@PutMapping(value = "/cancelOrder")
	@ResponseBody
	public Object cancelOrder(Model model, @RequestParam(value = "orderNumber", required = true) Long orderNumber) {
		Integer count = orderService.updateCancelOrder(orderNumber, SingletonLoginUtils.getUserId());
		return new OsResult(CommonReturnCode.SUCCESS, count);
	}
	
	/**
	 * PUT 修改送货时间
	 * @return
	 */
	@ApiOperation(value = "修改送货时间", notes = "根据URL传过来的订单编号修改送货时间")
	@PutMapping(value = "/time")
	@ResponseBody
	public Object timeOrder(Model model, @RequestParam(value = "orderNumber", required = true) Long orderNumber,
			@RequestParam(value = "shipmentTime", required = true) Integer shipmentTime) {
		Integer count = orderService.updateShipmentTime(orderNumber, shipmentTime, SingletonLoginUtils.getUserId());
		return new OsResult(CommonReturnCode.SUCCESS, count);
	}
	
	/**
	 * PUT 修改收货地址
	 * @return
	 */
	@ApiOperation(value = "修改收货地址", notes = "根据URL传过来的收货地址信息修改收货地址")
	@PutMapping(value = "/shipment")
	@ResponseBody
	public Object orderShipment(Model model, OrderShipment orderShipment) {
		Integer count = orderShipmentService.update(orderShipment, SingletonLoginUtils.getUserId());
		return new OsResult(CommonReturnCode.SUCCESS, count);
	}
}
