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
        <div class="topbar-cart" id="J_miniCartTrigger"> <a class="cart-mini" id="J_miniCartBtn" href="#"><img src="${ctxsta}/web/img/gouwuce.png" alt="">购物车<span class="cart-mini-num J_cartNum">（0）</span></a>
          <div class="cart-menu" id="J_miniCartMenu" style="display:none;">
            <div class="loading"> <span>这里神马都没有！~</span> </div>
          </div>
        </div>
        <div class="topbar-info"> <a class="link" data-toggle="modal" data-target="#myModal" href="#">登录</a><span class="sep">|</span> <a class="link" data-toggle="modal" data-target="#myModal2" href="#">注册</a> </div>
      </div>
    </div>
  </div>
</div>
<!--     bar栏end       --> 

<!--     主导航begin       -->
<div class="mainbav">
  <div class="LOGO"> <img src="${ctxsta}/web/img/logo.png"><img src="${ctxsta}/web/img/donghua.gif"> </div>
  <ul>
    <li><a href="#">小米盒子</a></li>
    <li><a href="#">红米</a></li>
    <li><a href="#">平板</a></li>
    <li><a href="#">电视</a></li>
    <li><a href="#">盒子</a></li>
    <li><a href="#">路由器</a></li>
    <li><a href="#">智能硬件</a></li>
    <li><a href="#">服务</a></li>
    <li><a href="#">社区</a></li>
  </ul>
  <div class="search">
    <div class="search_box"> <img src=""> </div>
    <span>平衡车</span> <span>小米手机4c</span> </div>
  <div class="clearfix"> </div>
</div>
<!--     主导航end       --> 
<!-- 顶部页眉栏结束 -->