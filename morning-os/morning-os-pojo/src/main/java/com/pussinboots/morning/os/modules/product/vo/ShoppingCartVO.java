package com.pussinboots.morning.os.modules.product.vo;

import java.math.BigDecimal;
import java.util.List;

import com.pussinboots.morning.os.modules.product.entity.ShoppingCart;

public class ShoppingCartVO extends ShoppingCart {

	private static final long serialVersionUID = 1L;
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
     * 积分
     */
	private Integer score;
    /**
     * 规格：规格ID，以“,”相隔
     */
	private String spec;
    /**
     * 规格名称
     */
	private List<String> specificationName;
	
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
	
	public Integer getScore() {
		return score;
	}
	
	public void setScore(Integer score) {
		this.score = score;
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
	
}
