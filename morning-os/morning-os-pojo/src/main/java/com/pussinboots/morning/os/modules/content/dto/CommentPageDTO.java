package com.pussinboots.morning.os.modules.content.dto;

import java.io.Serializable;
import java.util.List;

import com.pussinboots.morning.common.model.PageInfo;
import com.pussinboots.morning.os.modules.content.vo.CommentVO;

public class CommentPageDTO implements Serializable{

	private static final long serialVersionUID = 1L;
	
	/**
	 * 分页信息
	 */
	private PageInfo pageInfo;
	
	/**
	 * 评论列表
	 */
	private List<CommentVO> commentVOs;

	public CommentPageDTO() {
		super();
	}

	public CommentPageDTO(PageInfo pageInfo, List<CommentVO> commentVOs) {
		super();
		this.pageInfo = pageInfo;
		this.commentVOs = commentVOs;
	}

	public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}

	public List<CommentVO> getCommentVOs() {
		return commentVOs;
	}

	public void setCommentVOs(List<CommentVO> commentVOs) {
		this.commentVOs = commentVOs;
	}

}
