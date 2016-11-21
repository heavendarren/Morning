package com.morning.entity.goods;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.IdType;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 *
 * 
 *
 */
@TableName("tb_goods_spec")
public class GoodsSpec implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 商品规则ID */
	@TableId(value = "SPEC_ID", type = IdType.AUTO)
	private Integer specId;

	/** 商品ID */
	@TableField(value = "GOODS_ID")
	private Integer goodsId;

	/** 商品颜色 */
	@TableField(value = "SPEC_COLOR")
	private String specColor;

	/** 商品尺寸 */
	@TableField(value = "SPEC_SIZE")
	private String specSize;

	/**  */
	@TableField(value = "SPEC_PRICE")
	private Double specPrice;

	/** 库存信息 */
	@TableField(value = "SPEC_SAVE_INFO")
	private Integer specSaveInfo;

	/** 状态：1.上架；0.下架 */
	@TableField(value = "SPEC_STATUS")
	private Integer specStatus;


	public Integer getSpecId() {
		return this.specId;
	}

	public void setSpecId(Integer specId) {
		this.specId = specId;
	}

	public Integer getGoodsId() {
		return this.goodsId;
	}

	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}

	public String getSpecColor() {
		return this.specColor;
	}

	public void setSpecColor(String specColor) {
		this.specColor = specColor;
	}

	public String getSpecSize() {
		return this.specSize;
	}

	public void setSpecSize(String specSize) {
		this.specSize = specSize;
	}

	public Double getSpecPrice() {
		return this.specPrice;
	}

	public void setSpecPrice(Double specPrice) {
		this.specPrice = specPrice;
	}

	public Integer getSpecSaveInfo() {
		return this.specSaveInfo;
	}

	public void setSpecSaveInfo(Integer specSaveInfo) {
		this.specSaveInfo = specSaveInfo;
	}

	public Integer getSpecStatus() {
		return this.specStatus;
	}

	public void setSpecStatus(Integer specStatus) {
		this.specStatus = specStatus;
	}

}
