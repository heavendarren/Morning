package com.morning.entity.goods;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 
 * @description：商品图片实体类
 * @author CXX
 * @version 创建时间：2016年8月26日  下午1:56:43
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class GoodsPicture implements Serializable{
	
	private static final long serialVersionUID = 7638083998013773721L;
	/**商品图片编号*/
	private Integer goodspicId;
	/**商品编号*/
    private Integer goodsId;
    /**商品图片类别*/
    private Integer goodspicType;
    /**图片地址*/
    private String goodspicImage;

}