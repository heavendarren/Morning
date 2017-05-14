package org.pussinboots.morning.product.pojo.vo;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

@JsonInclude(Include.NON_NULL)
public class HotCategoryVO implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
    /**
     * 分类ID
     */
	private Long categoryId;
	
    /**
     * 分类名称
     */
	private String name;
	
	/**
	 * 类目广告列表
	 */
	private List<CategoryAdvertVO> categoryAdverts;
	
	/**
	 * 子级类目列表
	 */
	private List<CategoryVO> categorys;

	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<CategoryAdvertVO> getCategoryAdverts() {
		return categoryAdverts;
	}

	public void setCategoryAdverts(List<CategoryAdvertVO> categoryAdverts) {
		this.categoryAdverts = categoryAdverts;
	}

	public List<CategoryVO> getCategorys() {
		return categorys;
	}

	public void setCategorys(List<CategoryVO> categorys) {
		this.categorys = categorys;
	}
}
