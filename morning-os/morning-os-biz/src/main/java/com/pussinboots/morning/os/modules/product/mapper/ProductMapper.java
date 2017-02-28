package com.pussinboots.morning.os.modules.product.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.pussinboots.morning.os.modules.product.dto.ProductCommentDTO;
import com.pussinboots.morning.os.modules.product.entity.Product;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：ProductMapper   
* 类描述：Product表 / 商品表 数据访问层接口         
* 创建人：陈星星   
* 创建时间：2017年2月23日 下午3:47:24   
*
 */
public interface ProductMapper extends BaseMapper<Product> {
	
	/**
	 * 根据明星产品查找产品列表
	 * @param starProduct 明星产品 1:是/0:否
	 * @param showNumber 显示数量
	 * @param status 产品状态
	 * @return
	 */
	List<Product> selectProductsByStar(@Param("starProduct") Integer starProduct,
			@Param("showNumber") Integer showNumber, @Param("status") Integer status);
	
	/**
	 * 根据商品ID查找优质评论（随机抽取一条）
	 * @param productId 商品ID
	 * @param type 评论类型
	 * @param status 评论状态
	 * @return
	 */
	ProductCommentDTO selectHighGualityByProductId(@Param("productId") Long productId,
			@Param("type") Integer type, @Param("status") Integer status);
}