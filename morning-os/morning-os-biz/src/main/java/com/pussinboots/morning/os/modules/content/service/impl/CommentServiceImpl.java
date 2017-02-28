package com.pussinboots.morning.os.modules.content.service.impl;

import com.pussinboots.morning.os.modules.content.entity.Comment;
import com.pussinboots.morning.os.modules.content.mapper.CommentMapper;
import com.pussinboots.morning.os.modules.content.service.ICommentService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：CommentServiceImpl   
* 类描述：Comment表 / 评价表 业务逻辑层接口实现   
* 创建人：陈星星   
* 创建时间：2017年2月28日 上午1:10:41   
*
 */
@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements ICommentService {
	
}
