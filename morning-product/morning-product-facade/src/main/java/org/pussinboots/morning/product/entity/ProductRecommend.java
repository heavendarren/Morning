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
* 类名称：ProductRecommend   
* 类描述：ProductRecommend / 商品推荐表 实体类
* 创建人：陈星星   
* 创建时间：2017年4月11日 下午3:11:20   
*
 */
@TableName("os_product_recommend")
public class ProductRecommend extends Model<ProductRecommend> {

    private static final long serialVersionUID = 1L;

    /**
     * 产品推荐ID
     */
	@TableId(value="recommend_product_id", type= IdType.AUTO)
	private Long recommendProductId;
    /**
     * 推荐位ID
     */
	@TableField("recommend_id")
	private Long recommendId;
    /**
     * 商品ID
     */
	@TableField("product_id")
	private Long productId;
    /**
     * 排序
     */
	private Integer sort;
    /**
     * 状态 1=显示/0=隐藏
     */
	private Integer status;
    /**
     * 推荐起始时间
     */
	@TableField("begin_time")
	private Date beginTime;
    /**
     * 推荐结束时间
     */
	@TableField("end_time")
	private Date endTime;
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


	public Long getRecommendProductId() {
		return recommendProductId;
	}

	public void setRecommendProductId(Long recommendProductId) {
		this.recommendProductId = recommendProductId;
	}

	public Long getRecommendId() {
		return recommendId;
	}

	public void setRecommendId(Long recommendId) {
		this.recommendId = recommendId;
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
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
		return this.recommendProductId;
	}

}
