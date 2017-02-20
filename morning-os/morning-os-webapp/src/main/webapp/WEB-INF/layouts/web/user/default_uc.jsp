<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <title><sitemesh:write property='title' /> - 但行好事，莫问前程 </title>
	<meta name="author" content="猫宁Morning. - 但行好事，莫问前程。" />  
	<meta name="keywords" content="猫宁商城,猫宁Morning,猫宁公益商城,公益,电子商城,猫宁社区,公益商城,在线购物,社会责任">
	<meta name="description" content="猫宁Morning公益商城是中国公益性在线电子商城，以商城B2C模式运营的公益在线商城，是一家致力于将传统公益商城互联网化的创新公益商城。">
	<link rel="shortcut icon" href="${ctx }/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" media="all" href="${ctxsta}/common/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" media="all" href="${ctxsta}/web/css/sweet-alert.css" />
	<link rel="stylesheet" type="text/css" media="all" href="${ctxsta}/web/css/base.css" />
	<link rel="stylesheet" type="text/css" media="all" href="${ctxsta}/web/css/user-base.css" />
	<script type="text/javascript"> var t1 = new Date().getTime(); baselocation='${ctx}';</script>
	<sitemesh:write property='head' />
  </head>
  <body>
  	<!-- 页面内容控制开始 -->
	<div id="page-containner">
	 	<!-- 公共头引入 -->
		<jsp:include page="/WEB-INF/layouts/web/header.jsp" />
		<!-- 公共头引入 -->
		<!-- 目录导航栏引入 -->
		<jsp:include page="/WEB-INF/views/modules/common/topnav.jsp" />
		<!-- 目录导航栏引入 -->
		<div class="clear"></div>
		<div class="breadcrumbs">
	    	<div class="container">
	        	<a>首页</a>
	            <span class="sep">></span>
	            <span>个人中心</span>
	        </div>
	    </div>
		<div class="bg-fa of">
			<!-- /个人中心 主体 开始 -->
			<section class="container">
				<div class="u-body mt10">
					<!-- 左侧，开始 -->
					<jsp:include page="/WEB-INF/layouts/web/user/left_uc.jsp"></jsp:include>
					<!-- 左侧，结束 -->
					<sitemesh:write property='body' />
					<!-- /右侧内容区 结束 -->
					<div class="clear"></div>
				</div>
			</section>
			<!-- /个人中心 主体 结束 -->
		</div>
		<!-- 公共底引入 -->
		<jsp:include page="/WEB-INF/layouts/web/footer.jsp" />
		<!-- 公共底引入 -->
	</div>
	<!-- 全局js -->
	<script src="${ctxsta}/common/jquery-2.2.3.min.js"></script>
    <script type="text/javascript" src="${ctxsta}/common/bootstrap/js/bootstrap.min.js"></script>
    <!-- 第三方插件 -->
    <script type="text/javascript" src="${ctxsta}/web/js/sweet-alert.js"></script>
    <!-- 自定义js -->
    <script type="text/javascript" src="${ctxsta}/web/header/header.js"></script>
	<script type="text/javascript" src="${ctxsta}/web/js/base.js"></script>
	<script type="text/javascript" src="${ctxsta}/web/js/user.base.js"></script>
	<sitemesh:write property='myfooter' />
	<form action="${ctx}/front/goodslist" id="searchForm" method="post">
		<input type="hidden" name="queryGoods.classifyId" value="${queryGoods.classifyId }" />
		<input type="hidden" name="queryGoods.search" value="${queryGoods.search }" />
		<input type="hidden" name="queryGoods.condition" value="${queryGoods.condition }" />
		<input type="hidden" name="pageInfo.currentPage" value="${pageInfo.currentPage }" />
		<input type="hidden" name="pageInfo.totalPage" value="${pageInfo.totalPage }" />
	</form>
  </body>
</html>
