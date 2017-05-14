<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>
<sitemesh:write property='title' /> - 但行好事，莫问前程</title>
<meta name="author" content="猫宁Morning. - 但行好事，莫问前程。" />
<meta name="keywords" content="猫宁商城,猫宁Morning,猫宁公益商城,公益,电子商城,猫宁社区,公益商城,在线购物,社会责任">
<meta name="description" content="猫宁Morning公益商城是中国公益性在线电子商城，以商城B2C模式运营的公益在线商城，是一家致力于将传统公益商城互联网化的创新公益商城。">
<link rel="shortcut icon" href="${ctximg}/default/ico/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="${ctxsta}/common/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ctxsta}/os/css/base.css">
<link rel="stylesheet" href="${ctxsta}/os/css/main.css">
<script> var t1 = new Date().getTime(); baselocation='${ctx}';</script>
<sitemesh:write property='head' />
</head>
<body>
<jsp:include page="/WEB-INF/layouts/web/header.jsp" />

<!-- 轮播top菜单导航引入 -->
<jsp:include page="/WEB-INF/views/modules/common/site_header.jsp" />
<!-- 轮播top菜单导航引入 --> 

<!--     导航栏 begin       -->
<div class="breadcrumbs">
  <div class="container-fluid"> <a href="${ctx}/index">首页</a><span class="sep">&gt;</span><span class="title"></span> </div>
</div>
<!--     导航栏 begin       --> 

<!--     个人中心 begin       -->
<div class="page-main user-main">
  <div class="container-fluid">
    <div class="row">
      <div class="span4">
        <div class="uc-box uc-sub-box">
          <div class="uc-nav-box">
            <div class="box-hd">
              <h3 class="title">订单中心</h3>
            </div>
            <div class="box-bd">
              <ul class="uc-nav-list">
                <li><a href="${ctx}/uc/order/list">我的订单</a></li>
                <li><a href="${ctx}/uc/order/comment" data-count="comment" data-count-style="bracket">评价晒单</a></li>
              </ul>
            </div>
          </div>
          <div class="uc-nav-box">
            <div class="box-hd">
              <h3 class="title">个人中心</h3>
            </div>
            <div class="box-bd">
              <ul class="uc-nav-list">
                <li><a href="${ctx}/uc/user/portal">我的个人中心</a></li>
                <li><a href="">消息通知<i class="J_miMessageTotal"></i></a></li>
                <li><a href="${ctx}/uc/user/favorite">喜欢的商品</a></li>
                <li><a href="${ctx}/uc/user/address">收货地址</a></li>
              </ul>
            </div>
          </div>
          <div class="uc-nav-box">
            <div class="box-hd">
              <h3 class="title">账户管理</h3>
            </div>
            <div class="box-bd">
              <ul class="uc-nav-list">
                <li><a href="" target="_blank">个人信息</a></li>
                <li><a href="" target="_blank">修改密码</a></li>
                <li><a href="" target="_blank">社区VIP认证</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <sitemesh:write property='body' />
    </div>
  </div>
</div>
<!--     个人中心 end       -->

<jsp:include page="/WEB-INF/layouts/web/footer.jsp" />

<!-- 全局js --> 
<script src="${ctxsta}/common/jquery/jquery-3.2.0.min.js"></script> 
<script src="${ctxsta}/common/bootstrap/js/bootstrap.min.js"></script> 
<!-- 自定义js --> 
<script src="${ctxsta}/os/js/zySearch.js"></script> 
<script src="${ctxsta}/os/js/jump.js"></script> 
<script src="${ctxsta}/os/js/base.js"></script> 
<script src="${ctxsta}/os/js/main.js"></script> 
<!-- 第三方插件 -->
<sitemesh:write property='myfooter' />
</body>
</html>