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
* 类名称：CategoryAdvert   
* 类描述：CategoryAdvert / 类目广告表 实体类   
* 创建人：陈星星   
* 创建时间：2017年4月12日 下午4:19:44   
*
 */
@TableName("os_category_advert")
public class CategoryAdvert extends Model<CategoryAdvert> {

    private static final long serialVersionUID = 1L;

    /**
     * 类目广告ID
     */
	@TableId(value="category_advert_id", type= IdType.AUTO)
	private Long categoryAdvertId;
    /**
     * 类目ID
     */
	@TableField("category_id")
	private Long categoryId;
    /**
     * 标题
     */
	private String title;
    /**
     * 排序
     */
	private Integer sort;
    /**
     * 链接地址
     */
	private String href;
    /**
     * 状态 1=显示/0=隐藏
     */
	private Integer status;
    /**
     * 展示图片
     */
	@TableField("pic_img")
	private String picImg;
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
    /**
     * 广告起始时间
     */
	@TableField("begin_time")
	private Date beginTime;
    /**
     * 广告结束时间
     */
	@TableField("end_time")
	private Date endTime;
    /**
     * 备注信息
     */
	private String remarks;


	public Long getCategoryAdvertId() {
		return categoryAdvertId;
	}

	public void setCategoryAdvertId(Long categoryAdvertId) {
		this.categoryAdvertId = categoryAdvertId;
	}

	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getPicImg() {
		return picImg;
	}

	public void setPicImg(String picImg) {
		this.picImg = picImg;
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

	public Date getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(Date beginTime) {
		this.beginTime = beginTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	@Override
	protected Serializable pkVal() {
		return this.categoryAdvertId;
	}

}
