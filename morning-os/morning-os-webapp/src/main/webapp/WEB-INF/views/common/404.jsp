<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <title>404 - Not found</title>
	<meta name="author" content="猫宁Morning. - 但行好事,莫问前程." />  
	<meta name="keywords" content="猫宁商城,猫宁Morning,猫宁公益商城,公益,电子商城,猫宁社区,公益商城,在线购物,社会责任">
	<meta name="description" content="猫宁Morning公益商城是中国公益性在线电子商城，以商城B2C模式运营的公益在线商城，是一家致力于将传统公益商城互联网化的创新公益商城。">
	<link rel="shortcut icon" href="${ctx}/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" href="${ctxsta}/common/error/css/main.css" /> <!-- main stylesheet -->
	<link rel="stylesheet" href="${ctxsta}/common/error/css/tipsy.css" /> <!-- Tipsy implementation -->
	<script src="${ctxsta}/common/error/scripts/jquery-1.7.2.min.js"></script> <!-- uiToTop implementation -->
	<script src="${ctxsta}/common/error/scripts/custom-scripts.js"></script>
	<script src="${ctxsta}/common/error/scripts/jquery.tipsy.js"></script> <!-- Tipsy -->
	<script>
	$(document).ready(function(){
		universalPreloader();
	});
	$(window).load(function(){
		//remove Universal Preloader
		universalPreloaderRemove();
		rotate();
	    dogRun();
		dogTalk();
		//Tipsy implementation
		$('.with-tooltip').tipsy({gravity: $.fn.tipsy.autoNS});
	});
	</script>
  </head>
<body>
<!-- Universal preloader -->
<div id="universal-preloader">
    <div class="preloader">
        <img src="${ctxsta}/common/error/images/universal-preloader.gif" alt="universal-preloader" class="universal-preloader-preloader" />
    </div>
</div>
<!-- Universal preloader -->

<div id="wrapper">
<!-- 404 graphic -->
	<div class="graphic404"></div>
<!-- 404 graphic -->
<!-- Not found text -->
	<div class="not-found-text">
    	<h1 class="not-found-text">：（ 很抱歉，您所访问的页面不存在！</h1>
    </div>
<!-- Not found text -->

<!-- search form -->
<div class="search">
	<form name="search" method="get" action="#" >
        <input type="text" name="search" value="Search ..." />
        <input class="with-tooltip" title="Search!" type="submit" name="submit" value="" />
    </form>
</div>
<!-- search form -->

<!-- top menu -->
<div class="top-menu">
	<a href="#" class="with-tooltip" title="返回首页">返回首页</a> | <a href="javascript:history.back(-1)" class="with-tooltip" title="返回上一页">返回上页</a> | <a href="#" class="with-tooltip" title="帮助中心">帮助中心</a> | <a href="#" class="with-tooltip" title="联系我们">联系我们</a>
</div>
<!-- top menu -->

<div class="dog-wrapper">
<!-- dog running -->
	<div class="dog"></div>
<!-- dog running -->
	
<!-- dog bubble talking -->
	<div class="dog-bubble">
    	
    </div>
    
    <!-- The dog bubble rotates these -->
    <div class="bubble-options">
    	<p class="dog-bubble">
        	Are you lost, bud? No worries, I'm an excellent guide!
        </p>
    	<p class="dog-bubble">
	        <br />
        	Arf! Arf!
        </p>
        <p class="dog-bubble">
        	<br />
        	Don't worry! I'm on it!
        </p>
        <p class="dog-bubble">
        	I wish I had a cookie<br /><img style="margin-top:8px" src="${ctxsta}/common/error/images/cookie.png" alt="cookie" />
        </p>
        <p class="dog-bubble">
        	<br />
        	Geez! This is pretty tiresome!
        </p>
        <p class="dog-bubble">
        	<br />
        	Am I getting close?
        </p>
        <p class="dog-bubble">
        	Or am I just going in circles? Nah...
        </p>
        <p class="dog-bubble">
        	<br />
            OK, I'm officially lost now...
        </p>
        <p class="dog-bubble">
        	I think I saw a <br /><img style="margin-top:8px" src="${ctxsta}/common/error/images/cat.png" alt="cat" />
        </p>
        <p class="dog-bubble">
        	What are we supposed to be looking for, anyway? @_@
        </p>
    </div>
    <!-- The dog bubble rotates these -->
<!-- dog bubble talking -->
</div>

<!-- planet at the bottom -->
	<div class="planet"></div>
<!-- planet at the bottom -->
</div>

</body>
</html>