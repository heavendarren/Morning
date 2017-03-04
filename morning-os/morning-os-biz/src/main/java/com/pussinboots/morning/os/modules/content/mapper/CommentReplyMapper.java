package com.pussinboots.morning.os.modules.content.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.pussinboots.morning.os.modules.content.entity.CommentReply;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：CommentReplyMapper   
* 类描述：CommentReply表 / 评论回复表 数据访问层接口   
* 创建人：陈星星   
* 创建时间：2017年3月4日 下午3:12:45   
*
 */
public interface CommentReplyMapper extends BaseMapper<CommentReply> {
	
	/**
	 * 根据评论ID和状态查找回复列表（排序方式,官方回复最前,其次按回复顺序倒序）
	 * @param commentId  评论ID
	 * @param status 评论状态
	 * @return
	 */
	List<CommentReply> selectRepliesByCommentId(@Param("commentId")Long commentId, @Param("status")Integer status);


}