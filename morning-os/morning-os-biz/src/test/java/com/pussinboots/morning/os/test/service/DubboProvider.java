/*
 * Copyright 1999-2011 Alibaba Group.
 *  
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *  
 *      http://www.apache.org/licenses/LICENSE-2.0
 *  
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.pussinboots.morning.os.test.service;

/**
 * 
* 项目名称：morning-cms-biz   
* 类名称：DubboProvider   
* 类描述：DubboProvider 启动类:直接调用dubbo的main方法
* 		可以从日志发现它需要对配置文件的路径有要求
* 		Resolved location pattern [classpath*:META-INF/spring/*.xml] to resources []
* 创建人：陈星星   
* 创建时间：2017年2月3日 下午9:15:09
 */
public class DubboProvider {

	public static void main(String[] args) {
        com.alibaba.dubbo.container.Main.main(args);
	}

}

