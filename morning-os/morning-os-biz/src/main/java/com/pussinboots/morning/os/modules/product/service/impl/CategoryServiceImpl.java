package com.pussinboots.morning.os.modules.product.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.pussinboots.morning.common.enums.StatusEnum;
import com.pussinboots.morning.os.modules.product.dto.CategoryAdvertDTO;
import com.pussinboots.morning.os.modules.product.dto.ProductCommentDTO;
import com.pussinboots.morning.os.modules.product.entity.Category;
import com.pussinboots.morning.os.modules.product.entity.Product;
import com.pussinboots.morning.os.modules.product.enums.CategoryInIndexEnum;
import com.pussinboots.morning.os.modules.product.enums.CategoryTypeEnum;
import com.pussinboots.morning.os.modules.product.enums.CommentTypeEnum;
import com.pussinboots.morning.os.modules.product.enums.ProductStatusEnum;
import com.pussinboots.morning.os.modules.product.mapper.CategoryMapper;
import com.pussinboots.morning.os.modules.product.mapper.ProductCategoryMapper;
import com.pussinboots.morning.os.modules.product.mapper.ProductMapper;
import com.pussinboots.morning.os.modules.product.service.ICategoryService;
import com.pussinboots.morning.os.modules.product.vo.CategoryVO;
import com.pussinboots.morning.os.modules.product.vo.IndexProductCategoryVO;
import com.pussinboots.morning.os.modules.product.vo.ProductVO;

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
	@Autowired
	private ProductMapper productMapper;
	
	@Override
	public List<Category> selectLowerCategories(Long categoryId, Integer status) {
		// 查找子级分类
		List<Category> lowerCategories = categoryMapper.selectLowerCategories(categoryId, status);
		if (lowerCategories == null) {
			Category upperCategory = categoryMapper.selectUpperByLowerCategoryId(categoryId);
			lowerCategories = categoryMapper.selectLowerCategories(upperCategory.getCategoryId(), status);
		}
		return lowerCategories;
	}
	
	@Override
	public List<Category> selectUpperCategories(Long categoryId, Integer status) {
		List<Category> categories = new ArrayList<>();

		// 将当前类目添加类目列表中
		Category category = categoryMapper.selectById(categoryId);
		categories.add(category);

		// 查找当前类目父类目
		getUpperCategory(categories, categoryId);
		
		// 对类目列表进行反转
		Collections.reverse(categories);

		return categories;
	}

	@Override
	public List<CategoryVO> selectCategorysByStatus() {
		List<CategoryVO> categoryInNavVOs = new ArrayList<>();
		// 查找显示的总目录
		List<Category> allCategoryInNavs = categoryMapper.selectCategorysByStatus(StatusEnum.SHOW.getStatus(),
				StatusEnum.SHOW.getStatus());

		for (Category firstCategory : allCategoryInNavs) {
			List<Long> categoryIds = new ArrayList<>();
			CategoryVO categoryInNavVO = new CategoryVO();
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
						ProductStatusEnum.SHELVE.getStatus(), StatusEnum.SHOW.getStatus());
				categoryInNavVO.setProducts(products);
				// 将该类目添加总目录列表
				categoryInNavVOs.add(categoryInNavVO);
			}
		}
		return categoryInNavVOs;
	}
	
	
	@Override
	public List<IndexProductCategoryVO> selectProductCategoryArea(Integer showNumber, Integer advertNumber) {
		List<IndexProductCategoryVO> indexProductCategoryVOs = new ArrayList<>();

		// 查找显示分栏产品区类目信息
		Category queryCategory = new Category();
		queryCategory.setStatus(StatusEnum.SHOW.getStatus()); // 类目状态
		queryCategory.setType(CategoryTypeEnum.FIRST_CATEGORY.getType());// 类目类型
		queryCategory.setShowInIndex(CategoryInIndexEnum.SHOW_CATEGORY_AREA.getType());// 显示首页分栏产品区
		List<Category> categories = categoryMapper.selectList(new EntityWrapper<Category>(queryCategory));

		// 对分类进行遍历，查找每个分类下产品列表及广告位
		for (Category category : categories) {
			IndexProductCategoryVO indexProductCategoryVO = new IndexProductCategoryVO();
			indexProductCategoryVO.setName(category.getName());

			// 查找该分类下产品列表
			getCategoryVOs(indexProductCategoryVO, category, showNumber);

			// 查询该类目ID下类目广告
			List<CategoryAdvertDTO> categoryAdvertDTOs = categoryMapper.selectCategoryAdvert(category.getCategoryId(),
					StatusEnum.SHOW.getStatus(), advertNumber);
			indexProductCategoryVO.setCategoryAdvertDTOs(categoryAdvertDTOs);

			indexProductCategoryVOs.add(indexProductCategoryVO);
		}
		return indexProductCategoryVOs;
	}
	
	/**
	 * 查找该分类下产品列表（包括热门及分类）
	 * @param indexProductCategoryVO 分栏产品区信息
	 * @param category 分类信息
	 * @param showNumber 显示数量
	 */
	private void getCategoryVOs(IndexProductCategoryVO indexProductCategoryVO, Category category, Integer showNumber) {
		List<CategoryVO> categoryVOs = new ArrayList<>();
		
		// 查询子目录信息ID
		List<Long> categoryIds = categoryMapper.selectCategoryIds(category.getCategoryId(),
				StatusEnum.SHOW.getStatus());
		
		// 查找该类目下热门产品
		getHotCategoryVO(categoryVOs, categoryIds, category, showNumber);

		// 查找该类目下子类目产品
		getCategoryVO(categoryVOs, categoryIds, category, showNumber);
		
		indexProductCategoryVO.setCategoryVOs(categoryVOs);
	}
	
	/**
	 * 查找该类目下热门产品（销量前八的热销产品）
	 * @param categoryVOs 返回类目列表
	 * @param categoryIds 子目录ID
	 * @param category 该类目信息
	 * @param showNumber 显示数量
	 */
	private void getHotCategoryVO(List<CategoryVO> categoryVOs, List<Long> categoryIds, Category category, Integer showNumber) {
		// 查找该类目下热门产品
		CategoryVO hotCategoryVO = new CategoryVO();

		BeanUtils.copyProperties(category, hotCategoryVO);
		hotCategoryVO.setName(CategoryVO.HOT_NAME);

		// 查询该目录ID列表下商品列表
		List<ProductVO> productVOs = productCategoryMapper.selectHotProductVOsByCategoryIds(categoryIds,
				ProductStatusEnum.SHELVE.getStatus(), showNumber);

		// 查找商品热门评价
		for (ProductVO productVO : productVOs) {
			ProductCommentDTO commentDTO = productMapper.selectHighGualityByProductId(productVO.getProductId(),
					CommentTypeEnum.HIGH_GUALITY.getType(), StatusEnum.SHOW.getStatus());
			if (commentDTO != null) {
				BeanUtils.copyProperties(commentDTO, productVO);
				
			}
		}
		hotCategoryVO.setProductVOs(productVOs);
		
		categoryVOs.add(hotCategoryVO);
	}
	
	/**
	 * 查找该类目下子类目产品（随机查找8个产品）
	 * @param categoryVOs 返回类目列表
	 * @param categoryIds 子目录ID
	 * @param category 该类目信息
	 * @param showNumber 显示数量
	 */
	private void getCategoryVO(List<CategoryVO> categoryVOs, List<Long> categoryIds, Category category,
			Integer showNumber) {

		for (Long categoryId : categoryIds) {
			// 排除该类目ID
			if (!categoryId.equals(category.getCategoryId())) {
				// 查找类目信息
				Category queryCategory = new Category();
				queryCategory.setCategoryId(categoryId);
				queryCategory.setStatus(StatusEnum.SHOW.getStatus());
				Category childCategory = categoryMapper.selectOne(queryCategory);
				
				// 查找该类目下子类目产品
				CategoryVO childCategoryVO = new CategoryVO();
				BeanUtils.copyProperties(childCategory, childCategoryVO);
				
				// 查询该目录ID下商品列表
				List<ProductVO> productVOs = productCategoryMapper.selectProductVOs(categoryId,
						ProductStatusEnum.SHELVE.getStatus(), showNumber);

				// 查找商品热门评价
				for (ProductVO productVO : productVOs) {
					ProductCommentDTO commentDTO = productMapper.selectHighGualityByProductId(productVO.getProductId(),
							CommentTypeEnum.COMMON_ADVERT.getType(), StatusEnum.SHOW.getStatus());
					if (commentDTO != null) {
						BeanUtils.copyProperties(commentDTO, productVO);
					}
				}
				childCategoryVO.setProductVOs(productVOs);

				categoryVOs.add(childCategoryVO);
			}
		}
	}
	
	/**
	 * 查找类目ID的所有父类目
	 * @param categories 父类目列表
	 * @param categoryId 类目ID
	 */
	private void getUpperCategory(List<Category> categories, Long categoryId) {
		Category upperCategory = categoryMapper.selectUpperByLowerCategoryId(categoryId);
		if (upperCategory != null) {
			categories.add(upperCategory);
			getUpperCategory(categories, upperCategory.getCategoryId());
		}
	}

}
