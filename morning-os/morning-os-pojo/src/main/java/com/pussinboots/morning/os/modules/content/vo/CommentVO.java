package com.pussinboots.morning.os.modules.content.vo;

import java.io.Serializable;
import java.util.List;

import com.pussinboots.morning.os.modules.content.entity.Comment;
import com.pussinboots.morning.os.modules.content.entity.CommentReply;

public class CommentVO implements Serializable{

	private static final long serialVersionUID = 1L;
	
	/**
	 * 评论信息
	 */
	private Comment comment;
	
	/**
	 * 评论回复列表
	 */
	private List<CommentReply> commentReplies;

	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	public List<CommentReply> getCommentReplies() {
		return commentReplies;
	}

	public void setCommentReplies(List<CommentReply> commentReplies) {
		this.commentReplies = commentReplies;
	}
	
}
