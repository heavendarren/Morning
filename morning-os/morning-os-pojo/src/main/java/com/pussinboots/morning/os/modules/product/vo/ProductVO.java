package com.pussinboots.morning.os.modules.product.vo;

import com.pussinboots.morning.os.modules.product.entity.Product;

public class ProductVO extends Product {

	private static final long serialVersionUID = 1L;
	
	/** 明星产品显示数量 */
	public static final Integer STAR_PRODUCT_NUMBER = 10;

	/** 首页默认显示产品数量 */
	public static final Integer DEFAULT_PRODUCT_NUMBER = 8;
	
	/** 标签ID */
	private Integer labelId;

	/** 标签名称 */
	private String labelName;
	
    /** 销售量 */
	private Integer salesVolume;
	
    /** 评论数量 */
	private Integer commentNumber;
	
	/** 昵称 */
	private String userName;
	
    /** 评论内容 */
	private String content;
	
	public Integer getLabelId() {
		return labelId;
	}
	
	public void setLabelId(Integer labelId) {
		this.labelId = labelId;
	}
	
	public String getLabelName() {
		return labelName;
	}
	
	public void setLabelName(String labelName) {
		this.labelName = labelName;
	}

	public Integer getSalesVolume() {
		return salesVolume;
	}

	public void setSalesVolume(Integer salesVolume) {
		this.salesVolume = salesVolume;
	}

	public Integer getCommentNumber() {
		return commentNumber;
	}

	public void setCommentNumber(Integer commentNumber) {
		this.commentNumber = commentNumber;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}
