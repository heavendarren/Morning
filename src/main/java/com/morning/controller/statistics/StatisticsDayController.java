package com.morning.controller.statistics;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.morning.common.util.toolbox.DateUtil;
import com.morning.controller.BaseController;
import com.morning.entity.statistics.StatisticsDay;
import com.morning.service.statistics.StatisticsDayService;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：StatisticsDayController   
* 类描述： 网站统计表示层
* 创建人：陈星星   
* 创建时间：2016年10月5日 下午10:43:45   
* 修改人：陈星星   
* 修改时间：2016年10月5日 下午10:43:45   
* @version    
*
 */
@Controller
@RequestMapping("/system")
public class StatisticsDayController extends BaseController{
	
	private static final Logger logger = LoggerFactory.getLogger(StatisticsDayController.class);
	
	@Autowired
	private StatisticsDayService statisticsDayService;
	
	@RequestMapping("/statistics/detailajax")
	@ResponseBody
	public Map<String, Object> getDetailAjax(HttpServletRequest request, @RequestParam int days, @RequestParam String type){
		Map<String, Object> json = new HashMap<>();
		try {
			List<StatisticsDay> statisticsDay = statisticsDayService.getStatisticThirty(days);
			Map<String, Object> orderDate= new HashMap<>();//记录订单统计数
			String updateTime = DateUtil.formatDateTime(new Date());
			Object[] unpayOrder = new Object[days]; // 未支付订单
			Object[] payOrder = new Object[days]; // 支付订单
			
			Calendar calendar = Calendar.getInstance();
			Object[] showDate = new Object[days];// 时间轴
			for (int i = statisticsDay.size() - 1; i >= 0; i--) {
				calendar.setTime(statisticsDay.get(i).getStatisticsTime());
				showDate[statisticsDay.size() - 1 - i] = (calendar.get(Calendar.MONTH) + 1)+ "月"+ calendar.get(Calendar.DAY_OF_MONTH);
				if ("ORDER_NUM".equals(type)) {
					unpayOrder[statisticsDay.size() - 1 - i]  = statisticsDay.get(i).getDailyUnpayOrderNumber();
					payOrder[statisticsDay.size() - 1 - i]  = statisticsDay.get(i).getDailyPayOrderNumber();
				}
			}
			if("ORDER_NUM".equals(type)||"REGISTERED_NUM".equals(type)){
				orderDate.put("updateTime", updateTime);
				orderDate.put("unpayOrder", unpayOrder);
				orderDate.put("payOrder", payOrder);
				orderDate.put("showDate", showDate);
				json = this.setJson(true,"数据更新成功!", orderDate);
			}
		} catch (Exception e) {
			logger.error("StatisticsDayController.getDetailAjax", e);
		}
		return json;
	}
}
