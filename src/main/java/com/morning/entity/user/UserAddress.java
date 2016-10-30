package com.morning.entity.user;

import java.io.Serializable;

import lombok.Data;

/**
 * 
 * @description：用户收货地址实体类
 * @author CXX
 * @version 创建时间：2016年8月28日  下午11:00:38
 */
@Data
public class UserAddress implements Serializable{
	
	private static final long serialVersionUID = 1349644188171294575L;
	/**地址编号*/
	private Integer addressId;
	/**用户ID*/
    private Integer accountId;
	/**姓名*/
    private String orderUserName;
	/**手机号码*/
    private String orderUserTelphone;
	/**地址标签*/
    private String tagName;
	/**省份ID*/
    private Integer provinceId;
	/**省份名称*/
    private String provinceName;
	/**城市ID*/
    private Integer cityId;
	/**城市名称*/
    private String cityName;
	/**市县区ID*/
    private Integer districtId;
	/**市县区名称*/
    private String districtName;
	/**邮政编码*/
    private Integer area;
	/**详细地址*/
    private String orderUserAddress;

}