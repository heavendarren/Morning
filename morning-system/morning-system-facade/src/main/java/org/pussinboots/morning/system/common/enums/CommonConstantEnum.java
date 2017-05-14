package org.pussinboots.morning.system.common.enums;

/**
 * 
* 项目名称：morning-system-facade   
* 类名称：CommonConstantEnum   
* 类描述：CommonConstantEnum 公共参数枚举表述常量数据字段            
* 创建人：陈星星   
* 创建时间：2017年4月7日 下午3:10:33   
*
 */
public enum CommonConstantEnum {
	
	/** 版本日志每页显示数 */
	VERSION_NUMBER(8, "版本日志每页显示数");
	
	private Integer value;
	
	private String valueInfo;

	private CommonConstantEnum(Integer value, String valueInfo) {
		this.value = value;
		this.valueInfo = valueInfo;
	}

	public Integer getValue() {
		return value;
	}

	public String getValueInfo() {
		return valueInfo;
	}

}
