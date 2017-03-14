package com.pussinboots.morning.os.modules.content.mapper;

import com.pussinboots.morning.common.model.PageInfo;
import com.pussinboots.morning.os.modules.content.entity.Question;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：QuestionMapper   
* 类描述：Question表 / 提问表 数据访问层接口      
* 创建人：陈星星   
* 创建时间：2017年3月4日 下午3:13:10   
*
 */
public interface QuestionMapper extends BaseMapper<Question> {
	
	/**
	 * 
	 * 根据商品ID、排序、分页查找提问列表
	 * @param productId 商品ID
	 * @param pageInfo 排序方式
	 * @param status 评提问状态
	 * @param rowBounds 分页实体类
	 * @return
	 */
	List<Question> selectQuestionsByPage(@Param("productId") Long productId, @Param("pageInfo") PageInfo pageInfo,
			@Param("status") Integer status, RowBounds rowBounds);

}