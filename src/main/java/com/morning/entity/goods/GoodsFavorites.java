package com.morning.entity.goods;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotations.IdType;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 *
 * 
 *
 */
@TableName("tb_goods_favorites")
public class GoodsFavorites implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 收藏夹记录ID */
	@TableId(value = "COLLECT_ID", type = IdType.AUTO)
	private Integer collectId;

	/** 商品编号 */
	@TableField(value = "GOODS_ID")
	private Integer goodsId;

	/** 用户ID */
	@TableField(value = "ACCOUNT_ID")
	private Integer accountId;

	/** 添加时间 */
	@TableField(value = "ADD_TIME")
	private Date addTime;


	public Integer getCollectId() {
		return this.collectId;
	}

	public void setCollectId(Integer collectId) {
		this.collectId = collectId;
	}

	public Integer getGoodsId() {
		return this.goodsId;
	}

	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}

	public Integer getAccountId() {
		return this.accountId;
	}

	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
	}

	public Date getAddTime() {
		return this.addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

}
