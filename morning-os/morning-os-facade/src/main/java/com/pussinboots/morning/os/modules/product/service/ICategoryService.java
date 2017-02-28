package com.pussinboots.morning.os.modules.product.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.pussinboots.morning.os.modules.product.entity.Category;
import com.pussinboots.morning.os.modules.product.vo.CategoryVO;
import com.pussinboots.morning.os.modules.product.vo.IndexProductCategoryVO;

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
	List<CategoryVO> selectCategorysByStatus();
	
	/**
	 * 根据产品显示数量和广告数量查找产品列表（首页分栏产品区）
	 * @param showNumber 产品显示数量
	 * @param advertNumber 广告数量
	 * @return
	 */
	List<IndexProductCategoryVO> selectProductCategoryArea(Integer showNumber, Integer advertNumber);
	
}
