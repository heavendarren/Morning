package com.morning.test.base;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
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
	
	/*
	 * 1.@BeforeClass修饰的方法会在所有方法被调用前被执行,
	 * 而且该方法时静态的,所以当测试类被加载后直接运行它,
	 * 而且在内存中它只会存在一份实例,它比较适合加载配置文件。
	 */
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}
	
	/*
	 * 2.@AfterClass修饰的方法会在所有方法调用后被执行
	 * 通常用来对资源的清理，如关闭资源
	 * @BeforeClass @AfterClass 在各个测试方法前后各执行一次
	 */
	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}
	
	/*
	 * @Before 在每个方法运行前执行一次
	 */
	@Before
	public void setUp() throws Exception {
	}
	
	/*
	 * @After 在每个方法运行后执行一次
	 */
	@After
	public void tearDown() throws Exception {
	}
	
}
