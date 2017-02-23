package com.pussinboots.morning.cms.test.base;

import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * 
* 项目名称：morning-cms-biz   
* 类名称：BaseTest   
* 类描述：Spring集成测试基类      
* 创建人：陈星星   
* 创建时间：2017年1月31日 下午9:03:15
 */
@RunWith(SpringJUnit4ClassRunner.class)// 指定测试用例的运行器 这里是指定了Junit4
@ContextConfiguration(locations = {"classpath:dev/applicationContext-mybatis.xml"})// 指定Spring的配置文件 /为classpath下
public class BaseTest {
	
	protected Logger logger = LoggerFactory.getLogger(this.getClass());

}
