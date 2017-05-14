package org.pussinboots.morning.product.service.impl;

import org.pussinboots.morning.product.entity.Label;
import org.pussinboots.morning.product.mapper.LabelMapper;
import org.pussinboots.morning.product.service.ILabelService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * 
* 项目名称：morning-product-service   
* 类名称：LabelServiceImpl   
* 类描述：Label / 商品标签表 业务逻辑层接口实现      
* 创建人：陈星星   
* 创建时间：2017年4月11日 下午3:16:54   
*
 */
@Service
public class LabelServiceImpl extends ServiceImpl<LabelMapper, Label> implements ILabelService {
	
}
