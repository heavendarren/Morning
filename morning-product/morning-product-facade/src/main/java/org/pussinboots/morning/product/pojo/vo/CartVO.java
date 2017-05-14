package org.pussinboots.morning.product.pojo.vo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

public class CartVO implements Serializable{

	private static final long serialVersionUID = 1L;
	
	/** 订单列表*/
	private List<ShoppingCartVO> shoppingCartVOs;
	
	/** 订单总数量 */
	private Integer totalNumber;
	
	/** 订单总价格 */
	private BigDecimal totalPrice;
	
	/** 订单总积分*/
	private Integer totalScore;

	public void getTotal() {
		Integer totalNumberTemp = 0;
		Integer totalScoreTemp = 0;
		BigDecimal totalPriceTemp = BigDecimal.valueOf(0.0);
		for (ShoppingCartVO shoppingCartVO : shoppingCartVOs) {
			totalNumberTemp += shoppingCartVO.getBuyNumber();
			totalScoreTemp += shoppingCartVO.getProductScore();
			totalPriceTemp = totalPriceTemp.add(shoppingCartVO.getProductAmount());
		}
		this.totalNumber = totalNumberTemp;
		this.totalPrice = totalPriceTemp;
		this.totalScore = totalScoreTemp;
	}
	
	public List<ShoppingCartVO> getShoppingCartVOs() {
		return shoppingCartVOs;
	}

	public void setShoppingCartVOs(List<ShoppingCartVO> shoppingCartVOs) {
		this.shoppingCartVOs = shoppingCartVOs;
		this.getTotal();
	}
	
	public Integer getTotalNumber() {
		return totalNumber;
	}

	public void setTotalNumber(Integer totalNumber) {
		this.totalNumber = totalNumber;
	}

	public BigDecimal getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(BigDecimal totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	public Integer getTotalScore() {
		return totalScore;
	}

	public void setTotalScore(Integer totalScore) {
		this.totalScore = totalScore;
	}

}
