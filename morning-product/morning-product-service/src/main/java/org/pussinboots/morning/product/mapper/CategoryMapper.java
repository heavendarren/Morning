package org.pussinboots.morning.product.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.pussinboots.morning.product.entity.Category;
import org.pussinboots.morning.product.pojo.vo.CategoryVO;

import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * 
* 项目名称：morning-product-service   
* 类名称：CategoryMapper   
* 类描述：Category / 分类表 数据访问层接口      
* 创建人：陈星星   
* 创建时间：2017年4月12日 下午4:22:44   
*
 */
public interface CategoryMapper extends BaseMapper<Category> {
	
	/**
	 * 根据状态/类目类型/显示广告数量/是否置顶查找显示置顶分类列表
	 * @param status 状态
	 * @param type 目录类型
	 * @param advertNumber 显示广告数量
	 * @param showInTop 是否置顶
	 * @param date 广告时间
	 * @return
	 */
	List<CategoryVO> listTopAndAdvert(@Param("status") Integer status, @Param("type") Integer type,
			@Param("advertNumber") Integer advertNumber, @Param("showInTop") Integer showInTop,
			@Param("date") Date date);
	
	/**
	 * 根据状态/类目类型/显示广告数量/是否热门查找显示热门分类列表
	 * @param status 状态
	 * @param type 目录类型
	 * @param advertNumber 显示广告数量
	 * @param showInHot 是否热门
	 * @param date 广告时间
	 * @return
	 */
	List<CategoryVO> listHotAndAdvert(@Param("status") Integer status, @Param("type") Integer type,
			@Param("advertNumber") Integer advertNumber, @Param("showInHot") Integer showInHot,
			@Param("date") Date date);	
	
	/**
	 * 根据类目ID查找子类目ID
	 * @param categoryId 父类目ID
	 * @param status 类目状态
	 * @return
	 */
	List<Long> listIds(@Param("categoryId") Long categoryId, @Param("status") Integer status);
	
	/**
	 * 根据父级类目ID查找显示热门子级类目列表
	 * @param categoryId  父级类目ID
	 * @param status 类目状态
	 * @param showInHot 是否热门 
	 * @return
	 */
	List<CategoryVO> listHotChildrenAndAdvert(@Param("categoryId") Long categoryId, @Param("status") Integer status,
			@Param("showInHot") Integer showInHot);
	
	/**
	 * 根据是否导航/类目类型/导航状态/导航显示数量查找显示导航分类
	 * @param showInNav 是否导航
	 * @param type 类目类型
	 * @param status 类目状态
	 * @param navNumber 显示数量
	 * @return
	 */
	List<CategoryVO> listNav(@Param("showInNav") Integer showInNav, @Param("type") Integer type,
			@Param("status") Integer status, @Param("navNumber") Integer navNumber);
	
	/**
	 * 根据父类目ID查找子类目列表
	 * @param categoryId 父类目ID
	 * @param status 子类目状态
	 * @return
	 */
	List<Category> listLower(@Param("categoryId") Long categoryId, @Param("status") Integer status);
	
	/**
	 * 根据子类目ID查找父目录
	 * @param categoryId 子类目ID
	 * @return
	 */
	Category getUpper(@Param("categoryId") Long categoryId);
}