<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%--项目路径 --%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%--静态资源路径 --%>
<c:set var="ctxsta" value="${pageContext.request.contextPath}/static"/>
<%--上传图片保存路径 --%>
<c:set var="ctximg" value="${pageContext.request.contextPath}/uploads"/>