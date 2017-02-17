package com.pussinboots.morning.cms.test.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * 
* 项目名称：morning-cms-biz   
* 类名称：SpringBaseTest   
* 类描述：morning-cms-biz 项目启动测试类   
* 创建人：陈星星   
* 创建时间：2017年2月3日 下午9:26:39
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring/spring-context.xml" })
public class SpringBase extends AbstractJUnit4SpringContextTests{
	
    @Test
    public void startup() {

    }
}