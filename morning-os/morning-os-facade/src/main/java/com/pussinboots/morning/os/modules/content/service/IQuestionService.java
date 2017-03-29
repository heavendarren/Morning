package com.pussinboots.morning.os.modules.content.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.pussinboots.morning.common.model.PageInfo;
import com.pussinboots.morning.os.modules.content.dto.QuestionPageDTO;
import com.pussinboots.morning.os.modules.content.entity.Question;

/**
 * 
* 项目名称：morning-os-facade   
* 类名称：IQuestionService   
* 类描述： Question表 / 提问表 业务逻辑层接口  
* 创建人：陈星星   
* 创建时间：2017年3月4日 下午3:10:54   
*
 */
public interface IQuestionService extends IService<Question> {
	
	/**
	 * 创建用户提问
	 * @param userId 用户ID
	 * @param question 提问信息
	 */
	void insertQuestion(Long userId, Question question);
	
	/**
	 * 根据商品ID和提问状态查找最新提问（根据提问时间排序）
	 * @param productId 商品ID
	 * @param status 提问状态
	 * @param pageInfo 分页类
	 * @return
	 */
	List<Question> selectNewQuestions(Long productId, Integer status, PageInfo pageInfo);
	
	/**
	 * 根据商品ID和提问状态查找最有帮助提问（根据好评数排序）
	 * @param productId 商品ID
	 * @param status 提问状态
	 * @param pageInfo 分页类
	 * @return
	 */
	List<Question> selectHighQuestions(Long productId, Integer status, PageInfo pageInfo);	
	
	/**
	 * 根据商品ID、排序、分页查找提问列表及回复列表
	 * @param productId 商品ID
	 * @param pageInfo 分页
	 * @param status 提问状态
	 * @return QuestionPageDTO
	 */
	QuestionPageDTO selectQuestionsByPage(Long productId, PageInfo pageInfo, Integer status);
}
