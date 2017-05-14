package com.pussinboots.morning.administrator.test.base;

import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * 
* 项目名称：morning-administrator-service   
* 类名称：BaseTest   
* 类描述：BaseTest 测试类基类   
* 创建人：陈星星   
* 创建时间：2017年3月31日 下午4:08:36   
*
 */
@RunWith(SpringJUnit4ClassRunner.class)// 指定测试用例的运行器 这里是指定了Junit4
@ContextConfiguration(locations = {"classpath:dev/spring-mybatis.xml"})// 指定Spring的配置文件 /为classpath下
public class BaseTest {
	
	protected Logger logger = LoggerFactory.getLogger(this.getClass());

}
