package com.pussinboots.morning.os.modules.user.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * 
* 项目名称：morning-os-pojo   
* 类名称：Address   
* 类描述：Address表 / 收获地址表 实体类   
* 创建人：陈星星   
* 创建时间：2017年3月16日 下午6:56:21   
*
 */
@TableName("os_address")
public class Address extends Model<Address> {

    private static final long serialVersionUID = 1L;

    /**
     * 收获地址ID
     */
	@TableId("address_id")
	private Long addressId;
    /**
     * 用户ID
     */
	@TableField("user_id")
	private Long userId;
    /**
     * 姓名
     */
	@TableField("user_name")
	private String userName;
    /**
     * 手机号码
     */
	@TableField("user_phone")
	private String userPhone;
    /**
     * 地址标签
     */
	@TableField("user_tag")
	private String userTag;
    /**
     * 省份ID
     */
	@TableField("province_id")
	private Integer provinceId;
    /**
     * 省份名字
     */
	@TableField("province_name")
	private String provinceName;
    /**
     * 城市ID
     */
	@TableField("city_id")
	private Integer cityId;
    /**
     * 城市名字
     */
	@TableField("city_name")
	private String cityName;
    /**
     * 区域ID
     */
	@TableField("district_id")
	private Integer districtId;
    /**
     * 区域名字
     */
	@TableField("district_name")
	private String districtName;
    /**
     * 详细地址
     */
	@TableField("user_adress")
	private String userAdress;
    /**
     * 邮政编码
     */
	@TableField("user_zipcode")
	private Integer userZipcode;
    /**
     * 创建时间
     */
	@TableField("create_time")
	private Date createTime;
    /**
     * 更新时间
     */
	@TableField("update_time")
	private Date updateTime;
	
	public Long getAddressId() {
		return addressId;
	}

	public void setAddressId(Long addressId) {
		this.addressId = addressId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserTag() {
		return userTag;
	}

	public void setUserTag(String userTag) {
		this.userTag = userTag;
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

	public String getUserAdress() {
		return userAdress;
	}

	public void setUserAdress(String userAdress) {
		this.userAdress = userAdress;
	}

	public Integer getUserZipcode() {
		return userZipcode;
	}

	public void setUserZipcode(Integer userZipcode) {
		this.userZipcode = userZipcode;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	@Override
	protected Serializable pkVal() {
		return this.addressId;
	}

}
