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
@TableName("tb_goods_picture")
public class GoodsPicture implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 商品图片编号 */
	@TableId(value = "GOODSPIC_ID", type = IdType.AUTO)
	private Integer goodspicId;

	/**  */
	@TableField(value = "GOODS_ID")
	private Integer goodsId;

	/** 商品图片类别（0：详情图片  1：内容图片） */
	@TableField(value = "GOODSPIC_TYPE")
	private Integer goodspicType;

	/** 图片地址 */
	@TableField(value = "GOODSPIC_IMAGE")
	private String goodspicImage;


	public Integer getGoodspicId() {
		return this.goodspicId;
	}

	public void setGoodspicId(Integer goodspicId) {
		this.goodspicId = goodspicId;
	}

	public Integer getGoodsId() {
		return this.goodsId;
	}

	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}

	public Integer getGoodspicType() {
		return this.goodspicType;
	}

	public void setGoodspicType(Integer goodspicType) {
		this.goodspicType = goodspicType;
	}

	public String getGoodspicImage() {
		return this.goodspicImage;
	}

	public void setGoodspicImage(String goodspicImage) {
		this.goodspicImage = goodspicImage;
	}

}
