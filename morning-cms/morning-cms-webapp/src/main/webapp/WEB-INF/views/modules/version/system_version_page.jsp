<%@ page language="java" import="java.util.*"  contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<link rel="stylesheet" href="${ctxsta}/admin/main/css/style.css" />
<div id="vertical-timeline" class="vertical-container light-timeline" data-total="${pageInfo.total}" data-nowpage="${pageInfo.nowpage}" >
  <c:forEach items="${versionLogs}" var="versionLog"  varStatus="status">
   <div class="vertical-timeline-block">
   	<c:if test="${status.index % 5 == 0 }"><div class="vertical-timeline-icon navy-bg"> <i class="fa fa-briefcase"></i> </div></c:if>
    <c:if test="${status.index % 5 == 1 }"><div class="vertical-timeline-icon blue-bg"> <i class="fa fa-file-text"></i> </div></c:if>
    <c:if test="${status.index % 5 == 2 }"><div class="vertical-timeline-icon lazur-bg"> <i class="fa fa-coffee"></i> </div></c:if>
    <c:if test="${status.index % 5 == 3 }"><div class="vertical-timeline-icon yellow-bg"> <i class="fa fa-phone"></i> </div></c:if>
    <c:if test="${status.index % 5 == 4 }"><div class="vertical-timeline-icon lazur-bg"> <i class="fa fa-user-md"></i> </div></c:if>
    <div class="vertical-timeline-content">
      <h2>${versionLog.logTitle}</h2>
      <p>${versionLog.logContent}</p>
      <span class="vertical-date"> ${versionLog.createBy} <br>
      <small> <fmt:formatDate value="${versionLog.createTime}" pattern="yyyy/MM/dd HH:mm" /> </small> </span> </div>
  </div> 
  </c:forEach>
</div>