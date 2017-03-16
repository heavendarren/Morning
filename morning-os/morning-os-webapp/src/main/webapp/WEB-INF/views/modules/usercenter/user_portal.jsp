<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>个人中心 - 猫宁商城</title>
<link rel="stylesheet" href="${ctxsta}/web/css/main.css">
</head>
<body>
<!-- 轮播top菜单导航引入 -->
<jsp:include page="/WEB-INF/views/modules/common/site-header.jsp" />
<!-- 轮播top菜单导航引入 --> 

<!--     导航栏 begin       -->
<div class="breadcrumbs">
    <div class="container-fluid">
        <a href="" >首页</a><span class="sep">&gt;</span><span>个人中心</span>    </div>
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
                <li><a href="">我的订单</a></li>
                <li><a href="" data-count="comment" data-count-style="bracket">评价晒单</a></li>
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
                <li><a href="http://order.mi.com/message/list?r=98069.1489505349">消息通知<i class="J_miMessageTotal"></i></a></li>
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
                <li><a href="https://account.xiaomi.com/" target="_blank">个人信息</a></li>
                <li><a href="https://account.xiaomi.com/pass/auth/security/home#service=setPassword" target="_blank">修改密码</a></li>
                <li><a href="http://uvip.xiaomi.cn" target="_blank">社区VIP认证</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="span16">
        <div class="protal-content-update hide">
          <div class="protal-username"> Hi, 那年的我们 </div>
          <p class="msg">我们做了一个小升级：你的用户名可以直接修改啦，去换个酷炫的名字吧。<a href="https://account.xiaomi.com/pass/auth/profile/home" target="_blank"> 立即前往&gt;</a></p>
        </div>
        <div class="uc-box uc-main-box">
          <div class="uc-content-box portal-content-box">
            <div class="box-bd">
              <div class="portal-main clearfix">
                <div class="user-card">
                  <h2 class="username">那年的我们</h2>
                  <p class="tip">晚上好</p>
                  <a class="link" href="https://account.xiaomi.com/pass/userInfo" target="_blank">修改个人信息 &gt;</a> <img class="avatar" src="https://s1.mi-img.com/mfsv2/avatar/fdsc3/p01Ygog76kXH/BuhtfApyLbuEcR_320.jpg" width="160" height="160" alt="那年的我们"> </div>
                <div class="user-actions">
                  <ul class="action-list">
                    <li>账户安全：<span class="level level-3">较高</span></li>
                    <li>绑定手机：<span class="tel">188********27</span></li>
                    <li>绑定邮箱：<span class="tel">81******2@q*.com</span></li>
                  </ul>
                </div>
              </div>
              <div class="portal-sub">
                <ul class="info-list clearfix">
                  <li>
                    <h3>待支付的订单：<span class="num">0</span></h3>
                    <a href="//static.mi.com/order/?type=7">查看待支付订单&nbsp;<i class="glyphicon glyphicon-chevron-right"></i></a> <img src="${ctxsta}/web/img/portal-icon-1.png" alt=""> </li>
                  <li>
                    <h3>待收货的订单：<span class="num">0</span></h3>
                    <a href="//static.mi.com/order/?type=8">查看待收货订单&nbsp;<i class="glyphicon glyphicon-chevron-right"></i></a> <img src="${ctxsta}/web/img/portal-icon-2.png" alt=""> </li>
                  <li>
                    <h3>待评价商品数：<span class="num">0</span></h3>
                    <a href="http://order.mi.com/user/comment?filter=1&amp;r=98069.1489505349">查看待评价商品&nbsp;<i class="glyphicon glyphicon-chevron-right"></i></a> <img src="${ctxsta}/web/img/portal-icon-3.png" alt=""> </li>
                  <li>
                    <h3>喜欢的商品：<span class="num">0</span></h3>
                    <a href="http://order.mi.com/user/favorite?r=98069.1489505349">查看喜欢的商品&nbsp;<i class="glyphicon glyphicon-chevron-right"></i></a> <img src="${ctxsta}/web/img/portal-icon-4.png" alt=""> </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!--     个人中心 end       -->
</body>
</html>