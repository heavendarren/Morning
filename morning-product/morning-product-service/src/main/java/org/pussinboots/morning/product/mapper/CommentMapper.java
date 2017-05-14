package org.pussinboots.morning.product.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.pussinboots.morning.common.support.page.PageInfo;
import org.pussinboots.morning.product.entity.Comment;
import org.pussinboots.morning.product.pojo.vo.CommentVO;

import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * 
* 项目名称：morning-product-service   
* 类名称：CommentMapper   
* 类描述：Comment / 评价表 数据访问层接口
* 创建人：陈星星   
* 创建时间：2017年4月11日 下午3:14:04   
*
 */
public interface CommentMapper extends BaseMapper<Comment> {
	
	/**
	 * 根据商品ID、排序、分页查找评论列表
	 * @param productId 商品ID
	 * @param status 评论状态
	 * @param pageInfo 排序方式
	 * @param page
	 * @return
	 */
	List<CommentVO> listByProductId(@Param("productId") Long productId, @Param("status") Integer status,
			@Param("pageInfo") PageInfo pageInfo, RowBounds rowBounds);

}