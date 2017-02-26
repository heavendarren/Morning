package com.pussinboots.morning.os.modules.product.enums;

/**
 * 
* 项目名称：morning-os-pojo   
* 类名称：CategoryStatusEnum   
* 类描述：CategoryStatusEnum 明星产品枚举表述常量数据字段   
* 创建人：陈星星   
* 创建时间：2017年2月4日 下午11:02:16
 */
public enum ProductStarEnum {
	
	STAR_PRODUCT(1, "明星产品"), 
	COMMON_PRODUCT(0, "普通产品");

    private Integer status;
    
    private String stateInfo;
    
	private ProductStarEnum(Integer status, String stateInfo) {
		this.status = status;
		this.stateInfo = stateInfo;
	}

	public Integer getStatus() {
		return status;
	}

	public String getStateInfo() {
		return stateInfo;
	}

	public static ProductStarEnum stateOf(int index) {
		for (ProductStarEnum statusEnum : values()) {
			if (statusEnum.getStatus() == index) {
				return statusEnum;
			}
		}
		return null;
	}
}
