package com.morning.service.goods;

import java.util.List;

import com.morning.entity.goods.GoodsClassify;
import com.baomidou.framework.service.ISuperService;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：IGoodsClassifyService   
* 类描述：GoodsClassify 表业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2016年8月26日  下午2:11:58
* 修改人：陈星星   
* 修改时间：2016年11月20日 下午8:27:36   
* @version
 */
public interface IGoodsClassifyService extends ISuperService<GoodsClassify> {
	
	/**
	 * 查询导航栏类目
	 * @param count 展示数量
	 * @return List<GoodsClassify>
	 */
	List<GoodsClassify> selectNavClassify(Integer count);
	
	/**
	 * 查询类目及类目商品
	 * @return List<GoodsClassify>
	 */
	List<GoodsClassify> selectGoodsClassify();
	
	/**
	 * 根据类目ID查询类目
	 * @param classifyId
	 * @return
	 */
	GoodsClassify selectGoodsClassifyById(Integer classifyId);
}