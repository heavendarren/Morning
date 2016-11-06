package com.morning.entity.goods;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：GoodsPicture   
* 类描述：商品图片实体类  
* 创建人：陈星星   
* 创建时间：2016年8月26日  下午1:56:43
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午10:42:43   
* @version
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