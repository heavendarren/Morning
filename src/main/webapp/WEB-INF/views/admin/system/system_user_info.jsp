<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>${systemUser.loginName}</title>
    <link rel="stylesheet" href="${ctxsta}/common/bootstrap-table-master/bootstrap-table.min.css" />
    <link rel="stylesheet" href="${ctxsta}/common/bootstrap-datepicker-master/css/bootstrap-datepicker.min.css" />
    <link rel="stylesheet" href="${ctxsta}/common/icheck/flat/green.css" />
  </head>
  
  <body class="system-message gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight system-message">
        <div class="row">
            <div class="col-sm-5">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>管理员信息</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            <a class="close-link"><i class="fa fa-times"></i></a>
                        </div>
                    </div>
                    <div class="ibox-content form-horizontal" id="system-info">
                    	<form id="form-info">
                           <div class="form-group">
                                <label class="col-sm-3 control-label">昵称：</label>
                                <div class="col-sm-6">
                                    <input name="systemUser.userName" type="text" class="form-control form-disabled" disabled="disabled" value="${systemUser.userName}">
                                </div>
                                <div class="col-sm-3"><button type="button" class="btn btn-warning pull-right" onclick="change_Password();">修改密码</button></div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">姓名：</label>
                                <div class="col-sm-6">
                                    <input name="systemUser.realName" type="text" class="form-control form-disabled" disabled="disabled" value="${systemUser.realName}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">性别：</label>
                                <div class="col-sm-6">
                                    <input id="sex"  type="text" class="form-control" disabled="disabled" value="<c:if test="${systemUser.sex==1 }">男</c:if><c:if test="${systemUser.sex==2 }">女</c:if><c:if test="${systemUser.sex==0 }">保密</c:if>">
                                    <label class="radio-inline add-radio" >
                                        <input type="radio"  name="systemUser.sex" value="1" <c:if test="${systemUser.sex==1 }">checked="checked"</c:if> >  男</label>
                                    <label class="radio-inline add-radio">
                                        <input type="radio" name="systemUser.sex" value="2" <c:if test="${systemUser.sex==2 }">checked="checked"</c:if> >  女</label>
                                    <label class="radio-inline add-radio">
                                        <input type="radio" name="systemUser.sex" value="0" <c:if test="${systemUser.sex==0 }">checked="checked"</c:if> >  保密</label>
                                </div> 
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">年龄：</label>
                                <div class="col-sm-6">
                                    <input name="systemUser.age" type="text" class="form-control form-disabled" disabled="disabled" value="${systemUser.age}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">移动电话：</label>
                                <div class="col-sm-6">
                                     <input name="systemUser.telephone" type="text" class="form-control form-disabled" disabled="disabled" value="${systemUser.telephone}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label ">电子邮箱：</label>
                                <div class="col-sm-6 stm-inp">
                                     <input name="systemUser.email" type="text" class="form-control form-disabled" disabled="disabled" value="${systemUser.email}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">权限：</label>
                                <div class="col-sm-6">
                                     <input type="text" class="form-control disabled-form-control" disabled="disabled" value="${userRole }">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">注册时间：</label>
                                <div class="col-sm-6">
                                     <input type="text" class="form-control disabled-form-control" disabled="disabled" value="<fmt:formatDate value="${systemUser.createTime}" pattern="yyyy/MM/dd HH:mm" />">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-8 col-sm-offset-3">
                                	<button type="button" class="btn btn-primary pull-left m-r-md" onclick="modify();">修改信息</button>
                                    <button type="submit" class="btn btn-success" onclick="save_info();">保存修改</button>
                                </div>
                            </div>
                    	</form>
                    </div>
                </div>
            </div>
            <div class="col-sm-7">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>管理员登陆记录</h5>
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
                                        <table id="table"
                                           data-toggle="table"
                                           data-height="450"
                                           data-search="true"
                                           data-show-refresh="true"
                                           data-show-toggle="true"
                                           data-show-export="true"
                                           data-show-pagination-switch="true"
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
                                        <c:forEach items="${systemUserLoginLogList}" var="systemUserLoginLogList">
                                        <tr>
                                            <td><fmt:formatDate value="${systemUserLoginLogList.loginTime}" pattern="yyyy/MM/dd HH:mm" /></td>
                                            <td>${systemUserLoginLogList.userIp}</td>
                                            <td>${systemUserLoginLogList.operatingSystem}</td>
                                            <td>${systemUserLoginLogList.browser}</td>
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
    <div class="ibox-content form-horizontal change_Pass_style" id="change_Pass">
        <div class="form-group">
            <label class="col-sm-4 control-label">原密码：</label>
            <div class="col-sm-6">
                <input name="nowPassword" type="password" class="form-control" >
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label">新密码：</label>
            <div class="col-sm-6">
                <input name="newPassword" type="password" class="form-control" >
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-4 control-label">确认密码：</label>
            <div class="col-sm-6">
                 <input name="confirmPwd" type="password" class="form-control">
            </div>
        </div>
    </div>
    <myfooter>
    <!-- bootstrapvalidator-master前端验证框架 -->
	<script src="${ctxsta}/common/bootstrapvalidator-master/js/bootstrapValidator.min.js"></script>
    <!-- Bootstrap table -->
    <script src="${ctxsta}/common/bootstrap-table-master/bootstrap-table.min.js"></script>
    <script src="${ctxsta}/common/bootstrap-table-master/extensions/export/bootstrap-table-export.js"></script>
    <script src="${ctxsta}/common/bootstrap-table-master/tableExport.js"></script>
    <script src="${ctxsta}/common/bootstrap-table-master/locale/bootstrap-table-zh-CN.min.js"></script>
    <!-- Data picker -->
    <script src="${ctxsta}/common/bootstrap-datepicker-master/js/bootstrap-datepicker.min.js"></script>
    <!-- iCheck -->
	<script src="${ctxsta}/common/icheck/icheck.min.js"></script>
    <!-- 自定义js -->
    <script src="${ctxsta}/admin/main/js/systemUserInfo.js"></script>
    </myfooter>
  </body>
</html>
