<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>猫宁商城</title>
<link rel="stylesheet" href="${ctxsta}/web/css/list.css">
</head>
<body>
<!-- 轮播top菜单导航引入 -->
<jsp:include page="/WEB-INF/views/modules/common/site-header.jsp" />
<!-- 轮播top菜单导航引入 --> 

<!-- 错误提示信息bagin -->
<div class="container-fluid">
  <div class="xm-box ">
    <div class="bd">
      <div class="shop-global-error">
        <h2>你所查找的商品不存在</h2>
        <p class="shop-global-error-tips"></p>
        <p class="shop-global-error-btn"> <a href="${ctx }/index" class="btn">去首页</a> <a href="javascript:;" onclick="history.go(-1);" class="btn btn-dake">返回上一页</a> </p>
      </div>
    </div>
  </div>
</div>
<!-- 错误提示信息end -->
</body>
</html>