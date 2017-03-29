package com.pussinboots.morning.os.modules.content.service.impl;

import com.pussinboots.morning.common.model.PageInfo;
import com.pussinboots.morning.os.modules.content.dto.QuestionPageDTO;
import com.pussinboots.morning.os.modules.content.entity.Comment;
import com.pussinboots.morning.os.modules.content.entity.Question;
import com.pussinboots.morning.os.modules.content.mapper.QuestionMapper;
import com.pussinboots.morning.os.modules.content.service.IQuestionService;
import com.pussinboots.morning.os.modules.user.entity.User;
import com.pussinboots.morning.os.modules.user.mapper.UserMapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：QuestionServiceImpl   
* 类描述：Question表 / 提问表 业务逻辑层接口实现      
* 创建人：陈星星   
* 创建时间：2017年3月4日 下午3:14:37   
*
 */
@Service
public class QuestionServiceImpl extends ServiceImpl<QuestionMapper, Question> implements IQuestionService {
	
	@Autowired
	private QuestionMapper questionMapper;
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public void insertQuestion(Long userId, Question question) {
		// 根据ID查找用户信息
		User user = userMapper.selectById(userId);
		
		question.setUserId(user.getUserId());
		question.setUserName(user.getUserName());
		question.setCreateBy(user.getUserId().toString());
		question.setCreateTime(new Date());
		question.setPicImg(user.getPicImg());
		questionMapper.insert(question);
	}

	@Override
	public List<Question> selectNewQuestions(Long productId, Integer status, PageInfo pageInfo) {
		Question question = new Question();
		question.setProductId(productId);
		question.setStatus(status);
		Page<Question> page = new Page<>(pageInfo.getNowpage(), pageInfo.getPagesize());
		return questionMapper.selectPage(page, new EntityWrapper<Question>(question).orderBy("createTime", false));
	}

	@Override
	public List<Question> selectHighQuestions(Long productId, Integer status, PageInfo pageInfo) {
		Question question = new Question();
		question.setProductId(productId);
		question.setStatus(status);
		Page<Question> page = new Page<>(pageInfo.getNowpage(), pageInfo.getPagesize());
		return questionMapper.selectPage(page, new EntityWrapper<Question>(question).orderBy("goodCount", false));
	}

	@Override
	public QuestionPageDTO selectQuestionsByPage(Long productId, PageInfo pageInfo, Integer status) {
		// 查找分页评论列表
		Page<Comment> page = new Page<>(pageInfo.getNowpage(), pageInfo.getPagesize());
		List<Question> questions = questionMapper.selectQuestionsByPage(productId, pageInfo, status, page);
		pageInfo.setTotal(page.getTotal());
		return new QuestionPageDTO(pageInfo, questions);
	}

}
