package com.pussinboots.morning.os.modules.product.mapper;

import com.pussinboots.morning.os.modules.product.entity.Kind;
import com.pussinboots.morning.os.modules.product.vo.KindVO;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：KindMapper   
* 类描述： Kind表 / 产品类型表 数据访问层接口  
* 创建人：陈星星   
* 创建时间：2017年3月5日 下午5:36:52   
*
 */
public interface KindMapper extends BaseMapper<Kind> {
	
	/**
	 * 根据产品ID和类型状态查找类型列表
	 * @param productId 产品ID
	 * @param status 类型状态
	 * @return
	 */
	List<KindVO> selectByProductId(@Param("productId") Long productId, @Param("status") Integer status);

}