package org.pussinboots.morning.product.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.pussinboots.morning.common.enums.StatusEnum;
import org.pussinboots.morning.product.common.enums.CategoryRecommendTypeEnum;
import org.pussinboots.morning.product.common.enums.CategoryTypeEnum;
import org.pussinboots.morning.product.common.util.CategoryUtils;
import org.pussinboots.morning.product.entity.Category;
import org.pussinboots.morning.product.entity.ProductCategory;
import org.pussinboots.morning.product.mapper.CategoryMapper;
import org.pussinboots.morning.product.mapper.ProductCategoryMapper;
import org.pussinboots.morning.product.pojo.vo.CategoryVO;
import org.pussinboots.morning.product.pojo.vo.ProductVO;
import org.pussinboots.morning.product.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;

/**
 * 
* 项目名称：morning-product-service   
* 类名称：CategoryServiceImpl   
* 类描述：Category / 分类表 业务逻辑层接口实现      
* 创建人：陈星星   
* 创建时间：2017年4月12日 下午4:24:19   
*
 */
@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements ICategoryService {
	
	@Autowired
	private CategoryMapper categoryMapper;
	@Autowired
	private ProductCategoryMapper productCategoryMapper;

	@Override
	public List<CategoryVO> listTop(Integer showNumber, Integer advertNumber) {

		List<CategoryVO> categorys = categoryMapper.listTopAndAdvert(StatusEnum.SHOW.getStatus(),
				CategoryTypeEnum.FIRST_CATEGORY.getType(), advertNumber,
				CategoryRecommendTypeEnum.SHOW_IN_TOP.getType(), new Date());
		if (!categorys.isEmpty()) {
			for (CategoryVO category : categorys) {
				// 查询子目录ID列表
				List<Long> categoryIds = categoryMapper.listIds(category.getCategoryId(), StatusEnum.SHOW.getStatus());

				// 查询该目录ID列表下置顶商品列表
				List<ProductVO> products = productCategoryMapper.listTopByCategoryIds(categoryIds,
						StatusEnum.SHELVE.getStatus(), CategoryRecommendTypeEnum.SHOW_IN_TOP.getType(), showNumber);
				category.setProducts(products);
			}
			return categorys;
		}
		return null;
	}

	@Override
	public List<CategoryVO> listHot(Integer showNumber, Integer advertNumber, Integer type) {
		// 根据状态/类目类型/显示广告数量/是否热门查找显示热门分类列表
		List<CategoryVO> parentCategorys = categoryMapper.listHotAndAdvert(StatusEnum.SHOW.getStatus(),
				CategoryTypeEnum.FIRST_CATEGORY.getType(), advertNumber,
				CategoryRecommendTypeEnum.SHOW_IN_HOT.getType(), new Date());
		
		if(parentCategorys != null) {
			// 对父级类目进行遍历,查找父级类目下热门子级类目及其商品信息
			for (CategoryVO parentCategory : parentCategorys) {
				List<CategoryVO> childrenCategorys = new ArrayList<>();
				
				// 查找该父级类目下热门商品
				getHotCategoryVO(parentCategory, childrenCategorys, showNumber, type);
				
				// 查找该父级类目下热门类目
				listChildrenCategorys(parentCategory, childrenCategorys, showNumber, type);
				
				parentCategory.setChildrenCategorys(childrenCategorys);
			}
			return parentCategorys;
		}
		return null;
	}
	
	@Override
	public List<CategoryVO> listNav(Integer showNumber, Integer navNumber) {
		// 根据是否导航/类目类型/导航状态/导航显示数量查找显示导航分类
		List<CategoryVO> categorys = categoryMapper.listNav(CategoryRecommendTypeEnum.SHOW_IN_NAV.getType(),
				CategoryTypeEnum.FIRST_CATEGORY.getType(), StatusEnum.SHOW.getStatus(), navNumber);

		if (categorys != null) {
			for (CategoryVO category : categorys) {
				// 查询子目录ID列表
				List<Long> categoryIds = categoryMapper.listIds(category.getCategoryId(), StatusEnum.SHOW.getStatus());

				// 查询该目录ID列表下置顶商品列表
				List<ProductVO> products = productCategoryMapper.listNavByCategoryIds(categoryIds,
						StatusEnum.SHELVE.getStatus(), CategoryRecommendTypeEnum.SHOW_IN_NAV.getType(), showNumber);
				category.setProducts(products);
			}
			return categorys;
		}

		return null;
	}
	
	@Override
	public Category getById(Long categoryId, Integer status) {
		Category category = new Category();
		category.setCategoryId(categoryId);
		category.setStatus(status);
		return categoryMapper.selectOne(category);
	}
	
	@Override
	public List<Category> listLowerCategories(Long categoryId, Integer status) {
		// 查找子级分类
		List<Category> lowerCategories = categoryMapper.listLower(categoryId, status);

		// 判断是否为空,如果为空,则返回当前列表
		if (lowerCategories.isEmpty()) {
			Category upperCategory = categoryMapper.getUpper(categoryId);
			lowerCategories = categoryMapper.listLower(upperCategory.getCategoryId(), status);
		}
		return lowerCategories;
	}
	
	@Override
	public List<Category> listUpperCategories(Long categoryId, Integer status) {
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
	public List<Category> listUpperByProductId(Long productId, Integer status) {

		ProductCategory queryProductCategory = new ProductCategory();
		queryProductCategory.setProductId(productId);
		ProductCategory productCategory = productCategoryMapper.selectOne(queryProductCategory);

		// 查找类目ID的所有父类目
		if (productCategory != null) {
			List<Category> categories = new ArrayList<>();

			// 将该商品的所属类添加到列表中
			Category category = categoryMapper.selectById(productCategory.getCategoryId());
			categories.add(category);

			// 查找类目ID的所有父类目
			getUpperCategory(categories, productCategory.getCategoryId());

			// 对类目列表进行反转
			Collections.reverse(categories);
			return categories;
		}
		return null;
	}
	
	/**
	 * 查找该父级类目下热门类目
	 * @param parentCategory 父类目信息
	 * @param childrenCategorys 父类目下子级类目列表
	 * @param showNumber 商品显示数量
	 * @param type 评论类型
	 */
	private void listChildrenCategorys(CategoryVO parentCategory, List<CategoryVO> childrenCategorys,
			Integer showNumber, Integer type) {
		// 根据父级类目ID查找显示热门子级类目列表
		List<CategoryVO> otherCategorys = categoryMapper.listHotChildrenAndAdvert(parentCategory.getCategoryId(),
				StatusEnum.SHOW.getStatus(), CategoryRecommendTypeEnum.SHOW_IN_HOT.getType());
		
		// 对子级类目列表进行遍历,查找该类目下商品列表
		for (CategoryVO otherCategory : otherCategorys) {
			
			// 查询该目录ID列表下热门商品列表
			List<ProductVO> products = productCategoryMapper.listHotByCategoryId(otherCategory.getCategoryId(),
					StatusEnum.SHELVE.getStatus(), CategoryRecommendTypeEnum.SHOW_IN_HOT.getType(), showNumber);
			
			if (!products.isEmpty()) {
				// 对查询出来的商品列表进行遍历,随机选取一条优质评论
				for (ProductVO product : products) {
					ProductVO vo = productCategoryMapper.getComment(product.getProductId(), type,
							StatusEnum.SHOW.getStatus());
					if (vo != null) {
						product.setUserName(vo.getUserName());
						product.setContent(vo.getContent());
						product.setCommentId(vo.getCommentId());
					}
				}
				otherCategory.setProducts(products);
			}
		}
		
		// 将显示子级类目列表信息加到子级类目列表中
		childrenCategorys.addAll(otherCategorys);
	}

	/**
	 * 查找该类目下热门商品
	 * @param parentCategory 父类目信息
	 * @param childrenCategorys 父类目下子级类目列表
	 * @param showNumber 商品显示数量
	 * @param type 评论类型
	 */
	private void getHotCategoryVO(CategoryVO parentCategory, List<CategoryVO> childrenCategorys, Integer showNumber,
			Integer type) {

		// 设置热门类目信息
		CategoryVO hotCategory = new CategoryVO();
		hotCategory.setName(CategoryUtils.HOT_NAME);
		hotCategory.setCategoryId(parentCategory.getCategoryId());

		// 查询子目录ID列表
		List<Long> categoryIds = categoryMapper.listIds(parentCategory.getCategoryId(), StatusEnum.SHOW.getStatus());

		// 查询该目录ID列表下热门商品列表
		List<ProductVO> products = productCategoryMapper.listHotByCategoryIds(categoryIds,
				StatusEnum.SHELVE.getStatus(), CategoryRecommendTypeEnum.SHOW_IN_HOT.getType(), showNumber);
		
		if(!products.isEmpty()) {
			// 对查询出来的商品列表进行遍历,随机选取一条优质评论
			for (ProductVO product : products) {
				ProductVO vo = productCategoryMapper.getComment(product.getProductId(), type,
						StatusEnum.SHOW.getStatus());
				if (vo != null) {
					product.setUserName(vo.getUserName());
					product.setContent(vo.getContent());
					product.setCommentId(vo.getCommentId());
				}
			}
			hotCategory.setProducts(products);
		}

		// 将热门类目信息加到子级类目列表中
		childrenCategorys.add(hotCategory);
	}
	
	/**
	 * 查找类目ID的所有父类目
	 * @param categories 父类目列表
	 * @param categoryId 类目ID
	 */
	private void getUpperCategory(List<Category> categories, Long categoryId) {
		Category upperCategory = categoryMapper.getUpper(categoryId);
		if (upperCategory != null) {
			if (StatusEnum.SHOW.getStatus().equals(upperCategory.getStatus())) {
				categories.add(upperCategory);
			}
			getUpperCategory(categories, upperCategory.getCategoryId());
		}
	}

}
