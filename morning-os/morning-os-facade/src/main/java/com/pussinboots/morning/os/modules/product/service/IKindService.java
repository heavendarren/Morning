package com.pussinboots.morning.os.modules.product.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.pussinboots.morning.os.modules.product.entity.Kind;
import com.pussinboots.morning.os.modules.product.vo.KindVO;

/**
 * 
* 项目名称：morning-os-facade   
* 类名称：IKindService   
* 类描述：Kind表 / 产品类型表 业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2017年3月5日 下午5:35:15   
*
 */
public interface IKindService extends IService<Kind> {
	
	/**
	 * 根据产品ID查找产品类型 
	 * @param productId 产品ID
	 * @param status 类型状态
	 * @return
	 */
	List<KindVO> selectByProductId(Long productId, Integer status);

	
}
