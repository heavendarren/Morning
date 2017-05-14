<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>管理员分类列表 - 猫宁Morning</title>
<link rel="stylesheet" href="${ctxsta}/common/bootstrap-table/bootstrap-table.min.css" />
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
  <div class="row">
    <div class="col-sm-12">
      <div class="ibox float-e-margins">
        <div class="ibox-title">
          <h5>管理员分类列表</h5>
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
                         data-url="${ctx}/administrator/organization/${organizationId}/lists"
                         data-pagination="true"
                         data-page-size="20"
                         data-page-list="[20, 50, 100, 200]"
                         data-side-pagination="server"
                         data-striped="true"
                         data-pagination="true"
                         data-sort-order="desc"
                         data-toolbar="#toolbar">
                    <thead>
                      <tr>
                        <th data-field="userName" data-formatter="nameFormatter" data-halign="center" data-align="center" data-sortable="true">昵称</th>
                        <th data-field="realName" data-halign="center" data-align="center" data-sortable="true">姓名</th>
                        <th data-field="telephone" data-halign="center" data-align="center" data-sortable="true">手机</th>
                        <th data-field="email" data-halign="center" data-align="center" data-sortable="true">邮箱</th>
                        <th data-field="organizationName" data-halign="center" data-align="center" data-sortable="true">组织</th>
                        <th data-field="createTime" data-formatter="registerTimeFormatter" data-halign="center" data-align="center" data-sortable="true">注册时间</th>
                        <th data-field="lastLoginTime" data-formatter="loginTimeFormatter" data-halign="center" data-align="center" data-sortable="true">最后登录时间</th>
                        <th data-field="lastLoginIp" data-halign="center" data-align="center" data-sortable="true">登录IP</th>
                        <th data-field="status" data-formatter="statusFormatter" data-halign="center" data-align="center">状态</th>
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
  <!-- 自定义js --> 
  <script src="${ctxsta}/cms/js/adminUserList.js"></script> 
</myfooter>
</body>
</html>