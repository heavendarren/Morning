<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>成功加入购物车 - 猫宁商城</title>
<link rel="stylesheet" href="${ctxsta}/os/css/buy-success.css">
</head>
<body>
<!-- 轮播top菜单导航引入 -->
<jsp:include page="/WEB-INF/views/modules/common/site_header.jsp" />
<!-- 轮播top菜单导航引入 -->

<div class="page-main">
  <div class="container-fluid">
    <div class="buy-succ-box clearfix">
      <div class="goods-content" id="J_goodsBox">
        <div class="goods-img"> <a href="${ctx}/detail/${shoppingCartVO.productNumber}"><img src="${ctximg}/${shoppingCartVO.picImg}" title="${shoppingCartVO.name}" width="110" height="110"> </a></div>
        <div class="goods-info"> <span class="name">${shoppingCartVO.name}  <c:forEach items="${shoppingCartVO.specificationName}" var="specificationName">&nbsp;${specificationName}</c:forEach></span> <span class="price">${shoppingCartVO.price}元</span>
          <h3>已成功加入购物车！</h3>
        </div>
      </div>
      <div class="actions"> <a href="${ctx}/index" class="btn btn-line-gray" >继续购物</a> <a href="${ctx}/cart/list" class="btn btn-primary">去购物车结算</a> </div>
    </div>
    <!-- 买购物车中商品的人还买了 -->
    <div class="buy-succ-recommend" id="J_buyRecommend"></div>
    <!-- 根据浏览向您推荐 -->    
    <div class="buy-succ-recommend" id="J_historyRecommend"></div>
  </div>
</div>
<myfooter> 
<script type="text/javascript">
	/**
	 * 导航分类栏显示及颜色变换
	 */
	$(function() {
		$('#J_navCategory').mouseover(function() {
			$('.site-category').css('display', 'block');
		})
		$('#J_navCategory').mouseout(function() {
			$('.site-category').css('display', 'none');
		})
	});
</script> 
</myfooter>
</body>
</html>