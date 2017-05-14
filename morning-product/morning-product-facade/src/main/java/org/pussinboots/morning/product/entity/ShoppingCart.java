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
* 类名称：ShoppingCart   
* 类描述：ShoppingCart / 购物车表 实体类   
* 创建人：陈星星   
* 创建时间：2017年5月10日 下午3:54:27   
*
 */
@TableName("os_shopping_cart")
public class ShoppingCart extends Model<ShoppingCart> {

    private static final long serialVersionUID = 1L;

    /**
     * 购物车ID
     */
	@TableId(value="cart_id", type= IdType.AUTO)
	private Long cartId;
    /**
     * 商品规格编号
     */
	@TableField("product_spec_number")
	private Long productSpecNumber;
    /**
     * 用户ID
     */
	@TableField("user_id")
	private Long userId;
    /**
     * 购买数量
     */
	@TableField("buy_number")
	private Integer buyNumber;
    /**
     * 创建时间
     */
	@TableField("create_time")
	private Date createTime;
    /**
     * 更新时间
     */
	@TableField("update_time")
	private Date updateTime;
    /**
     * 购物车状态：0,未选中；1,选中
     */
	@TableField("check_status")
	private Integer checkStatus;


	public Long getCartId() {
		return cartId;
	}

	public void setCartId(Long cartId) {
		this.cartId = cartId;
	}

	public Long getProductSpecNumber() {
		return productSpecNumber;
	}

	public void setProductSpecNumber(Long productSpecNumber) {
		this.productSpecNumber = productSpecNumber;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Integer getBuyNumber() {
		return buyNumber;
	}

	public void setBuyNumber(Integer buyNumber) {
		this.buyNumber = buyNumber;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Integer getCheckStatus() {
		return checkStatus;
	}

	public void setCheckStatus(Integer checkStatus) {
		this.checkStatus = checkStatus;
	}

	@Override
	protected Serializable pkVal() {
		return this.cartId;
	}

}
