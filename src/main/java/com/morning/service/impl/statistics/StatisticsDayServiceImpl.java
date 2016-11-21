package com.morning.service.impl.statistics;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.morning.dao.statistics.StatisticsDayMapper;
import com.morning.entity.statistics.StatisticsDay;
import com.morning.service.statistics.StatisticsDayService;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：StatisticsDayServiceImpl   
* 类描述：   网站统计业务逻辑层实现
* 创建人：陈星星   
* 创建时间：2016年10月2日 上午3:53:48   
* 修改人：陈星星   
* 修改时间：2016年10月2日 上午3:53:48   
* 修改备注：   
* @version    
*
 */
@Service("statisticsDayService")
public class StatisticsDayServiceImpl implements StatisticsDayService {
	
	@Autowired
	private StatisticsDayMapper statisticsDayMapper;
	
	@Override
    public void delStatisticsDay(Date date){
		statisticsDayMapper.delStatisticsDay(date);
	}
	
	@Override
	public void addStatisticsDayAuto() {
    	Calendar c = Calendar.getInstance();		
    	c.setTime(new Date());	
    	//每天定时统计前一天的数据，天数减1
    	c.set(Calendar.DATE, c.get(Calendar.DATE) - 1);		
    	Date date = c.getTime();
    	statisticsDayMapper.delStatisticsDay(date);
    	//添加网校统计
    	statisticsDayMapper.addStatisticsDayAuto(date);
	}

	@Override
	public int getLoginNumber(Date date) {
		return statisticsDayMapper.getLoginNumber(date);
	}

	@Override
	public int getOrderNumber(Date date, Integer orderState) {
		Map<String,Object> parameter = new HashMap<String, Object>();
		parameter.put("value", date);
		parameter.put("orderState", orderState);
		return statisticsDayMapper.getOrderNumber(parameter);
	}

	@Override
	public double getPayNumber(Date date, Integer orderState) {
		Map<String,Object> parameter = new HashMap<String, Object>();
		parameter.put("value", date);
		parameter.put("orderState", orderState);
		return statisticsDayMapper.getPayNumber(parameter);
	}

	@Override
	public List<StatisticsDay> getStatisticThirty(Integer days) {
		return statisticsDayMapper.getStatisticThirty(days);
	}
}
