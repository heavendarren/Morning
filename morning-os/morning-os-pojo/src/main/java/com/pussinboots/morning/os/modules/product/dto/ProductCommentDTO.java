package com.pussinboots.morning.os.modules.product.dto;

import java.io.Serializable;

/**
 * 
* 项目名称：morning-os-pojo   
* 类名称：ProductCommentDTO   
* 类描述：ProductCommentDTO 商品评价DTO类   
* 创建人：陈星星   
* 创建时间：2017年2月28日 上午1:45:21   
*
 */
public class ProductCommentDTO implements Serializable{

	private static final long serialVersionUID = 1L;
	
	/**
	 * 昵称
	 */
	private String userName;
	
    /**
     * 评论内容
     */
	private String content;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}
