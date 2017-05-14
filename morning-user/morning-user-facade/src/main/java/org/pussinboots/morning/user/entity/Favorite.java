package org.pussinboots.morning.user.entity;

import com.baomidou.mybatisplus.enums.IdType;
import java.math.BigDecimal;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * 
* 项目名称：morning-user-facade   
* 类名称：Favorite   
* 类描述：Favorite / 收藏夹表 实体类   
* 创建人：陈星星   
* 创建时间：2017年5月9日 下午7:56:14   
*
 */
@TableName("os_favorite")
public class Favorite extends Model<Favorite> {

    private static final long serialVersionUID = 1L;

    /**
     * 收藏表ID
     */
	@TableId(value="favorite_id", type= IdType.AUTO)
	private Long favoriteId;
    /**
     * 用户ID
     */
	@TableField("user_id")
	private Long userId;
    /**
     * 商品ID
     */
	@TableField("product_id")
	private Long productId;
    /**
     * 商品编号
     */
	@TableField("product_number")
	private Long productNumber;
    /**
     * 商品名称
     */
	private String name;
    /**
     * 展示图片
     */
	@TableField("pic_img")
	private String picImg;
    /**
     * 显示价格
     */
	@TableField("show_price")
	private BigDecimal showPrice;
    /**
     * 商品状态：1,上架；2,下架
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


	public Long getFavoriteId() {
		return favoriteId;
	}

	public void setFavoriteId(Long favoriteId) {
		this.favoriteId = favoriteId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public Long getProductNumber() {
		return productNumber;
	}

	public void setProductNumber(Long productNumber) {
		this.productNumber = productNumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPicImg() {
		return picImg;
	}

	public void setPicImg(String picImg) {
		this.picImg = picImg;
	}

	public BigDecimal getShowPrice() {
		return showPrice;
	}

	public void setShowPrice(BigDecimal showPrice) {
		this.showPrice = showPrice;
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
		return this.favoriteId;
	}

}
