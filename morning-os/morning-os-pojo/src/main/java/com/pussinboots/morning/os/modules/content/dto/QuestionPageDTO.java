package com.pussinboots.morning.os.modules.content.dto;

import java.io.Serializable;
import java.util.List;

import com.pussinboots.morning.common.model.PageInfo;
import com.pussinboots.morning.os.modules.content.entity.Question;

public class QuestionPageDTO implements Serializable{

	private static final long serialVersionUID = 1L;
	
	/**
	 * 分页信息
	 */
	private PageInfo pageInfo;
	
	/**
	 * 提问列表
	 */
	private List<Question> questions;

	
	public QuestionPageDTO() {
		super();
	}

	public QuestionPageDTO(PageInfo pageInfo, List<Question> questions) {
		super();
		this.pageInfo = pageInfo;
		this.questions = questions;
	}

	public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}

	public List<Question> getQuestions() {
		return questions;
	}

	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}
	
}
