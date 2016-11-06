package com.morning.service.impl.goods;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.morning.dao.goods.GoodsClassifyMapper;
import com.morning.entity.goods.GoodsClassify;
import com.morning.service.goods.GoodsClassifyService;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：GoodsClassifyServiceImpl   
* 类描述：商品类别业务逻辑层实现   
* 创建人：陈星星   
* 创建时间：2016年8月26日  下午2:13:57 
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午10:58:56   
* @version
 */
@Service("goodsClassifyService")
public class GoodsClassifyServiceImpl implements GoodsClassifyService {
	
	@Autowired
	private GoodsClassifyMapper goodsClassifyMapper;
	
	@Override
	public GoodsClassify queryClassifyById(Integer classityId) {
		return goodsClassifyMapper.queryClassifyById(classityId);
	}

	@Override
	public GoodsClassify queryGoodsByClassify(Integer classityId) {
		return goodsClassifyMapper.queryGoodsByClassify(classityId);
	}

	@Override
	public List<GoodsClassify> queryAllGoods() {
		return goodsClassifyMapper.queryAllGoods();
	}
	
}
