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
* 类名称：ProductImage   
* 类描述：ProductImage / 商品图片表 实体类          
* 创建人：陈星星   
* 创建时间：2017年4月14日 上午1:54:50   
*
 */
@TableName("os_product_image")
public class ProductImage extends Model<ProductImage> {

    private static final long serialVersionUID = 1L;

	@TableId(value="pic_img_id", type= IdType.AUTO)
	private Long picImgId;
    /**
     * 商品ID
     */
	@TableField("product_id")
	private Long productId;
    /**
     * 展示图片
     */
	@TableField("pic_img")
	private String picImg;
    /**
     * 排序
     */
	private Integer sort;
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


	public Long getPicImgId() {
		return picImgId;
	}

	public void setPicImgId(Long picImgId) {
		this.picImgId = picImgId;
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public String getPicImg() {
		return picImg;
	}

	public void setPicImg(String picImg) {
		this.picImg = picImg;
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
		return this.picImgId;
	}

}
