<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <title><sitemesh:write property='title' /> - 但行好事，莫问前程</title>
	<meta name="author" content="猫宁Morning. - 但行好事，莫问前程。" />  
	<meta name="keywords" content="猫宁商城,猫宁Morning,猫宁公益商城,公益,电子商城,猫宁社区,公益商城,在线购物,社会责任">
	<meta name="description" content="猫宁Morning公益商城是中国公益性在线电子商城，以商城B2C模式运营的公益在线商城，是一家致力于将传统公益商城互联网化的创新公益商城。">
	<link rel="shortcut icon" href="${ctx}/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" href="${ctxsta}/common/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${ctxsta}/common/font-awesome/css/font-awesome.min.css" />
	<link rel="stylesheet" href="${ctxsta}/admin/main/css/animate.css" />
	<link rel="stylesheet" href="${ctxsta}/admin/main/css/style.css" />
	<script> var t1 = new Date().getTime(); baselocation='${ctx}';</script>
	<sitemesh:write property='head' />
  </head>
  <body class="fixed-sidebar full-height-layout gray-bg">
  	<sitemesh:write property='body' />
  	<!-- 全局js -->
	<script src="${ctxsta}/common/jquery/jquery-3.1.1.min.js"></script>
	<script src="${ctxsta}/common/bootstrap/js/bootstrap.min.js"></script>
	<script src="${ctxsta}/admin/main/js/metisMenu/jquery.metisMenu.js"></script>
	<script src="${ctxsta}/admin/main/js/slimscroll/jquery.slimscroll.min.js"></script>
	<!-- 自定义js -->
	<script src="${ctxsta}/admin/main/js/contabs.js"></script>
	<script src="${ctxsta}/admin/main/js/content.js"></script>
	<script src="${ctxsta}/admin/main/js/hplus.js"></script>
	<sitemesh:write property='myfooter' />
  </body>
</html>
