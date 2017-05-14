package org.pussinboots.morning.cms.common.result;

import java.io.Serializable;

/**
 * 
* 项目名称：morning-cms-web Maven Webapp   
* 类名称：CmsPageResult   
* 类描述：CmsPageResult 后台管理系统分页返回结果类    
* 创建人：陈星星   
* 创建时间：2017年4月2日 下午7:04:07   
*
 */
public class CmsPageResult implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Object rows;
	
	private Integer total;
	
	public CmsPageResult(Object rows, Integer total) {
		super();
		this.rows = rows;
		this.total = total;
	}

	public Object getRows() {
		return rows;
	}

	public void setRows(Object rows) {
		this.rows = rows;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}
}
