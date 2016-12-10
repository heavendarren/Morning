<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>用户列表</title>
    <link rel="stylesheet" href="${ctxsta}/common/bootstrap-table-master/bootstrap-table.min.css" />
    <link rel="stylesheet" href="${ctxsta}/common/bootstrap-datepicker-master/css/bootstrap-datepicker.min.css" />
  </head>
  
  <body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>用户数量</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            <a class="close-link"><i class="fa fa-times"></i></a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins">${sysUserNumber}</h1>
                        <div class="stat-percent font-bold text-danger">${updateTime}</div>
                        <small>更新时间</small>
                    </div>
                </div>
            </div>
            <div class="col-sm-9">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>搜索查询</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            <a class="close-link"><i class="fa fa-times"></i></a>
                        </div>
                    </div>
                    <div class="ibox-content search-query">
                    <form action="${ctx}/system/sysuser/list" method="post" id="searchForm">
                        <div class="col-sm-6">
                            <div class="form-group" id="data_5">
                                <label class="control-label">添加时间</label>
                                <div class="input-daterange input-group" id="datepicker">
                                    <input type="text" class="form-control" name="queryUser.beginCreateTime" value="" />
                                    <span class="input-group-addon">到</span>
                                    <input type="text" class="form-control" name="queryUser.endCreateTime" value="" />
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="control-label">会员名称</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" name="queryUser.searchContent"> 
                                    <span class="input-group-btn"><button type="button" class="btn btn-primary" onclick="javascript:$('#searchForm').submit();">搜索</button> </span>
                                </div>
                            </div>
                        </div>
                    </form>
                    </div>
                </div>
            </div>
       </div>
       <div class="row">
            <div class="col-sm-3">
                <div class="ibox">
                    <div class="ibox-content">
                        <h3>管理员分类列表</h3>
                        <p class="small"><i class="fa fa-hand-o-up"></i> 在列表之间拖动管理员角色</p>
                        <ul class="sortable-list connectList agile-list">
                        <c:forEach items="${systemRoles}" var="systemRole" varStatus="status">
                            <li class="<c:if test="${status.index % 3 == 0 }">success-element</c:if><c:if test="${status.index % 3 == 1 }">warning-element</c:if><c:if test="${status.index % 3 == 2 }">info-element</c:if>">
                                ${systemRole.roleName }<span class="badge <c:if test="${status.index % 3 == 0 }">badge-primary</c:if><c:if test="${status.index % 3 == 1 }">badge-warning</c:if><c:if test="${status.index % 3 == 2 }">badge-success</c:if> m-l">${systemRole.number}</span>
                                <div class="agile-detail">
                                    <a onclick="member_show('${systemRole.roleName }','${ctx }/system/sysuser/list','${systemRole.roleId}','role','1000','600')" class="pull-right btn btn-xs <c:if test="${status.index % 3 == 0 }">btn-primary</c:if><c:if test="${status.index % 3 == 1 }">btn-warning</c:if><c:if test="${status.index % 3 == 2 }">btn-success</c:if>">查看</a>
                                    <i class="fa fa-clock-o"></i> <fmt:formatDate value="${systemRole.updateTime}" pattern="yyyy.MM.dd" />
                                </div>
                            </li>
                        </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-sm-9">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>管理员列表</h5>
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
                                            <button type="button" class="btn btn-default"  title="创建用户" onclick="member_show('创建用户','${ctx}/system/sysuser/list/add',null,null,'900','600')">
                                                <i class="glyphicon glyphicon-plus"></i>
                                            </button>
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
                                            <th data-halign="center" data-align="center" data-sortable="true">昵称</th>
                                            <th data-halign="center" data-align="center" data-sortable="true">姓名</th>
                                            <th data-halign="center" data-align="center" data-sortable="true">手机</th>
                                            <th data-halign="center" data-align="center" data-sortable="true">邮箱</th>
                                            <th data-halign="center" data-align="center" data-sortable="true">注册时间</th>
                                            <th data-halign="center" data-align="center" data-sortable="true">最后登录时间</th>
                                            <th data-halign="center" data-align="center" data-sortable="true">登录IP</th>
                                            <th data-halign="center" data-align="center">状态</th>
                                            <th data-halign="center" data-align="center">操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${systemUsers}" var="systemUsers">
                                        <tr>
                                            <td>
                                                <a href="javascript:void(0)" onclick="member_show('${systemUsers.userName}','${ctx}/system/sysuser/list','${systemUsers.accountId}','detail','500','400')">${systemUsers.userName}</a>
                                            </td>
                                            <td>${systemUsers.realName}</td>
                                            <td>${systemUsers.telephone}</td>
                                            <td>${systemUsers.email}</td>
                                            <td><fmt:formatDate value="${systemUsers.createTime}" pattern="yyyy/MM/dd" /></td>
                                            <td><fmt:formatDate value="${systemUsers.lastLoginTime}" pattern="yyyy/MM/dd HH:mm" /></td>
                                            <td>${systemUsers.lastLoginIp}</td>
                                            <td class="td-status">
                                            <c:if test="${systemUsers.status==1}"><span class="label label-primary">正常</span></c:if>
                                            <c:if test="${systemUsers.status==0}"><span class="label label-danger">冻结</span></c:if>
                                            </td>
                                            <td class="td-manage">  
                                            <c:if test="${systemUsers.status==1}"><a class="like text-info" href="javascript:void(0)" onClick="member_stop(this,'${ctx}/system/sysuser/list/${systemUsers.accountId}/audit')" title="冻结"><i class="glyphicon glyphicon-pause"></i></a></c:if>
                                            <c:if test="${systemUsers.status==0}"><a class="like text-info" href="javascript:void(0)" onClick="member_start(this,'${ctx}/system/sysuser/list/${systemUsers.accountId}/audit')" title="启用"><i class="glyphicon glyphicon-play"></i></a></c:if>
                                            <a class="edit m-l-sm text-warning" href="javascript:void(0)" onclick="member_show('${systemUsers.userName}','${ctx}/system/sysuser/list','${systemUsers.accountId}','edit','900','600')" title="编辑">
                                            <i class="glyphicon glyphicon-edit"></i>
                                            </a>
                                            <a class="remove m-l-sm text-danger" href="javascript:void(0)" onclick="member_delete(this,'${ctx}/system/sysuser/list/'+${systemUsers.accountId}+'/delete','确认要删除该用户吗?')" title="删除">
                                            <i class="glyphicon glyphicon-remove"></i>
                                            </a>
                                            <a class="remove m-l-sm text-primary" href="javascript:void(0)" onclick="member_show('${systemUsers.userName}','${ctx}/system/sysuser/list','${systemUsers.accountId}','log','900','600')" title="日志">
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
    	</div>
    </div>
    <myfooter>
    <!-- jquery-ui-->
    <script src="${ctxsta}/common/jquery/jquery-ui.min.js"></script>
    <!-- Bootstrap table -->
    <script src="${ctxsta}/common/bootstrap-table-master/bootstrap-table.min.js"></script>
    <script src="${ctxsta}/common/bootstrap-table-master/extensions/export/bootstrap-table-export.js"></script>
    <script src="${ctxsta}/common/bootstrap-table-master/tableExport.js"></script>
    <script src="${ctxsta}/common/bootstrap-table-master/locale/bootstrap-table-zh-CN.min.js"></script>
    <!-- Data picker -->
    <script src="${ctxsta}/common/bootstrap-datepicker-master/js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript">
    // 日期插件
	$(document).ready(function () {
		$('#data_5 .input-daterange').datepicker({
			keyboardNavigation: false,
			forceParse: false,
			autoclose: true,
			format: 'yyyy/mm/dd',  
		});
	})
	
	//拖动面板
	$(document).ready(function () {
	    $(".sortable-list").sortable({
	        connectWith: ".connectList"
	    }).disableSelection();
	});
    </script>
    </myfooter>
  </body>
</html>
