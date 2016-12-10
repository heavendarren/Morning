<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
  	<link rel="stylesheet" href="${ctxsta}/common/treeTable/themes/vsStyle/treeTable.min.css" />
  	<link rel="stylesheet" href="${ctxsta}/common/treeTable/themes/demo.css" />
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>菜单列表</h5>
                <div class="ibox-tools">
                    <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                    <a class="close-link"><i class="fa fa-times"></i></a>
                </div>
            </div>
            <div class="ibox-content">
                <div class="row row-lg">
                    <div class="col-sm-12">
	                    <div class="btn-group m-t-sm">
	                        <button type="button" class="btn btn-default"  title="创建用户" onclick="member_show('创建菜单','${ctx}/system/manage/menu/1/add',null,null,'1000',null)">
	                            <i class="glyphicon glyphicon-plus"></i>
	                        </button>
	                        <button type="button" class="btn btn-default"  title="刷新列表" onclick="javascript:window.location.reload()">
	                            <i class="glyphicon glyphicon-refresh"></i>
	                        </button>                                           
	                    </div>
						<table id="treeTable" class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>菜单名称</th>
									<th>权限代码</th>
									<th>链接地址</th>
									<th class="text-center">排序</th>
									<th class="text-center">状态</th>
									<th class="text-center">权限标识</th>
									<th class="text-center">操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${systemMenus }" var="systemMenu">
								<tr id="${systemMenu.menuId}" pId="${systemMenu.parentId ne '1'?systemMenu.parentId:'0'}">
									<td class="<c:if test="${systemMenu.parentId==1}">menuName</c:if>"><i class="fa fa-${not empty systemMenu.icon?systemMenu.icon:' hide'} m-l-xs m-r-xs"></i>${systemMenu.menuName}</td>
									<td>${systemMenu.menuCode}</td>
									<td>${systemMenu.href}</td>
									<td style="text-align:center;">${systemMenu.sort}</td>
                                    <td class="td-status" style="text-align:center;">
	                                    <c:if test="${systemMenu.status==1}"><span class="label label-primary">正常</span></c:if>
										<c:if test="${systemMenu.status==0}"><span class="label label-danger">冻结</span></c:if>
                                    </td>									
									<td class="text-center">${systemMenu.permission}</td>
									<td class="td-manage text-center">  
	                                    <c:if test="${systemMenu.status==1}"><a class="like text-info" href="javascript:void(0)" onClick="member_stop(this,'${ctx}/system/manage/menu/${systemMenu.menuId}/audit')" title="冻结"><i class="glyphicon glyphicon-pause"></i></a></c:if>
	                                    <c:if test="${systemMenu.status==0}"><a class="like text-info" href="javascript:void(0)" onClick="member_start(this,'${ctx}/system/manage/menu/${systemMenu.menuId}/audit')" title="启用"><i class="glyphicon glyphicon-play"></i></a></c:if>
	                                    <a class="edit m-l-sm text-warning" href="javascript:void(0)" onclick="member_show('${systemMenu.menuName}','${ctx}/system/manage/menu/${systemMenu.menuId}/edit',null,null,'1000',null)" title="编辑">
	                                    <i class="glyphicon glyphicon-edit"></i>
	                                    </a>
	                                    <a class="remove m-l-sm text-danger" href="javascript:void(0)" onclick="member_delete(this,'${ctx}/system/manage/menu/${systemMenu.menuId}/delete','确认要删除该目录?')" title="删除">
	                                    <i class="glyphicon glyphicon-remove"></i>
	                                    </a>
	                                    <c:if test="${systemMenu.menuType!=0 }">
	                                    <a class="remove m-l-sm text-primary" href="javascript:void(0)" onclick="member_show('创建菜单','${ctx}/system/manage/menu/${systemMenu.menuId}/add',null,null,'1000',null)" title="添加下级菜单">
	                                    <i class="glyphicon glyphicon-sort-by-attributes-alt"></i>
	                                    </a>
	                                    </c:if>
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
    <myfooter>
    <script src="${ctxsta}/common/treeTable/jquery.treeTable.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#treeTable").treeTable({expandLevel : 2}).show();
		});
     </script>
    </myfooter>
</body>
</html>