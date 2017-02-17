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
                    	<h1 class="no-margins">${userNumber}</h1>
                        <div class="stat-percent font-bold text-danger">${updateTime}
                        </div>
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
                    <form action="${ctx}/system/user/list" method="post" id="searchForm">
                        <div class="col-sm-6">
                            <div class="form-group" id="data_5">
                                <label class="control-label">添加时间</label>
                                <div class="input-daterange input-group" id="datepicker">
                                    <input type="text" class="form-control" name="queryUser.beginCreateTime" />
                                    <span class="input-group-addon">到</span>
                                    <input type="text" class="form-control" name="queryUser.endCreateTime" />
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
        
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>用户列表</h5>
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
                                    <button type="button" class="btn btn-default" onclick="member_show('创建用户','${ctx}/system/user//list/add',null,null,'900','600')">
                                        <i class="glyphicon glyphicon-plus"></i>
                                    </button>
                                    <button type="button" class="btn btn-default">
                                        <i class="glyphicon glyphicon-trash"></i>
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
                                    <th data-halign="center" data-align="center" data-field="state" data-checkbox="true"></th>
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
                                <c:forEach items="${userList}" var="userList">
                                <tr>
                                    <td></td>
                                    <td id="td-id-1" class="td-class-1">
                                        <a href="javascript:void(0)" onclick="member_show('${userList.loginName}','${ctx}/system/user/list','${userList.accountId}','detail','500','400')">${userList.loginName}</a>
                                    </td>
                                    <td>${userList.userName}</td>
                                    <td>${userList.telephone}</td>
                                    <td>${userList.email}</td>
                                    <td><fmt:formatDate value="${userList.createDate}" pattern="yyyy/MM/dd" /></td>
                                    <td><fmt:formatDate value="${userList.lastLoginTime}" pattern="yyyy/MM/dd HH:mm" /></td>
                                    <td>${userList.lastLoginIp}</td>
                                    <td class="td-status">
                                    <c:if test="${userList.status==1}"><span class="label label-primary">正常</span></c:if>
									<c:if test="${userList.status==0}"><span class="label label-danger">冻结</span></c:if>
                                    </td>
                                    <td class="td-manage">  
                                    <c:if test="${userList.status==1}"><a class="like text-info" href="javascript:void(0)" onClick="member_stop(this,${userList.accountId})" title="冻结"><i class="glyphicon glyphicon-pause"></i></a></c:if>
									<c:if test="${userList.status==0}"><a class="like text-info" href="javascript:void(0)" onClick="member_start(this,${userList.accountId})" title="启用"><i class="glyphicon glyphicon-play"></i></a></c:if>
                                    <a class="edit m-l-sm text-warning" href="javascript:void(0)" onclick="member_show('${userList.loginName}','${ctx}/system/user/list','${userList.accountId}','edit','900','600')" title="编辑">
                                    <i class="glyphicon glyphicon-edit"></i>
                                    </a>
                                    <a class="remove m-l-sm text-danger" href="javascript:void(0)" onclick="member_del(this,${userList.accountId})" title="删除">
                                    <i class="glyphicon glyphicon-remove"></i>
                                    </a>
                                    <a class="remove m-l-sm text-primary" href="javascript:void(0)" onclick="member_show('${userList.loginName}','${ctx}/system/user/list','${userList.accountId}','log','900','600')" title="日志">
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
    <!-- Data picker -->
    <script src="${ctxsta}/common/bootstrap-datepicker-master/js/bootstrap-datepicker.min.js"></script>
    <!-- 自定义js -->
    <script src="${ctxsta}/admin/main/js/user-list.js"></script>
    </myfooter>

  </body>
</html>
