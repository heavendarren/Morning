<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>管理员分类列表</title>
<link rel="stylesheet" href="${ctxsta}/admin/main/css/style.css" />
<link rel="stylesheet" href="${ctxsta}/common/bootstrap-table-master/bootstrap-table.min.css" />
<link rel="stylesheet" href="${ctxsta}/common/bootstrap-datepicker-master/css/bootstrap-datepicker.min.css" />
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
  <div class="ibox float-e-margins">
    <div class="ibox-title">
      <h5>管理员分类信息</h5>
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
                    <th data-halign="center" data-align="center" data-sortable="true">编号</th>
                    <th data-halign="center" data-align="center" data-sortable="true">昵称</th>
                    <th data-halign="center" data-align="center" data-sortable="true">姓名</th>
                    <th data-halign="center" data-align="center" data-sortable="true">手机</th>
                    <th data-halign="center" data-align="center" data-sortable="true">邮箱</th>
                    <th data-halign="center" data-align="center" data-sortable="true">注册时间</th>
                    <th data-halign="center" data-align="center" data-sortable="true">最后登录时间</th>
                    <th data-halign="center" data-align="center" data-sortable="true">登录IP</th>
                    <th data-halign="center" data-align="center">状态</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${users}" var="users">
                    <tr>
                      <td>${users.userId}</td>
                      <td><a href="javascript:void(0)" onclick="member_show('${users.userName}','${ctx}/administrator/list','${users.userId}','detail','500','400')">${users.userName}</a></td>
                      <td>${users.realName}</td>
                      <td>${users.telephone}</td>
                      <td>${users.email}</td>
                      <td><fmt:formatDate value="${users.createTime}" pattern="yyyy/MM/dd" /></td>
                      <td><fmt:formatDate value="${users.lastLoginTime}" pattern="yyyy/MM/dd HH:mm" /></td>
                      <td>${users.lastLoginIp}</td>
                      <td class="td-status"><span class="label ${user.status eq '1'?'label-primary':'label-danger'}">${user.status eq '1'?'正常':'冻结'}</span></td>
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