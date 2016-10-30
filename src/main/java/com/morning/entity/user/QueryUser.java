package com.morning.entity.user;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

/**
 * 
*    
* 项目名称：morning Maven Webapp   
* 类名称：QueryUser   
* 类描述：查询用户   
* 创建人：陈星星   
* 创建时间：2016年10月17日 下午6:45:21   
* 修改人：陈星星   
* 修改时间：2016年10月17日 下午6:45:21   
* 修改备注：   
* @version    
*
 */
@Data
public class QueryUser {
	
	/**搜索内容*/
	private String searchContent;
    /**状态 0正常 1冻结 2删除*/
    private Integer status;
    /**查询 开始注册时间*/
	@DateTimeFormat(pattern="yyyy/MM/dd")
	private Date beginCreateTime;
	/**查询 结束注册时间*/
	@DateTimeFormat(pattern="yyyy/MM/dd")
	private Date endCreateTime;
}
