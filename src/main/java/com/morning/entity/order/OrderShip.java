package com.morning.entity.order;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.IdType;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.morning.entity.user.UserAddress;

/**
 *
 * 订单配送表
 *
 */
@TableName("tb_order_ship")
public class OrderShip implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 配送ID */
	@TableId(value = "SHIP_ID", type = IdType.AUTO)
	private Integer shipId;

	/** 订单ID */
	@TableField(value = "ORDER_ID")
	private Integer orderId;

	/** 收货人姓名 */
	@TableField(value = "ORDER_USER_NAME")
	private String orderUserName;

	/** 手机号码 */
	@TableField(value = "ORDER_USER_TELPHONE")
	private String orderUserTelphone;

	/** 省份ID */
	@TableField(value = "PROVINCE_ID")
	private Integer provinceId;

	/** 省份名称 */
	@TableField(value = "PROVINCE_NAME")
	private String provinceName;

	/** 城市编号 */
	@TableField(value = "CITY_ID")
	private Integer cityId;

	/** 城市名称 */
	@TableField(value = "CITY_NAME")
	private String cityName;

	/** 市县区ID */
	@TableField(value = "DISTRICT_ID")
	private Integer districtId;

	/** 市县区名称 */
	@TableField(value = "DISTRICT_NAME")
	private String districtName;

	/** 邮政编码 */
	private Integer area;

	/** 详细地址 */
	@TableField(value = "ORDER_USER_ADDRESS")
	private String orderUserAddress;
	
	public OrderShip() {
		super();
	}
	
	public OrderShip(UserAddress userAddress) {
		super();
		this.orderUserName = userAddress.getOrderUserName();
		this.orderUserTelphone = userAddress.getOrderUserTelphone();
		this.provinceId = userAddress.getProvinceId();
		this.provinceName = userAddress.getProvinceName();
		this.cityId = userAddress.getCityId();
		this.cityName = userAddress.getCityName();
		this.districtId = userAddress.getDistrictId();
		this.districtName = userAddress.getDistrictName();
		this.area = userAddress.getArea();
		this.orderUserAddress = userAddress.getOrderUserAddress();
	}
	
	public Integer getShipId() {
		return this.shipId;
	}

	public void setShipId(Integer shipId) {
		this.shipId = shipId;
	}

	public Integer getOrderId() {
		return this.orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public String getOrderUserName() {
		return this.orderUserName;
	}

	public void setOrderUserName(String orderUserName) {
		this.orderUserName = orderUserName;
	}

	public String getOrderUserTelphone() {
		return this.orderUserTelphone;
	}

	public void setOrderUserTelphone(String orderUserTelphone) {
		this.orderUserTelphone = orderUserTelphone;
	}

	public Integer getProvinceId() {
		return this.provinceId;
	}

	public void setProvinceId(Integer provinceId) {
		this.provinceId = provinceId;
	}

	public String getProvinceName() {
		return this.provinceName;
	}

	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}

	public Integer getCityId() {
		return this.cityId;
	}

	public void setCityId(Integer cityId) {
		this.cityId = cityId;
	}

	public String getCityName() {
		return this.cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public Integer getDistrictId() {
		return this.districtId;
	}

	public void setDistrictId(Integer districtId) {
		this.districtId = districtId;
	}

	public String getDistrictName() {
		return this.districtName;
	}

	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}

	public Integer getArea() {
		return this.area;
	}

	public void setArea(Integer area) {
		this.area = area;
	}

	public String getOrderUserAddress() {
		return this.orderUserAddress;
	}

	public void setOrderUserAddress(String orderUserAddress) {
		this.orderUserAddress = orderUserAddress;
	}

}
