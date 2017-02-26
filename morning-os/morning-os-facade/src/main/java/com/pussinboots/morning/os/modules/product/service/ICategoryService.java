package com.pussinboots.morning.os.modules.product.service;

import com.pussinboots.morning.os.modules.product.entity.Category;
import com.pussinboots.morning.os.modules.product.vo.CategoryInNavVO;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-os-facade   
* 类名称：ICategoryService   
* 类描述：Category表 / 商品分类表 业务逻辑层接口     
* 创建人：陈星星   
* 创建时间：2017年2月23日 下午3:41:02   
*
 */
public interface ICategoryService extends IService<Category> {
	
	/**
	 * 查找首页导航栏商品列表
	 * @return
	 */
	List<CategoryInNavVO> selectCategorysByStatus();
	
}
