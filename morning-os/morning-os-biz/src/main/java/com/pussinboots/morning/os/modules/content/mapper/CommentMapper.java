package com.pussinboots.morning.os.modules.content.mapper;

import com.pussinboots.morning.common.model.PageInfo;
import com.pussinboots.morning.os.modules.content.entity.Comment;
import com.pussinboots.morning.os.modules.content.vo.CommentVO;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：CommentMapper   
* 类描述：Comment表 / 评价表 数据访问层接口
* 创建人：陈星星   
* 创建时间：2017年2月28日 上午1:09:53   
*
 */
public interface CommentMapper extends BaseMapper<Comment> {
	
	/**
	 * 根据商品ID、排序、分页查找评论列表及回复列表
	 * @param productId 商品ID
	 * @param pageInfo 排序方式
	 * @param status 评论状态
	 * @param rowBounds 分页实体类
	 * @return
	 */
	List<CommentVO> selectCommentsByPage(@Param("productId") Long productId, @Param("pageInfo") PageInfo pageInfo,
			@Param("status") Integer status, RowBounds rowBounds);	

}