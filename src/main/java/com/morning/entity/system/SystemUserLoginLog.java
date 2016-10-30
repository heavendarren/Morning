package com.morning.entity.system;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

/**
 * 
 * @description：后台管理员登录日志实体类
 * @author CXX
 * @version 创建时间：2016年9月14日  下午2:15:03
 */
@Data
public class SystemUserLoginLog implements Serializable{

	private static final long serialVersionUID = -5472870191315984029L;
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