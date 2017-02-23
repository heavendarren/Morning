package com.pussinboots.morning.os.modules.product.service.impl;

import com.pussinboots.morning.os.modules.product.entity.Category;
import com.pussinboots.morning.os.modules.product.mapper.CategoryMapper;
import com.pussinboots.morning.os.modules.product.service.ICategoryService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：CategoryServiceImpl   
* 类描述：Category表 / 商品分类表  业务逻辑层接口实现类         
* 创建人：陈星星   
* 创建时间：2017年2月23日 下午3:48:15   
*
 */
@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements ICategoryService {
	
}
