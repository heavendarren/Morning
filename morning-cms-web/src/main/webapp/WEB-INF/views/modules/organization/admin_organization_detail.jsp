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
    <c:forEach items="${organizationVOs}" var="organizationVO">
      <div class="col-sm-4">
        <div class="ibox">
          <div class="ibox-title">
            <c:if test="${organizationVO.status eq '0' }"> <span class="label label-danger pull-right">冻结</span></c:if>
            <h5>编号-${organizationVO.organizationId } - ${organizationVO.organizationName }</h5>
          </div>
          <div class="ibox-content">
            <div class="team-members"> <a href="${ctx}/administrator/organization/${organizationVO.organizationId }/detail">
              <c:forEach items="${organizationVO.users }" var="user"><img src="${ctximg}/${user.picImg}" alt="头像加载中..." class="img-circle"> </c:forEach>
              </a></div>
            <h4>组织简介</h4>
            <p> ${organizationVO.remarks } </p>
            <div class="row  m-t-sm">
              <div class="col-sm-4">
                <div class="font-bold">组织人数</div>
                <i class="fa fa-user-times text-navy"></i>&nbsp;&nbsp;&nbsp;&nbsp;${organizationVO.numberUser } </div>
              <div class="col-sm-4 col-md-offset-4 text-right">
                <div class="font-bold">成立时间</div>
                <i class="fa fa-calendar-times-o text-navy"></i>&nbsp;&nbsp;
                <fmt:formatDate value="${organizationVO.createTime}" pattern="yyyy/MM/dd HH:mm" />
              </div>
            </div>
          </div>
        </div>
      </div>
    </c:forEach>
  </div>
</div>
</body>
</html>