package org.pussinboots.morning.product.service.impl;

import org.pussinboots.morning.product.entity.CommentReply;
import org.pussinboots.morning.product.mapper.CommentReplyMapper;
import org.pussinboots.morning.product.service.ICommentReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;

/**
 * 
* 项目名称：morning-product-service   
* 类名称：CommentReplyServiceImpl   
* 类描述：CommentReply / 评论回复表 业务逻辑层接口实现      
* 创建人：陈星星   
* 创建时间：2017年5月9日 下午12:51:13   
*
 */
@Service
public class CommentReplyServiceImpl extends ServiceImpl<CommentReplyMapper, CommentReply> implements ICommentReplyService {
	
	@Autowired
	private CommentReplyMapper commentReplyMapper;
	
	@Override
	public Integer updateLike(Long commentReplyId) {
		CommentReply commentReply = commentReplyMapper.selectById(commentReplyId);
		if (commentReply != null) {
			commentReply.setGoodCount(commentReply.getGoodCount() + 1);
			commentReplyMapper.updateById(commentReply);
			return commentReply.getGoodCount();
		} else {
			// TODO 抛出一个评论不存在异常
			return null;
		}
	}
	
}
