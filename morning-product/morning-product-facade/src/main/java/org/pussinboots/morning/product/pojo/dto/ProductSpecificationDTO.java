package org.pussinboots.morning.product.pojo.dto;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.pussinboots.morning.product.pojo.vo.KindVO;

public class ProductSpecificationDTO implements Serializable{

	private static final long serialVersionUID = 1L;
	
	/**
	 * 商品类型列表
	 */
	private List<KindVO> kindVOs;
	
	/**
	 * 商品规格列表
	 */
	private Map<String, Object> productSpecifications;
	

	public ProductSpecificationDTO(List<KindVO> kindVOs, Map<String, Object> productSpecifications) {
		super();
		this.kindVOs = kindVOs;
		this.productSpecifications = productSpecifications;
	}

	public List<KindVO> getKindVOs() {
		return kindVOs;
	}

	public void setKindVOs(List<KindVO> kindVOs) {
		this.kindVOs = kindVOs;
	}

	public Map<String, Object> getProductSpecifications() {
		return productSpecifications;
	}

	public void setProductSpecifications(Map<String, Object> productSpecifications) {
		this.productSpecifications = productSpecifications;
	}
}
