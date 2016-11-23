package com.morning.controller.main;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.morning.common.util.NumberUtil;
import com.morning.common.util.toolbox.DateUtil;
import com.morning.controller.BaseController;
import com.morning.entity.system.SystemMenu;
import com.morning.service.order.OrderService;
import com.morning.service.statistics.StatisticsDayService;
import com.morning.service.system.ISystemMenuService;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：MainController   
* 类描述：后台主页面表示层   
* 创建人：陈星星   
* 创建时间：2016年11月6日 下午10:26:58   
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午10:26:58   
* @version    
 */
@Controller
@RequestMapping("/system/main")
public class MainController extends BaseController {

	/** 后台管理主界面 */
	private static final String MAIN = getViewPath("admin/main/main");
	/** 后台管理主界面初始化首页 */
	private static final String MAIN_INDEX = getViewPath("admin/main/index");
	
	@Autowired
	private OrderService orderService;
	@Autowired
	private StatisticsDayService statisticsDayService;
	@Autowired
	private ISystemMenuService systemMenuService;
	
	
	/**
	 * 进入操作中心
	 * @param request
	 * @return
	 */
	@RequiresPermissions("system:view")
	@RequestMapping(method = RequestMethod.GET)
	public String main(Model model) {
		Map<String, Object> mainCountMap = new HashMap<>();
		// 未处理订单数
		int undisposedOrder = orderService.queryOrderCountBySystem(2);
		mainCountMap.put("undisposedOrder", undisposedOrder);
		if (undisposedOrder != 0) {
			String undisposedOrderTime = DateUtil.dateDiff(
					orderService.queryOrderTime(2), new Date());
			mainCountMap.put("undisposedOrderTime", undisposedOrderTime);
		}
		// 系统目录
		List<SystemMenu> systemMenus = systemMenuService.selectSystemMenu();
		model.addAttribute("systemMenus", systemMenus);
		model.addAttribute("mainCountMap", mainCountMap);
		return MAIN;
	}
	
	/**
	 * 后台管理主界面初始化首页
	 * @param request
	 * @return
	 */
	@RequiresPermissions("system:view")
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public ModelAndView mainIndex(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView(MAIN_INDEX);
		Map<String, Object> webCountMap = new HashMap<>();
		// 今天未支付订单数
		int unpayOrder = statisticsDayService.getOrderNumber(new Date(), 1);
		webCountMap.put("unpayOrder", unpayOrder);
		// 今天支付订单数
		int payOrder = statisticsDayService.getOrderNumber(new Date(), 6);
		webCountMap.put("payOrder", payOrder);
		// 今天支付订单数
		int allPayOrder = statisticsDayService.getOrderNumber(new Date(), null);
		// 订单转化率
		String orderPercent = NumberUtil.getPercent(allPayOrder, payOrder);
		webCountMap.put("orderPercent", orderPercent);
		// 今天已支付金额
		double payMoney = statisticsDayService.getPayNumber(new Date(), 6);
		webCountMap.put("payMoney", NumberUtil.fmtMicrometer(String.valueOf(payMoney)));
		// 昨天已支付金额
		double ytdPayMoney = statisticsDayService.getPayNumber(DateUtil.getOffsiteDate(new Date(), Calendar.DATE, -1), 6);
		webCountMap.put("ytdPayMoney", NumberUtil.fmtMicrometer(String.valueOf(ytdPayMoney)));
		// 支付金额同比
		String payPercent = NumberUtil.getPercent((int) ytdPayMoney, (int) (payMoney - ytdPayMoney));
		webCountMap.put("payPercent", payPercent);
		modelAndView.addObject("webCountMap", webCountMap);
		return modelAndView;
	}
	
}
