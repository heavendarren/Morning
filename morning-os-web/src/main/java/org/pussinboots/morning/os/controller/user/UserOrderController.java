package org.pussinboots.morning.os.controller.user;

import org.apache.commons.lang3.StringUtils;
import org.pussinboots.morning.common.base.BaseController;
import org.pussinboots.morning.common.base.BasePageDTO;
import org.pussinboots.morning.common.support.page.PageInfo;
import org.pussinboots.morning.order.common.enums.OrderTypeEnum;
import org.pussinboots.morning.order.pojo.vo.OrderVO;
import org.pussinboots.morning.order.service.IOrderService;
import org.pussinboots.morning.os.common.util.SingletonLoginUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 
* 项目名称：morning-os-web Maven Webapp   
* 类名称：UserOrderController   
* 类描述：后台中心-订单中心表示层控制器      
* 创建人：陈星星   
* 创建时间：2017年5月10日 上午10:21:35   
*
 */
@Controller
@RequestMapping(value = "/uc/order")
@Api(value = "订单中心", description = "订单中心")
public class UserOrderController extends BaseController {
	
	@Autowired
	private IOrderService orderService; 
	
	/**
	 * GET 我的订单
	 * @param model
	 * @return
	 */
	@ApiOperation(value = "我的订单", notes = "我的订单")  
	@GetMapping(value = "/list")
	public String list(Model model, @RequestParam(value = "page", required = false, defaultValue = "1") String reqPage,
			@RequestParam(value = "type", required = false, defaultValue = "0") String reqSort,
			@RequestParam(value = "search", required = false) String search,
			@RequestParam(value = "limit", required = false, defaultValue = "6") Integer limit) {
		
		
		// 请求参数:排序方式,如果排序方式不存在或者不为Integer类型,则默认0/全部有效订单
		Integer type = StringUtils.isNumeric(reqSort) ? Integer.valueOf(reqSort) : OrderTypeEnum.ALL_VALID.getType();
		// 请求参数:分页,如果分页不存在或者不为Integer类型,则默认1/默认页数
		Integer page = StringUtils.isNumeric(reqPage) ? Integer.valueOf(reqPage) : 1;
		
		PageInfo pageInfo = new PageInfo(limit, page);
		
		BasePageDTO<OrderVO> basePageDTO = orderService.list(SingletonLoginUtils.getUserId(), pageInfo,
				OrderTypeEnum.typeOf(type).getTypeValue(), search);	
		
		model.addAttribute("orderVOs", basePageDTO.getList()); // 订单列表
		model.addAttribute("pageInfo", basePageDTO.getPageInfo()); // 分页信息
		model.addAttribute("type", type); // 排序方式
		model.addAttribute("search", search);// 搜索内容
		
		return "/modules/usercenter/user_order";
	}
	
	/**
	 * GET 订单详情
	 * @param model
	 * @param orderNumber
	 * @return
	 */
	@ApiOperation(value = "订单详情", notes = "根据URL传过来的订单编号获取订单详情信息")  
	@GetMapping(value = "/{orderNumber}")
	public String orderView(Model model, @PathVariable("orderNumber") Long orderNumber) {
		OrderVO orderVO = orderService.getOrder(SingletonLoginUtils.getUserId(), orderNumber);
		model.addAttribute("orderVO", orderVO);
		return "/modules/usercenter/user_order_view";
	}
}
