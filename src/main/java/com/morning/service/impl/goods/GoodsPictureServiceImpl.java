package com.morning.service.impl.goods;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.morning.dao.goods.GoodsPictureMapper;
import com.morning.entity.goods.GoodsPicture;
import com.morning.service.goods.GoodsPictureService;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：GoodsPictureServiceImpl   
* 类描述：商品图片业务逻辑层实现   
* 创建人：陈星星   
* 创建时间：2016年8月26日  下午2:13:23
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午10:59:17   
* @version
 */
@Service("goodsPictureService")
public class GoodsPictureServiceImpl implements GoodsPictureService {
	
	@Autowired
	private GoodsPictureMapper goodsPictureMapper;

	@Override
	public List<GoodsPicture> queryPictureByGoods(GoodsPicture goodsPicture) {
		return goodsPictureMapper.queryPictureByGoods(goodsPicture);
	}

}
