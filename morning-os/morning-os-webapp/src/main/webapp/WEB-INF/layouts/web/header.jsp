<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
		<header id="header">
			<!-- 顶部导航开始 -->
			<div id="mian-nav">
		   	  <div class="mian-nav-content">
		        	<div class="mian-nav-row">
		            	<!-- 顶部导航栏左部开始-->
		            	<div class="mian-nav-left">
		                     <a class="mian-nav-a" href="${ctx}">猫宁商城</a><span>|</span>
		                     <a class="mian-nav-a" href="#">公益频道</a><span>|</span>
		                     <a class="mian-nav-a" href="#">益行者</a><span>|</span>
		                     <a class="mian-nav-a" href="#">猫粉社区</a><span>|</span>
		                     <a class="mian-nav-a" href="#">关于我们</a><span>|</span>
		                     <a class="mian-nav-a" href="#">问题反馈</a>
		                </div>
		                <!-- 顶部导航栏左部结束-->
		                <!-- 顶部导航栏右部开始-->
		                <div class="mian-nav-right">
		                	<div id="mian-nav-right-login">
		                    	<a class="mian-nav-a" href="${ctx}/user/userLogin">登录</a><span>|</span>
		                        <a class="mian-nav-a" href="${ctx}/user/userSignin">注册</a>
		                    </div>
		                    <div class="mian-nav-right-user">
		                        <a class="mian-nav-a" id="userName">${user.loginName}</a>
		                       	<div class="user-content">
			                       <ul class="user-content-ul">
			                              <li><a href="${ctx}/user/initUpdateUser/0" target="_blank">个人中心</a></li>
			                              <li><a href="#" target="_blank">评价晒单</a></li>
			                              <li><a href="#" target="_blank">我的足迹</a></li>
			                              <li><a href="#" target="_blank">猫宁账户</a></li>
			                              <li onclick="exit();">退出登录</li>
			                       </ul>
		                        </div>
		                    </div>
		                    <div class="mian-nav-right-order">       
		                        <a class="mian-nav-a" href="${ctx}/user/myorder/list">我的订单</a>
		                    </div>
		                    <div id="mian-nav-right-car">
		                    	<a id="cart" class="cart_link" href="#" rel="nofollow">
                                    <img src="${ctxsta}/web/images/shopping_icon.png" width="24" height="24" class="cart_gif">
                                    <span class="text">购物车</span>
                                    <s class="icon_arrow_right"></s>
                                </a>
								<div id="car-content">

		                        </div>
		                    </div>
		                </div>
		                <!-- 顶部导航栏右部结束-->
		            </div>
		      </div>
		    </div>
		    <!-- 顶部导航结束 -->	
		</header>