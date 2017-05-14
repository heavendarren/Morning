package org.pussinboots.morning.product.service;

import org.pussinboots.morning.product.entity.CommentReply;
import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-product-facade   
* 类名称：ICommentReplyService   
* 类描述：CommentReply / 评论回复表 业务逻辑层接口         
* 创建人：陈星星   
* 创建时间：2017年5月9日 下午12:49:26   
*
 */
public interface ICommentReplyService extends IService<CommentReply> {
	
	/**
	 * 根据评价回复ID更新评价回复点赞数
	 * @param commentId 评价ID
	 * @return
	 */
	Integer updateLike(Long commentReplyId);
	
}
