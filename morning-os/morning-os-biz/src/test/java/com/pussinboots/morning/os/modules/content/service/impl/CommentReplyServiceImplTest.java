package com.pussinboots.morning.os.modules.content.service.impl;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.pussinboots.morning.os.modules.content.entity.CommentReply;
import com.pussinboots.morning.os.modules.content.service.ICommentReplyService;
import com.pussinboots.morning.os.test.base.BaseTest;

public class CommentReplyServiceImplTest extends BaseTest {
	
	@Autowired
	private ICommentReplyService commentReplyService;

	@Test
	public void test() {
		CommentReply commentReply = new CommentReply();
		commentReply.setCommentId(1L);
		commentReplyService.selectList(new EntityWrapper<CommentReply>(commentReply).orderBy("type", false).orderBy("commentReplyId", false));
	}

}
