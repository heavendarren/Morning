package com.pussinboots.morning.os.modules.product.service.impl;

import com.pussinboots.morning.os.modules.product.entity.Category;
import com.pussinboots.morning.os.modules.product.entity.Product;
import com.pussinboots.morning.os.modules.product.enums.CategoryNavStatusEnum;
import com.pussinboots.morning.os.modules.product.enums.CategoryStatusEnum;
import com.pussinboots.morning.os.modules.product.enums.CategoryTypeEnum;
import com.pussinboots.morning.os.modules.product.enums.ProductNavStatusEnum;
import com.pussinboots.morning.os.modules.product.enums.ProductStatusEnum;
import com.pussinboots.morning.os.modules.product.mapper.CategoryMapper;
import com.pussinboots.morning.os.modules.product.mapper.ProductCategoryMapper;
import com.pussinboots.morning.os.modules.product.service.ICategoryService;
import com.pussinboots.morning.os.modules.product.vo.CategoryInNavVO;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
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
	
	@Autowired
	private CategoryMapper categoryMapper;
	@Autowired
	private ProductCategoryMapper productCategoryMapper;

	@Override
	public List<CategoryInNavVO> selectCategorysByStatus() {
		List<CategoryInNavVO> categoryInNavVOs = new ArrayList<>();
		// 查找显示的总目录
		List<Category> allCategoryInNavs = categoryMapper.selectCategorysByStatus(CategoryStatusEnum.SHOW.getStatus(),
				CategoryNavStatusEnum.SHOW.getStatus());

		for (Category firstCategory : allCategoryInNavs) {
			List<Long> categoryIds = new ArrayList<>();
			CategoryInNavVO categoryInNavVO = new CategoryInNavVO();
			// 判断是否是一级目录
			if (CategoryTypeEnum.FIRST_CATEGORY.getType().equals(firstCategory.getType())) {
				categoryIds.add(firstCategory.getCategoryId());
				BeanUtils.copyProperties(firstCategory, categoryInNavVO);

				for (Category secondCategory : allCategoryInNavs) {
					// 判断是否是该目录下的二级目录
					if (secondCategory.getParentId().equals(firstCategory.getCategoryId())) {
						categoryIds.add(secondCategory.getCategoryId());
					}
				}
				
				// 查找该类目列表下产品列表
				List<Product> products = productCategoryMapper.selectProductByCategoryIds(categoryIds,
						ProductStatusEnum.SHELVE.getStatus(), ProductNavStatusEnum.SHOW.getStatus());
				categoryInNavVO.setProducts(products);
				// 将该类目添加总目录列表
				categoryInNavVOs.add(categoryInNavVO);
			}
		}
		return categoryInNavVOs;
	}
	
}
