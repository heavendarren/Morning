package com.morning.service.impl.goods;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.morning.dao.goods.GoodsSpecMapper;
import com.morning.entity.goods.GoodsSpec;
import com.morning.service.goods.IGoodsSpecService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：GoodsSpecServiceImpl   
* 类描述：GoodsSpec 表业务访问层接口实现类   
* 创建人：陈星星   
* 创建时间：2016年11月21日 下午11:54:48   
* 修改人：陈星星   
* 修改时间：2016年11月21日 下午11:54:48   
* @version
 */
@Service
public class GoodsSpecServiceImpl extends SuperServiceImpl<GoodsSpecMapper, GoodsSpec> implements IGoodsSpecService {
	
	@Autowired
	private GoodsSpecMapper goodsSpecMapper;
	
	@Override
	public List<GoodsSpec> selectGoodsSpec(Integer goodsId) {
		return goodsSpecMapper.selectGoodsSpec(goodsId);
	}


}