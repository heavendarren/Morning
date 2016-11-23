package com.morning.entity.statistics;

import java.io.Serializable;
import java.util.Date;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：StatisticsDay   
* 类描述：   网站统计实体类
* 创建人：陈星星   
* 创建时间：2016年10月2日 上午2:29:30   
* 修改人：陈星星   
* 修改时间：2016年10月2日 上午2:29:30   
* @version    
*
 */
public class StatisticsDay implements Serializable {
	
	private static final long serialVersionUID = -1624793003739254732L;
	
	/** 统计编号 */
	private Integer statisticsId;
	
	/** 统计日期 */
	private Date statisticsTime;
	
	/** 生成时间 */
	private Date createTime;
	
	/** 登录人数 */
	private Integer dailyLoginNumber;
	
	/** 每日访客数 */
	private Integer dailyUserNumber;
	
	/** 每日游览数 */
	private Integer dailyVisitNumber;
	
	/** 每日订单数 */
	private Integer dailyOrderNumber;
	
	/** 每日支付订单数 */
	private Integer dailyPayOrderNumber;
	
	/** 每日未支付订单数 */
	private Integer dailyUnpayOrderNumber;
	
	/** 每日支付金额数 */
	private Double dailyPayNumber;

	public Integer getStatisticsId() {
		return statisticsId;
	}

	public void setStatisticsId(Integer statisticsId) {
		this.statisticsId = statisticsId;
	}

	public Date getStatisticsTime() {
		return statisticsTime;
	}

	public void setStatisticsTime(Date statisticsTime) {
		this.statisticsTime = statisticsTime;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getDailyLoginNumber() {
		return dailyLoginNumber;
	}

	public void setDailyLoginNumber(Integer dailyLoginNumber) {
		this.dailyLoginNumber = dailyLoginNumber;
	}

	public Integer getDailyUserNumber() {
		return dailyUserNumber;
	}

	public void setDailyUserNumber(Integer dailyUserNumber) {
		this.dailyUserNumber = dailyUserNumber;
	}

	public Integer getDailyVisitNumber() {
		return dailyVisitNumber;
	}

	public void setDailyVisitNumber(Integer dailyVisitNumber) {
		this.dailyVisitNumber = dailyVisitNumber;
	}

	public Integer getDailyOrderNumber() {
		return dailyOrderNumber;
	}

	public void setDailyOrderNumber(Integer dailyOrderNumber) {
		this.dailyOrderNumber = dailyOrderNumber;
	}

	public Integer getDailyPayOrderNumber() {
		return dailyPayOrderNumber;
	}

	public void setDailyPayOrderNumber(Integer dailyPayOrderNumber) {
		this.dailyPayOrderNumber = dailyPayOrderNumber;
	}

	public Integer getDailyUnpayOrderNumber() {
		return dailyUnpayOrderNumber;
	}

	public void setDailyUnpayOrderNumber(Integer dailyUnpayOrderNumber) {
		this.dailyUnpayOrderNumber = dailyUnpayOrderNumber;
	}

	public Double getDailyPayNumber() {
		return dailyPayNumber;
	}

	public void setDailyPayNumber(Double dailyPayNumber) {
		this.dailyPayNumber = dailyPayNumber;
	}
	
	
}