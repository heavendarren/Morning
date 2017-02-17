<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>登陆日志</title>
<link rel="stylesheet" href="${ctxsta}/admin/main/css/style.css" />
<link rel="stylesheet" href="${ctxsta}/common/bootstrap-table-master/bootstrap-table.min.css" />
<link rel="stylesheet" href="${ctxsta}/common/bootstrap-datepicker-master/css/bootstrap-datepicker.min.css" />
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
  <div class="ibox float-e-margins">
    <div class="ibox-title">
      <h5>用户登录日志</h5>
      <div class="ibox-tools"> <a class="collapse-link"><i class="fa fa-chevron-up"></i></a> <a class="close-link"><i class="fa fa-times"></i></a> </div>
    </div>
    <div class="ibox-content">
      <div class="row row-lg">
        <div class="col-sm-12">
          <div class="example-wrap">
            <div class="example">
              <table id="table"
                                   data-toggle="table"
                                   data-height="400"
                                   data-search="true"
                                   data-show-refresh="true"
                                   data-show-toggle="true"
                                   data-show-export="true"
                                   data-show-pagination-switch="true"
                                   data-show-columns="true"
                                   data-striped="true"
                                   data-pagination="true"
                                   data-sort-name="stargazers_count"
                                   data-sort-order="desc">
                <thead>
                  <tr>
                    <th data-halign="center" data-align="center" data-sortable="true">登录时间</th>
                    <th data-halign="center" data-align="center" data-sortable="true">登录IP</th>
                    <th data-halign="center" data-align="center" data-sortable="true">操作系统</th>
                    <th data-halign="center" data-align="center" data-sortable="true">游览器</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${userLoginLogs}" var="userLoginLog">
                    <tr>
                      <td><fmt:formatDate value="${userLoginLog.loginTime}" pattern="yyyy/MM/dd HH:mm" /></td>
                      <td>${userLoginLog.userIp}</td>
                      <td>${userLoginLog.operatingSystem}</td>
                      <td>${userLoginLog.browser}</td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<myfooter> 
  <!-- Bootstrap table --> 
  <script src="${ctxsta}/common/bootstrap-table-master/bootstrap-table.min.js"></script> 
  <script src="${ctxsta}/common/bootstrap-table-master/extensions/export/bootstrap-table-export.js"></script> 
  <script src="${ctxsta}/common/bootstrap-table-master/tableExport.js"></script> 
  <script src="${ctxsta}/common/bootstrap-table-master/locale/bootstrap-table-zh-CN.min.js"></script> 
</myfooter>
</body>
</html>