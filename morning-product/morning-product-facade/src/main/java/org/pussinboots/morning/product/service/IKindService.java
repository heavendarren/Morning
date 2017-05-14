package org.pussinboots.morning.product.service;

import java.util.List;

import org.pussinboots.morning.product.entity.Kind;
import org.pussinboots.morning.product.pojo.vo.KindVO;

import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-product-facade   
* 类名称：IKindService   
* 类描述：Kind / 产品类型表 业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2017年4月25日 上午12:24:38   
*
 */
public interface IKindService extends IService<Kind> {

	/**
	 * 根据产品ID查找产品类型 
	 * @param productId 产品ID
	 * @param status 类型状态
	 * @return
	 */
	List<KindVO> listByProductId(Long productId, Integer status);
	
}
