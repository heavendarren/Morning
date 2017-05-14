package org.pussinboots.morning.product.service.impl;

import java.util.List;

import org.pussinboots.morning.product.entity.Kind;
import org.pussinboots.morning.product.mapper.KindMapper;
import org.pussinboots.morning.product.pojo.vo.KindVO;
import org.pussinboots.morning.product.service.IKindService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
* 项目名称：morning-product-service   
* 类名称：KindServiceImpl   
* 类描述：Kind / 产品类型表 业务逻辑层接口实现   
* 创建人：陈星星   
* 创建时间：2017年4月25日 上午12:26:32   
*
 */
@Service
public class KindServiceImpl extends ServiceImpl<KindMapper, Kind> implements IKindService {
	
	@Autowired
	private KindMapper kindMapper;

	@Override
	public List<KindVO> listByProductId(Long productId, Integer status) {
		return kindMapper.listByProductId(productId, status);
	}
}
