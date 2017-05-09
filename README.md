## 猫宁Morning公益商城系统

> 但行好事，莫问前程。（基于SSM框架的公益B2C网上商城的设计与实现）<br>



## 项目背景
据相关统计，2015年有2.7亿网友通过阿里系平台（不含支付宝）参与公益30亿次，累计产生捐赠1.9亿元。淘宝公益突破了传统的公益模式，开创了适合企业自身的公益道路，以“授人以渔”的方式将公益与自身商业模式捆绑销售，加速了“人人公益”时代的到来，让公众看到了中国公益事业的巨大改变和影响。


## 平台简介
猫宁Morning公益商城是中国公益性在线电子商城，以商城B2C模式运营的公益在线商城，是一家致力于将传统公益商城互联网化的创新公益商城。

该网上商城系统分为**电子商城系统**、**公益商城系统**、**后台管理系统**，使用Maven对项目进行模块化管理，搭建多模块企业级项目。	

Morning是在Spring Framework基础上搭建的一个Java基础开发平台，以Spring MVC为模型视图控制器，MyBatis为数据访问层，Apache Shiro为权限授权层，SLF4J+Log4j2为日志管理，Ehcahe对常用数据进行缓存，采用Dubbo分布式服务框架进行分布式系统开发。

Morning系統目前包括以下三大系统，电子商城系统、公益商城系统、后台管理系统。

 **后台管理系统（CMS）** ，包括管理员管理模块、会员管理模块、产品管理模块、交易管理模块、系统管理模块等。（已重构完毕）

 **电子商城系统（OS）** ，包括用户登录模块、商品游览模块、商品购买模块、在线评论模块、在线提问模块、个人中心模块、账户管理模块等。（在重构中）
 
 **公益商城系统（DS）** ，包括公益申请模块、积分捐赠模块、进度查看模块、在线评论模块等。（未搭建）

 
## 技术选型

1、后端

* 核心框架：Spring Framework 4.3.5
* 安全框架：Apache Shiro 1.3.2
* 视图框架：Spring MVC 4.3.5
* 任务调度：Spring + Quartz 2.2.3
* 持久层框架：MyBatis 3.4.2 + Mybatis-plus 2.0.1
* 数据库连接池：Alibaba Druid 1.0
* 缓存框架：Ehcache 2.6 + Redis 2.9.0
* 日志管理：SLF4J 1.7 + Log4j2 2.7
* 布局框架：SiteMesh 3.0.1 
* 分布式应用程序协调服务：ZooKeeper 3.3.1 
* 分布式服务框架：Dubbo 2.5.3 
* 工具类：Apache Commons、Jackson 2.2、fastjson 1.2.20

2、前端

* JS框架：Jquery
* 表格插件：Bootstrap Table
* 表单验证插件：BootstrapValidator
* 日期选择插件：Datepicker for Bootstrap
* 弹层组件：Layer
* 数据图表：Echarts
* 表单美化插件：ICheck
* 树形视图插件：Ztree
* 后台管理系统模版：H+
* 电子商城系统模版：小米官网

## 项目结构
![输入图片说明](http://git.oschina.net/uploads/images/2017/0218/001739_ad0ca473_755773.png "项目结构")
<br>


## 快速体验

> 运行项目配置说明

1.后台管理系统（CMS）项目依赖Redis和ZooKeeper服务。(Dubbo分布式服务框架进行分布式系统开发)

```
1、具备运行环境：JDK1.7+、Maven3.0+、MySql5+

2、根据 morning-common-config\src\main\resources\properties\jdbc.properties 配置数据库

3、导入数据库 project-doc\database\pussinboots_morning.sql

4、开启Redis、ZooKeeper服务，默认端口号

5、运行morning-cms-biz\src\test\java\com\pussinboots\morning\cms\test\service\DubboProvider Main方法，启动Dubbo消费提供者

6、用Tomcat等服务器运行morning-cms-webapp

7、后台管理系统（CMS），账号：admdin 密码：123456    测试地址：http://localhost:8080/system.morning/login

```

2.后台管理系统（CMS）项目不依赖ZooKeeper服务。（不使用Dubbo分布式服务框架进行分布式系统开发）

```
1、具备运行环境：JDK1.7+、Maven3.0+、MySql5+

2、根据 morning-common-config\src\main\resources\properties\jdbc.properties 配置数据库

3、导入数据库 project-doc\database\pussinboots_morning.sql

4、将morning-cms-biz依赖导入到morning-cms-webapp的pom.xml

5、删除morning-cms-webapp项目\src\main\resources\properties\spring\spring-context.xml applicationContext-dubbo-consumer.xml
文件的引入，加入applicationContext-mybatis.xml文件的引入

6、用Tomcat等服务器运行morning-cms-webapp

7、后台管理系统（CMS），账号：admdin 密码：123456    测试地址：http://localhost:8080/system.morning/login

```

3.电子商城系统（OS）项目不依赖ZooKeeper服务。（不使用Dubbo分布式服务框架进行分布式系统开发）

```
1、具备运行环境：JDK1.7+、Maven3.0+、MySql5+

2、根据 morning-common-config\src\main\resources\properties\jdbc.properties 配置数据库

3、导入数据库 project-doc\database\pussinboots_morning.sql

4、用Tomcat等服务器运行morning-os-webapps-webapp

5、电子商城系统（OS），账号：810170512@qq.com 密码：xh2013212542    测试地址：http://localhost:8080/morning/index

```

## 特别说明

1.本人是自学的Java Web，如果系统中存在严重Bug，或者存在严重缺陷的问题，希望各位多提宝贵意见，小弟不胜感激。

2.QQ：810170512  Email：<chenxingxing1994@foxmail.com>  欢迎各位大佬的指导。

3.如有不足之处，请提出，我会尽快修正。


## 特别鸣谢

1.[因酷 / inxedu](https://git.oschina.net/inxeduopen/inxedu)   因酷在线教育平台

2.[ThinkGem 王震/JeeSite](https://git.oschina.net/thinkgem/jeesite)   JeeSite 企业信息化快速开发平台

3.[青苗 / SpringWind](https://git.oschina.net/juapk/SpringWind)   spring-wind

4.[轩少 / spring-shiro-training](https://git.oschina.net/wangzhixuan/spring-shiro-training)   spring-shiro-training

5.[iBase4J / iBase4J](https://git.oschina.net/iBase4J/iBase4J)   iBase4J

## 小白求助

1.系统服务中**日志记录**怎么应用到项目中
<br>
<br>

## 开发进度
![公益B2C网上商城项目结构](http://git.oschina.net/uploads/images/2017/0217/233047_df7e1a51_755773.png "公益B2C网上商城项目结构")

### 后台管理系统（CMS）开发进度
![后台管理系统（CMS）开发进度](http://git.oschina.net/uploads/images/2017/0314/220002_dd03f603_755773.jpeg "后台管理系统（CMS）开发进度")
### 电子商城系统（OS）开发进度
![电子商城系统（OS）开发进度](http://git.oschina.net/uploads/images/2017/0314/220307_410ddbad_755773.jpeg "电子商城系统（OS）开发进度")

## 演示界面

### 后台管理系统（CMS）预览图
![后台管理系统用户登录界面](http://git.oschina.net/uploads/images/2016/1107/002717_a03a5a3c_755773.png "后台管理系统用户登录界面")

![后台管理系统角色管理界面](http://git.oschina.net/uploads/images/2017/0218/000700_6c60b895_755773.png "后台管理系统角色管理界面")

![后台管理系统菜单管理界面](http://git.oschina.net/uploads/images/2017/0218/000846_6634a71f_755773.png "后台管理系统菜单管理界面")
<br>

### 电子商城系统（OS）预览图
![电子商城首页](http://git.oschina.net/uploads/images/2017/0314/222358_602ebf8e_755773.png "电子商城首页")

![电子商城商品显示界面](http://git.oschina.net/uploads/images/2017/0314/222122_835e328a_755773.png "电子商城商品显示界面")

![电子商城商品分类界面](http://git.oschina.net/uploads/images/2017/0314/222307_4b32d6bf_755773.png "电子商城商品分类界面")

![电子商城用户找回密码](http://git.oschina.net/uploads/images/2017/0314/222516_e8710975_755773.png "电子商城用户找回密码")
<br>

### 公益商城系统（DS）预览图，未搭建

