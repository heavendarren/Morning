<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>个人资料</title>
</head>

<body class="gray-bg">
<div class="middle-box text-center lockscreen animated fadeInDown">
  <div>
    <div class="m-b-md"> <img src="${ctximg}/${user.picImg}" alt="头像加载中..." class="img-circle circle-border"> </div>
    <h3>${user.userName}</h3>
    <div class="hr-line-dashed"></div>
    <div class="member_content">
      <ul>
        <li>
          <label class="label_name">姓名：</label>
          <span class="name">${user.realName}</span></li>
        <li>
          <label class="label_name">年龄：</label>
          <span class="name">${user.age}</span></li>
        <li>
          <label class="label_name">性别：</label>
          <span class="name">${user.sex eq '0'?'保密':''}${user.sex eq '1'?'男':''}${user.sex eq '2'?'女':''}</span></li>
        <li>
          <label class="label_name">手机：</label>
          <span class="name">${user.telephone}</span></li>
        <li>
          <label class="label_name">邮箱：</label>
          <span class="name">${user.email}</span></li>
        <li>
          <label class="label_name">注册时间：</label>
          <span class="name">
          <fmt:formatDate value="${user.createTime}" pattern="yyyy/MM/dd HH:mm" />
          </span></li>
        <li>
          <label class="label_name">创建者：</label>
          <span class="name">${user.createBy}</span></li>
        <li>
          <label class="label_name">更新时间：</label>
          <span class="name">
          <fmt:formatDate value="${user.updateTime}" pattern="yyyy/MM/dd HH:mm" />
          </span></li>
        <li>
          <label class="label_name">更新者：</label>
          <span class="name">${user.updateBy}</span></li>
        <li>
          <label class="label_name">权限：</label>
          <span class="name">
          <c:forEach items="${roles}" var="role">${role.roleName}&nbsp;&nbsp;</c:forEach>
          </span></li>
        <li>
          <label class="label_name">所属组织：</label>
          <span class="name">${user.organizationName}</span></li>
      </ul>
    </div>
  </div>
</div>
</body>
</html>