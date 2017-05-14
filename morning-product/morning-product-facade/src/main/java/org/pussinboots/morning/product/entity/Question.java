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
* 类名称：Question   
* 类描述：Question / 提问表 实体类   
* 创建人：陈星星   
* 创建时间：2017年4月25日 下午7:28:41   
*
 */
@TableName("os_question")
public class Question extends Model<Question> {

    private static final long serialVersionUID = 1L;

    /**
     * 提问ID
     */
	@TableId(value="question_id", type= IdType.AUTO)
	private Long questionId;
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
     * 提问内容
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
     * 回答内容
     */
	@TableField("answer_content")
	private String answerContent;
    /**
     * 回复人
     */
	@TableField("answer_by")
	private String answerBy;
    /**
     * 回复时间
     */
	@TableField("answer_time")
	private Date answerTime;
    /**
     * 状态：1.已处理；0.未处理；2.不予处理
     */
	private Integer type;
    /**
     * 更新者
     */
	@TableField("update_by")
	private String updateBy;
    /**
     * 更新时间
     */
	@TableField("update_time")
	private Date updateTime;


	public Long getQuestionId() {
		return questionId;
	}

	public void setQuestionId(Long questionId) {
		this.questionId = questionId;
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

	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

	public String getAnswerBy() {
		return answerBy;
	}

	public void setAnswerBy(String answerBy) {
		this.answerBy = answerBy;
	}

	public Date getAnswerTime() {
		return answerTime;
	}

	public void setAnswerTime(Date answerTime) {
		this.answerTime = answerTime;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	@Override
	protected Serializable pkVal() {
		return this.questionId;
	}

}
