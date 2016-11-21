package com.morning.dao.goods;

import java.util.List;

import com.morning.entity.goods.GoodsSpec;
import com.baomidou.mybatisplus.mapper.AutoMapper;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：GoodsSpecMapper   
* 类描述：GoodsSpec 表数据访问层接口   
* 创建人：陈星星   
* 创建时间：2016年11月22日 上午12:01:37   
* 修改人：陈星星   
* 修改时间：2016年11月22日 上午12:01:37   
* @version
 */
public interface GoodsSpecMapper extends AutoMapper<GoodsSpec> {

	/**
	 * 根据商品ID查找商品规格
	 * @param goodsId
	 * @return
	 */
	List<GoodsSpec> selectGoodsSpec(Integer goodsId);
	
}