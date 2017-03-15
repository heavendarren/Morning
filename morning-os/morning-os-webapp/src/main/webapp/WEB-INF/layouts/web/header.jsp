<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!-- 顶部页眉栏开始 -->
<!--     bar栏begin       -->

<div class="site-topbar">
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-12">
        <div class="topbar-nav">
          <c:forEach items="${indexTop }" var="indexTop"> <a href="${indexTop.href }" target="${indexTop.target }">${indexTop.name }</a><span class="sep indexTop">|</span> </c:forEach>
        </div>
        <div class="topbar-cart" id="J_miniCartTrigger"> <a class="cart-mini" id="J_miniCartBtn" href="#"><img src="" alt="">购物车<span class="cart-mini-num J_cartNum">（0）</span></a>
          <div class="cart-menu" id="J_miniCartMenu" style="display:none;">
            <div class="loading"> <span>这里神马都没有！~</span> </div>
          </div>
        </div>
        <c:if test="${not empty user.userNumber}">
        <div class="topbar-info" id="J_userInfo"><span class="user"><a rel="nofollow" class="user-name" href="" target="_blank"><span class="name">${user.userName}</span>&nbsp;&nbsp;<i class="glyphicon glyphicon-chevron-down"></i></a>
          <ul class="user-menu" style="display: none;">
            <li><a rel="nofollow" href="${ctx}/uc/user/portal" target="_blank">个人中心</a></li>
            <li><a rel="nofollow" href="//order.mi.com/user/comment" target="_blank">评价晒单</a></li>
            <li><a rel="nofollow" href="//order.mi.com/user/favorite" target="_blank">我的喜欢</a></li>
            <li><a rel="nofollow" href="http://account.xiaomi.com/" target="_blank">小米账户</a></li>
            <li><a rel="nofollow" href="${ctx }/pass/logout">退出登录</a></li>
          </ul>
          </span><span class="sep">|</span><span class="message"><a rel="nofollow" href="//order.mi.com/message/list">消息通知<i class="J_miMessageTotal"></i></a></span><span class="sep">|</span><a rel="nofollow" class="link link-order" href="//static.mi.com/order/" target="_blank">我的订单</a></div>
        </c:if>
        <c:if test="${empty user.userNumber}">
        <div class="topbar-info"> <a rel="nofollow" class="link" href="${ctx}/pass/login">登录</a><span class="sep">|</span><a rel="nofollow" class="link" href="${ctx}/pass/register">注册</a></div>
        </c:if>
      </div>
    </div>
  </div>
</div>
<!--     bar栏end       --> 

<!-- 顶部页眉栏结束 -->