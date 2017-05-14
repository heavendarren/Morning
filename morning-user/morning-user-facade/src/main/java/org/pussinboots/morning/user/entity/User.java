package org.pussinboots.morning.user.entity;

import com.baomidou.mybatisplus.enums.IdType;
import java.math.BigDecimal;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * 
* 项目名称：morning-user-facade   
* 类名称：User   
* 类描述：User / 用户表 实体类   
* 创建人：陈星星   
* 创建时间：2017年4月8日 下午2:12:07   
*
 */
@TableName("os_user")
public class User extends Model<User> {

    private static final long serialVersionUID = 1L;

    /**
     * 用户ID
     */
	@TableId(value="user_id", type= IdType.AUTO)
	private Long userId;
    /**
     * 用户编号
     */
	@TableField("user_number")
	private Long userNumber;
    /**
     * 昵称
     */
	@TableField("user_name")
	private String userName;
    /**
     * 登录密码
     */
	@TableField("login_password")
	private String loginPassword;
    /**
     * 加密密码的盐
     */
	private String salt;
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
     * 邮箱激活 0=未激活/1=已激活
     */
	@TableField("email_is_active")
	private Integer emailIsActive;
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
     * 登录次数
     */
	@TableField("login_number")
	private Long loginNumber;
    /**
     * 注册时间
     */
	@TableField("regeist_time")
	private Date regeistTime;
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
    /**
     * 消费额
     */
	private BigDecimal amount;
    /**
     * 会员等级ID
     */
	@TableField("rank_id")
	private Long rankId;
    /**
     * 会员积分
     */
	private Integer score;


	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getUserNumber() {
		return userNumber;
	}

	public void setUserNumber(Long userNumber) {
		this.userNumber = userNumber;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
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

	public Integer getEmailIsActive() {
		return emailIsActive;
	}

	public void setEmailIsActive(Integer emailIsActive) {
		this.emailIsActive = emailIsActive;
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

	public Long getLoginNumber() {
		return loginNumber;
	}

	public void setLoginNumber(Long loginNumber) {
		this.loginNumber = loginNumber;
	}

	public Date getRegeistTime() {
		return regeistTime;
	}

	public void setRegeistTime(Date regeistTime) {
		this.regeistTime = regeistTime;
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

	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	public Long getRankId() {
		return rankId;
	}

	public void setRankId(Long rankId) {
		this.rankId = rankId;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	@Override
	protected Serializable pkVal() {
		return this.userId;
	}

}
