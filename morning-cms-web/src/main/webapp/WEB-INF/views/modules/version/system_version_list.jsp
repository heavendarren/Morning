<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>版本日志 - 猫宁Morning</title>
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
  <div class="row">
    <div class="col-sm-12">
      <div class="ibox float-e-margins">
        <div class="text-center float-e-margins p-md"> <span>预览：</span> <a href="#" class="btn btn-xs btn-primary" id="lightVersion">浅色</a> <a href="#" class="btn btn-xs btn-primary" id="darkVersion">深色</a> <a href="#" class="btn btn-xs btn-primary" id="leftVersion">布局切换</a> </div>
        <div id="ibox-content">
          <div id="vertical-timeline" class="vertical-container light-timeline">
            <c:forEach items="${versionLogs}" var="versionLog">
              <div class="vertical-timeline-block">
                <div class="vertical-timeline-icon"> <i class="fa"></i> </div>
                <div class="vertical-timeline-content">
                  <h2>${versionLog.logTitle}</h2>
                  <p>${versionLog.logContent}</p>
                  <span class="vertical-date"> ${versionLog.createBy} <br>
                  <small>
                  <fmt:formatDate value="${versionLog.createTime}" pattern="yyyy/MM/dd HH:mm" />
                  </small> </span> </div>
              </div>
            </c:forEach>
          </div>
        </div>
        <c:if test="${pageInfo.current lt pageInfo.totalPage}">
          <button class="btn btn-primary btn-block m more-button" onclick="options(this)" data-pager-limit="${pageInfo.limit}" data-pager-current="${pageInfo.current}"><i class="fa fa-arrow-down"></i> 显示更多</button>
        </c:if>
        <c:if test="${pageInfo.current ge pageInfo.totalPage}">
          <div class="spiner-example">
            <div class="sk-spinner sk-spinner-cube-grid">
              <div class="sk-cube"></div>
              <div class="sk-cube"></div>
              <div class="sk-cube"></div>
              <div class="sk-cube"></div>
              <div class="sk-cube"></div>
              <div class="sk-cube"></div>
              <div class="sk-cube"></div>
              <div class="sk-cube"></div>
              <div class="sk-cube"></div>
            </div>
          </div>
          <h4 class="text-center">没有更多数据了...</h4>
        </c:if>
      </div>
    </div>
  </div>
</div>
<myfooter> 
  <script src="${ctxsta}/cms/js/systemVersionList.js"></script> 
</myfooter>
</body>
</html>