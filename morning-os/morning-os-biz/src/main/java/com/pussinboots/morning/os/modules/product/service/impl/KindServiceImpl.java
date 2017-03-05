package com.pussinboots.morning.os.modules.product.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.pussinboots.morning.os.modules.product.entity.Kind;
import com.pussinboots.morning.os.modules.product.mapper.KindMapper;
import com.pussinboots.morning.os.modules.product.service.IKindService;
import com.pussinboots.morning.os.modules.product.vo.KindVO;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：KindServiceImpl   
* 类描述：Kind 表   / 产品类型表 业务逻辑层接口实现    
* 创建人：陈星星   
* 创建时间：2017年3月5日 下午5:40:33   
*
 */
@Service
public class KindServiceImpl extends ServiceImpl<KindMapper, Kind> implements IKindService {

	@Autowired
	private KindMapper kindMapper;
	
	@Override
	public List<KindVO> selectByProductId(Long productId, Integer status) {
		return kindMapper.selectByProductId(productId,status);
	}
}
