<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>账户注册 | 猫宁网 - 但行好事，莫问前程</title>
<meta name="author" content="猫宁Morning. - 但行好事，莫问前程。" />
<meta name="keywords" content="猫宁商城,猫宁Morning,猫宁公益商城,公益,电子商城,猫宁社区,公益商城,在线购物,社会责任">
<meta name="description" content="猫宁Morning公益商城是中国公益性在线电子商城，以商城B2C模式运营的公益在线商城，是一家致力于将传统公益商城互联网化的创新公益商城。">
<link rel="shortcut icon" href="${ctximg}/default/ico/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="${ctxsta}/common/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ctxsta}/os/user/css/gloab.css" />
<link rel="stylesheet" href="${ctxsta}/os/user/css/index.css" />
<script> var t1 = new Date().getTime(); baselocation='${ctx}';</script>
</head>
<body class="bgf4">
<script zIndex="-1" src="${ctxsta}/os/user/js/canvas-nest.min.js"></script>
<div class="login-box">
  <div class="container-nav"> <a class="navbar-brand">但行好事,莫问前程.</a>
    <ul class="navbar-nav-right">
    <c:forEach items="${loginTop}" var="loginTop">
       <li><a href="${loginTop.href}" target="${loginTop.target}">${loginTop.name }</a></li>   
    </c:forEach>
      <li class="link-line">|</li>
      <li><a href="${ctx}/pass/login">登录</a></li>
      <li><a href="${ctx}/pass/register">注册</a></li>
    </ul>
  </div>
  <div class="main">
    <div class="reg-box-pan display-inline">
      <div class="step">
        <ul>
          <li class="col-xs-4 on"> <span class="num"><em class="f-r5"></em><i>1</i></span> <span class="line_bg lbg-r"></span>
            <p class="lbg-txt">填写账户信息</p>
          </li>
          <li class="col-xs-4"> <span class="num"><em class="f-r5"></em><i>2</i></span> <span class="line_bg lbg-l"></span> <span class="line_bg lbg-r"></span>
            <p class="lbg-txt">验证账户信息</p>
          </li>
          <li class="col-xs-4"> <span class="num"><em class="f-r5"></em><i>3</i></span> <span class="line_bg lbg-l"></span>
            <p class="lbg-txt">注册成功</p>
          </li>
        </ul>
      </div>
      <div class="reg-box" id="verifyCheck" style="margin-top:20px;">
        <div class="part1">
          <form method="post" id="verifyUser">
            <div class="item col-xs-12"> <span class="intelligent-label f-fl"><b class="ftx04">*</b>昵称：</span>
              <div class="f-fl item-ifo">
                <input type="text" name="userName" maxlength="20" class="txt03 f-r3 required btn_part1" tabindex="1" data-valid="isNonEmpty||between:3-20||isUname" data-error="用户名不能为空||用户名长度3-20位||只能输入中文、字母、数字、下划线，且以中文或字母开头" id="adminNo" />
                <span class="ie8 icon-close close hide"></span>
                <label class="icon-sucessfill blank hide"></label>
                <label class="focus"><span>3-20位，中文、字母、数字、下划线的组合，以中文或字母开头</span></label>
                <label class="focus valid"></label>
              </div>
            </div>
            <div class="item col-xs-12"> <span class="intelligent-label f-fl"><b class="ftx04">*</b>电子邮箱：</span>
              <div class="f-fl item-ifo">
                <input type="text" name="email" class="txt03 f-r3 required btn_part1" keycodes="mail" tabindex="2" data-valid="isNonEmpty||isEmail" data-error="email不能为空||邮箱格式不正确"  id="mail" />
                <span class="ie8 icon-close close hide"></span>
                <label class="icon-sucessfill blank hide"></label>
                <label class="focus">请填写正确格式的电子邮箱</label>
                <label class="focus valid"></label>
              </div>
            </div>
            <div class="item col-xs-12"> <span class="intelligent-label f-fl"><b class="ftx04">*</b>密码：</span>
              <div class="f-fl item-ifo">
                <input type="password" name="loginPassword" id="password" maxlength="20" class="txt03 f-r3 required btn_part1" tabindex="3" style="ime-mode:disabled;" onpaste="return  false" autocomplete="off" data-valid="isNonEmpty||between:6-20||level:2" data-error="密码不能为空||密码长度6-20位||该密码太简单，有被盗风险，建议字母+数字的组合" />
                <span class="ie8 icon-close close hide" style="right:55px"></span> <span class="showpwd" data-eye="password"></span>
                <label class="icon-sucessfill blank hide"></label>
                <label class="focus">6-20位英文（区分大小写）、数字、字符的组合</label>
                <label class="focus valid"></label>
                <span class="clearfix"></span>
                <label class="strength"> <span class="f-fl f-size12">安全程度：</span> <b><i>弱</i><i>中</i><i>强</i></b> </label>
              </div>
            </div>
            <div class="item col-xs-12"> <span class="intelligent-label f-fl"><b class="ftx04">*</b>确认密码：</span>
              <div class="f-fl item-ifo">
                <input type="password"  maxlength="20" class="txt03 f-r3 required btn_part1" tabindex="4" style="ime-mode:disabled;" onpaste="return  false" autocomplete="off" data-valid="isNonEmpty||between:6-16||isRepeat:password" data-error="密码不能为空||密码长度6-16位||两次密码输入不一致" id="rePassword" />
                <span class="ie8 icon-close close hide" style="right:55px"></span> <span class="showpwd" data-eye="rePassword"></span>
                <label class="icon-sucessfill blank hide"></label>
                <label class="focus">请再输入一遍上面的密码</label>
                <label class="focus valid"></label>
              </div>
            </div>
            <div class="item col-xs-12"> <span class="intelligent-label f-fl"><b class="ftx04">*</b>验证码：</span>
              <div class="f-fl item-ifo">
                <input type="text" name="registerCode" maxlength="4" class="txt03 f-r3 f-fl required btn_part1" tabindex="4" style="width:167px" id="randCode" data-valid="isNonEmpty" data-error="验证码不能为空" />
                <span class="ie8 icon-close close hide"></span>
                <label class="f-size12 c-999 f-fl f-pl10"> <img src="${ctx}/pass/captcha-image.jpg" id="kaptchaImage" /> </label>
                <label class="icon-sucessfill blank hide" style="left:380px"></label>
                <label class="focusa">看不清？<a href="javascript:;" class="c-blue" onclick="$(this).parent().prev().prev().find('img').click()">换一张</a></label>
                <label class="focus valid" style="left:370px"></label>
              </div>
            </div>
            <div class="message item col-xs-12" style="height:auto"> <span class="intelligent-label f-fl">&nbsp;</span>
              <label class="valid"></label>
            </div>
            <div class="item col-xs-12" style="height:auto"> <span class="intelligent-label f-fl">&nbsp;</span>
              <p class="f-size14 required"  data-valid="isChecked" data-error="请先同意条款">
                <input type="checkbox"  checked />
                <a href="javascript:showoutc();" class="f-ml5">我已阅读并同意条款</a> </p>
              <label class="focus valid"></label>
            </div>
            <div class="item col-xs-12"> <span class="intelligent-label f-fl">&nbsp;</span>
              <div class="f-fl item-ifo"> <a href="javascript:;" class="btn btn-blue f-r3" id="btn_part1">下一步</a> </div>
            </div>
          </form>
        </div>
          <div class="part2" style="display:none">
            <div class="alert alert-info" style="width:700px">点击"发送验证码"，发送邮件至您电子邮箱，输入邮箱中的验证码，确保您的电子邮箱真实有效。</div>
            <div class="item col-xs-12 f-mb30 f-mt10" style="height:auto"> <span class="intelligent-label f-fl">电子邮箱：</span>
              <div class="f-fl item-ifo c-blue"> </div>
            </div>
            <div class="item col-xs-12"> <span class="intelligent-label f-fl"><b class="ftx04">*</b>验证码：</span>
              <div class="f-fl item-ifo">
                <input type="text" maxlength="6" name="emailCaptcha" id="verifyNo" class="txt03 f-r3 f-fl required btn_part2" tabindex="4" style="width:167px" data-valid="isNonEmpty" data-error="验证码不能为空" />
                <span class="btn btn-gray f-r3 f-ml5 f-size13" id="time_box" disabled style="width:97px;display:none;">发送验证码</span> <span class="btn btn-gray f-r3 f-ml5 f-size13" id="verifyYz" data-type="/pass/sendEmailRegister" data-emailSign="" style="width:97px;">发送验证码</span> <span class="ie8 icon-close close hide" style="right:130px"></span>
                <label class="icon-sucessfill blank hide"></label>
                <label class="focus"><span>请查收电子邮箱邮件，并填写邮件中的验证码（此验证码3分钟内有效）</span></label>
                <label class="focus valid"></label>
              </div>
            </div>
            <div class="message item col-xs-12" style="height:auto"> <span class="intelligent-label f-fl">&nbsp;</span>
              <label class="valid"></label>
            </div>
            <div class="item col-xs-12"> <span class="intelligent-label f-fl">&nbsp;</span>
              <div class="f-fl item-ifo"> <a href="javascript:;" class="btn btn-blue f-r3" id="btn_part2">注册</a> </div>
            </div>
          </div>
          <form method="post" id="creatUser">
          <div class="part3" style="display:none">
            <div class="item col-xs-12 f-mb20"> <span class="intelligent-label f-fl"><b class="ftx04">*</b>真实姓名：</span>
              <div class="f-fl item-ifo">
                <input type="text" name=realName maxlength="10" class="txt03 f-r3 required btn_part3" tabindex="1" data-valid="isNonEmpty||between:2-10||isZh" data-error="真实姓名不能为空||真实姓名长度2-10位||只能输入中文" id="adminNo" />
                <span class="ie8 icon-close close hide"></span>
                <label class="icon-sucessfill blank hide"></label>
                <label class="focus">2-10位，中文真实姓名</label>
                <label class="focus valid"></label>
              </div>
            </div>
            <div class="item col-xs-12"> <span class="intelligent-label f-fl"><b class="ftx04">*</b>手机号码：</span>
              <div class="f-fl item-ifo">
                <input type="text" name="telephone" class="txt03 f-r3 required btn_part3" keycodes="tel" tabindex="2" data-valid="isNonEmpty||isPhone" data-error="手机号码不能为空||手机号码格式不正确" maxlength="11" id="phone" />
                <span class="ie8 icon-close close hide"></span>
                <label class="icon-sucessfill blank hide"></label>
                <label class="focus">请填写11位有效的手机号码</label>
                <label class="focus valid"></label>
              </div>
            </div>
            <div class="message item col-xs-12" style="height:auto"> <span class="intelligent-label f-fl">&nbsp;</span>
              <label class="valid"></label>
            </div>
            <div class="item col-xs-12"> <span class="intelligent-label f-fl">&nbsp;</span>
              <div class="f-fl item-ifo"> <a href="javascript:;" class="btn btn-blue f-r3" id="btn_part3">下一步</a> </div>
            </div>
          </div>
        </form>
        <div class="part4 text-center" style="display:none">
          <h3></h3>
          <p class="c-666 f-mt30 f-mb50">页面将在 <strong id="times" class="f-size18">10</strong> 秒钟后，跳转到 <a href="${ctx}/pass/login" class="c-blue">登陆界面</a></p>
        </div>
        <div class="item col-xs-12" style="height:auto">
            <div class="lines" ></div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="m-sPopBg" style="z-index:998;"></div>
<div class="m-sPopCon regcon">
  <div class="m-sPopTitle"><strong>服务协议条款</strong><b id="sPopClose" class="m-sPopClose" onClick="closeClause()">×</b></div>
  <div class="apply_up_content">
    <pre class="f-r0">
		<strong>同意以下服务条款，提交注册信息</strong>
        </pre>
  </div>
  <center>
    <a class="btn btn-blue btn-lg f-size12 b-b0 b-l0 b-t0 b-r0 f-pl50 f-pr50 f-r3" href="javascript:closeClause();">已阅读并同意此条款</a>
  </center>
</div>
<footer class="footer clear">
  <div class="footer_copyright"> © 2016<a href="https://git.oschina.net/Morning_/Morning" target="_blank"> 穿鞋子的猫 </a>/ <span id="showsectime"></span> / <span id="TimeShow"></span> </div>
</footer>
<script src="${ctxsta}/common/jquery/jquery-2.1.4.min.js"></script> 
<script src="${ctxsta}/common/bootstrap/js/bootstrap.min.js"></script> 
<script src="${ctxsta}/os/user/js/register.js"></script> 
<script src="${ctxsta}/os/js/base.js"></script>
</body>
</html>