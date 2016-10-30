package com.morning.entity.goods;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 
 * @description：商品查询条件
 * @author CXX
 * @version 创建时间：2016年8月22日  下午10:46:06
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class QueryGoods implements Serializable {

	private static final long serialVersionUID = 8453228267684177653L;
	
	/**商品类别*/
	private Integer classifyId;
	/**搜索内容*/
	private String search;
	/**查询数量*/
	private int count;
	/**查询条件：价格goodsPrice、时间goodsDate、游览数goodsViewNum、
	 * 销售数goodsBuyNum、评论数goodsReviews、提问数goodsQuery、
	 * 收藏数goodsFavorites、类别classifyId*/
	private String condition;
	
}
