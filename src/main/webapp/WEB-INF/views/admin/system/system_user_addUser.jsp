<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>创建用户</title>
    <link rel="stylesheet" href="${ctxsta}/common/icheck/flat/green.css" />
  </head>
  
  <body class="gray-bg">
    <div class="wrapper add-member-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5><c:if test="${empty systemUser}">创建用户</c:if><c:if test="${!empty systemUser}">修改用户信息</c:if> <small>  用户个人信息时应当遵循合法、正当、必要的原则，明示目的、方式和范围，并经用户同意。</small></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            <a class="close-link"><i class="fa fa-times"></i></a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form id="systemuserform" class="form-horizontal">
                        	<c:if test="${empty systemUser}">
                            <div class="form-group m-t">
                            	<label class="col-sm-2 control-label">用户名：</label>
								<div class="col-sm-4">
                                	<input type="text" maxlength="10" class="form-control" name="systemUser.loginName">
                                </div>
								<label class="col-sm-2 control-label">密码：</label>
								<div class="col-sm-4">
                                	<input type="password" maxlength="18" class="form-control" name="systemUser.loginPassword">
                                </div>  
								
                            </div>
                            <div class="hr-line-dashed"></div>
                            </c:if>
                            <div class="form-group  <c:if test="${!empty systemUser}">m-t</c:if>">
                                <label class="col-sm-2 control-label">昵称：</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" name="systemUser.userName" value="${systemUser.userName}">
                                </div> 
                                <label class="col-sm-2 control-label">真实姓名：</label>
								<div class="col-sm-4">
                                	<input type="text" maxlength="11" class="form-control" name="systemUser.realName" value="${systemUser.realName}">
                                </div>                                
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">电子邮箱：</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" name="systemUser.email" value="${systemUser.email}">
                                </div> 
                                <label class="col-sm-2 control-label">移动电话：</label>
								<div class="col-sm-4">
                                	<input type="text" maxlength="11" class="form-control" name="systemUser.telephone" value="${systemUser.telephone}">
                                </div>                                
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">性别：</label>
                                <div class="col-sm-4">
                                    <label class="radio-inline add-radio">
                                        <input type="radio"  name="systemUser.sex" value="1" <c:if test="${systemUser.sex==1 }">checked="checked"</c:if> >  男</label>
                                    <label class="radio-inline add-radio">
                                        <input type="radio" name="systemUser.sex" value="2" <c:if test="${systemUser.sex==2 }">checked="checked"</c:if> >  女</label>
                                    <c:if test="${empty systemUser}">
                                    <label class="radio-inline add-radio">
                                        <input type="radio" name="systemUser.sex" value="0" checked="checked">  保密</label>
                                    </c:if>
                                    <c:if test="${!empty systemUser}">
                                    <label class="radio-inline add-radio">
                                        <input type="radio" name="systemUser.sex" value="0" <c:if test="${systemUser.sex==0 }">checked="checked"</c:if> >  保密</label>
                                    </c:if>
                                </div>
                                <label class="col-sm-2 control-label">状态：</label>
                                <div class="col-sm-4">
                                <c:if test="${empty systemUser}">
                                   <label class="radio-inline add-radio">
                                        <input type="radio" name="systemUser.status" value="1" checked="checked">  开启</label>
                                </c:if>
                                <c:if test="${!empty systemUser}">
                                   <label class="radio-inline add-radio">
                                        <input type="radio" name="systemUser.status" value="1" <c:if test="${systemUser.status==1 }">checked="checked"</c:if> >  开启</label>
                                </c:if>
                                    <label class="radio-inline add-radio">
                                        <input type="radio" name="systemUser.status" value="0" <c:if test="${systemUser.status==0 }">checked="checked"</c:if> >  关闭</label>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">权限：</label>
								<div class="col-sm-10">
								<c:forEach items="${systemRoles }" var="systemRole">
	                                <div class="checkbox col-sm-3">
	                                    <label>
	                                        <input type="checkbox" name="roleId" value="${systemRole.roleId }" <c:forEach items="${systemRoleList}" var="systemRoleList"> <c:if test="${systemRole.roleId==systemRoleList.roleId }">checked="checked"</c:if></c:forEach>/>&nbsp&nbsp${systemRole.roleName}
	                                    </label>
	                                </div>
	                            </c:forEach>
                                </div>                             
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-4 add-submit">
                                <input type="hidden" class="form-control" name="systemUser.accountId" value="${systemUser.accountId}">
                                    <button class="btn btn-primary sysusersubmit" type="submit" id="submit">提交</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <myfooter>  
   	<!-- iCheck -->
	<script src="${ctxsta}/common/icheck/icheck.min.js"></script>
	 <!-- bootstrapvalidator-master前端验证框架 -->
	<script src="${ctxsta}/common/bootstrapvalidator-master/js/bootstrapValidator.min.js"></script>
	<!-- layer javascript -->
    <script src="${ctxsta}/common/layer/layer.js"></script>
	<!-- 自定义js -->
    <script src="${ctxsta}/admin/main/js/add-list.js"></script>
	</myfooter>  
</body>
</html>
