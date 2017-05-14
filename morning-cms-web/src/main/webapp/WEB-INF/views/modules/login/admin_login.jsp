<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>后台管理系统 | 猫宁网 - 但行好事，莫问前程</title>
<meta name="author" content="猫宁Morning. - 但行好事，莫问前程。" />
<meta name="keywords" content="猫宁商城,猫宁Morning,猫宁公益商城,公益,电子商城,猫宁社区,公益商城,在线购物,社会责任">
<meta name="description" content="猫宁Morning公益商城是中国公益性在线电子商城，以商城B2C模式运营的公益在线商城，是一家致力于将传统公益商城互联网化的创新公益商城。">
<link rel="shortcut icon" href="${ctximg}/default/ico/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="${ctxsta}/cms/css/login.css" />
<script> var t1 = new Date().getTime(); baselocation='${ctx}';</script>
</head>

<body>
<dl class="admin_login">
  <dt> <strong>猫宁后台管理系统</strong> <em>Management System</em> </dt>
  <dd class="user_icon">
    <input type="text" name="loginName" placeholder="账号" class="login_txtbx"/>
  </dd>
  <dd class="pwd_icon">
    <input type="password" name="loginPassword" placeholder="密码" class="login_txtbx" data-exponent="${publicKeyMap.exponent}" data-modulus="${publicKeyMap.modulus}" />
  </dd>
  <dd class="val_icon">
    <div class="checkcode">
      <input type="text" id="J_codetext" name="registerCode" placeholder="验证码" maxlength="4" class="login_txtbx">
      <img class="J_codeimg" src="${ctx}/captcha-image.jpg" id="kaptchaImage" /> </div>
    <input type="button" value="点击,换一张" class="ver_btn" onclick="$(this).prev().find('img').click()">
  </dd>
  <dd>
    <input type="button" value="立即登陆" class="submit_btn"/>
  </dd>
  <dd>
    <p>© 2016 猫宁商城 版权所有</p>
    <p><span id="showsectime"></span></p>
  </dd>
</dl>
<script src="${ctxsta}/common/jquery/jquery-3.2.0.min.js"></script> 
<script src="${ctxsta}/common/layer/layer.js"></script> 
<script src="${ctxsta}/common/security/security.js"></script> 
<script src="${ctxsta}/common/particleground/js/jquery.particleground.min.js"></script> 
<script src="${ctxsta}/cms/js/login.js"></script>
</body>
</html>