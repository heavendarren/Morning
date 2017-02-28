package com.pussinboots.morning.os.modules.product.vo;

import java.util.List;

import com.pussinboots.morning.os.modules.product.dto.CategoryAdvertDTO;
import com.pussinboots.morning.os.modules.product.entity.Category;
import com.pussinboots.morning.os.modules.product.entity.Product;

public class CategoryVO extends Category{

	private static final long serialVersionUID = 1L;
	
	public static final String HOT_NAME = "热门";
	
	/**
	 * 类目商品列表
	 */
	private List<Product> products;
	
	/**
	 * 首页产品展示列表
	 */
	private List<ProductVO> productVOs;
	
	/** 类目广告 */
	private List<CategoryAdvertDTO> categoryAdvertDTOs;
	
	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public List<ProductVO> getProductVOs() {
		return productVOs;
	}

	public void setProductVOs(List<ProductVO> productVOs) {
		this.productVOs = productVOs;
	}

	public List<CategoryAdvertDTO> getCategoryAdvertDTOs() {
		return categoryAdvertDTOs;
	}

	public void setCategoryAdvertDTOs(List<CategoryAdvertDTO> categoryAdvertDTOs) {
		this.categoryAdvertDTOs = categoryAdvertDTOs;
	}
	
}
