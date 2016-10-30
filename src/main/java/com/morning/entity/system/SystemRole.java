package com.morning.entity.system;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

/**
 * 
*    
* 项目名称：morning Maven Webapp   
* 类名称：SystemRole   
* 类描述：系统角色实体类   
* 创建人：陈星星   
* 创建时间：2016年10月23日 下午8:49:02   
* 修改人：陈星星   
* 修改时间：2016年10月23日 下午8:49:02   
* 修改备注：   
* @version    
*
 */
@Data
public class SystemRole implements Serializable{
	
	private static final long serialVersionUID = 5142964679603393096L;
	/**角色编号*/
	private Integer roleId;
	/**角色名称*/
    private String roleName;
	/**所属部门*/
    private String roleOffice;
	/**系统数据：1.是，只有超级管理员能修改；0.否，拥有角色修改人员的权限能都修改*/
    private Integer isSystem;
	/**状态：1.正常；0.冻结*/
    private Integer status;
	/**创建时间*/
    private Date createTime;
	/**创建者*/
    private String createBy;
	/**更新时间*/
    private Date updateTime;
	/**更新者*/
    private String updateBy;
	/**备注信息*/
    private String remarks;
    /**角色人数*/
    private Integer number;
}