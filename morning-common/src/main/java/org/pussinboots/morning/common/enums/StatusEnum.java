package org.pussinboots.morning.common.enums;

/**
 * 
* 项目名称：morning-common   
* 类名称：StatusEnum   
* 类描述：StatusEnum 状态枚举表述常量数据字段       
* 创建人：陈星星   
* 创建时间：2017年3月31日 下午12:57:39   
*
 */
public enum StatusEnum {
	
	/** 正常 */
	NORMAL(1, "正常"),
	/** 冻结 */
	FREEZE(0, "冻结"),
	
	/** 激活 */
	ACTIVATED(1, "激活"),
	/** 未激活 */
	NONACTIVATED(0, "未激活"),
	
	/** 显示 */
	SHOW(1, "显示"),
	/** 隐藏 */
	HIDDEN(0, "隐藏"),
	
	/** 有效 */
	VALID(1, "有效"), 
	/** 无效 */
	INVALID(0, "无效"),
	
	/** 选中 */
	CHECKED(1, "选中"),
	/** 未选中 */
	UNCHECKED(0, "未选中"),
	
	/** 默认 */
	DEFAULT(1, "默认 "), 
	/** 下架 */
	UN_DEFAULT(0, "不默认"),
	
	/** 上架 */
	SHELVE(1, "上架"), 
	/** 下架 */
	OFF_SHELVE(0, "下架"),
	
	/** 全部*/
	ALL(null, "全部");
	
	private Integer status;

	private String stateInfo;

	private StatusEnum(Integer status, String stateInfo) {
		this.status = status;
		this.stateInfo = stateInfo;
	}

	public Integer getStatus() {
		return status;
	}

	public String getStateInfo() {
		return stateInfo;
	}

	public static StatusEnum stateOf(int index) {
		for (StatusEnum statusEnum : values()) {
			if (statusEnum.getStatus() == index) {
				return statusEnum;
			}
		}
		return null;
	}
}
