# 猫宁Morning公益商城系统

## 平台简介

猫宁Morning公益商城是中国公益性在线电子商城，以商城B2C模式运营的公益在线商城，是一家致力于将传统公益商城互联网化的创新公益商城。

系统分为前台和后台,前台主要功能包括注册和登录、商品浏览、个人信息管理、购物车、我的订单、网上支付、评价、提问、公益活动、公益论坛、商城论坛等系统，后台主要功能包括管理成员信息管理、用户信息管理、商品管理、公益活动管理、商品分类管理、订单管理、公告资讯管理、论坛平台管理、商品提上管理、商品评价管理等。 

Morning是在Spring Framework基础上搭建的一个Java基础开发平台，以Spring MVC为模型视图控制器，MyBatis为数据访问层，
Apache Shiro为权限授权层，Ehcahe对常用数据进行缓存，SLF4J 1+Log4j2为日志管理。

Morning系統目前包括以下四大模块，系统管理模块、电子商城模块、在线社区模块（未搭建）、公益商城模块（未搭建）。
 **系统管理模块** ，包括管理员管理、会员管理、产品管理、交易管理、邮件管理、系统信息、系统管理等。
 **电子商城模块** ，包括用户登录、商品游览、商品购买、在线评论、在线提问、账户管理、订单中心、个人中心等。
 **在线社区模块** ，包括文章列表、游览文章、发表评论、问答列表等。
 **公益商城模块** ，包括公益捐赠、进度查询、发布公益项目等。

## 内置功能

1.	用户管理：用户是系统操作者，该功能主要完成系统用户配置。
2.	机构管理：配置系统组织机构（公司、部门、小组），树结构展现，可随意调整上下级。
3.	区域管理：系统城市区域模型，如：国家、省市、地市、区县的维护。
4.	菜单管理：配置系统菜单，操作权限，按钮权限标识等。
5.	角色管理：角色菜单权限分配、设置角色按机构进行数据范围权限划分。
6.	字典管理：对系统中经常使用的一些较为固定的数据进行维护，如：是否、男女、类别、级别等。
7.	操作日志：系统正常操作日志记录和查询；系统异常信息日志记录和查询。
8.	连接池监视：监视当期系统数据库连接池状态，可进行分析SQL找出系统性能瓶颈。
9.	工作流引擎：实现业务工单流转、在线流程设计器。

## 为何选择JeeSite

1. 使用 [Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0) 协议，源代码完全开源，无商业限制。
2. 使用目前主流的Java EE开发框架，简单易学，学习成本低。
3. 数据库无限制，目前支持MySql、Oracle，可扩充SQL Server、PostgreSQL、H2等。
4. 模块化设计，层次结构清晰。内置一系列企业信息管理的基础功能。
5. 操作权限控制精密细致，对所有管理链接都进行权限验证，可控制到按钮。
6. 数据权限控制精密细致，对指定数据集权限进行过滤，七种数据权限可供选择。
7. 提供在线功能代码生成工具，提高开发效率及质量。
8. 提供常用工具类封装，日志、缓存、验证、字典、组织机构等，常用标签（taglib），获取当前组织机构、字典等数据。
9. 兼容目前最流行浏览器（IE7+、Chrome、Firefox）IE6也支持，但体验效果差。

## 技术选型

1、后端

* 核心框架：Spring Framework 4.3.3
* 安全框架：Apache Shiro 1.2
* 视图框架：Spring MVC 4.1
* 布局框架：SiteMesh 2.4
* 工作流引擎：Activiti 5.21
* 任务调度：Spring + Quartz 2.2.3
* 持久层框架：MyBatis 3.4.1
* 数据库连接池：Alibaba Druid 1.0
* 缓存框架：Ehcache 2.6
* 日志管理：SLF4J 1.7、Log4j2 2.7
* 布局框架：SiteMesh 3.0.1 
* 工具类：Apache Commons、Jackson 2.2、Xstream 1.4、Dozer 5.3、POI 3.9


2、前端

* JS框架：jquery-2.2.3
* 表格插件：Bootstrap Table
* 表单验证插件：bootstrapValidator
* 日期选择插件：Datepicker for Bootstrap
* 弹层组件：layer2.4
* 数据图表：echarts
* 表单美化插件：iCheck

4、平台

* 服务器中间件：在Java EE 5规范（Servlet 2.5、JSP 2.1）下开发，支持应用服务器中间件
有Tomcat 6+、Jboss 7+、WebLogic 10+、WebSphere 8+。
* 数据库支持：目前仅提供MySql和Oracle数据库的支持，但不限于数据库，平台留有其它数据库支持接口，
你可以很方便的更改为其它数据库，如：SqlServer 2008、MySql 5.5、H2等
* 开发环境：Java、Eclipse Java EE 4.3、Maven 3.1、Git

## 安全考虑

1. 开发语言：系统采用Java 语言开发，具有卓越的通用性、高效性、平台移植性和安全性。
2. 分层设计：（数据库层，数据访问层，业务逻辑层，展示层）层次清楚，低耦合，各层必须通过接口才能接入并进行参数校验（如：在展示层不可直接操作数据库），保证数据操作的安全。
3. 双重验证：用户表单提交双验证：包括服务器端验证及客户端验证，防止用户通过浏览器恶意修改（如不可写文本域、隐藏变量篡改、上传非法文件等），跳过客户端验证操作数据库。
4. 安全编码：用户表单提交所有数据，在服务器端都进行安全编码，防止用户提交非法脚本及SQL注入获取敏感数据等，确保数据安全。
5. 密码加密：登录用户密码进行SHA1散列加密，此加密方法是不可逆的。保证密文泄露后的安全问题。
6. 强制访问：系统对所有管理端链接都进行用户身份权限验证，防止用户直接填写url进行访问。

## 演示地址

* <http://demo.jeesite.com/jeesite>  &nbsp; 用户名：thinkgem &nbsp; 密码：admin

## 快速体验

1. 具备运行环境：JDK1.6+、Maven3.0+、MySql5+或Oracle10g+。
2. 修改src\main\resources\jeesite.properties文件中的数据库设置参数。
3. 根据修改参数创建对应MySql或Oracle数据库用户和参数。
4. 运行bin\init-db.bat脚本，即可导入表结构及演示数据(linux操作系统：在控制台中切换至项目根目录，运行命令：mvn antrun:run -Pinit-db)
5. 运行bin\run-tomcat7.bat或bin\run-jetty.bat，启动Web服务器（第一次运行，需要下载依赖jar包，请耐心等待）。
6. 最高管理员账号，用户名：thinkgem 密码：admin

## 常见问题

1. 用一段时间提示内存溢出，请修改JVM参数：-Xmx512m -XX:MaxPermSize=256m
2. 有时出现文字乱码：修改Tomcat的server.xml文件的Connector项，增加URIEncoding="UTF-8"
3. 为什么新建菜单后看不到新建的菜单？因为授权问题，菜单管理只允许最高管理员账号管理（最高管理员默认账号：thinkgem 密码：admin）。

## 更多文档

* <https://github.com/thinkgem/jeesite/tree/master/doc>

## 如何交流、反馈、参与贡献？

* QQ Group：127515876 &nbsp; 209330483 &nbsp; 223507718 &nbsp; 苹果版QQ若不能加入请使用手机QQ最新版
* E-mail：thinkgem@163.com
* GitHub：<https://github.com/thinkgem/jeesite>
* 开源中国：<http://git.oschina.net/thinkgem/jeesite>
* 官方网址：<http://jeesite.com>  论坛：<http://bbs.jeesite.com>
* 支持JeeSite发展：（加我好友）支付宝：thinkgem@163.com &nbsp; 微信：thinkgem

一个人的个人能力再强，也无法战胜一个团队，希望兄弟姐妹的支持，能够贡献出自己的部分代码，参与进来共同完善它(^_^)。

怎么共享我的代码：[手把手教你如何加入到github的开源世界！](http://www.cnblogs.com/wenber/p/3630921.html)

## 版权声明

本软件使用 [Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0) 协议，请严格遵照协议内容：

1. 需要给代码的用户一份Apache Licence。
2. 如果你修改了代码，需要在被修改的文件中说明。
3. **在延伸的代码中（修改和有源代码衍生的代码中）需要带有原来代码中的协议，商标，专利声明和其他原来作者规定需要包含的说明。**
4. 如果再发布的产品中包含一个Notice文件，则在Notice文件中需要带有Apache Licence。你可以在Notice中增加自己的许可，但不可以表现为对Apache Licence构成更改。
5. Apache Licence也是对商业应用友好的许可。使用者也可以在需要的时候修改代码来满足需要并作为开源或商业产品发布/销售
6. 你可以二次包装出售，**但还请保留文件中的版权和作者信息**，并在你的产品说明中注明JeeSite。
7. 你可以以任何方式获得，你可以修改包名或类名，**但还请保留文件中的版权和作者信息**。

##为何使用MyBatis

* 学习成本：Hibernate的真正掌握要比Mybatis来得难不少。Mybatis框架相对简单很容易上手，也更加灵活。
对于学习过Hibernate的用户，学习起MyBatis也更容易上手。

* 开发成本：大家都说Hibernate开发效率高，个人认为MyBatis的开发效率并不比Hibernate低，
通过代码生成器和封装开发效率不是问题，并且MyBatis可控性比较高，并更易于维护。

* 性能方面：由于Hibernate比较难以掌握，性能方面也成为了Hibernate的问题瓶颈，当然如果你对Hibernate非常熟，
Hibernate性能上定不是问题。但对于大多数情况下，真正掌握Hibernate的人少之又少，然而的也就造就了项目风险加大。

* 多数据库支持：有些人说MyBatis对多数据库支持困难，我认为这个不是问题，虽说目前JeeSite仅提供对MySql或Oracle
数据库的支持，但对于支持其它数据库的改动也不是很麻烦，SQL是被专门写在XML中，对于大多数SQL来说都是通用的，
对于不同的数据库可通过dbName区分和修改各别的SQL片段即可。