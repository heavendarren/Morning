package org.pussinboots.morning.product.service.impl;

import java.util.List;

import org.pussinboots.morning.common.base.BasePageDTO;
import org.pussinboots.morning.common.support.page.PageInfo;
import org.pussinboots.morning.product.entity.Comment;
import org.pussinboots.morning.product.entity.CommentReply;
import org.pussinboots.morning.product.mapper.CommentMapper;
import org.pussinboots.morning.product.mapper.CommentReplyMapper;
import org.pussinboots.morning.product.pojo.vo.CommentVO;
import org.pussinboots.morning.product.service.ICommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

/**
 * 
* 项目名称：morning-product-service   
* 类名称：CommentServiceImpl   
* 类描述：Comment / 评价表 业务逻辑层接口实现   
* 创建人：陈星星   
* 创建时间：2017年4月11日 下午3:16:30   
*
 */
@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements ICommentService {
	
	@Autowired
	private CommentMapper commentMapper;
	@Autowired
	private CommentReplyMapper commentReplyMapper;

	@Override
	public BasePageDTO<CommentVO> listByProductId(Long productId, Integer status, PageInfo pageInfo) {
		
		Page<CommentVO> page = new Page<>(pageInfo.getCurrent(), pageInfo.getLimit());
		List<CommentVO> commentVOs = commentMapper.listByProductId(productId, status, pageInfo, page);
		pageInfo.setTotal(page.getTotal());
		
		// 对评论列表进行遍历,查找评论回复列表
		for (CommentVO forComment : commentVOs) {
			List<CommentReply> commentReplies = commentReplyMapper.listByCommentId(forComment.getCommentId(), status);
			forComment.setCommentReplies(commentReplies);
		}
		return new BasePageDTO<CommentVO>(pageInfo, commentVOs);
	}

	@Override
	public Integer updateLike(Long commentId) {
		Comment comment = commentMapper.selectById(commentId);
		if (comment != null) {
			comment.setGoodCount(comment.getGoodCount() + 1);
			commentMapper.updateById(comment);
			return comment.getGoodCount();
		} else {
			// TODO 抛出一个评论不存在异常
			return null;
		}
	}
}
