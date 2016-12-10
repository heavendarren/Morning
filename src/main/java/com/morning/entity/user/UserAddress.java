package com.morning.entity.user;

import java.io.Serializable;


/**
 * @description：用户收货地址实体类
 * @author CXX
 * @version 创建时间：2016年8月28日  下午11:00:38
 */
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
    
	public Integer getAddressId() {
		return addressId;
	}
	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}
	public Integer getAccountId() {
		return accountId;
	}
	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}
	public String getOrderUserName() {
		return orderUserName;
	}
	public void setOrderUserName(String orderUserName) {
		this.orderUserName = orderUserName;
	}
	public String getOrderUserTelphone() {
		return orderUserTelphone;
	}
	public void setOrderUserTelphone(String orderUserTelphone) {
		this.orderUserTelphone = orderUserTelphone;
	}
	public String getTagName() {
		return tagName;
	}
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	public Integer getProvinceId() {
		return provinceId;
	}
	public void setProvinceId(Integer provinceId) {
		this.provinceId = provinceId;
	}
	public String getProvinceName() {
		return provinceName;
	}
	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}
	public Integer getCityId() {
		return cityId;
	}
	public void setCityId(Integer cityId) {
		this.cityId = cityId;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public Integer getDistrictId() {
		return districtId;
	}
	public void setDistrictId(Integer districtId) {
		this.districtId = districtId;
	}
	public String getDistrictName() {
		return districtName;
	}
	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}
	public Integer getArea() {
		return area;
	}
	public void setArea(Integer area) {
		this.area = area;
	}
	public String getOrderUserAddress() {
		return orderUserAddress;
	}
	public void setOrderUserAddress(String orderUserAddress) {
		this.orderUserAddress = orderUserAddress;
	}
}