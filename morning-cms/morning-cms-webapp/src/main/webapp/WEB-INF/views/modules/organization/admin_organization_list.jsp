<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>组织管理</title>
<link rel="stylesheet" href="${ctxsta}/admin/main/css/style.css" />
<link rel="stylesheet" href="${ctxsta}/common/bootstrap-table-master/bootstrap-table.min.css" />
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
  <div class="ibox float-e-margins">
    <div class="ibox-title">
      <h5>组织管理</h5>
      <div class="ibox-tools"> <a class="collapse-link"><i class="fa fa-chevron-up"></i></a> <a class="close-link"><i class="fa fa-times"></i></a> </div>
    </div>
    <div class="ibox-content">
      <div class="row row-lg">
        <div class="col-sm-12">
          <div class="example-wrap">
            <div class="example">
              <div id="toolbar" class="btn-group m-t-sm">
                <shiro:hasPermission name="administrator:organization:create">
                  <button type="button" class="btn btn-default"  title="创建组织" onclick="member_show('创建组织','${ctx}/administrator/organization/create',null,null,'1000','600')"> <i class="glyphicon glyphicon-plus"></i> </button>
                </shiro:hasPermission>
                <button type="button" class="btn btn-default"  title="刷新列表" onclick="javascript:window.location.reload()"> <i class="glyphicon glyphicon-refresh"></i> </button>
                <button type="button" class="btn btn-default"  title="查看详情" onclick="javascript:window.location.href='${ctx}/administrator/organization/detail'"> <i class="glyphicon glyphicon-th-list"></i> </button>
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
                    <th data-halign="center" data-align="center" data-sortable="true">组织名称</th>
                    <th data-halign="center" data-align="center" data-sortable="true">系统数据</th>
                    <th data-halign="center" data-align="center" data-sortable="true">状态</th>
                    <th data-halign="center" data-align="center" data-sortable="true">创建人</th>
                    <th data-halign="center" data-align="center" data-sortable="true">创建时间</th>                    
                    <th data-halign="center" data-align="center" data-sortable="true">更新者</th>
                    <th data-halign="center" data-align="center" data-sortable="true">更新时间</th>
                    <th data-halign="center" data-align="center" data-sortable="true">备注</th>
                    <th data-halign="center" data-align="center" data-sortable="true">操作</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${organizations}" var="organization">
                    <tr>
                      <td>${organization.organizationName}</td>
                      <td><c:if test="${organization.isSystem==1}"><span class="label label-danger">是</span></c:if>
                        <c:if test="${organization.isSystem==0}"><span class="label label-primary">否</span></c:if></td>
                      <td class="td-status"><c:if test="${organization.status==1}"><span class="label label-primary">正常</span></c:if>
                        <c:if test="${organization.status==0}"><span class="label label-danger">冻结</span></c:if></td>
                      <td>${organization.createBy}</td>
                      <td><fmt:formatDate value="${organization.createTime}" pattern="yyyy/MM/dd HH:mm" /></td>                      
                      <td>${organization.updateBy}</td>
                      <td><fmt:formatDate value="${organization.updateTime}" pattern="yyyy/MM/dd HH:mm" /></td>
                      <td>${organization.remarks}</td>
                      <td class="td-manage"><c:if test="${organization.isSystem==1}">
                          <shiro:hasRole name="admin">
                            <shiro:hasPermission name="administrator:organization:audit">
                              <c:if test="${organization.status==1}"><a class="like text-info" href="javascript:void(0)" onClick="member_stop(this,'${ctx}/administrator/organization/${organization.organizationId}/audit')" title="冻结"><i class="glyphicon glyphicon-pause"></i></a></c:if>
                              <c:if test="${organization.status==0}"><a class="like text-info" href="javascript:void(0)" onClick="member_start(this,'${ctx}/administrator/organization/${organization.organizationId}/audit')" title="启用"><i class="glyphicon glyphicon-play"></i></a></c:if>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="administrator:organization:edit"> <a class="edit m-l-sm text-warning" href="javascript:void(0)" onclick="member_show('${organization.organizationName }','${ctx}/administrator/organization','${organization.organizationId}','edit','1000','600')" title="编辑"> <i class="glyphicon glyphicon-edit"></i> </a> </shiro:hasPermission>
                            <shiro:hasPermission name="administrator:organization:delete"> <a class="remove m-l-sm text-danger" href="javascript:void(0)" onclick="member_delete(this,'${ctx}/administrator/organization/'+${organization.organizationId}+'/delete','确认要删除该用户吗?')" title="删除"> <i class="glyphicon glyphicon-remove"></i> </a> </shiro:hasPermission>
                          </shiro:hasRole>
                        </c:if>
                        <c:if test="${organization.isSystem==0}">
                            <shiro:hasPermission name="administrator:organization:audit">
                              <c:if test="${organization.status==1}"><a class="like text-info" href="javascript:void(0)" onClick="member_stop(this,'${ctx}/administrator/organization/${organization.organizationId}/audit')" title="冻结"><i class="glyphicon glyphicon-pause"></i></a></c:if>
                              <c:if test="${organization.status==0}"><a class="like text-info" href="javascript:void(0)" onClick="member_start(this,'${ctx}/administrator/organization/${organization.organizationId}/audit')" title="启用"><i class="glyphicon glyphicon-play"></i></a></c:if>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="administrator:organization:edit"> <a class="edit m-l-sm text-warning" href="javascript:void(0)" onclick="member_show('${organization.organizationName }','${ctx}/administrator/organization','${organization.organizationId}','edit','1000','600')" title="编辑"> <i class="glyphicon glyphicon-edit"></i> </a> </shiro:hasPermission>
                            <shiro:hasPermission name="administrator:organization:delete"> <a class="remove m-l-sm text-danger" href="javascript:void(0)" onclick="member_delete(this,'${ctx}/administrator/organization/'+${organization.organizationId}+'/delete','确认要删除该用户吗?')" title="删除"> <i class="glyphicon glyphicon-remove"></i> </a> </shiro:hasPermission>
                        </c:if>
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