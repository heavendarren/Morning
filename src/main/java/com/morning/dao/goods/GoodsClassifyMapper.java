package com.morning.dao.goods;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.morning.entity.goods.GoodsClassify;
import com.baomidou.mybatisplus.mapper.AutoMapper;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：GoodsClassifyMapper   
* 类描述：GoodsClassify 表数据访问层接口   
* 创建人：陈星星   
* 创建时间：2016年5月25日  上午1:16:54   
* 修改人：陈星星   
* 修改时间：2016年11月20日 下午9:32:46   
* @version
 */
public interface GoodsClassifyMapper extends AutoMapper<GoodsClassify> {
	
	/**
	 * 查询导航栏类目
	 * @param count 展示数量
	 * @return List<GoodsClassify>
	 */
	List<GoodsClassify> selectNavClassify(@Param("count") Integer count);

	/**
	 * 查询类目及类目商品
	 * @return List<GoodsClassify>
	 */
	List<GoodsClassify> selectGoodsClassify();
	
	/**
	 * 根据类目ID查询类目
	 * @param classifyId 类目ID
	 * @return GoodsClassify
	 */
	GoodsClassify selectGoodsClassifyById(@Param("classifyId") Integer classifyId);
}
