<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>猫宁商城</title>
<link rel="stylesheet" href="${ctxsta}/os/css/list.css">
</head>
<body>
<!-- 轮播top菜单导航引入 -->
<jsp:include page="/WEB-INF/views/modules/common/site_header.jsp" />
<!-- 轮播top菜单导航引入 -->

<c:if test="${not empty products}"> 
  <!--     分类导航栏 begin       -->
  <div class="breadcrumbs">
    <div class="container-fluid"><a href='${ctx}/index'>首页</a> <span class="sep">&gt;</span><a href="${ctx}/search?search=${search}" title="${search}">全部结果</a>
      <c:if test="${not empty search}"><span class="sep">&gt;</span><a>${search}</a></c:if>
    </div>
  </div>
  <!--     分类导航栏 end       --> 
  
  <!--     产品分类目录begin       -->
  <div class="category">
    <div class="container-fluid">
      <div class="filter-box">
        <div class="filter-list-wrap">
          <dl class="filter-list clearfix">
            <dt>分类：</dt>
            <dd class="${category.categoryId eq 1 ? 'active':''}"><a href="${ctx}/list?categoryId=1">全部</a></dd>
            <c:forEach items="${lowerCategories}" var="lowerCategoriy">
              <dd class="${lowerCategoriy.categoryId eq category.categoryId ? 'active':''}"><a href="${ctx}/list?categoryId=${lowerCategoriy.categoryId}">${lowerCategoriy.name }</a></dd>
            </c:forEach>
          </dl>
          <a class="more J_filterToggle" href="javascript:void(0);" onclick="showMornCategory(this);" >更多<i class="glyphicon glyphicon-chevron-down"></i></a> </div>
      </div>
    </div>
  </div>
  <!--     产品分类目录end       --> 
  
  <!--     产品分类内容begin       -->
  <div class="content">
    <div class="container-fluid">
      <div class="order-list-box clearfix">
        <ul class="order-list">
          <li class="${sort eq 0 ? 'active':''} first"><a href="${ctx}/search?search=${search}&sort=0" rel="nofollow">推荐</a></li>
          <li class="${sort eq 1 ? 'active':''}"><a href="${ctx}/search?search=${search}&sort=1" rel="nofollow">新品</a></li>
          <li class="${sort eq 2 ? 'active':''}"><a href="${ctx}/search?search=${search}&sort=2" rel="nofollow">销量</a></li>
          <li class="${sort eq 6 ? 'active':''}"><a href="${ctx}/search?search=${search}&sort=6" rel="nofollow">价格 <i class="glyphicon glyphicon-arrow-up"></i></a></li>
          <li class="${sort eq 7 ? 'active':''}"><a href="${ctx}/search?search=${search}&sort=7" rel="nofollow">价格 <i class="glyphicon glyphicon-arrow-down"></i></a></li>
          <li class="${sort eq 3 ? 'active':''}"><a href="${ctx}/search?search=${search}&sort=3"  rel="nofollow">评论最多</a></li>
        </ul>
      </div>
      <div class="goods-list-box">
        <div class="goods-list clearfix">
          <c:forEach items="${products}" var="product">
            <div class="goods-item">
              <div class="figure figure-img"><a title="${product.introduce}" href="${ctx}/detail/${product.productNumber}"><img src="${ctximg}/${product.picImg}" title="${product.introduce}" width="200" height="200" alt="${product.name}" /></a></div>
              <p class="desc"></p>
              <h2 class="title"><a title="${product.name}" href="${ctx}/detail/${product.productNumber}">${product.name}</a></h2>
              <p class="price">${product.showPrice}元</p>
              <div class="thumbs">
                <ul class="thumb-list clearfix">
                  <li data-gid="${product.productNumber}"><img src="${ctximg}/${product.picImg}" width="34" height="34" title="${product.introduce}" alt="${product.name}" /></li>
                </ul>
                <p class="desc"> ${product.introduce} </p>
              </div>
              <div class="actions clearfix"> <a class="btn-like J_likeGoods" data-cid="1161200061" href="javascript: void(0);"><i class="glyphicon glyphicon-heart-empty"></i> <span>喜欢</span></a> <a class="btn-buy J_buyGoods" data-gid="2161200067" href=""><span>加入购物车</span> <i class="glyphicon glyphicon-shopping-cart"></i></a> </div>
              <div class="flags">
                <c:if test="${not empty product.labelName}">
                  <div class="flag">${product.labelName}</div>
                </c:if>
              </div>
              <div class="notice"></div>
            </div>
          </c:forEach>
        </div>
        <div class="xm-pagenavi">
          <c:if test="${pageInfo.total gt pageInfo.limit}">
            <div id="pager" data-pager-href="${ctx}/search?search=${search}&sort=${sort}&page=" data-pager-totalPage="${pageInfo.totalPage}" data-pager-current="${pageInfo.current}"></div>
          </c:if>
        </div>
      </div>
    </div>
    <div id="J_newPrudoct" class="xm-recommend-container container-fluid xm-carousel-container"> 
      <!-- <h2 class="title">带上亲爱的朋友 把滑雪歌儿唱  (♥◠‿◠)ﾉ  ʅ(‾◡◝)</h2> --> 
    </div>
  </div>
  <!--     产品分类内容begin       --> 
</c:if>
<c:if test="${empty products}">
  <div class="container-fluid">
    <div class="xm-box ">
      <div class="bd">
        <div class="shop-global-error">
          <h2 class="title">抱歉，没有搜索到与 “<span class="keyword">${search}</span>” 相关的商品</h2>
          <p class="shop-global-error-tips"></p>
          <p class="shop-global-error-btn"> <a href="${ctx}/index" class="btn btn-primary">去首页</a> <a href="javascript:;" onclick="history.go(-1);" class="btn btn-dake">返回上一页</a> </p>
        </div>
      </div>
    </div>
  </div>
</c:if>
<myfooter> 
  <!-- layer javascript --> 
  <script src="${ctxsta}/common/layer/layer.js"></script> 
  <!-- 分页js --> 
  <script src="${ctxsta}/common/pager/jquery.pager.js"></script> 
  <script src="${ctxsta}/os/js/list.js"></script> 
</myfooter>
</body>
</html>