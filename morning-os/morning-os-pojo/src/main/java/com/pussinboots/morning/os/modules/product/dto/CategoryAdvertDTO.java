package com.pussinboots.morning.os.modules.product.dto;

import java.io.Serializable;

/**
 * 
* 项目名称：morning-os-pojo   
* 类名称：CategoryAdvertDTO   
* 类描述：CategoryAdvertDTO 类目广告DTO类
* 创建人：陈星星   
* 创建时间：2017年2月23日 下午11:14:14   
*
 */
public class CategoryAdvertDTO implements Serializable{

    private static final long serialVersionUID = 1L;

    /** 标题 */
	private String title;
	
	/** 链接地址*/
	private String href;
	
	/** 展示图片*/
	private String picImg;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public String getPicImg() {
		return picImg;
	}

	public void setPicImg(String picImg) {
		this.picImg = picImg;
	}
}
