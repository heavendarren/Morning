package com.morning.dao.goods;

import java.util.List;

import com.morning.entity.goods.GoodsPicture;

/**
 * 
*    
* 项目名称：morning Maven Webapp   
* 类名称：GoodsPictureMapper   
* 类描述：商品图片数据访问层接口   
* 创建人：陈星星   
* 创建时间：2016年11月6日 下午10:32:04   
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午10:32:04   
* 修改备注：   
* @version    
*
 */
public interface GoodsPictureMapper {
	
	/**
	 * 查询商品图片
	 * @param goodsPicture
	 * @return
	 */
	public List<GoodsPicture> queryPictureByGoods(GoodsPicture goodsPicture);

}
