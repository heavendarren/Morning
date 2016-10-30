package com.morning.entity.system;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

/**
 * 
 * @description：后台管理员实体类
 * @author CXX
 * @version 创建时间：2016年9月14日  下午2:11:48
 */
@Data
public class SystemUser implements Serializable{

	private static final long serialVersionUID = 2918277223863775768L;
	
	/**用户ID*/
	private Integer accountId;
	/**登录名*/
    private String loginName;
    /**用户密码*/
    private String loginPassword;
    /**昵称*/
    private String userName;
    /**真实姓名*/
    private String realName;
    /**性别 0保密 1男  2女*/
    private Integer sex;
    /**年龄*/
    private Integer age;
    /**头像*/
    private String picImg;
    /**状态 0正常 1冻结 2删除*/
    private Integer status;
    /**最后登录时间*/
    private Date lastLoginTime;
    /**最后登录IP*/
    private String lastLoginIp;
    /**电子邮箱*/
    private String email;
    /**手机号码*/
    private String telephone;
    /**创建时间*/
    private Date createTime;
	/**创建者*/
    private String createBy;
	/**更新时间*/
    private Date updateTime;
	/**更新者*/
    private String updateBy;
}