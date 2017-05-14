package org.pussinboots.morning.product.entity;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * 
* 项目名称：morning-product-facade   
* 类名称：CommentReply   
* 类描述：CommentReply / 评论回复表   实体类   
* 创建人：陈星星   
* 创建时间：2017年5月9日 下午12:48:46   
*
 */
@TableName("os_comment_reply")
public class CommentReply extends Model<CommentReply> {

    private static final long serialVersionUID = 1L;

    /**
     * 评论回复ID
     */
	@TableId(value="comment_reply_id", type= IdType.AUTO)
	private Long commentReplyId;
    /**
     * 评论ID
     */
	@TableField("comment_id")
	private Long commentId;
    /**
     * 用户ID
     */
	@TableField("user_id")
	private Long userId;
    /**
     * 昵称
     */
	@TableField("user_name")
	private String userName;
    /**
     * 用户头像
     */
	@TableField("pic_img")
	private String picImg;
    /**
     * 评论内容
     */
	private String content;
    /**
     * 好评数
     */
	@TableField("good_count")
	private Integer goodCount;
    /**
     * 状态：1.显示；0.隐藏
     */
	private Integer status;
    /**
     * 评论类型：1,官方回复；0,用户回复
     */
	private Integer type;
    /**
     * 创建时间
     */
	@TableField("create_time")
	private Date createTime;
    /**
     * 创建者
     */
	@TableField("create_by")
	private String createBy;
    /**
     * 更新时间
     */
	@TableField("update_time")
	private Date updateTime;
    /**
     * 更新者
     */
	@TableField("update_by")
	private String updateBy;


	public Long getCommentReplyId() {
		return commentReplyId;
	}

	public void setCommentReplyId(Long commentReplyId) {
		this.commentReplyId = commentReplyId;
	}

	public Long getCommentId() {
		return commentId;
	}

	public void setCommentId(Long commentId) {
		this.commentId = commentId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
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

	@Override
	protected Serializable pkVal() {
		return this.commentReplyId;
	}

}
