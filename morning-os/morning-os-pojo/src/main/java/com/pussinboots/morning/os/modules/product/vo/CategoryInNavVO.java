package com.pussinboots.morning.os.modules.product.vo;

import java.util.List;

import com.pussinboots.morning.os.modules.product.entity.Category;
import com.pussinboots.morning.os.modules.product.entity.Product;

public class CategoryInNavVO extends Category{

	private static final long serialVersionUID = 1L;
	
	/**
	 * 类目商品列表
	 */
	private List<Product> products;

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

}
