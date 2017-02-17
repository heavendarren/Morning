<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>修改用户信息</title>
<link rel="stylesheet" href="${ctxsta}/admin/main/css/style.css" />
<link rel="stylesheet" href="${ctxsta}/common/icheck/flat/green.css" />
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
  <div class="row">
    <div class="col-sm-12">
      <div class="ibox float-e-margins">
        <div class="ibox-title">
          <h5>修改用户信息<small> 用户个人信息时应当遵循合法、正当、必要的原则，明示目的、方式和范围，并经用户同意。</small></h5>
          <div class="ibox-tools"> <a class="collapse-link"><i class="fa fa-chevron-up"></i></a> <a class="close-link"><i class="fa fa-times"></i></a> </div>
        </div>
        <div class="ibox-content">
          <form id="form" class="form-horizontal">
            <div class="form-group m-t">
              <label class="col-sm-2 control-label">昵称：</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" name="userName" value="${user.userName}">
              </div>
              <label class="col-sm-2 control-label">真实姓名：</label>
              <div class="col-sm-4">
                <input type="text" maxlength="11" class="form-control" name="realName" value="${user.realName}">
              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <label class="col-sm-2 control-label">电子邮箱：</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" name="email" value="${user.email}">
              </div>
              <label class="col-sm-2 control-label">移动电话：</label>
              <div class="col-sm-4">
                <input type="text" maxlength="11" class="form-control" name="telephone" value="${user.telephone}">
              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <label class="col-sm-2 control-label">性别：</label>
              <div class="col-sm-4">
                <label class="radio-inline add-radio">
                  <input type="radio"  name="sex" value="1" <c:if test="${user.sex==1 }">checked="checked"</c:if> >
                  男</label>
                <label class="radio-inline add-radio">
                  <input type="radio" name="sex" value="2" <c:if test="${user.sex==2 }">checked="checked"</c:if> >
                  女</label>
                <label class="radio-inline add-radio">
                  <input type="radio" name="sex" value="0" <c:if test="${user.sex==0 }">checked="checked"</c:if> >
                  保密</label>
              </div>
              <label class="col-sm-2 control-label">状态：</label>
              <div class="col-sm-4">
                <label class="radio-inline add-radio">
                  <input type="radio" name="status" value="1" <c:if test="${user.status==1 }">checked="checked"</c:if> >
                  开启</label>
                <label class="radio-inline add-radio">
                  <input type="radio" name="status" value="0" <c:if test="${user.status==0 }">checked="checked"</c:if> >
                  关闭</label>
              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <label class="col-sm-2 control-label">权限：</label>
              <div class="col-sm-10">
                <c:forEach items="${roles }" var="role">
                  <div class="checkbox col-sm-3">
                    <label>
                      <input type="checkbox" name="roleId" value="${role.roleId }" <c:forEach items="${userRoles}" var="userRole"> <c:if test="${role.roleId==userRole.roleId }">checked="checked"</c:if></c:forEach>/>
                      &nbsp;&nbsp;${role.roleName} </label>
                  </div>
                </c:forEach>
              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <label class="col-sm-2 control-label">归属部门：</label>
              <div class="col-sm-4">
                <select class="form-control" name="organizationId">
                <option value="">--请选择--</option> 
                <c:forEach items="${organizations }" var="organization">
                  <option value="${organization.organizationId }" <c:if test="${user.organizationId == organization.organizationId }">selected="selected"</c:if> >${organization.organizationName }</option>
                </c:forEach>
                </select>
              </div>
            </div>            
            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <div class="col-sm-4 col-sm-offset-4 add-submit">
                <input type="hidden" class="form-control" name="userId" value="${user.userId}">
                <button class="btn btn-primary" type="submit" id="submit">提交</button>
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
  <!-- 自定义js --> 
  <script src="${ctxsta}/admin/main/js/adminUser.js"></script> 
</myfooter>
</body>
</html>
