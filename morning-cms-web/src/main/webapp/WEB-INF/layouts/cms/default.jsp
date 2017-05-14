<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <title><sitemesh:write property='title' /> - 但行好事，莫问前程</title>
	<meta name="author" content="猫宁Morning. - 但行好事，莫问前程。" />  
	<meta name="keywords" content="猫宁商城,猫宁Morning,猫宁公益商城,公益,电子商城,猫宁社区,公益商城,在线购物,社会责任">
	<meta name="description" content="猫宁Morning公益商城是中国公益性在线电子商城，以商城B2C模式运营的公益在线商城，是一家致力于将传统公益商城互联网化的创新公益商城。">
	<link rel="shortcut icon" href="${ctximg}/default/ico/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" href="${ctxsta}/common/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${ctxsta}/common/font-awesome/css/font-awesome.min.css" />
	<link rel="stylesheet" href="${ctxsta}/cms/css/animate.css" />
	<link rel="stylesheet" href="${ctxsta}/cms/css/style.css" />
	<script> var t1 = new Date().getTime(); baselocation='${ctx}'; imagelocation='${ctximg}';</script>
	<sitemesh:write property='head' />
  </head>
  <body class="fixed-sidebar full-height-layout gray-bg">
  	<sitemesh:write property='body' />
  	<!-- 全局js -->
	<script src="${ctxsta}/common/jquery/jquery-3.2.0.min.js"></script>
	<script src="${ctxsta}/common/bootstrap/js/bootstrap.min.js"></script>
	<script src="${ctxsta}/common/metismenu/metisMenu.min.js"></script>
	<script src="${ctxsta}/common/slimscroll/jquery.slimscroll.min.js"></script>
	<!-- layer弹出框js -->
    <script src="${ctxsta}/common/layer/layer.js"></script>
    <!-- iCheck --> 
  	<script src="${ctxsta}/common/icheck/icheck.min.js"></script> 
  	<!-- bootstrapvalidator-master前端验证框架 --> 
  	<script src="${ctxsta}/common/bootstrapvalidator/js/bootstrapValidator.min.js"></script> 
	<!-- 自定义js -->
	<script src="${ctxsta}/cms/js/hplus.js"></script>
	<script src="${ctxsta}/cms/js/contabs.js"></script>
	<script src="${ctxsta}/cms/js/content.js"></script>
	<sitemesh:write property='myfooter' />
  </body>
</html>
