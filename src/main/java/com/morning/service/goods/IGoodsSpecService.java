package com.morning.service.goods;

import java.util.List;

import com.morning.entity.goods.GoodsSpec;
import com.baomidou.framework.service.ISuperService;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：IGoodsSpecService   
* 类描述：GoodsSpec 表业务访问层接口   
* 创建人：陈星星   
* 创建时间：2016年11月21日 下午11:54:10   
* 修改人：陈星星   
* 修改时间：2016年11月21日 下午11:54:10   
* @version
 */
public interface IGoodsSpecService extends ISuperService<GoodsSpec> {
	
	/**
	 * 根据商品ID查找商品规格
	 * @param goodsId
	 * @return
	 */
	List<GoodsSpec> selectGoodsSpec(Integer goodsId);

}