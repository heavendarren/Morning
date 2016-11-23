package com.morning.test.base;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：BaseTest   
* 类描述：Spring集成测试基类   
* 创建人：陈星星   
* 创建时间：2016年11月9日 上午12:46:03   
* 修改人：陈星星   
* 修改时间：2016年11月9日 上午12:46:03   
* @version
 */

@RunWith(SpringJUnit4ClassRunner.class) //指定测试用例的运行器 这里是指定了Junit4  
@ContextConfiguration(locations = {  //指定Spring的配置文件 /为classpath下 
		"classpath:spring/spring-context.xml",
		"classpath:spring/spring-context-mybatis.xml"
})
public class BaseTest {
	
}
