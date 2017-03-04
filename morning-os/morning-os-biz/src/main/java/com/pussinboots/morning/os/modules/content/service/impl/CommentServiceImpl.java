package com.pussinboots.morning.os.modules.content.service.impl;

import com.pussinboots.morning.common.enums.StatusEnum;
import com.pussinboots.morning.common.model.PageInfo;
import com.pussinboots.morning.os.modules.content.entity.Comment;
import com.pussinboots.morning.os.modules.content.entity.CommentReply;
import com.pussinboots.morning.os.modules.content.mapper.CommentMapper;
import com.pussinboots.morning.os.modules.content.mapper.CommentReplyMapper;
import com.pussinboots.morning.os.modules.content.service.ICommentService;
import com.pussinboots.morning.os.modules.content.vo.CommentVO;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：CommentServiceImpl   
* 类描述：Comment表 / 评价表 业务逻辑层接口实现   
* 创建人：陈星星   
* 创建时间：2017年2月28日 上午1:10:41   
*
 */
@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements ICommentService {
	
	@Autowired
	private CommentMapper commentMapper;
	@Autowired
	private CommentReplyMapper commentReplyMapper;

	@Override
	public List<Comment> selectNewComments(Long productId, Integer type, Integer status, PageInfo pageInfo) {
		Comment comment = new Comment();
		comment.setProductId(productId);
		comment.setType(type);
		comment.setStatus(status);
		Page<Comment> page = new Page<Comment>(pageInfo.getNowpage(), pageInfo.getPagesize());
		return commentMapper.selectPage(page, new EntityWrapper<Comment>(comment).orderBy("createTime", false));
	}

	@Override
	public List<CommentVO> selectHighComments(Long productId, Integer type, Integer status, PageInfo pageInfo) {
		List<CommentVO> commentVOs = new ArrayList<>();
		// 查找评论列表
		Comment comment = new Comment();
		comment.setProductId(productId);
		comment.setType(type);
		comment.setStatus(status);
		Page<Comment> page = new Page<Comment>(pageInfo.getNowpage(), pageInfo.getPagesize());
		List<Comment> comments = commentMapper.selectPage(page,
				new EntityWrapper<Comment>(comment).orderBy("goodCount", false));

		// 对评论列表进行遍历,查找评论回复列表
		for (Comment forComment : comments) {
			CommentVO commentVO = new CommentVO();
			commentVO.setComment(forComment);
			List<CommentReply> commentReplies = commentReplyMapper.selectRepliesByCommentId(forComment.getCommentId(),
					StatusEnum.SHOW.getStatus());
			commentVO.setCommentReplies(commentReplies);
			commentVOs.add(commentVO);
		}
		return commentVOs;
	}
	
}
