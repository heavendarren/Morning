package org.pussinboots.morning.product.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.pussinboots.morning.product.entity.CommentReply;
import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * 
* 项目名称：morning-product-service   
* 类名称：CommentReplyMapper   
* 类描述：CommentReply / 评论回复表 数据访问层接口   
* 创建人：陈星星   
* 创建时间：2017年5月9日 下午12:50:18   
*
 */
public interface CommentReplyMapper extends BaseMapper<CommentReply> {
	
	/**
	 * 根据评论ID和状态查找回复列表（排序方式,官方回复最前,其次按回复顺序倒序）
	 * @param commentId  评论ID
	 * @param status 评论状态
	 * @return
	 */
	List<CommentReply> listByCommentId(@Param("commentId") Long commentId, @Param("status") Integer status);
}