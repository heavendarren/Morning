package org.pussinboots.morning.product.pojo.vo;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

@JsonInclude(Include.NON_NULL)
public class CategoryAdvertVO implements Serializable{

	private static final long serialVersionUID = 1L;
	
    /**
     * 类目广告ID
     */
	private Long categoryAdvertId;
	
    /**
     * 标题
     */
	private String title;
	
    /**
     * 链接地址
     */
	private String href;
	
    /**
     * 展示图片
     */
	private String picImg;

	public Long getCategoryAdvertId() {
		return categoryAdvertId;
	}

	public void setCategoryAdvertId(Long categoryAdvertId) {
		this.categoryAdvertId = categoryAdvertId;
	}

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
