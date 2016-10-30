package com.morning.entity.system;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

/**
 * 
*    
* 项目名称：morning Maven Webapp   
* 类名称：SystemUserRole   
* 类描述： 用户角色实体类  
* 创建人：陈星星   
* 创建时间：2016年10月28日 下午4:56:23   
* 修改人：陈星星   
* 修改时间：2016年10月28日 下午4:56:23   
* 修改备注：   
* @version    
*
 */
@Data
public class SystemUserRole implements Serializable{
	
	private static final long serialVersionUID = 197863750542605706L;

	/**用户角色编号*/
	private Integer userRoleId;
	/**角色编号*/
	private Integer roleId;
	/**用户ID*/
	private Integer accountId;
	/**创建时间*/
    private Date createTime;
	/**创建者*/
    private String createBy;

}
