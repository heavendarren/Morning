package org.pussinboots.morning.product.service;

import org.pussinboots.morning.common.base.BasePageDTO;
import org.pussinboots.morning.common.support.page.PageInfo;
import org.pussinboots.morning.product.entity.Question;

import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-product-facade   
* 类名称：IQuestionService   
* 类描述：Question / 提问表 业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2017年4月25日 下午7:30:07   
*
 */
public interface IQuestionService extends IService<Question> {
	
	/**
	 * 创建商品提问
	 * @param question 提问信息
	 * @param productId 商品ID
	 * @return
	 */
	Integer insertQuestion(Question question, Long productId);
	
	/**
	 * 根据商品ID和提问状态查找提问列表
	 * @param productId 商品ID
	 * @param status 提问状态
	 * @param pageInfo 分页信息
	 * @return
	 */
	BasePageDTO<Question> listByProductId(Long productId, Integer status, PageInfo pageInfo);
	
	/**
	 * 根据提问ID更新提问点赞数
	 * @param questionId 提问ID
	 * @return
	 */
	Integer updateLike(Long questionId);
	
}
