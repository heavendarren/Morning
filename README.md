##  猫宁Morning公益商城系统

------------------------------------------------

> 但行好事，莫问前程。

------------------------------------------------
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

 **系统管理模块**
1.	管理员管理：管理员列表、个人信息、角色管理（未搭建）。
2.	会员管理：会员列表、等级管理（未搭建）、会员记录管理（未搭建）。
3.      产品管理：产品列表（搭建ing）、分类管理、问答管理（未搭建）。

 **电子商城模块**
1.	已完成：用户登录、商品游览、商品购买、账户管理。
2.	搭建中：商品交易、订单中心。
3.	未搭建：在线评论、在线提问、个人中心。

 **在线社区模块** 
1.	未搭建

 **公益商城模块** 
1.	未搭建

 **日志管理模块** 
1.	搭建中


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
* 工具类：Apache Commons、Jackson 2.2

2、前端

* JS框架：jquery-2.2.3
* 表格插件：Bootstrap Table
* 表单验证插件：bootstrapValidator
* 日期选择插件：Datepicker for Bootstrap
* 弹层组件：layer2.4
* 数据图表：echarts
* 表单美化插件：iCheck

## 快速体验


> 运行项目配置说明

```
1、具备运行环境：JDK1.6+、Maven3.0+、MySql5+

2、根据 src\main\resources\properties\jdbc.properties 配置数据库

3、导入数据库 doc\database\db_morning.sql，数据库已更新。

4、根据 doc\lombok\lombok安装.txt 提示安装lombok插件

5、前台用户账号，账号：810170512@qq.com  密码：xh2013212542    测试地址：http://localhost:8080/morning/index
   后台管理员账号，账号：admdin 密码：xh2013212542    测试地址：http://localhost:8080/morning/system

```

## 特别说明

1.本人是自学的Java Web，如果系统中存在严重Bug，或者存在严重缺陷的问题，希望各位多提宝贵意见，小弟不胜感激。

2.QQ：810170512  Email：<chenxingxing1994@foxmail.com>  欢迎各位大佬的指导。

3.虚心接受指导，杜绝肆意谩骂。

4.之前由于数据库文件、JDK版本问题而导致无法运行的情况，浪费了各位的时间，深感抱歉。

5.目前只接触过Myeclipse，对于intellij idea没有测试过，问题：intellij idea启动起来后css没有正常加载。


## 特别鸣谢

1.[因酷 / inxedu](https://git.oschina.net/inxeduopen/inxedu)   因酷在线教育平台

2.[ThinkGem 王震/JeeSite](https://git.oschina.net/thinkgem/jeesite)   JeeSite 企业信息化快速开发平台

3.[青苗 / SpringWind](https://git.oschina.net/juapk/SpringWind)   spring-wind

4.[轩少 / spring-shiro-training](https://git.oschina.net/wangzhixuan/spring-shiro-training)   spring-shiro-training

## 小白求助

1.系统服务中日志记录怎么应用到项目中

2.系统服务异常处理在项目中的具体应用

## 演示界面

![输入图片说明](http://git.oschina.net/uploads/images/2016/1107/001913_2396bb4f_755773.png "前台登陆界面")
![输入图片说明](http://git.oschina.net/uploads/images/2016/1107/002154_c7600f3c_755773.png "前台首页")
![输入图片说明](http://git.oschina.net/uploads/images/2016/1107/002342_d58db7c0_755773.png "商品显示界面")
![输入图片说明](http://git.oschina.net/uploads/images/2016/1107/002717_a03a5a3c_755773.png "后台登录界面")
![输入图片说明](http://git.oschina.net/uploads/images/2016/1107/003030_9d1c798f_755773.png "后台主界面")