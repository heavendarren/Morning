package org.pussinboots.morning.product.pojo.vo;

import java.io.Serializable;
import java.math.BigDecimal;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.annotation.JsonInclude;

@JsonInclude(Include.NON_NULL)
public class ProductVO implements Serializable{

	private static final long serialVersionUID = 1L;
	
    /**
     * 商品推荐ID
     */
	private Long recommendProductId;
	
    /**
     * 商品ID
     */
	private Long productId;
	
    /**
     * 商品编号
     */
	private Long productNumber;
	
    /**
     * 商品名称
     */
	private String name;
	
    /**
     * 显示价格
     */
	private BigDecimal showPrice;
	
    /**
     * 显示积分
     */
	private Integer showScore;
	
    /**
     * 商品简介
     */
	private String introduce;
	
	/**
	 * 商品描述 
	 */
	private String description;
	
    /**
     * 展示图片
     */
	private String picImg;
	
	/**
	 * 评论数量
	 */
	private Integer commentNumber;
	
	/**
	 * 评论ID
	 */
	private Long commentId;
	
	/**
	 * 评论内容
	 */
	private String content;
	
	/**
	 * 评论人昵称
	 */
	private String userName;
	
	/**
	 * 标签名称
	 */
	private String labelName;
	
	public Long getRecommendProductId() {
		return recommendProductId;
	}

	public void setRecommendProductId(Long recommendProductId) {
		this.recommendProductId = recommendProductId;
	}

	public Long getProductId() {
		return productId;
	}
	
	public void setProductId(Long productId) {
		this.productId = productId;
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
	
	public BigDecimal getShowPrice() {
		return showPrice;
	}
	
	public void setShowPrice(BigDecimal showPrice) {
		this.showPrice = showPrice;
	}
	
	public Integer getShowScore() {
		return showScore;
	}

	public void setShowScore(Integer showScore) {
		this.showScore = showScore;
	}
	
	public String getIntroduce() {
		return introduce;
	}
	
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPicImg() {
		return picImg;
	}
	
	public void setPicImg(String picImg) {
		this.picImg = picImg;
	}

	public Integer getCommentNumber() {
		return commentNumber;
	}

	public void setCommentNumber(Integer commentNumber) {
		this.commentNumber = commentNumber;
	}
	
	public Long getCommentId() {
		return commentId;
	}

	public void setCommentId(Long commentId) {
		this.commentId = commentId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getLabelName() {
		return labelName;
	}

	public void setLabelName(String labelName) {
		this.labelName = labelName;
	}
	
}
