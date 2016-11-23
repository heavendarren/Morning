package com.morning.service.goods;

import java.util.List;

import com.morning.entity.PageInfo;
import com.morning.entity.goods.Goods;
import com.morning.entity.goods.QueryGoods;
import com.morning.entity.order.OrderMessage;
import com.baomidou.framework.service.ISuperService;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：IGoodsService   
* 类描述：Goods 表业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2016年8月23日  上午12:16:56
* 修改人：陈星星   
* 修改时间：2016年11月20日 下午8:26:43   
* @version
 */
public interface IGoodsService extends ISuperService<Goods> {
	
	/**
	 * 根据查询条件查找商品列表
	 * @param count 查询数量
	 * @param condition 查询条件
	 * @param status 查询状态
	 * @return List<Goods>
	 */
	List<Goods> selectGoodsList(Integer count, String condition, Integer status);
	
	/**
	 * 根据查询条件查找商品列表
	 * @param queryGoods 查询条件
	 * @return List<Goods> 
	 */
	List<Goods> selectGoodsListBySystem(QueryGoods queryGoods);
	
	/**
	 * 根据查询条件、分页查找商品列表
	 * @param queryGoods 查询条件
	 * @param pageInfo 分页条件
	 * @return List<Goods>	
	 */
	List<Goods> selectGoodsListByPage(QueryGoods queryGoods, PageInfo pageInfo);
	
	/**
	 * 根据商品ID查找商品
	 * @param goodsId 商品ID
	 * @return Goods
	 */
	Goods selectGoodsByGoodsId(Integer goodsId);
	
	/**
	 * 查找所有商品数量
	 * @param status 商品状态：1、上架/0、下架
	 * @return
	 */
	Integer selectAllGoodsNumber(Integer status);
	
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
	
	/**
	 * 通过商品ID更新商品状态
	 * @param goodsId
	 * @param status
	 */
	void updateGoodsStatus(Integer goodsId, Integer status);
	
	/**
	 * 删除商品，同时删除商品图片和商品规格
	 * @param goodsId
	 */
	void deleteGoods(Integer goodsId);

}