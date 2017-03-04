package com.pussinboots.morning.os.modules.product.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * 
* 项目名称：morning-os-pojo   
* 类名称：ProductCategory   
* 类描述：ProductCategory表 / 商品表分类表关联表 实体类    
* 创建人：陈星星   
* 创建时间：2017年2月23日 下午3:35:50   
*
 */
@TableName("os_product_category")
public class ProductCategory extends Model<ProductCategory> {

    private static final long serialVersionUID = 1L;

    /**
     * 商品分类ID
     */
	@TableId("product_category_id")
	private Long productCategoryId;
    /**
     * 商品ID
     */
	@TableField("product_id")
	private Long productId;
    /**
     * 分类ID
     */
	@TableField("category_id")
	private Long categoryId;
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
	

	public ProductCategory() {
		super();
	}

	public ProductCategory(Long productId) {
		super();
		this.productId = productId;
	}

	public Long getProductCategoryId() {
		return productCategoryId;
	}

	public void setProductCategoryId(Long productCategoryId) {
		this.productCategoryId = productCategoryId;
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
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

	@Override
	protected Serializable pkVal() {
		return this.productCategoryId;
	}

}
