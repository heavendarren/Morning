package com.pussinboots.morning.os.modules.product.service;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.service.IService;
import com.pussinboots.morning.os.modules.product.entity.ProductSpecification;
import com.pussinboots.morning.os.modules.product.vo.KindVO;

/**
 * 
* 项目名称：morning-os-facade   
* 类名称：IProductSpecificationService   
* 类描述：ProductSpecification 表 / 商品规格表 业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2017年3月5日 下午9:56:39   
*
 */
public interface IProductSpecificationService extends IService<ProductSpecification> {
	
	/**
	 * 根据产品ID、类型列表、产品规格状态查找产品规格列表
	 * @param productId 产品ID
	 * @param status 产品规格状态
	 * @param kindVOs 类型列表
	 * @return Map<String, Object> 组合ID,组合信息
	 */
	Map<String, Object> selectByProductId(Long productId, Integer status, List<KindVO> kindVOs);
	
}
