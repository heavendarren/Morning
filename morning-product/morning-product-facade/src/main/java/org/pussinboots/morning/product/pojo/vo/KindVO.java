package org.pussinboots.morning.product.pojo.vo;

import java.io.Serializable;
import java.util.List;

import org.pussinboots.morning.product.entity.KindAttribute;

public class KindVO implements Serializable {

	private static final long serialVersionUID = 1L;
	
    /**
     * 类型ID
     */
	private Long kindId;
	
    /**
     * 商品ID
     */
	private Long productId;
	
    /**
     * 规格ID
     */
	private Long specificationId;
	
    /**
     * 类型名称
     */
	private String name;

	/**
	 * 产品类型属性列表
	 */
	private List<KindAttribute> kindAttributes;
	
	public Long getKindId() {
		return kindId;
	}

	public void setKindId(Long kindId) {
		this.kindId = kindId;
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public Long getSpecificationId() {
		return specificationId;
	}

	public void setSpecificationId(Long specificationId) {
		this.specificationId = specificationId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<KindAttribute> getKindAttributes() {
		return kindAttributes;
	}

	public void setKindAttributes(List<KindAttribute> kindAttributes) {
		this.kindAttributes = kindAttributes;
	}
	}
