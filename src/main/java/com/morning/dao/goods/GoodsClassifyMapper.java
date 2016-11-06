package com.morning.dao.goods;

import java.util.List;

import com.morning.entity.goods.GoodsClassify;

/**
 * 
*    
* 项目名称：morning Maven Webapp   
* 类名称：GoodsClassifyMapper   
* 类描述：商品类目数据访问层接口   
* 创建人：陈星星   
* 创建时间：2016年11月6日 下午10:31:06   
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午10:31:06   
* 修改备注：   
* @version    
*
 */
public interface GoodsClassifyMapper {
	
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
