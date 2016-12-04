package com.morning.service.impl.goods;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.morning.common.util.SingletonLoginUtils;
import com.morning.dao.goods.GoodsMapper;
import com.morning.entity.PageInfo;
import com.morning.entity.goods.Goods;
import com.morning.entity.goods.QueryGoods;
import com.morning.entity.order.OrderMessage;
import com.morning.service.goods.IGoodsService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：GoodsServiceImpl   
* 类描述：Goods 表业务逻辑层接口实现类   
* 创建人：陈星星   
* 创建时间：2016年8月23日  上午12:16:56   
* 修改人：陈星星   
* 修改时间：2016年11月21日 上午12:09:33   
* @version
 */
@Service
public class GoodsServiceImpl extends SuperServiceImpl<GoodsMapper, Goods> implements IGoodsService {
	
	@Autowired
	private GoodsMapper goodsMapper;
	
	@Override
	public List<Goods> selectGoodsList(Integer count, String condition, Integer status) {
		QueryGoods queryGoods = new QueryGoods();
		queryGoods.setCount(count);
		queryGoods.setCondition(condition);
		queryGoods.setStatus(status);
		return goodsMapper.selectGoodsList(queryGoods);
	}

	@Override
	public List<Goods> selectGoodsListBySystem(QueryGoods queryGoods) {
		return goodsMapper.selectGoodsList(queryGoods);
	}
	
	@Override
	public List<Goods> selectGoodsByClassifyId(Integer goodsClassifyId) {
		QueryGoods queryGoods = new QueryGoods();
		queryGoods.setClassifyId(goodsClassifyId);
		return goodsMapper.selectGoodsList(queryGoods);
	}
	
	@Override
	public List<Goods> selectGoodsListByPage(QueryGoods queryGoods,
			PageInfo pageInfo) {
		int totalNumber = goodsMapper.selectGoodsCount(queryGoods);
		queryGoods.setStatus(1);
		pageInfo.setTotalNumber(totalNumber);//商品总数量
		pageInfo.setpageNumber(12);//单页商品数量
		Map<String,Object> parameter = new HashMap<>();
		parameter.put("queryGoods", queryGoods);
		parameter.put("pageInfo", pageInfo);
		return goodsMapper.selectGoodsListByPage(parameter);
	}
	

	@Override
	public Goods selectGoodsByGoodsId(Integer goodsId) {
		return goodsMapper.selectGoodsByGoodsId(goodsId);
	}
	
	@Override
	public Integer selectAllGoodsNumber(Integer status) {
		QueryGoods queryGoods = new QueryGoods();
		queryGoods.setStatus(status);
		return goodsMapper.selectGoodsCount(queryGoods);
	}

	@Override
	public void updateGoodsViewCount(Integer goodsId) {
		goodsMapper.updateGoodsViewCount(goodsId);
	}

	@Override
	public void updateGoodsPay(OrderMessage orderMessage) {
		goodsMapper.updateGoodsPay(orderMessage);
	}

	@Override
	public void updateGoodsStatus(Integer goodsId, Integer status) {
		Goods goods = new Goods();
		goods.setGoodsId(goodsId);
		goods.setStatus(status);
		goods.setUpdateTime(new Date());
		goods.setUpdateBy(SingletonLoginUtils.getSystemUserName());
		goodsMapper.updateSelectiveById(goods);
	}

	@Override
	public void deleteGoods(Integer goodsId) {
		
	}

}