package com.morning.service.goods;

import java.util.List;

import com.morning.entity.goods.GoodsPicture;
import com.baomidou.framework.service.ISuperService;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：IGoodsPictureService   
* 类描述：GoodsPicture 表业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2016年8月26日  下午1:56:43
* 修改人：陈星星   
* 修改时间：2016年11月21日 上午2:25:31   
* @version
 */
public interface IGoodsPictureService extends ISuperService<GoodsPicture> {
	
	/**
	 * 根据商品ID查找商品详情图片
	 * @param goodsId 商品ID
	 * @return List<GoodsPicture>
	 */
	List<GoodsPicture> selectGoodsPictures(Integer goodsId);

}