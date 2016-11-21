package com.morning.service.impl.goods;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.morning.dao.goods.GoodsPictureMapper;
import com.morning.entity.goods.GoodsPicture;
import com.morning.service.goods.IGoodsPictureService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：IGoodsPictureService   
* 类描述：GoodsPicture 表业务逻辑层接口实现类   
* 创建人：陈星星   
* 创建时间：2016年8月26日  下午1:56:43
* 修改人：陈星星   
* 修改时间：2016年11月21日 上午2:25:31   
* @version
 */
@Service
public class GoodsPictureServiceImpl extends SuperServiceImpl<GoodsPictureMapper, GoodsPicture> implements IGoodsPictureService {
	
	@Autowired
	private GoodsPictureMapper goodsPictureMapper;
	
	@Override
	public List<GoodsPicture> selectGoodsPictures(Integer goodsId) {
		return goodsPictureMapper.selectGoodsPictures(goodsId);
	}


}