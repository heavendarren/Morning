package com.pussinboots.morning.os.modules.product.vo;

import java.io.Serializable;
import java.util.List;

import com.pussinboots.morning.os.modules.product.dto.CategoryAdvertDTO;

public class IndexProductCategoryVO implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	/** 主产品区分类列表 */
	private List<CategoryVO> categoryVOs;

	/** 类目名称 */
	private String name;
	
	/** 类目广告 */
	private List<CategoryAdvertDTO> categoryAdvertDTOs;

	public List<CategoryVO> getCategoryVOs() {
		return categoryVOs;
	}

	public void setCategoryVOs(List<CategoryVO> categoryVOs) {
		this.categoryVOs = categoryVOs;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<CategoryAdvertDTO> getCategoryAdvertDTOs() {
		return categoryAdvertDTOs;
	}

	public void setCategoryAdvertDTOs(List<CategoryAdvertDTO> categoryAdvertDTOs) {
		this.categoryAdvertDTOs = categoryAdvertDTOs;
	}
}
