package com.pussinboots.morning.os.modules.user.controller;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.pussinboots.morning.common.controller.BaseController;
import com.pussinboots.morning.common.model.PageInfo;
import com.pussinboots.morning.os.common.enums.CommonConstantEnum;
import com.pussinboots.morning.os.common.security.AuthorizingUser;
import com.pussinboots.morning.os.common.util.SingletonLoginUtils;
import com.pussinboots.morning.os.modules.order.dto.OrderPageDTO;
import com.pussinboots.morning.os.modules.order.enums.OrderTypeEnum;
import com.pussinboots.morning.os.modules.order.service.IOrderService;

/**
 * 
* 项目名称：morning-os-webapp   
* 类名称：UserAccountController   
* 类描述：后台中心-订单中心表示层控制器   
* 创建人：陈星星   
* 创建时间：2017年3月14日 下午11:15:07   
*
 */
@Controller
@RequestMapping(value = "/uc/order")
public class UserOrderController extends BaseController {
	
	/** 我的订单 */
	private static final String USER_ORDER = getViewPath("modules/usercenter/user_order");
	
	@Autowired
	private IOrderService orderService; 
	
	@GetMapping(value = "/list")
	public String list(Model model) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		// 获取排序方式,如果排序方式不存或者不为Integer类型,则默认0/全部有效订单
		Integer type = StringUtils.isNumeric(getParameter("type")) ? Integer.valueOf(getParameter("type"))
				: OrderTypeEnum.ALL_VALID.getType();
		// 获取当前页数,如果当前页数不存在或者不为Integer类型,则默认1/默认页数
		Integer page = StringUtils.isNumeric(getParameter("page")) ? Integer.valueOf(getParameter("page")) : 1;
		// 获取搜索内容,如果搜索内容不存在,则默认空。
		String search = StringUtils.isNotBlank(getParameter("search")) ? getParameter("search").trim() : null;
		
		PageInfo pageInfo = new PageInfo(page, CommonConstantEnum.ORDER_NUMBER.getValue());
		OrderPageDTO orderPageDTO = orderService.selectOrderVO(authorizingUser.getUserId(),
				OrderTypeEnum.typeOf(type).getTypeValue(), pageInfo, search);
		model.addAttribute("orderVOs", orderPageDTO.getOrderVOs());
		System.out.println(JSON.toJSON(orderPageDTO.getOrderVOs()));
		model.addAttribute("pageInfo", orderPageDTO.getPageInfo());
		
		model.addAttribute("type", type);
		model.addAttribute("search", search);
		return USER_ORDER;
	}
	
	@GetMapping(value = "/comment")
	public String comment(Model model) {
		return null;
	}
}
