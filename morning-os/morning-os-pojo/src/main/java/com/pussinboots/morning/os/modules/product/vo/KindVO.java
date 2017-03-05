package com.pussinboots.morning.os.modules.product.vo;

import java.util.List;

import com.pussinboots.morning.os.modules.product.entity.Kind;
import com.pussinboots.morning.os.modules.product.entity.KindAttribute;

public class KindVO extends Kind{

	private static final long serialVersionUID = 1L;
	
	/**
	 * 产品类型属性列表
	 */
	private List<KindAttribute> kindAttributes;
	
	public List<KindAttribute> getKindAttributes() {
		return kindAttributes;
	}

	public void setKindAttributes(List<KindAttribute> kindAttributes) {
		this.kindAttributes = kindAttributes;
	}
}
