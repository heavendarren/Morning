package com.pussinboots.morning.os.modules.content.service.impl;

import com.pussinboots.morning.os.modules.content.entity.CommentReply;
import com.pussinboots.morning.os.modules.content.mapper.CommentReplyMapper;
import com.pussinboots.morning.os.modules.content.service.ICommentReplyService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：CommentReplyServiceImpl   
* 类描述：CommentReply表 / 评论回复表 业务逻辑层接口实现      
* 创建人：陈星星   
* 创建时间：2017年3月4日 下午3:13:57   
*
 */
@Service
public class CommentReplyServiceImpl extends ServiceImpl<CommentReplyMapper, CommentReply> implements ICommentReplyService {
	
}
