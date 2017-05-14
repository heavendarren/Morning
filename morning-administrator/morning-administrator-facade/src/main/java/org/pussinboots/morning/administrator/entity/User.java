package org.pussinboots.morning.administrator.entity;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * 
* 项目名称：morning-administrator-facade   
* 类名称：User   
* 类描述：User / 管理员表 实体类    
* 创建人：陈星星   
* 创建时间：2017年3月31日 下午4:44:43   
*
 */
@TableName("cms_user")
public class User extends Model<User> {

    private static final long serialVersionUID = 1L;

    /**
     * 管理员ID
     */
	@TableId(value="user_id", type= IdType.AUTO)
	private Long userId;
    /**
     * 组织ID
     */
	@TableField("organization_id")
	private Long organizationId;
    /**
     * 管理员账号
     */
	@TableField("login_name")
	private String loginName;
    /**
     * 管理员密码
     */
	@TableField("login_password")
	private String loginPassword;
    /**
     * 加密密码的盐
     */
	private String salt;
    /**
     * 昵称
     */
	@TableField("user_name")
	private String userName;
    /**
     * 真实姓名
     */
	@TableField("real_name")
	private String realName;
    /**
     * 性别 0=保密/1=男/2=女
     */
	private Integer sex;
    /**
     * 年龄
     */
	private Integer age;
    /**
     * 用户头像
     */
	@TableField("pic_img")
	private String picImg;
    /**
     * 状态 0=冻结/1=正常
     */
	private Integer status;
    /**
     * 电子邮箱
     */
	private String email;
    /**
     * 手机号码
     */
	private String telephone;
    /**
     * 最后登录时间
     */
	@TableField("last_login_time")
	private Date lastLoginTime;
    /**
     * 最后登录IP
     */
	@TableField("last_login_ip")
	private String lastLoginIp;
    /**
     * 创建时间
     */
	@TableField("create_time")
	private Date createTime;
    /**
     * 创建者
     */
	@TableField("create_by")
	private String createBy;
    /**
     * 更新时间
     */
	@TableField("update_time")
	private Date updateTime;
    /**
     * 更新者
     */
	@TableField("update_by")
	private String updateBy;


	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getOrganizationId() {
		return organizationId;
	}

	public void setOrganizationId(Long organizationId) {
		this.organizationId = organizationId;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getLoginPassword() {
		return loginPassword;
	}

	public void setLoginPassword(String loginPassword) {
		this.loginPassword = loginPassword;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getPicImg() {
		return picImg;
	}

	public void setPicImg(String picImg) {
		this.picImg = picImg;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public Date getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public String getLastLoginIp() {
		return lastLoginIp;
	}

	public void setLastLoginIp(String lastLoginIp) {
		this.lastLoginIp = lastLoginIp;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getCreateBy() {
		return createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}

	@Override
	protected Serializable pkVal() {
		return this.userId;
	}

}
