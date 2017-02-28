package com.pussinboots.morning.os.modules.product.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.pussinboots.morning.os.modules.product.entity.ProductCategory;
import com.pussinboots.morning.os.modules.product.vo.CategoryVO;

/**
 * 
* 项目名称：morning-os-facade   
* 类名称：IProductCategoryService   
* 类描述：ProductCategory表   / 商品表分类表关联表 业务逻辑层接口
* 创建人：陈星星   
* 创建时间：2017年2月23日 下午3:42:13   
*
 */
public interface IProductCategoryService extends IService<ProductCategory> {
	
	/**
	 * 根据产品显示数量和广告数量查找产品列表（首页主产品区）
	 * @param showNumber 产品显示数量
	 * @param advertNumber 广告数量
	 * @return
	 */
	List<CategoryVO> selectProductArea(Integer showNumber, Integer advertNumber);
	
}
