package org.pussinboots.morning.product.service;

import org.pussinboots.morning.common.base.BasePageDTO;
import org.pussinboots.morning.common.support.page.PageInfo;
import org.pussinboots.morning.product.entity.Comment;
import org.pussinboots.morning.product.pojo.vo.CommentVO;

import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-product-facade   
* 类名称：ICommentService   
* 类描述：Comment / 评价表 业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2017年4月11日 下午3:12:11   
*
 */
public interface ICommentService extends IService<Comment> {
	
	/**
	 * 根据商品ID和评论类型查找评论列表
	 * @param productId 商品ID
	 * @param status 评论状态
	 * @param pageInfo 分页信息
	 * @return
	 */
	BasePageDTO<CommentVO> listByProductId(Long productId, Integer status, PageInfo pageInfo);
	
	/**
	 * 根据评价ID更新提问点赞数
	 * @param commentId 评价ID
	 * @return
	 */
	Integer updateLike(Long commentId);
	
}
