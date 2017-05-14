package org.pussinboots.morning.product.pojo.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.pussinboots.morning.product.entity.CommentReply;

public class CommentVO implements Serializable{

	private static final long serialVersionUID = 1L;
	
    /**
     * 评价ID
     */
	private Long commentId;
	
    /**
     * 商品ID
     */
	private Long productId;
	
    /**
     * 昵称
     */
	private String userName;
	
    /**
     * 用户头像
     */
	private String picImg;
	
    /**
     * 评论星级：1,2,3,4,5
     */
	private Integer star;
	
    /**
     * 评论内容
     */
	private String content;
	
    /**
     * 好评数
     */
	private Integer goodCount;
	
    /**
     * 状态：1.显示；0.隐藏
     */
	private Integer status;
	
    /**
     * 评论类型：1,优质；0,普通
     */
	private Integer type;
	
    /**
     * 创建时间
     */
	private Date createTime;
	
    /**
     * 创建者
     */
	private String createBy;
	
    /**
     * 更新时间
     */
	private Date updateTime;
	
    /**
     * 更新者
     */
	private String updateBy;
	
	/**
	 * 评论回复列表
	 */
	private List<CommentReply> commentReplies;

	public Long getCommentId() {
		return commentId;
	}

	public void setCommentId(Long commentId) {
		this.commentId = commentId;
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPicImg() {
		return picImg;
	}

	public void setPicImg(String picImg) {
		this.picImg = picImg;
	}

	public Integer getStar() {
		return star;
	}

	public void setStar(Integer star) {
		this.star = star;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getGoodCount() {
		return goodCount;
	}

	public void setGoodCount(Integer goodCount) {
		this.goodCount = goodCount;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getCreateBy() {
		return createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}

	public List<CommentReply> getCommentReplies() {
		return commentReplies;
	}

	public void setCommentReplies(List<CommentReply> commentReplies) {
		this.commentReplies = commentReplies;
	}
	
}
