package com.morning.dao.goods;

import java.util.List;
import java.util.Map;

import com.morning.entity.goods.Goods;
import com.morning.entity.goods.QueryGoods;
import com.morning.entity.order.OrderMessage;
import com.baomidou.mybatisplus.mapper.AutoMapper;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：GoodsMapper   
* 类描述：Goods 表数据访问层接口   
* 创建人：陈星星   
* 创建时间：2016年8月23日  上午12:16:56 
* 修改人：陈星星   
* 修改时间：2016年11月21日 上午12:31:55   
* @version
 */
public interface GoodsMapper extends AutoMapper<Goods> {
	
	/**
	 * 根据查询条件查找商品列表
	 * @param queryGoods 查询条件
	 * @return
	 */
	List<Goods> selectGoodsList(QueryGoods queryGoods);
	
	/**
	 * 根据查询条件查找商品数量
	 * @param queryGoods
	 * @return
	 */
	Integer selectGoodsCount(QueryGoods queryGoods);
	
	/**
	 * 根据查询条件、分页查找商品列表
	 * @param parameter 参数列表：queryGoods 查询条件、pageInfo 分页条件
	 * @return
	 */
	List<Goods> selectGoodsListByPage(Map<String,Object> parameter);
	
	/**
	 * 根据商品ID查找商品
	 * @param goodsId 商品ID
	 * @return Goods
	 */
	Goods selectGoodsByGoodsId(Integer goodsId);
	
	/**
	 * 通过商品ID更新商品游览量
	 * @param goodsId 商品ID
	 */
	void updateGoodsViewCount(Integer goodsId);
	
	/**
	 * 通过订单详情更新商品库存、销量
	 * @param orderMessage
	 */
	void updateGoodsPay(OrderMessage orderMessage);

}