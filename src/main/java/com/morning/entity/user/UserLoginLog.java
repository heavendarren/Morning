package com.morning.entity.user;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

/**
 * 
 * @description：用户登录日志
 * @author CXX
 * @version 创建时间：2016年8月12日  下午11:37:03
 */
@Data
public class UserLoginLog implements Serializable {
	
	private static final long serialVersionUID = 3907610102817431130L;
	/**登录日志ID*/
	private Integer logId;
	/**登录时间*/
    private Date loginTime;
	/**登录IP*/
    private String userIp;
	/**用户ID*/
    private Integer userId;
	/**操作系统*/
    private String operatingSystem;
	/**浏览器*/
    private String browser;
    
}