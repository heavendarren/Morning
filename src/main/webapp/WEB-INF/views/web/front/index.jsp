<%@ page language="java" import="java.util.*"  contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <title>首页 - 猫宁Morning</title>
	<link rel="stylesheet" href="${ctxsta}/web/css/index.css" />
  </head>
 <body>
	<!-- 目录导航栏开始 -->
	<div id="header">
   	  <div id="header-content">
          <div id="header-content-logo">
            	<img src="images/logo3.png" class="indexlogo" />
          </div>
          <div id="header-content-nav">
            <ul>
            <c:forEach items="${classifyList}" var="classifyList" begin="0" end="4"><li class="menu_li">
            	<span>|</span><a href="javascript: void(0)" onclick="submitForm(1,${classifyList.classifyId})">${classifyList.classifyName}</a>
            </li></c:forEach>
            </ul>
          </div>
          <div id="header-content-search">
               <span class="zySearch" id="zySearch"></span>
          </div>
       </div>
    </div>
    <!-- 目录导航栏结束 -->
    <!-- 导航及轮播图开始 -->
	<div id="content">
		<div class="position">
            <ul id="content_menu_wrap">
            <c:forEach items="${classifyList}" var="classifyList">
                <li class="active">
                     <div class="item" onclick="submitForm(1,${classifyList.classifyId})" ><a >${classifyList.classifyName}</a><a class="sign">&gt;</a></div>
                     <c:choose>
                     <c:when test="${fn:length(classifyList.goodsList)>6}">
                     <div class="content_menu_content" style="width:600px;">
                        <ul class="content_menu_content_ul">
                        <c:forEach items="${classifyList.goodsList}" var="goodsList" begin="0" end="5">
                            <li><a href="${ctx}/front/detail/${goodsList.goodsId}"><img src="commodity/${goodsList.goodsImagename}.jpg"/>${goodsList.goodsName}</a></li>
                        </c:forEach>
                        </ul>
                        <ul class="content_menu_content_ul">
                        <c:forEach items="${classifyList.goodsList}" var="goodsList" begin="6" end="11">
                        	<li><a href="${ctx}/front/detail/${goodsList.goodsId}"><img src="commodity/${goodsList.goodsImagename}.jpg"/>${goodsList.goodsName}</a></li>
                        </c:forEach>
                        </ul>
                     </div>
                     </c:when>
                     <c:otherwise>
                     <div class="content_menu_content" style="width:300px;">
                        <ul class="content_menu_content_ul">
                        <c:forEach items="${classifyList.goodsList}" var="goodsList">
                            <li><a href="${ctx}/front/detail/${goodsList.goodsId}"><img src="commodity/${goodsList.goodsImagename}.jpg"/>${goodsList.goodsName}</a></li>
                         </c:forEach>
                         </ul>
                     </div>
                     </c:otherwise>
                     </c:choose>
                </li>
            </c:forEach>
            </ul>
        </div>
        <div id="demo01" class="flexslider">
            <ul class="slides">
            <li><div class="img"><img src="images/ad_home.jpg"  /></div></li>
            <li><div class="img"><img src="images/ad_yuetu.jpg"  /></div></li>
            <li><div class="img"><img src="images/ad_nba.jpg"  /></div></li>
            <li><div class="img"><img src="images/ad_stock.jpg"  /></div></li>
            <li><div class="img"><img src="images/ad_auto.jpg"  /></div></li>
            </ul>
        </div>
    </div>
    <!-- 导航及轮播图结束 -->
    <!--主要展示栏（一）开始-->
    <div id="content-star-goods">
    	<div id="star-goods-content">
        	<div id="star-goods-content-title">
            	<span class="title_span">猫宁新品推荐</span>
                <div id="star-goods-content-change">
               		<span id="star-goods-content-prave"><</span>
                	<span id="star-goods-content-next">></span>
                </div>
            </div>
            <div id="star-goods-content-goods">
            	 <ul>
            	 <c:forEach items="${goodsFormByDate}" var="goodsFormByDate">
                     <li>
                         <a href="front/detail/${goodsFormByDate.goodsId}" target="_blank"><img src="commodity/${goodsFormByDate.goodsImagename}.jpg"/></a>
                         <a href="front/detail/${goodsFormByDate.goodsId}" target="_blank">${goodsFormByDate.goodsName}</a>
                         <a>${goodsFormByDate.goodsDescript}</a>
                         <a>${goodsFormByDate.goodsPrice}</a>
                     </li>
            	 </c:forEach>
             	 </ul>
            </div>
        </div>
    </div>
    <!--主要展示栏（一）结束-->
    <!--主要展示（二）栏开始-->
    <div id="main-show-box">
        <div class="list-title">
            <p><strong style="border-bottom:solid 2px #00c3d5;">猫宁明星单品</strong></p><a href="#">More</a>
        </div>
        <div class="main-show-box-goods">
        	 <ul>
                 <c:forEach items="${goodsFormByBuyNum}" var="goodsFormByBuyNum">
                    <li class="floor_goods_wrap_li">
                         <a class="floor_goods_img" href="front/detail/${goodsFormByBuyNum.goodsId}" target="_blank"><img src="commodity/${goodsFormByBuyNum.goodsImagename}.jpg"/></a>
                         <a class="floor_goods_tit" href="front/detail/${goodsFormByBuyNum.goodsId}" target="_blank">${goodsFormByBuyNum.goodsName}</a>
                         <a class="floor_goods_txt">${goodsFormByBuyNum.goodsDescript}</a>
                         <a class="floor_goods_price">${goodsFormByBuyNum.goodsPrice}元</a>
                         <a class="floor_goods_txt">${goodsFormByBuyNum.goodsBuyNum}人购买</a>
                     </li>
                 </c:forEach>
             </ul>
        </div>
        <div class="list-title">
            <p><strong style="border-bottom:solid 2px #54cb00;">猫宁热评产品</strong></p><a href="#">More</a>
        </div>
        <div class="main-show-box-goods">
        	 <ul>
                 <c:forEach items="${goodsFormByReviews}" var="goodsFormByReviews">
                    <li class="floor_goods_wrap_li">
                         <a class="floor_goods_img" href="front/detail/${goodsFormByReviews.goodsId}" target="_blank"><img src="commodity/${goodsFormByReviews.goodsImagename}.jpg"/></a>
                         <a class="floor_goods_tit" href="front/detail/${goodsFormByReviews.goodsId}" target="_blank">${goodsFormByReviews.goodsName}</a>
                         <a class="floor_goods_txt">${goodsFormByReviews.goodsDescript}</a>
                         <a class="floor_goods_price">${goodsFormByReviews.goodsPrice}</a>
                         <a class="floor_goods_txt">${goodsFormByReviews.goodsReviews}人评价</a>
                     </li>
                 </c:forEach>
             </ul>
             <div class="clear"></div>
        </div>
    </div>
    <!--主要展示（二）栏结束-->
    <myfooter>  
    <script src="${ctxsta}/web/js/index.js"></script>
    <script src="${ctxsta}/web/js/slider.js"></script>
	</myfooter>  
</body>
</html>
 