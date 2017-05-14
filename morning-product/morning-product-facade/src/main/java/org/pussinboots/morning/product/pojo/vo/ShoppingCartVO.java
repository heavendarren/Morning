package org.pussinboots.morning.product.pojo.vo;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

public class ShoppingCartVO implements Serializable {

	private static final long serialVersionUID = 1L;
	
    /**
     * 购物车ID
     */
	private Long cartId;
	
    /**
     * 商品规格编号
     */
	private Long productSpecNumber;
	
    /**
     * 用户ID
     */
	private Long userId;
	
    /**
     * 购买数量
     */
	private Integer buyNumber;
	
    /**
     * 创建时间
     */
	private Date createTime;
	
    /**
     * 更新时间
     */
	private Date updateTime;
	
    /**
     * 购物车状态：0,未选中；1,选中
     */
	private Integer checkStatus;
	
    /**
     * 商品ID
     */
	private Long productNumber;
    /**
     * 商品名称
     */
	private String name;
    /**
     * 展示图片
     */
	private String picImg;
    /**
     * 库存
     */
	private Integer stock;
    /**
     * 销售量
     */
	private Integer salesVolume;
    /**
     * 价格
     */
	private BigDecimal price;
	/**
	 * 商品总金额
	 */
	private BigDecimal productAmount;
    /**
     * 积分
     */
	private Integer score;
    /**
     * 商品总积分
     */
	private Integer productScore;
    /**
     * 规格：规格ID，以“,”相隔
     */
	private String spec;
    /**
     * 规格名称
     */
	private List<String> specificationName;
	/**
	 * 商品规格名称
	 */
	private String productSpecName;

	public void getTotal() {
		BigDecimal productAmountTemp = this.getPrice().multiply(new BigDecimal(this.getBuyNumber()));
		Integer productScoreTemp = this.getScore() * this.getBuyNumber();
		this.productAmount = productAmountTemp;
		this.productScore = productScoreTemp;
	}
	
	public Long getCartId() {
		return cartId;
	}

	public void setCartId(Long cartId) {
		this.cartId = cartId;
	}

	public Long getProductSpecNumber() {
		return productSpecNumber;
	}

	public void setProductSpecNumber(Long productSpecNumber) {
		this.productSpecNumber = productSpecNumber;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Integer getBuyNumber() {
		return buyNumber;
	}

	public void setBuyNumber(Integer buyNumber) {
		this.buyNumber = buyNumber;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Integer getCheckStatus() {
		return checkStatus;
	}

	public void setCheckStatus(Integer checkStatus) {
		this.checkStatus = checkStatus;
	}

	public Long getProductNumber() {
		return productNumber;
	}

	public void setProductNumber(Long productNumber) {
		this.productNumber = productNumber;
	}

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getPicImg() {
		return picImg;
	}

	public void setPicImg(String picImg) {
		this.picImg = picImg;
	}

	public Integer getStock() {
		return stock;
	}
	
	public void setStock(Integer stock) {
		this.stock = stock;
	}
	
	public Integer getSalesVolume() {
		return salesVolume;
	}
	
	public void setSalesVolume(Integer salesVolume) {
		this.salesVolume = salesVolume;
	}
	
	public BigDecimal getPrice() {
		return price;
	}
	
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	
	public BigDecimal getProductAmount() {
		BigDecimal productAmountTemp = this.getPrice().multiply(new BigDecimal(this.getBuyNumber()));
		this.productAmount = productAmountTemp;
		return productAmount;
	}

	public void setProductAmount(BigDecimal productAmount) {
		this.productAmount = productAmount;
	}

	public Integer getScore() {
		return score;
	}
	
	public void setScore(Integer score) {
		this.score = score;
	}

	public Integer getProductScore() {
		Integer productScoreTemp = this.getScore() * this.getBuyNumber();
		this.productScore = productScoreTemp;
		return productScore;
	}

	public void setProductScore(Integer productScore) {
		this.productScore = productScore;
	}

	public String getSpec() {
		return spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}

	public List<String> getSpecificationName() {
		return specificationName;
	}

	public void setSpecificationName(List<String> specificationName) {
		this.specificationName = specificationName;
	}

	public String getProductSpecName() {
		StringBuilder productSpecNameTemp = new StringBuilder();
		if (!this.getSpecificationName().isEmpty()) {
			for (String name : this.getSpecificationName()) {
				productSpecNameTemp.append(name);
				productSpecNameTemp.append(StringUtils.SPACE);
			}
			this.productSpecName = productSpecNameTemp.toString();
		}
		return productSpecName;
	}

	public void setProductSpecName(String productSpecName) {
		this.productSpecName = productSpecName;
	}
}
