package com.morning.service.goods;

import java.util.List;

import com.morning.entity.goods.GoodsClassify;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：GoodsClassifyService   
* 类描述：商品类目业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2016年8月26日  下午2:11:58
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午10:55:02   
* @version
 */
public interface GoodsClassifyService {
	
	/**
	 * 查询类目名称，通过ID
	 * @param classityId
	 * @return
	 */
	public GoodsClassify queryClassifyById(Integer classityId);
	
	/**
	 * 通过ID查询该类目商品
	 * @param classityId
	 * @return
	 */
	public GoodsClassify queryGoodsByClassify(Integer classityId); 
	
	/**
	 * 查询所有商品，根据类目分类
	 * @return
	 */
	public List<GoodsClassify> queryAllGoods();
	
}
