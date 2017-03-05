package com.pussinboots.morning.os.modules.product.service.impl;

import com.pussinboots.morning.os.modules.product.entity.Specification;
import com.pussinboots.morning.os.modules.product.mapper.SpecificationMapper;
import com.pussinboots.morning.os.modules.product.service.ISpecificationService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：SpecificationServiceImpl   
* 类描述：Specification 表 / 规格表 业务逻辑层接口  
* 创建人：陈星星   
* 创建时间：2017年3月5日 下午5:41:02   
*
 */
@Service
public class SpecificationServiceImpl extends ServiceImpl<SpecificationMapper, Specification> implements ISpecificationService {
	
}
