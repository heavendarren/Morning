package org.pussinboots.morning.product.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.pussinboots.morning.product.entity.Kind;
import org.pussinboots.morning.product.pojo.vo.KindVO;

import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * 
* 项目名称：morning-product-service   
* 类名称：KindMapper   
* 类描述：Kind / 产品类型表 数据访问层接口   
* 创建人：陈星星   
* 创建时间：2017年4月25日 上午12:25:49   
*
 */
public interface KindMapper extends BaseMapper<Kind> {
	
	/**
	 * 根据产品ID和类型状态查找类型列表
	 * @param productId 产品ID
	 * @param status 类型状态
	 * @return
	 */
	List<KindVO> listByProductId(@Param("productId") Long productId, @Param("status") Integer status);
}