package org.pussinboots.morning.product.service.impl;

import java.util.Date;
import java.util.List;

import org.pussinboots.morning.common.base.BasePageDTO;
import org.pussinboots.morning.common.support.page.PageInfo;
import org.pussinboots.morning.product.entity.Product;
import org.pussinboots.morning.product.entity.Question;
import org.pussinboots.morning.product.mapper.ProductMapper;
import org.pussinboots.morning.product.mapper.QuestionMapper;
import org.pussinboots.morning.product.service.IQuestionService;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
* 项目名称：morning-product-service   
* 类名称：QuestionServiceImpl   
* 类描述：Question / 提问表 业务逻辑层接口实现   
* 创建人：陈星星   
* 创建时间：2017年4月25日 下午7:31:17   
*
 */
@Service
public class QuestionServiceImpl extends ServiceImpl<QuestionMapper, Question> implements IQuestionService {
	
	@Autowired
	private QuestionMapper questionMapper;
	@Autowired
	private ProductMapper productMapper;
	
	@Override
	public Integer insertQuestion(Question question, Long productId) {
		Product product = productMapper.selectById(productId);
		if (product != null) {
			question.setProductId(productId);
			question.setCreateTime(new Date());
			question.setCreateBy(question.getUserName());
			return questionMapper.insert(question);
		} else {
			// TODO 抛出一个商品不存在的异常
			return null;
		}
	}

	@Override
	public BasePageDTO<Question>  listByProductId(Long productId, Integer status, PageInfo pageInfo) {
		Page<Question> page = new Page<>(pageInfo.getCurrent(), pageInfo.getLimit());
		List<Question> questions = questionMapper.listByProductId(productId, status, pageInfo, page);
		pageInfo.setTotal(page.getTotal());
		return new BasePageDTO<Question>(pageInfo, questions);
	}

	@Override
	public Integer updateLike(Long questionId) {
		questionMapper.updateLike(questionId);
		Question question = questionMapper.selectById(questionId);
		return question.getGoodCount();
	}
}
