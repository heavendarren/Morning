package com.morning.test.statistics;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alibaba.fastjson.JSON;
import com.morning.common.util.NumberUtil;
import com.morning.common.util.toolbox.DateUtil;
import com.morning.entity.statistics.StatisticsDay;
import com.morning.service.statistics.StatisticsDayService;

@RunWith(SpringJUnit4ClassRunner.class)		//表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = { "classpath:spring/spring-context.xml", "classpath:spring/spring-context-mybatis.xml" }) 
public class StatisticsDayTest {
	
	private static Logger logger = LogManager.getLogger(StatisticsDayTest.class.getName()); 
	
	@Resource
	private StatisticsDayService statisticsDayService;
	
	@Test
	public void test(){
		int days = 7;
		String unpayOrder = "";
		int unpay= statisticsDayService.getOrderNumber(new Date(), 1);
		List<StatisticsDay> statisticsDay = statisticsDayService.getStatisticThirty(days);
		Calendar calendar = Calendar.getInstance();
		Object[] showDate = new Object[days];// 时间轴
		for (int i = statisticsDay.size() - 1; i >= 0; i--) {
			calendar.setTime(statisticsDay.get(i).getStatisticsTime());
			showDate[statisticsDay.size() - 1 - i] = (calendar.get(Calendar.MONTH) + 1)+ "月"+ calendar.get(Calendar.DAY_OF_MONTH);
			unpayOrder += statisticsDay.get(i).getDailyUnpayOrderNumber()+ ",";
		}
		String updateTime = DateUtil.formatDateTime(new Date());
		System.out.println(updateTime);
		System.out.println(unpay);
		logger.info(JSON.toJSON(showDate));
		logger.info(JSON.toJSON(unpayOrder));
	}
	
	@Test
	public void test1(){
		double payMoney = statisticsDayService.getPayNumber(new Date(), 6);
		// 昨天已支付金额
		double ytdPayMoney = statisticsDayService.getPayNumber(
				DateUtil.getOffsiteDate(new Date(), Calendar.DATE, -1), 6);
		// 支付金额同比
		String payPercent = NumberUtil.getPercent((int) ytdPayMoney,
				(int) (payMoney - ytdPayMoney));
		System.out.println(payPercent);
	}

}
