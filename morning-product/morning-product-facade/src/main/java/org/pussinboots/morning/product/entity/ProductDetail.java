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
* 类名称：ProductDetail   
* 类描述：ProductDetail / 商品描述表 实体类       
* 创建人：陈星星   
* 创建时间：2017年4月14日 上午1:54:26   
*
 */
@TableName("os_product_detail")
public class ProductDetail extends Model<ProductDetail> {

    private static final long serialVersionUID = 1L;

    /**
     * 商品描述ID
     */
	@TableId(value="product_detail_id", type= IdType.AUTO)
	private Long productDetailId;
    /**
     * 商品ID
     */
	@TableField("product_id")
	private Long productId;
    /**
     * 商品描述
     */
	private String description;
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


	public Long getProductDetailId() {
		return productDetailId;
	}

	public void setProductDetailId(Long productDetailId) {
		this.productDetailId = productDetailId;
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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
		return this.productDetailId;
	}

}
