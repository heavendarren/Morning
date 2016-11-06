package com.morning.service.goods;

import java.util.List;

import com.morning.entity.goods.GoodsPicture;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：GoodsPictureService   
* 类描述：商品图片业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2016年8月26日  下午2:11:33
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午10:55:21   
* @version
 */
public interface GoodsPictureService {
	
	/**
	 * 查询商品图片
	 * @param goodsPicture
	 * @return
	 */
	public List<GoodsPicture> queryPictureByGoods(GoodsPicture goodsPicture);

}
