<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>个人中心 - 猫宁商城</title>
</head>
<body>
<div class="span16">
  <div class="protal-content-update hide">
    <div class="protal-username"> Hi, 那年的我们 </div>
    <p class="msg">我们做了一个小升级：你的用户名可以直接修改啦，去换个酷炫的名字吧。<a href="" target="_blank"> 立即前往&gt;</a></p>
  </div>
  <div class="uc-box uc-main-box">
    <div class="uc-content-box portal-content-box">
      <div class="box-bd">
        <div class="portal-main clearfix">
          <div class="user-card">
            <h2 class="username">${userVO.userName}</h2>
            <p class="tip">晚上好</p>
            <a class="link" href="" target="_blank">修改个人信息 &gt;</a> <img class="avatar" src="${ctximg}/${userVO.picImg}" width="160" height="160" alt="${userVO.userName}"> </div>
          <div class="user-actions">
            <ul class="action-list">
              <li>账户安全：<span class="level level-3">较高</span></li>
              <li>绑定手机：<span class="tel">${userVO.telephone}</span></li>
              <li>绑定邮箱：<span class="tel">${userVO.email}</span></li>
            </ul>
          </div>
        </div>
        <div class="portal-sub">
          <ul class="info-list clearfix">
            <li>
              <h3>待支付的订单：<span class="num">0</span></h3>
              <a href="${ctx}/uc/order/list?type=1">查看待支付订单&nbsp;<i class="glyphicon glyphicon-chevron-right"></i></a> <img src="${ctxsta}/os/images/portal-icon-1.png" alt=""> </li>
            <li>
              <h3>待收货的订单：<span class="num">0</span></h3>
              <a href="${ctx}/uc/order/list?type=2">查看待收货订单&nbsp;<i class="glyphicon glyphicon-chevron-right"></i></a> <img src="${ctxsta}/os/images/portal-icon-2.png" alt=""> </li>
            <li>
              <h3>待评价商品数：<span class="num">0</span></h3>
              <a href="">查看待评价商品&nbsp;<i class="glyphicon glyphicon-chevron-right"></i></a> <img src="${ctxsta}/os/images/portal-icon-3.png" alt=""> </li>
            <li>
              <h3>喜欢的商品：<span class="num">0</span></h3>
              <a href="${ctx}/uc/user/favorite">查看喜欢的商品&nbsp;<i class="glyphicon glyphicon-chevron-right"></i></a> <img src="${ctxsta}/os/images/portal-icon-4.png" alt=""> </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>