package com.morning.entity.goods;

import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：GoodsClassify   
* 类描述：商品类别实体类   
* 创建人：陈星星   
* 创建时间：2016年5月25日  上午1:16:54 
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午10:42:28   
* @version
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class GoodsClassify implements Serializable{

	private static final long serialVersionUID = -6761516150997576475L;
	/**类别编号*/
	private Integer classifyId;
	/**类别名称*/
    private String classifyName;
    /**商品列表*/
    private List<Goods> goodsList;

}