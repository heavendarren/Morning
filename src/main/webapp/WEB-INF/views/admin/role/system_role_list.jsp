<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>管理员分类列表</title>
    <link rel="stylesheet" href="${ctxsta}/common/bootstrap-table-master/bootstrap-table.min.css" />
  </head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>管理员分类信息</h5>
                <div class="ibox-tools">
                    <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                    <a class="close-link"><i class="fa fa-times"></i></a>
                </div>
            </div>
            <div class="ibox-content">
                <div class="row row-lg">
                    <div class="col-sm-12">
                        <div class="example-wrap">
                            <div class="example">
                                <div id="toolbar" class="btn-group m-t-sm">
                                    <button type="button" class="btn btn-default"  title="创建用户" onclick="member_show('创建用户','${ctx}/system/sysuser/role/add',null,null,'1000',null)">
                                        <i class="glyphicon glyphicon-plus"></i>
                                    </button>
                                </div>
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
                                   data-sort-order="desc"
                                   data-toolbar="#toolbar">
                                <thead>
                                <tr>
                                    <th data-halign="center" data-align="center" data-sortable="true">角色名称</th>
                                    <th data-halign="center" data-align="center" data-sortable="true">归属部门</th>
                                    <th data-halign="center" data-align="center" data-sortable="true">系统数据</th>
                                    <th data-halign="center" data-align="center" data-sortable="true">备注</th>
                                    <th data-halign="center" data-align="center" data-sortable="true">状态</th>
                                    <th data-halign="center" data-align="center" data-sortable="true">更新者</th>
                                    <th data-halign="center" data-align="center" data-sortable="true">更新时间</th>                                    
                                    <th data-halign="center" data-align="center" data-sortable="true">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${systemRoles}" var="systemRole">
                                <tr>
                                	<td>${systemRole.roleName}</td>
                                    <td>${systemRole.roleOffice}</td>
                                    <td>${systemRole.isSystem}</td>
                                    <td>${systemRole.remarks}</td>
                                    <td class="td-status">
                                    <c:if test="${systemRole.status==1}"><span class="label label-primary">正常</span></c:if>
                                    <c:if test="${systemRole.status==0}"><span class="label label-danger">冻结</span></c:if>
                                    </td>
                                    <td>${systemRole.updateBy}</td>
									<td><fmt:formatDate value="${systemRole.updateTime}" pattern="yyyy/MM/dd HH:mm" /></td>                                    
                                    <td class="td-manage">  
	                                    <c:if test="${systemRole.status==1}"><a class="like text-info" href="javascript:void(0)" onClick="member_stop(this,${systemUsers.accountId})" title="冻结"><i class="glyphicon glyphicon-pause"></i></a></c:if>
	                                    <c:if test="${systemRole.status==0}"><a class="like text-info" href="javascript:void(0)" onClick="member_start(this,${systemUsers.accountId})" title="启用"><i class="glyphicon glyphicon-play"></i></a></c:if>
	                                    <a class="edit m-l-sm text-warning" href="javascript:void(0)" onclick="member_show('${systemRole.roleName }','${ctx}/system/sysuser/role','${systemRole.roleId}','edit','1000',null)" title="编辑">
	                                    <i class="glyphicon glyphicon-edit"></i>
	                                    </a>
	                                    <a class="remove m-l-sm text-danger" href="javascript:void(0)" onclick="member_delete(this,'${ctx}/system/sysuser/role/'+${systemRole.roleId}+'/delete','确认要删除该用户吗?')" title="删除">
	                                    <i class="glyphicon glyphicon-remove"></i>
	                                    </a>
	                                    <a class="remove m-l-sm text-primary" href="javascript:void(0)" onclick="member_show('${systemRole.roleName }','${ctx}/system/sysuser/list','${systemRole.roleId}','role','1000',null)" title="用户列表">
	                                    <i class="glyphicon glyphicon-list-alt"></i>
	                                    </a>
                                   </td>
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