package com.morning.service.impl.goods;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.morning.dao.goods.GoodsMapper;
import com.morning.entity.PageInfo;
import com.morning.entity.goods.Goods;
import com.morning.entity.goods.QueryGoods;
import com.morning.entity.order.OrderMessage;
import com.morning.service.goods.GoodsService;

/**
 * 
 * @description：商品业务层实现
 * @author CXX
 * @version 创建时间：2016年8月26日  下午2:13:31
 */
@Service("goodsService")
public class GoodsServiceImpl implements GoodsService{
	
	private static Logger logger = Logger.getLogger(GoodsServiceImpl.class);
	
	@Autowired
	private GoodsMapper goodsMapper;

	@Override
	public int createGoods(Goods goods) {
		return goodsMapper.createGoods(goods);
	}

	@Override
	public void updateGoods(Goods goods) {
		goodsMapper.updateGoods(goods);
	}

	@Override
	public Goods queryGoodsById(Integer goodsId) {
		return goodsMapper.queryGoodsById(goodsId);
	}

	@Override
	public List<Goods> queryGoods(QueryGoods queryGoods) {
		Map<String,Object> parameter = new HashMap<String, Object>();
		parameter.put("queryGoods", queryGoods);
		return goodsMapper.queryGoods(parameter);
	}

	@Override
	public int queryGoodsCount(QueryGoods queryGoods) {
		Map<String,Object> parameter = new HashMap<String, Object>();
		parameter.put("queryGoods", queryGoods);
		return goodsMapper.queryGoodsCount(parameter);
	}

	@Override
	public void updateGoodsCount(String type,int goodsId) {
		Map<String,Object> parameter = new HashMap<String, Object>();
		parameter.put("type", type);
		parameter.put("goodsId", goodsId);
		goodsMapper.updateGoodsCount(parameter);		
	}

	@Override
	public void updateGoodsCountList(OrderMessage orderMessage) {
		goodsMapper.updateGoodsCountList(orderMessage);
	}
	
	@Override
	public List<Goods> queryWebGoodsListPage(QueryGoods queryGoods,PageInfo pageInfo) {
		Map<String,Object> parameter = new HashMap<String, Object>();
		try{
			int totalNumber = queryGoodsCount(queryGoods);
			pageInfo.setTotalNumber(totalNumber);
		}catch(Exception e){
			logger.error("GoodsServiceImpl.queryWebGoodsListPage", e);
		}
		parameter.put("queryGoods", queryGoods);
		parameter.put("pageInfo", pageInfo);
		return goodsMapper.queryWebGoodsListPage(parameter);
	}
	
    public void clearActivityByDate() {
        logger.debug("----5秒钟到----");
     }
    
    public void printSomething(){
        //内容就是打印一句话
        System.out.println("this is andy schedule");
    }
}
