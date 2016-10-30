<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <title>账户注册 | 猫宁网 - 但行好事，莫问前程</title>
	<meta name="author" content="猫宁Morning. - 但行好事，莫问前程。" />  
	<meta name="keywords" content="猫宁商城,猫宁Morning,猫宁公益商城,公益,电子商城,猫宁社区,公益商城,在线购物,社会责任">
	<meta name="description" content="猫宁Morning公益商城是中国公益性在线电子商城，以商城B2C模式运营的公益在线商城，是一家致力于将传统公益商城互联网化的创新公益商城。">
	<link rel="shortcut icon" href="${ctx}/favicon.ico" type="image/x-icon" />
	<link rel="stylesheet" href="${ctxsta}/common/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${ctxsta}/web/user/css/gloab.css" />
	<link rel="stylesheet" href="${ctxsta}/web/user/css/index.css" />
	<script src="${ctxsta}/common/jquery-2.2.3.min.js"></script>
	<script src="${ctxsta}/common/bootstrap/js/bootstrap.min.js"></script>
	<script src="${ctxsta}/web/user/js/register.js"></script>
	<script src="${ctxsta}/common/security/security.js"></script>
	<script src="${ctxsta}/web/js/base.js"></script>
	<script> var t1 = new Date().getTime(); baselocation='${ctx}';</script>
</head>
<body class="bgf4">
<script zIndex="-1" src="${ctxsta}/web/user/js/canvas-nest.min.js"></script>
<div class="login-box">
	<div class="container-nav">
    	<a class="navbar-brand">但行好事,莫问前程.</a>
        <ul class="navbar-nav-right">
            <li><a href="${ctx}">猫宁商城</a></li>
            <li><a href="#">公益频道</a></li>
            <li><a href="#">益行者</a></li>
            <li><a href="#">猫粉社区</a></li>
            <li class="link-line">|</li>
            <li><a href="${ctx}/user/userLogin">登录</a></li>
            <li><a href="${ctx}/user/userSignin">注册</a></li>
        </ul>
    </div>
	<div class="main">   
    	<div class="reg-box-pan display-inline">  
        	<div class="reg-box  login" id="verifyCheck" style="margin-top:20px;">
            	<div class="part1">
            	<form id="userLogin">               	
                    <div class="item col-xs-12">
                        <div class="f-fl item-ifo">
                            <input type="text" name="user.loginName" maxlength="20" placeholder="邮箱/手机号码" class="txt03 f-r3 required" tabindex="1" data-valid="isNonEmpty" data-error="请输入帐号" id="adminNo" /><span class="ie8 icon-close close hide"></span>
                            <label class="icon-sucessfill blank hide"></label>
                            <label class="focus"><span></span></label>
                            <label class="focus valid"></label>
                        </div>
                    </div>
                    <div class="item col-xs-12">
                        <div class="f-fl item-ifo">
                            <input type="password" name="user.loginPassword" id="password" maxlength="20" placeholder="密码" class="txt03 f-r3 required" tabindex="3" style="ime-mode:disabled;" onpaste="return  false" autocomplete="off" data-valid="isNonEmpty" data-error="密码不能为空" data-exponent="${publicKeyMap.exponent}" data-modulus="${publicKeyMap.modulus}"/> 
                            <span class="ie8 icon-close close hide" style="right:55px"></span>
                            <span class="showpwd" data-eye="password"></span>                        
                            <label class="icon-sucessfill blank hide"></label>
                            <label class="focus"></label>
                            <label class="focus valid"></label>
                            <span class="clearfix"></span>
                            <label class="strength">
                            	<span class="f-fl f-size12">安全程度：</span>
                            	<b><i>弱</i><i>中</i><i>强</i></b>
                            </label>    
                        </div>
                    </div>
                    </form>
 					<div class="item col-xs-12 message" style="height:auto">
                        <label class="valid" ></label> 
                    </div> 
                    <div class="item col-xs-12">
                        <div class="f-fl item-ifo">
                           <a href="javascript:;" class="btn btn-blue f-r3" id="btn_login">立即登录</a>                         
                        </div>
                    </div> 
                    <div class="item col-xs-12" style="height:auto">
                        <label class="valid  line" ><a href="${ctx }/user/userGetPsw">忘记密码？</a></label> 
                    </div> 
                </div>
            </div>
        </div>
    </div>
</div>
<footer class="footer clear">
    <div class="footer_copyright">
    © 2016<a href=""> 穿鞋子的猫 </a>/ <span id="showsectime"></span> / <span id="TimeShow"></span> / 当前在线用户人数：${userNumber }
    </div>
</footer>
</body>
</html>
