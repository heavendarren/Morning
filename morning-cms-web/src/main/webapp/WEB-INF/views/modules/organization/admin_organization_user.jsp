<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>组织管理</title>
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
  <div class="row">
    <c:forEach items="${userVOs}" var="userVO">
      <div class="col-sm-4">
        <div class="contact-box">
          <div class="col-sm-4">
            <div class="text-center"> <img src="${ctximg}/${userVO.picImg}" alt="头像加载中..." class="img-circle m-t-xs img-responsive">
              <div class="m-t-xs font-bold">${userVO.userName }</div>
            </div>
          </div>
          <div class="col-sm-8">
            <h3><strong>${userVO.realName }</strong></h3>
            <p><i class="fa fa-map-marker"></i>
              <c:forEach items="${userVO.roles}" var="role">${role.roleName}&nbsp;&nbsp;</c:forEach>
            </p>
            <address>
            <strong>${userVO.sex eq '0'?'保密':''}${userVO.sex eq '1'?'男':''}${userVO.sex eq '2'?'女':''}&nbsp; ${userVO.age }</strong><br>
            E-mail:${userVO.email }<br>
            <abbr title="Phone">Tel:</abbr> ${userVO.telephone }<br>
            	上次登录时间:
            <fmt:formatDate value="${userVO.lastLoginTime}" pattern="yyyy/MM/dd HH:mm" />
            <br>
            </address>
          </div>
          <div class="clearfix"></div>
        </div>
      </div>
    </c:forEach>
  </div>
</div>
<myfooter> 
  <script type="text/javascript">
        $(document).ready(function () {
            $('.contact-box').each(function () {
                animationHover(this, 'pulse');
            });
        });
     </script> 
</myfooter>
</body>
</html>