package org.pussinboots.morning.product.mapper;

import org.apache.ibatis.annotations.Param;
import org.pussinboots.morning.product.entity.Product;
import org.pussinboots.morning.product.pojo.vo.ProductVO;

import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * 
* 项目名称：morning-product-service   
* 类名称：ProductMapper   
* 类描述：Product / 商品表 数据访问层接口      
* 创建人：陈星星   
* 创建时间：2017年4月11日 下午3:15:04   
*
 */
public interface ProductMapper extends BaseMapper<Product> {
	
	/**
	 * 根据商品编号和状态查找商品
	 * @param productNumber 商品编号
	 * @param status 状态
	 * @return
	 */
	ProductVO getByNumber(@Param("productNumber") Long productNumber, @Param("status") Integer status);
}