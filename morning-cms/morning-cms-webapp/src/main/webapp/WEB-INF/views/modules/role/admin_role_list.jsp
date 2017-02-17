<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>角色管理</title>
<link rel="stylesheet" href="${ctxsta}/admin/main/css/style.css" />
<link rel="stylesheet" href="${ctxsta}/common/bootstrap-table-master/bootstrap-table.min.css" />
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
  <div class="ibox float-e-margins">
    <div class="ibox-title">
      <h5>角色管理</h5>
      <div class="ibox-tools"> <a class="collapse-link"><i class="fa fa-chevron-up"></i></a> <a class="close-link"><i class="fa fa-times"></i></a> </div>
    </div>
    <div class="ibox-content">
      <div class="row row-lg">
        <div class="col-sm-12">
          <div class="example-wrap">
            <div class="example">
              <div id="toolbar" class="btn-group m-t-sm">
                <shiro:hasPermission name="administrator:role:create">
                  <button type="button" class="btn btn-default"  title="创建用户" onclick="member_show('创建用户','${ctx}/administrator/role/create',null,null,'1000',null)"> <i class="glyphicon glyphicon-plus"></i> </button>
                </shiro:hasPermission>
                <button type="button" class="btn btn-default"  title="刷新列表" onclick="javascript:window.location.reload()"> <i class="glyphicon glyphicon-refresh"></i> </button>
              </div>
              <table id="table"
                                   data-toggle="table"
                                   data-height="500"
                                   data-search="true"
                                   data-show-refresh="true"
                                   data-show-toggle="true"
                                   data-show-export="true"
                                   data-show-pagination-switch="true"
                                   data-show-columns="true"
                                   data-striped="true"
                                   data-pagination="true"
                                   data-sort-name="stargazers_count"
                                   data-sort-order="desc"
                                   data-toolbar="#toolbar">
                <thead>
                  <tr>
                    <th data-halign="center" data-align="center" data-sortable="true">角色名称</th>
                    <th data-halign="center" data-align="center" data-sortable="true">角色标志</th>
                    <th data-halign="center" data-align="center" data-sortable="true">系统数据</th>
                    <th data-halign="center" data-align="center" data-sortable="true">备注</th>
                    <th data-halign="center" data-align="center" data-sortable="true">状态</th>
                    <th data-halign="center" data-align="center" data-sortable="true">更新者</th>
                    <th data-halign="center" data-align="center" data-sortable="true">更新时间</th>
                    <th data-halign="center" data-align="center" data-sortable="true">操作</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${roles}" var="role">
                    <tr>
                      <td>${role.roleName}</td>
                      <td>${role.roleSign}</td>
                      <td><c:if test="${role.isSystem==1}"><span class="label label-danger">是</span></c:if>
                        <c:if test="${role.isSystem==0}"><span class="label label-primary">否</span></c:if></td>
                      <td>${role.remarks}</td>
                      <td class="td-status"><c:if test="${role.status==1}"><span class="label label-primary">正常</span></c:if>
                        <c:if test="${role.status==0}"><span class="label label-danger">冻结</span></c:if></td>
                      <td>${role.updateBy}</td>
                      <td><fmt:formatDate value="${role.updateTime}" pattern="yyyy/MM/dd HH:mm" /></td>
                      <td class="td-manage"><c:if test="${role.isSystem==1}">
                          <shiro:hasRole name="admin">
                            <shiro:hasPermission name="administrator:role:audit">
                              <c:if test="${role.status==1}"><a class="like text-info" href="javascript:void(0)" onClick="member_stop(this,'${ctx}/administrator/role/${role.roleId}/audit')" title="冻结"><i class="glyphicon glyphicon-pause"></i></a></c:if>
                              <c:if test="${role.status==0}"><a class="like text-info" href="javascript:void(0)" onClick="member_start(this,'${ctx}/administrator/role/${role.roleId}/audit')" title="启用"><i class="glyphicon glyphicon-play"></i></a></c:if>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="administrator:role:edit"> <a class="edit m-l-sm text-warning" href="javascript:void(0)" onclick="member_show('${role.roleName }','${ctx}/administrator/role','${role.roleId}','edit','1000',null)" title="编辑"> <i class="glyphicon glyphicon-edit"></i> </a> </shiro:hasPermission>
                            <shiro:hasPermission name="administrator:role:delete"> <a class="remove m-l-sm text-danger" href="javascript:void(0)" onclick="member_delete(this,'${ctx}/administrator/role/'+${role.roleId}+'/delete','确认要删除该用户吗?')" title="删除"> <i class="glyphicon glyphicon-remove"></i> </a> </shiro:hasPermission>
                          </shiro:hasRole>
                        </c:if>
                        <c:if test="${role.isSystem==0}">
                          <shiro:hasPermission name="administrator:role:audit">
                            <c:if test="${role.status==1}"><a class="like text-info" href="javascript:void(0)" onClick="member_stop(this,'${ctx}/administrator/role/${role.roleId}/audit')" title="冻结"><i class="glyphicon glyphicon-pause"></i></a></c:if>
                            <c:if test="${role.status==0}"><a class="like text-info" href="javascript:void(0)" onClick="member_start(this,'${ctx}/administrator/role/${role.roleId}/audit')" title="启用"><i class="glyphicon glyphicon-play"></i></a></c:if>
                          </shiro:hasPermission>
                          <shiro:hasPermission name="administrator:role:edit"> <a class="edit m-l-sm text-warning" href="javascript:void(0)" onclick="member_show('${role.roleName }','${ctx}/administrator/role','${role.roleId}','edit','1000',null)" title="编辑"> <i class="glyphicon glyphicon-edit"></i> </a> </shiro:hasPermission>
                          <shiro:hasPermission name="administrator:role:delete"> <a class="remove m-l-sm text-danger" href="javascript:void(0)" onclick="member_delete(this,'${ctx}/administrator/role/'+${role.roleId}+'/delete','确认要删除该用户吗?')" title="删除"> <i class="glyphicon glyphicon-remove"></i> </a> </shiro:hasPermission>
                        </c:if>
                        <a class="remove m-l-sm text-primary" href="javascript:void(0)" onclick="member_show('${role.roleName }','${ctx}/administrator/role','${role.roleId}','list','1000','600')" title="用户列表"> <i class="glyphicon glyphicon-list-alt"></i> </a></td>
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