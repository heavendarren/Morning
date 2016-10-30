package com.morning.entity.system;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.Data;

/**
 * 
*    
* 项目名称：morning Maven Webapp   
* 类名称：SystemMenu   
* 类描述：系统权限实体类   
* 创建人：陈星星   
* 创建时间：2016年10月23日 下午9:07:45   
* 修改人：陈星星   
* 修改时间：2016年10月23日 下午9:07:45   
* 修改备注：   
* @version    
*
 */
@Data
public class SystemMenu implements Serializable{
	
	private static final long serialVersionUID = 9137362876083250917L;
	/**权限编号*/
	private Integer menuId;
	/**父级编号*/
    private Integer parentId;
	/**权限类型：1.菜单；2.功能；3.子功能；0.操作*/
    private Integer menuType;
	/**权限代码*/
    private String menuCode;
	/**权限名称*/
    private String menuName;
	/**权限排序*/
    private Integer sort;
	/**链接地址*/
    private String href;
	/**图标名称*/
    private String icon;
	/**状态*/
    private Integer status;
	/**权限标识*/
    private String permission;
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
	/**子级权限List*/
	private List<SystemMenu> childMenuList;
}