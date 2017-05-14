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
* 类名称：Comment   
* 类描述：Comment / 评价表   实体类
* 创建人：陈星星   
* 创建时间：2017年4月11日 下午3:10:21   
*
 */
@TableName("os_comment")
public class Comment extends Model<Comment> {

    private static final long serialVersionUID = 1L;

    /**
     * 评价ID
     */
	@TableId(value="comment_id", type= IdType.AUTO)
	private Long commentId;
    /**
     * 商品ID
     */
	@TableField("product_id")
	private Long productId;
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
     * 订单ID
     */
	@TableField("order_id")
	private Long orderId;
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
	@TableField("good_count")
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

	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
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

	@Override
	protected Serializable pkVal() {
		return this.commentId;
	}

}
