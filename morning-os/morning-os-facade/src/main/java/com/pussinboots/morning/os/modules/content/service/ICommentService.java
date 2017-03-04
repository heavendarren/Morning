package com.pussinboots.morning.os.modules.content.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.pussinboots.morning.common.model.PageInfo;
import com.pussinboots.morning.os.modules.content.entity.Comment;
import com.pussinboots.morning.os.modules.content.vo.CommentVO;

/**
 * 
* 项目名称：morning-os-facade   
* 类名称：ICommentService   
* 类描述：Comment表 / 评价表 业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2017年2月28日 上午1:09:09   
*
 */
public interface ICommentService extends IService<Comment> {
	
	/**
	 * 根据商品ID和评论类型查找最新评论列表
	 * @param productId 商品ID
	 * @param type 评论类型
	 * @param type 评论状态
	 * @param pageInfo 分页条件
	 * @return List<Comment> 
	 */
	List<Comment> selectNewComments(Long productId, Integer type, Integer status, PageInfo pageInfo);
	
	/**
	 * 根据商品ID和评论类型查找有帮助评论列表
	 * @param productId 商品ID
	 * @param type 评论类型
	 * @param type 评论状态
	 * @param pageInfo 分页条件
	 * @return List<Comment> 
	 */
	List<CommentVO> selectHighComments(Long productId, Integer type, Integer status, PageInfo pageInfo);

}
