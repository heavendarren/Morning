<%@ page language="java" import="java.util.*"  contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <title>成功加入购物车 | Morning 猫宁</title>
    <link rel="stylesheet" href="${ctxsta}/web/css/commodity-shopping.css" />
  </head>
 <body>
 	<!-- 目录导航栏引入 -->
	<jsp:include page="/WEB-INF/views/web/common/topnav.jsp" />
	<!-- 目录导航栏引入 -->
        <!-- 产品订单信息栏开始 -->
        <div id="order">
        	<div id="order-content">
            	<div id="order-content-left">
                	<img src="commodity/${orderMessage.goods.goodsImagename}.jpg"/>
                    <div id="order-content-left-title">
                        <a id="name">${orderMessage.goods.goodsName}&nbsp;&nbsp;${orderMessage.goodsColor}&nbsp;&nbsp;
                        ${orderMessage.goodsStandard}&nbsp;&nbsp;&nbsp;${orderMessage.goods.goodsPrice}元 x${orderMessage.orderNumber}</a><br/>
                        <span id="message">已成功加入购物车！</span>
                    </div>
                </div>
                <div id="order-content-right">
                	<div id="shopping" onclick="location.href='${ctx}';">
                    	<a >继续购物</a>
                    </div>
                    <div id="buy" onclick="location.href='${ctx}/cart';">
                    	<a >去购物车结算</a>
                    </div>
                	
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <!-- 产品订单信息栏结束 -->
        <!--主要展示栏（一）开始-->
    	<div id="content-star-goods">
    	<div id="star-goods-content">
        	<div id="star-goods-content-title">
            	<span class="title_span">为你推荐</span>
                <div id="star-goods-content-change">
               		<span id="star-goods-content-prave"><</span>
                	<span id="star-goods-content-next">></span>
                </div>
            </div>
            <div id="star-goods-content-goods">
            	 <ul>
            	 <c:forEach items="${goodsFormByRandom}" var="goodsFormByRandom">
                     <li onclick="location.href='${ctx}/front/detail/${goodsFormByRandom.goodsId}';">
                         <a><img src="${ctx}/commodity/${goodsFormByRandom.goodsImagename}.jpg"/></a>
                         <a>${goodsFormByRandom.goodsName}</a>
                         <a>${goodsFormByRandom.goodsDescript}</a>
                         <a>${goodsFormByRandom.goodsPrice}</a>
                     </li>
            	 </c:forEach>
             	 </ul>
            </div>
        </div>
    	</div>
   		<!--主要展示栏（一）结束-->
   		<myfooter>
   		<script src="${ctxsta}/web/js/commodity.shopping.js"></script>
   		</myfooter>
</body>
</html>
