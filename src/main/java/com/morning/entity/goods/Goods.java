package com.morning.entity.goods;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 
 * @description：商品实体类
 * @author CXX
 * @version 创建时间：2016年8月26日  下午1:56:55
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class Goods implements Serializable {

	private static final long serialVersionUID = 1500991196340845604L;
	/**商品编号*/
    private Integer goodsId;
    /**商品名称*/
    private String goodsName;
    /**商品价格*/
    private Double goodsPrice;
    /**商品描述*/
    private String goodsDescript;
    /**图片路径*/
    private String goodsImagename;
    /**添加时间*/
    private Date goodsDate;
    /**销售数量*/
    private Integer goodsBuyNum;
    /**游览数量*/
    private Integer goodsViewNum;
    /**库存信息*/
    private Integer goodsSaveInfo;
    /**提问数量*/
    private Integer goodsQuery;
    /**评论数量*/
    private Integer goodsReviews;
    /**收藏数量*/
    private Integer goodsFavorites;
    /**商品类别*/
    private Integer classifyId;
    /**商品详情*/
    private String goodsContext;
    /**商品类目*/
    private GoodsClassify goodsClassify;
}
