package com.pussinboots.morning.os.modules.product.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.pussinboots.morning.common.enums.StatusEnum;
import com.pussinboots.morning.common.model.PageInfo;
import com.pussinboots.morning.os.modules.product.dto.CategoryAdvertDTO;
import com.pussinboots.morning.os.modules.product.dto.ProductPageDTO;
import com.pussinboots.morning.os.modules.product.entity.Category;
import com.pussinboots.morning.os.modules.product.entity.ProductCategory;
import com.pussinboots.morning.os.modules.product.enums.CategoryInIndexEnum;
import com.pussinboots.morning.os.modules.product.enums.CategoryTypeEnum;
import com.pussinboots.morning.os.modules.product.enums.ProductStatusEnum;
import com.pussinboots.morning.os.modules.product.mapper.CategoryMapper;
import com.pussinboots.morning.os.modules.product.mapper.ProductCategoryMapper;
import com.pussinboots.morning.os.modules.product.service.IProductCategoryService;
import com.pussinboots.morning.os.modules.product.vo.CategoryVO;
import com.pussinboots.morning.os.modules.product.vo.ProductVO;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：ProductCategoryServiceImpl   
* 类描述：ProductCategory表 / 商品表分类表关联表 业务逻辑层接口实现类            
* 创建人：陈星星   
* 创建时间：2017年2月23日 下午3:48:45   
*
 */
@Service
public class ProductCategoryServiceImpl extends ServiceImpl<ProductCategoryMapper, ProductCategory> implements IProductCategoryService {
	
	@Autowired
	private CategoryMapper categoryMapper;
	@Autowired
	private ProductCategoryMapper productCategoryMapper;
	
	@Override
	public List<CategoryVO> selectProductArea(Integer showNumber, Integer advertNumber) {
		List<CategoryVO> categoryVOs = new ArrayList<>();

		// 查找显示主产品区类目信息
		Category queryCategory = new Category();
		queryCategory.setStatus(StatusEnum.SHOW.getStatus()); // 类目状态
		queryCategory.setType(CategoryTypeEnum.FIRST_CATEGORY.getType());// 类目类型
		queryCategory.setShowInIndex(CategoryInIndexEnum.SHOW_PRODUCT_AREA.getType());// 显示首页主产品区
		List<Category> categories = categoryMapper.selectList(new EntityWrapper<Category>(queryCategory));

		// 对分类进行遍历，查找每个分类下产品列表及广告位
		for (Category category : categories) {
			CategoryVO categoryVO = new CategoryVO();
			BeanUtils.copyProperties(category, categoryVO);

			// 查询子目录信息ID
			List<Long> categoryIds = categoryMapper.selectCategoryIds(category.getCategoryId(),
					StatusEnum.SHOW.getStatus());
			// 查询该目录ID列表下商品列表
			List<ProductVO> productVOs = productCategoryMapper.selectProductVOsByCategoryIds(categoryIds,
					ProductStatusEnum.SHELVE.getStatus(), showNumber);
			categoryVO.setProductVOs(productVOs);

			// 查询该类目ID下类目广告
			List<CategoryAdvertDTO> categoryAdvertDTOs = categoryMapper.selectCategoryAdvert(category.getCategoryId(),
					StatusEnum.SHOW.getStatus(), advertNumber);
			categoryVO.setCategoryAdvertDTOs(categoryAdvertDTOs);
			
			categoryVOs.add(categoryVO);
		}
		return categoryVOs;
	}

	@Override
	public ProductPageDTO selectProductVOs(Long categoryId, PageInfo pageInfo) {

		// 查询子目录信息ID
		List<Long> categoryIds = categoryMapper.selectCategoryIds(categoryId, StatusEnum.SHOW.getStatus());

		// 查询该目录ID列表下商品列表
		Page<ProductVO> page = new Page<>(pageInfo.getNowpage(), pageInfo.getPagesize());
		List<ProductVO> productVOs = productCategoryMapper.selectProductVOsByPage(categoryIds,
				StatusEnum.SHOW.getStatus(), page, pageInfo);
		pageInfo.setTotal(page.getTotal());

		return new ProductPageDTO(pageInfo, productVOs);
	}
	
	@Override
	public ProductPageDTO selectProductVOsBySearch(String search, PageInfo pageInfo) {
		Page<ProductVO> page = new Page<>(pageInfo.getNowpage(), pageInfo.getPagesize());
		List<ProductVO> productVOs = productCategoryMapper.selectProductVOsBySearch(search, StatusEnum.SHOW.getStatus(),
				page, pageInfo);
		pageInfo.setTotal(page.getTotal());
		return new ProductPageDTO(pageInfo, productVOs);
	}

	@Override
	public List<Category> selectUpperCategories(Long productId) {
		ProductCategory productCategory = productCategoryMapper.selectOne(new ProductCategory(productId));
		
		// 查找类目ID的所有父类目
		List<Category> categories = new ArrayList<>();
		if (productCategory != null) {
			// 将该商品的所属类添加到列表中
			Category category =  categoryMapper.selectById(productCategory.getCategoryId());
			categories.add(category);
			
			// 查找类目ID的所有父类目
			getUpperCategory(categories, productCategory.getCategoryId());
			
			// 对类目列表进行反转
			Collections.reverse(categories);
		}
		
		return categories;
	}
	
	/**
	 * 查找类目ID的所有父类目
	 * @param categories 父类目列表
	 * @param categoryId 类目ID
	 */
	private void getUpperCategory(List<Category> categories, Long categoryId) {
		Category upperCategory = categoryMapper.selectUpperByLowerCategoryId(categoryId);
		if (upperCategory != null) {
			if (StatusEnum.NORMAL.getStatus().equals(upperCategory.getStatus())) {
				categories.add(upperCategory);
			}
			getUpperCategory(categories, upperCategory.getCategoryId());
		}
	}
}
