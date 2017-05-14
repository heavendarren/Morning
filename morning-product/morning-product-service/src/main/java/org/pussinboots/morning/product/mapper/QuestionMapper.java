package org.pussinboots.morning.product.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.pussinboots.morning.common.support.page.PageInfo;
import org.pussinboots.morning.product.entity.Question;

import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * 
* 项目名称：morning-product-service   
* 类名称：QuestionMapper   
* 类描述：Question / 提问表 数据访问层接口   
* 创建人：陈星星   
* 创建时间：2017年4月25日 下午7:30:56   
*
 */
public interface QuestionMapper extends BaseMapper<Question> {
	
	/**
	 * 根据商品ID和提问状态查找提问列表
	 * @param productId 商品ID
	 * @param status 提问状态
	 * @param pageInfo 分页信息
	 * @param rowBounds 分页实体类
	 * @return
	 */
	List<Question> listByProductId(@Param("productId") Long productId, @Param("status") Integer status,
			@Param("pageInfo") PageInfo pageInfo, RowBounds rowBounds);
	
	/**
	 * 根据提问ID更新提问点赞数
	 * @param questionId 提问ID
	 * @return
	 */
	Integer updateLike(Long questionId);

}