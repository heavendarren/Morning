<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <link rel="stylesheet" href="${ctxsta}/common/icheck/flat/green.css" />
    <link rel="stylesheet" href="${ctxsta}/common/ztree/css/metroStyle/metroStyle.css" />
  </head>
  
  <body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5><c:if test="${empty systemRole}">创建角色</c:if><c:if test="${!empty systemRole}">修改角色信息</c:if> <small>  角色信息时应当遵循合法、正当、必要的原则，明示目的、方式和范围。</small></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            <a class="close-link"><i class="fa fa-times"></i></a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form id="systemRoleform" class="form-horizontal">
                           <div class="form-group m-t">
                            	<label class="col-sm-2 control-label">角色名称：</label>
								<div class="col-sm-4">
                                	<input type="text" maxlength="10" class="form-control" name="systemRole.roleName" value="${systemRole.roleName }">
                                </div>
								<label class="col-sm-2 control-label">归属部门：</label>
								<div class="col-sm-4">
                                	<input type="text" maxlength="10" class="form-control" name="systemRole.roleOffice" value="${systemRole.roleOffice }">
                                </div>  
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">是否系统数据：</label>
                                <div class="col-sm-10">
                                    <c:if test="${empty systemRole}">
                                    <label class="radio-inline add-radio">
                                        <input type="radio" name="systemRole.isSystem" value="1" checked="checked">  是</label>
                                    </c:if>
                                    <c:if test="${!empty systemRole}">
                                    <label class="radio-inline add-radio">
                                        <input type="radio"  name="systemRole.isSystem" value="1" <c:if test="${systemRole.isSystem==1 }">checked="checked"</c:if> >  是</label>
                                    </c:if>
                                    <label class="radio-inline add-radio">
                                        <input type="radio" name="systemRole.isSystem" value="0" <c:if test="${systemRole.isSystem==0 }">checked="checked"</c:if> >  否</label>
                                	<label class="radio-inline add-radio"><strong>系统数据：</strong> “是”代表只有超级管理员能进行修改，“否”代表拥有角色修改人权限的人员能进行修改</label>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">是否可用：</label>
                                <div class="col-sm-10">
                                    <c:if test="${empty systemRole}">
                                    <label class="radio-inline add-radio">
                                        <input type="radio" name="systemRole.status" value="1" checked="checked">  开启</label>
                                    </c:if>    
                                    <c:if test="${!empty systemRole}">                             
                                    <label class="radio-inline add-radio">
                                        <input type="radio" name="systemRole.status" value="1" <c:if test="${systemRole.status==1 }">checked="checked"</c:if> >  开启</label>
                                    </c:if>
                                    <label class="radio-inline add-radio">
                                        <input type="radio" name="systemRole.status" value="0" <c:if test="${systemRole.status==0 }">checked="checked"</c:if> >  冻结</label>
                                    <label class="radio-inline add-radio"><strong>状态：</strong> “开启”代表此数据可用，“冻结”代表此数据不可用</label>
                                </div>                          
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">角色授权：</label>
                                <div class="col-sm-10">
									<div id="ztreedemo" class="ztree"></div>
                                </div>                          
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">角色备注：</label>
                                <div class="col-sm-10">
                                    <textarea class="form-control" rows="2" name="systemRole.remarks" placeholder="请输入消息..." style="margin: 0px -17.675px 0px 0px; height: 50px; width: 600px;">${ systemRole.remarks}</textarea>
                                </div>                          
                            </div>     
                            <div class="hr-line-dashed"></div>                       
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-4 add-submit">
                                	<input type="hidden" class="form-control" name="systemRole.roleId" value="${systemRole.roleId}">
                                    <button class="btn btn-primary sysusersubmit" type="button" id="submit">提交</button>
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
	<!-- ztree -->
	<script src="${ctxsta}/common/ztree/js/jquery.ztree.all.min.js"></script>
	<!-- 自定义js -->
	<script type="text/javascript">
		/*多选按钮插件*/
		$(document).ready(function() {
			$('input').iCheck({
				checkboxClass : 'icheckbox_flat-green',
				radioClass : 'iradio_flat-green'
			});
		});

		var treedata = '${systemMenus}';
		$(function() {
			initMenuTree(treedata);
		});
	</script>
    <script src="${ctxsta}/admin/main/js/systemRole.js"></script>
	</myfooter>  
</body>
</html>
