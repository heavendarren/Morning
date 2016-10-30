package com.morning.service.goods;

import java.util.List;

import com.morning.entity.PageInfo;
import com.morning.entity.goods.Goods;
import com.morning.entity.goods.QueryGoods;
import com.morning.entity.order.OrderMessage;

/**
 * 
 * @description：商品业务层接口
 * @author CXX
 * @version 创建时间：2016年8月23日  上午12:16:56
 */
public interface GoodsService {
	
	/**
	 * 添加商品
	 * @param goods
	 * @return
	 */
	public int createGoods(Goods goods);
	
	/**
	 * 更新商品
	 * @param goods
	 */
	public void updateGoods(Goods goods);
	
	/**
	 * 查询商品，通过ID
	 * @param orderId
	 * @return
	 */
	public Goods queryGoodsById(Integer goodsId);
	
	/**
	 * 查询商品，排序游览量、销售量、收藏量、提问数等
	 * @param parameter  QueryGoods查询条件
	 * @return
	 */
	public List<Goods> queryGoods(QueryGoods queryGoods);
	
	/**
	 * 前台查询课程列表
	 * @param queryGoods  查询条件
	 * @param pageInfo 分页条件
	 * @return List<Goods>
	 */
	public List<Goods> queryWebGoodsListPage(QueryGoods queryGoods,PageInfo pageInfo);
	
	/**
	 * 查询商品数量
	 * @param parameter QueryGoods查询条件
	 * @return
	 */
	public int queryGoodsCount(QueryGoods queryGoods);
	
	/**
	 * 更新课程数据（浏览数）
	 * @param type 类型
	 * @param goodsId 商品ID
	 */
	public void updateGoodsCount(String type,int goodsId);
	
	/**
     * 根据商品订单详情表更新商品销量和库存
     * @param orderMessageFormList
     * @return
     */
	public void updateGoodsCountList(OrderMessage orderMessage);
	
	public void clearActivityByDate();
	
	public void printSomething();
	
}
