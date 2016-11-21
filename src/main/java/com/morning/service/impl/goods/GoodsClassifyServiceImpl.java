package com.morning.service.impl.goods;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.morning.dao.goods.GoodsClassifyMapper;
import com.morning.entity.goods.GoodsClassify;
import com.morning.service.goods.IGoodsClassifyService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：GoodsClassifyServiceImpl   
* 类描述：GoodsClassify 表业务逻辑层接口实现类   
* 创建人：陈星星   
* 创建时间：2016年8月26日  下午2:11:58  
* 修改人：陈星星   
* 修改时间：2016年11月20日 下午11:48:41   
* @version
 */
@Service
public class GoodsClassifyServiceImpl extends SuperServiceImpl<GoodsClassifyMapper, GoodsClassify> implements IGoodsClassifyService {
	
	@Autowired
	private GoodsClassifyMapper goodsClassifyMapper;
	
	
	@Override
	public List<GoodsClassify> selectNavClassify(Integer count) {
		return goodsClassifyMapper.selectNavClassify(count);
	}


	@Override
	public List<GoodsClassify> selectGoodsClassify() {
		return goodsClassifyMapper.selectGoodsClassify();
	}

	@Override
	public GoodsClassify selectGoodsClassifyById(Integer classifyId) {
		return goodsClassifyMapper.selectGoodsClassifyById(classifyId);
	}



}