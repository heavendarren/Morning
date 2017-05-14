<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>管理员登录日志 - 猫宁Morning</title>
<link rel="stylesheet" href="${ctxsta}/common/bootstrap-table/bootstrap-table.min.css" />
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
  <div class="row">
    <div class="col-sm-12">
      <div class="ibox float-e-margins">
        <div class="ibox-title">
          <h5>管理员登录日志</h5>
          <div class="ibox-tools"> <a class="collapse-link"><i class="fa fa-chevron-up"></i></a> <a class="close-link"><i class="fa fa-times"></i></a> </div>
        </div>
        <div class="ibox-content">
          <div class="row row-lg">
            <div class="col-sm-12">
              <div class="example-wrap">
                <div class="example">
                  <table id="table"
                         data-toggle="table"
                         data-height="450"
                         data-search="true"
                         data-show-refresh="true"
                         data-show-toggle="true"
                         data-show-export="true"
                         data-url="${ctx}/administrator/list/${userId}/logs"
                         data-pagination="true"
                         data-page-size="20"
                         data-page-list="[20, 50, 100, 200]"
                         data-side-pagination="server"
                         data-striped="true"
                         data-pagination="true"
                         data-sort-name="loginTime"
                         data-sort-order="desc">
                  <thead>
                    <tr>
                      <th data-field="loginTime" data-formatter="loginTimeFormatter" data-halign="center" data-align="center" data-sortable="true">登录时间</th>
                      <th data-field="userIp" data-halign="center" data-align="center" data-sortable="true">登录IP</th>
                      <th data-field="operatingSystem" data-halign="center" data-align="center" data-sortable="true">操作系统</th>
                      <th data-field="browser" data-halign="center" data-align="center" data-sortable="true">游览器</th>
                    </tr>
                  </thead>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<myfooter> 
  <!-- Bootstrap table --> 
  <script src="${ctxsta}/common/bootstrap-table/bootstrap-table.min.js"></script> 
  <script src="${ctxsta}/common/bootstrap-table/extensions/export/bootstrap-table-export.js"></script> 
  <script src="${ctxsta}/common/bootstrap-table/tableExport.js"></script> 
  <script src="${ctxsta}/common/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script> 
  <script>
  	function loginTimeFormatter(value) {
		return new Date(value).Format("yyyy-MM-dd HH:mm:ss");
	}
  </script>
</myfooter>
</body>
</html>
