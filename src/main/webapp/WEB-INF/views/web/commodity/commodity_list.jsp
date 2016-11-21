<%@ page language="java" import="java.util.*"  contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <title>${goodsClassify.classifyName} ${queryGoods.search} | Morning 猫宁</title>
    <link rel="stylesheet" href="${ctxsta}/web/css/commodity-list.css" />
  </head>
<body>
	<!-- 目录导航栏引入 -->
	<jsp:include page="/WEB-INF/views/web/common/topnav.jsp" />
	<!-- 目录导航栏引入 -->
    <!-- 商品详情页开始 -->
    <div id="content">
    	<div id="content-nav">
        	<div id="content-nav-content">
            	<a href="${ctx}">首页</a> / 
            	<c:if test="${empty queryGoods.search }">所有商品 / ${goodsClassify.classifyName}</c:if>
            	<c:if test="${!empty queryGoods.search }">全部结果 / ${queryGoods.search}</c:if>
            </div>
        </div>
        <div class="content-main">
            <div class="small-class">
                <p>分类：  <a <c:if test="${queryGoods.classifyId==null}">class="current"</c:if> href="javascript: void(0)" onclick="submitForm(1,'')">全部</a>
                    <c:forEach items="${classifyList}" var="classifyList">
                    |<a <c:if test="${queryGoods.classifyId==classifyList.classifyId}">class="current"</c:if> href="javascript: void(0)" onclick="submitForm(1,${classifyList.classifyId})">${classifyList.classifyName}</a>
                    </c:forEach>
                </p>
        	</div>
        	<div class="box-hd">
                <div class="filter-lists">
                    <ul>
                        <li ><a <c:if test="${queryGoods.condition=='goodsViewNum'}">class="current"</c:if> href="javascript: void(0)" onclick="submitForm(2,'goodsViewNum')">推荐</a>|</li>
                        <li ><a <c:if test="${queryGoods.condition=='goodsBuyNum'}">class="current"</c:if> href="javascript: void(0)" onclick="submitForm(2,'goodsBuyNum')">销量</a>|</li>
                        <li ><a <c:if test="${queryGoods.condition=='goodsPrice'}">class="current"</c:if> href="javascript: void(0)" onclick="submitForm(2,'goodsPrice')">价格</a>|</li>
                        <li ><a <c:if test="${queryGoods.condition=='goodsDate'}">class="current"</c:if> href="javascript: void(0)" onclick="submitForm(2,'goodsDate')">新品</a>|</li>
                        <li ><a <c:if test="${queryGoods.condition=='goodsReviews'}">class="current"</c:if> href="javascript: void(0)" onclick="submitForm(2,'goodsReviews')">评论最多</a></li>
                    </ul>
                </div>
            </div>
            <c:if test="${empty goodsList}">
            	<!-- /无数据提示 开始-->
            	<span>没有相关数据，小编正在努力整理中...</span>
            	<!-- /无数据提示 结束-->
            </c:if>
            <c:if test="${!empty goodsList}">
            <div class="products-list" id="products-list">
                <ul>
                <c:forEach items="${goodsList}" var="goodsList">
                    <li>
                        <div class="img">
                        	<a href="${ctx}/front/detail/${goodsList.goodsId}" target="_blank"><img alt="" src="${ctx}/commodity/${goodsList.goodsImagename}.jpg"></a>
                        </div>
                        <div class="w">
                            <div class="left">
                              <p><a href="${ctx}/front/detail/${goodsList.goodsId}" target="_blank">${goodsList.goodsName}</a></p><span>¥${goodsList.goodsPrice}元</span></div>
                            <div class="right"><p>${goodsList.goodsBuyNum}人购买</p></div>
                        </div>
                        <div class="btn">
                            <a href="${ctx}/front/detail/${goodsList.goodsId}" target="_blank" class="btn1">立即购买</a>
                            <a href="${ctx}/front/detail/${goodsList.goodsId}" target="_blank" class="btn2">加入购物车</a>
                        </div>
                    </li>
               	</c:forEach>
                </ul>
                <div class="clr10"></div>
            </div>
           	<div class="page">
				<div id="pager" ></div>
	    	</div>            
            </c:if>
        </div>
    </div>
   	<!-- 商品详情页结束 -->
   	<myfooter>
   	<script src="${ctxsta}/web/js/jquery.pager.js"></script>
    <script src="${ctxsta}/web/js/commodity.list.js"></script>
   	</myfooter>
</body>
</html>