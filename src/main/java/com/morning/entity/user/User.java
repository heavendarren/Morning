package com.morning.entity.user;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

/**
 * 
 * @description：用户实体类
 * @author CXX
 * @version 创建时间：2016年8月12日  下午4:14:08
 */
@Data
public class User implements Serializable {

	private static final long serialVersionUID = -681369877242642871L;
	/**用户ID*/
	private Integer accountId;
	/**用户名*/
    private String loginName;
	/**用户密码*/
    private String loginPassword;
	/**注册时间*/
    private Date createDate;
	/**姓名*/
    private String userName;
	/**身份证*/
    private String userIdentity;
	/**用户头像*/
    private String picImg;
    /**电子邮箱*/
    private String email;
    /**手机号码*/
    private String telephone;
    /**性别*/
    private Byte sex;
    /**年龄*/
    private Byte age;
    /**账户余额*/
    private Integer payment;
    /**站内信未读消息数*/
    private Integer msgNum;
    /**用户商城积分 */
    private Integer userPoint;
    /**状态 0正常 1冻结 2删除*/
    private Integer status;
    /**最后登录时间*/
    private Date lastLoginTime;
    /**最后登录IP*/
    private String lastLoginIp;
}