package org.pussinboots.morning.product.entity;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * 
* 项目名称：morning-product-facade   
* 类名称：ProductParameter   
* 类描述：ProductParameter / 商品参数表 实体类    
* 创建人：陈星星   
* 创建时间：2017年4月14日 上午1:55:17   
*
 */
@TableName("os_product_parameter")
public class ProductParameter extends Model<ProductParameter> {

    private static final long serialVersionUID = 1L;

    /**
     * 参数ID
     */
    @TableId("product_parameter_id")
	private Long productParameterId;
    /**
     * 商品ID
     */
	@TableField("product_id")
	private Long productId;
    /**
     * 参数名
     */
	private String name;
    /**
     * 参数值
     */
	private String value;
    /**
     * 状态：1.显示；0.隐藏
     */
	private Integer status;
    /**
     * 排序
     */
	private Integer sort;
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


	public Long getProductParameterId() {
		return productParameterId;
	}

	public void setProductParameterId(Long productParameterId) {
		this.productParameterId = productParameterId;
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
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
		return this.productParameterId;
	}

}
