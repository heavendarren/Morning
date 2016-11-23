<%@ page language="java" import="java.util.*"  contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <title>订单中心- 猫宁Morning</title>
	<link rel="stylesheet" href="${ctxsta}/web/css/user-order.css" />
  </head>
  <body>
        <!-- 右侧，开始 -->
        <article class="uArtucle">              
            <div class="u-r-cont">
                <section>
                	<h1 class="title">
                    	我的订单
                        <small>
                        	请谨防钓鱼链接或诈骗电话!
                        </small>
                    </h1>
                    <div>
                        <section class="c-infor-tabTitle c-tab-title c-tab-title-order">
                            <a href="javascript: void(0)" title="全部有效订单" onclick="orderOptions('',this,null)" class="clickAvailable current">全部有效订单</a>
                            <a href="javascript: void(0)" title="待支付" onclick="orderOptions(1,this,null)" >待支付</a>
                            <a href="javascript: void(0)" title="待支付" onclick="orderOptions(2,this,null)" >待发货</a>
                            <a href="javascript: void(0)" title="待收货" onclick="orderOptions(3,this,null)" >待收货</a>
                        </section>
                        <div class="c-tab-title">
                            <aside class="h-r-search">
                                    <label class="h-r-s-box">
                                    	<input type="text" placeholder="输入商品名称、商品编号、订单号" name="order.search">
                                        <button onclick="orderOptions('',this,null)" class="s-btn">
                                            <em class="icon18">&nbsp;</em>
                                        </button>
                                    </label>
                            </aside>
                        </div>
						<div class="clear"></div>
                    </div>
                    <div  id="p_tCont">
                    	<div class="u-account-box">
                        	<ul class="order-list" id="orderOptions">

                            </ul>
                        </div>
                   </div>
                </section>
            </div>
        </article>
        <!-- 右侧，结束 -->
        <myfooter>  
        <script src="${ctxsta}/common/layer/layer.js"></script>
		<script>$(function() {$(".clickAvailable").click();});</script>
		</myfooter>  
  </body>
</html>
