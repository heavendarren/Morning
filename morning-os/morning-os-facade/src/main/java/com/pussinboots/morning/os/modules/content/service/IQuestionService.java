package com.pussinboots.morning.os.modules.content.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.pussinboots.morning.common.model.PageInfo;
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
	
}
