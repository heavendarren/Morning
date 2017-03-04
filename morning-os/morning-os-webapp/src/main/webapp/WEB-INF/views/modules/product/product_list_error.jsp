<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>猫宁商城</title>
<link rel="stylesheet" href="${ctxsta}/web/css/list.css">
</head>
<body>
<!--     轮播top菜单导航 begin       -->
<div class="site-header">
  <div class="container-fluid">
    <div class="header-logo"> <a class="logo ir" href="//www.mi.com/index.html" title="小米官网"><img src="${ctxsta}/web/img/logo.png"></a> </div>
    <div class="header-nav">
      <ul class="nav-list J_navMainList clearfix">
        <li id="J_navCategory" class="nav-category"> <a class="link-category" href="${ctx }/list?categoryId=1"><span class="text">全部商品分类</span></a> 
        <!--     轮播top菜单导航begin       -->
        <div class="site-category">
          <ul id="J_categoryList" class="site-category-list clearfix">
            <c:forEach items="${categoryInNavVOs }" var="categoryInNavVO">
              <li class="category-item"> <a class="title" href="${ctx }/list?categoryId=${categoryInNavVO.categoryId}">${categoryInNavVO.name }<span class="glyphicon glyphicon-chevron-right"></span></a>
                <c:choose>
                  <c:when test="${fn:length(categoryInNavVO.products)<=6}">
                    <div class="children clearfix children-col-1">
                      <ul class="children-list clearfix">
                        <c:forEach items="${categoryInNavVO.products}" var="product" begin="0" end="5">
                          <li> <a class="link" title="${product.name}" href="${ctx }/item/${product.productNumber}"><img class="thumb" src="${ctximg}/${product.picImg}" width="40" height="40" alt="${product.name}"><span class="text">${product.name}</span></a> </li>
                        </c:forEach>
                      </ul>
                    </div>
                  </c:when>
                  <c:when test="${fn:length(categoryInNavVO.products)<=12}">
                    <div class="children clearfix children-col-2">
                      <ul class="children-list children-list-col children-list-col-1">
                        <c:forEach items="${categoryInNavVO.products}" var="product" begin="0" end="5">
                          <li> <a class="link" title="${product.name}" href="${ctx }/item/${product.productNumber}"><img class="thumb" src="${ctximg}/${product.picImg}" width="40" height="40" alt="${product.name}"><span class="text">${product.name}</span></a> </li>
                        </c:forEach>
                      </ul>
                      <ul class="children-list children-list-col children-list-col-2">
                        <c:forEach items="${categoryInNavVO.products}" var="product" begin="6" end="11">
                          <li> <a class="link" title="${product.name}" href="${ctx }/item/${product.productNumber}"><img class="thumb" src="${ctximg}/${product.picImg}" width="40" height="40" alt="${product.name}"><span class="text">${product.name}</span></a> </li>
                        </c:forEach>
                      </ul>
                    </div>
                  </c:when>
                  <c:when test="${fn:length(categoryInNavVO.products)<=18}">
                    <div class="children clearfix children-col-3">
                      <ul class="children-list children-list-col children-list-col-1">
                        <c:forEach items="${categoryInNavVO.products}" var="product" begin="0" end="5">
                          <li> <a class="link" title="${product.name}" href="${ctx }/item/${product.productNumber}"><img class="thumb" src="${ctximg}/${product.picImg}" width="40" height="40" alt="${product.name}"><span class="text">${product.name}</span></a> </li>
                        </c:forEach>
                      </ul>
                      <ul class="children-list children-list-col children-list-col-2">
                        <c:forEach items="${categoryInNavVO.products}" var="product" begin="6" end="11">
                          <li> <a class="link" title="${product.name}" href="${ctx }/item/${product.productNumber}"><img class="thumb" src="${ctximg}/${product.picImg}" width="40" height="40" alt="${product.name}"><span class="text">${product.name}</span></a> </li>
                        </c:forEach>
                      </ul>
                      <ul class="children-list children-list-col children-list-col-3">
                        <c:forEach items="${categoryInNavVO.products}" var="product" begin="12" end="17">
                          <li> <a class="link" title="${product.name}" href="${ctx }/item/${product.productNumber}"><img class="thumb" src="${ctximg}/${product.picImg}" width="40" height="40" alt="${product.name}"><span class="text">${product.name}</span></a> </li>
                        </c:forEach>
                      </ul>
                    </div>
                  </c:when>
                  <c:otherwise>
                    <div class="children clearfix children-col-4">
                      <ul class="children-list children-list-col children-list-col-1">
                        <c:forEach items="${categoryInNavVO.products}" var="product" begin="0" end="5">
                          <li> <a class="link" title="${product.name}" href="${ctx }/item/${product.productNumber}"><img class="thumb" src="${ctximg}/${product.picImg}" width="40" height="40" alt="${product.name}"><span class="text">${product.name}</span></a> </li>
                        </c:forEach>
                      </ul>
                      <ul class="children-list children-list-col children-list-col-2">
                        <c:forEach items="${categoryInNavVO.products}" var="product" begin="6" end="11">
                          <li> <a class="link" title="${product.name}" href="${ctx }/item/${product.productNumber}"><img class="thumb" src="${ctximg}/${product.picImg}" width="40" height="40" alt="${product.name}"><span class="text">${product.name}</span></a> </li>
                        </c:forEach>
                      </ul>
                      <ul class="children-list children-list-col children-list-col-3">
                        <c:forEach items="${categoryInNavVO.products}" var="product" begin="12" end="17">
                          <li> <a class="link" title="${product.name}" href="${ctx }/item/${product.productNumber}"><img class="thumb" src="${ctximg}/${product.picImg}" width="40" height="40" alt="${product.name}"><span class="text">${product.name}</span></a> </li>
                        </c:forEach>
                      </ul>
                      <ul class="children-list children-list-col children-list-col-4">
                        <c:forEach items="${categoryInNavVO.products}" var="product" begin="17" end="23">
                          <li> <a class="link" title="${product.name}" href="${ctx }/item/${product.productNumber}"><img class="thumb" src="${ctximg}/${product.picImg}" width="40" height="40" alt="${product.name}"><span class="text">${product.name}</span></a> </li>
                        </c:forEach>
                      </ul>
                    </div>
                  </c:otherwise>
                </c:choose>
              </li>
            </c:forEach>
          </ul>
        </div>
        <!--     轮播top菜单导航end       --> 
        </li>
        <c:forEach items="${indexClassify }" var="indexClassify">
	      <li class="nav-item"> <a class="link" href="${indexClassify.href }" target="${indexClassify.target }"><span class="text">${indexClassify.name }</span><span class="arrow"></span></a> </li>
	    </c:forEach>
      </ul>
    </div>
    <div class="header-search">
      <form id="J_searchForm" class="search-form clearfix" action="//search.mi.com/search" method="get">
        <label for="search" class="hide">站内搜索</label>
        <input class="search-text" type="search" id="search" name="keyword" autocomplete="off">
        <input type="submit" class="search-btn iconfont" value="">
        <div class="search-hot-words" style="display: block;"> <a href="#">手环</a><a href="#">小米手机4</a> </div>
        <div id="J_keywordList" class="keyword-list" style="display:none;">
          <ul class="result-list">
            <li data-key="移动电源"> <a href="#">移动电源<span class="result">约有22件</span></a> </li>
            <li data-key="空气净化器"> <a href="#">空气净化器<span class="result">约有2件</span></a> </li>
            <li data-key="小米手环"><a href="#">小米手环<span class="result">约有5件</span></a> </li>
            <li data-key="WiFi"><a href="//search.mi.com/search_WiFi">WiFi<span class="result">约有7件</span></a> </li>
            <li data-key="自拍杆"><a href="#">自拍杆<span class="result">约有4件</span></a> </li>
            <li data-key="小米体重秤"><a href="#">小米体重秤<span class="result">约有1件</span></a> </li>
            <li data-key="小蚁摄像机"><a href="#">小蚁摄像机<span class="result">约有2件</span></a> </li>
            <li data-key="运动相机"><a href="#">运动相机<span class="result">约有2件</span></a> </li>
            <li data-key="智能插座"><a href="#">智能插座<span class="result">约有5件</span></a> </li>
            <li data-key="配件优惠套装"><a href="#">配件优惠套装<span class="result">约有15件</span></a> </li>
          </ul>
        </div>
      </form>
    </div>
  </div>
</div>
<!--     轮播top菜单导航 end         -->

<!-- 错误提示信息bagin -->
<div class="container-fluid">
  <div class="xm-box ">
    <div class="bd">
      <div class="shop-global-error">
        <h2>你所查找的分类不存在</h2>
        <p class="shop-global-error-tips"></p>
        <p class="shop-global-error-btn"> <a href="${ctx }/index" class="btn">去首页</a> <a href="javascript:;" onclick="history.go(-1);" class="btn btn-dake">返回上一页</a> </p>
      </div>
    </div>
  </div>
</div>
<!-- 错误提示信息end -->
</body>
</html>