<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <link rel="stylesheet" href="${ctxsta}/common/icheck/flat/green.css" />
  </head>
  
  <body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5><c:if test="${empty systemMenu}">创建菜单</c:if><c:if test="${!empty systemMenu}">修改菜单信息</c:if> <small>  菜单信息应当遵循合法、正当、必要的原则，明示目的、方式和范围。</small></h5>
                        <div class="ibox-tools">
                            <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            <a class="close-link"><i class="fa fa-times"></i></a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <form class="form-horizontal">
                           <div class="form-group m-t">
                            	<label class="col-sm-2 control-label">菜单名称：</label>
								<div class="col-sm-4">
                                	<input type="text" class="form-control" name="systemMenu.menuName" value="${systemMenu.menuName }">
                                </div>
								<label class="col-sm-2 control-label">上级菜单：</label>
								<div class="col-sm-4">
									<input type="text" disabled="" placeholder="${parentMenu.menuName}${menuName}" class="form-control">
                                </div>  
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                            	<label class="col-sm-2 control-label">权限代码：</label>
								<div class="col-sm-4">
                                	<input type="text"  class="form-control" name="systemMenu.menuCode" value="${systemMenu.menuCode }">
                                </div>
								<label class="col-sm-2 control-label">链接：</label>
								<div class="col-sm-4">
                                	<input type="text" class="form-control" name="systemMenu.href" value="${systemMenu.href }">
                                </div>  
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                            	<label class="col-sm-2 control-label">图标：</label>
								<div class="col-sm-4">
                                    <div class="input-group m-b">
                                    	<span class="input-group-btn">
                                            <button type="button" class="btn btn-primary" onclick="member_show('菜单图标','${ctx}/system/manage/menu/icon',null,null,'800',null)" title="图标">选择</button> 
                                        </span>
                                        <input type="text" class="form-control" name="systemMenu.icon" value="${systemMenu.icon }">
                                    </div>
                                </div>
								<label class="col-sm-2 control-label">排序：</label>
								<div class="col-sm-4">
                                	<input type="text" class="form-control" name="systemMenu.sort" value="${systemMenu.sort }">
                                </div>  
                            </div>
                            <div class="hr-line-dashed"></div>
                            <c:if test="${systemMenu.menuType!=0 }">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">是否显示：</label>
                                <div class="col-sm-10">
                                    <c:if test="${empty systemMenu}">
                                    <label class="radio-inline add-radio">
                                        <input type="radio" name="systemMenu.status" value="1" checked="checked">  开启</label>
                                    </c:if>    
                                    <c:if test="${!empty systemMenu}">                             
                                    <label class="radio-inline add-radio">
                                        <input type="radio" name="systemMenu.status" value="1" <c:if test="${systemMenu.status==1 }">checked="checked"</c:if> >  开启</label>
                                    </c:if>
                                    <label class="radio-inline add-radio">
                                        <input type="radio" name="systemMenu.status" value="0" <c:if test="${systemMenu.status==0 }">checked="checked"</c:if> >  冻结</label>
                                    <label class="radio-inline add-radio"><strong>状态：</strong> “开启”代表此数据显示，“冻结”代表此数据隐藏</label>
                                </div>                          
                            </div>
                            <div class="hr-line-dashed"></div>
                            </c:if>
                            <c:if test="${systemMenu.menuType==0 }">
                            <div class="form-group">
                            	<label class="col-sm-2 control-label">权限标识：</label>
								<div class="col-sm-4">
                                	<input type="text" class="form-control" name="systemMenu.permission" value="${systemMenu.permission}">
                                </div>
                                <label class="radio-inline add-radio"><strong>说明：</strong>控制器中定义的权限标识，如：@RequiresPermissions("权限标识")</label>
                            </div>
                            <div class="hr-line-dashed"></div>
                            </c:if>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">备注信息：</label>
                                <div class="col-sm-10">
                                    <textarea class="form-control" rows="2" name="systemMenu.remarks" placeholder="请输入消息..." style="margin: 0px -17.675px 0px 0px; height: 50px; width: 600px;">${systemMenu.remarks}</textarea>
                                </div>                          
                            </div>     
                            <div class="hr-line-dashed"></div>                       
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-4 add-submit">
                                	<input type="hidden" class="form-control" name="systemMenu.menuId" value="${systemMenu.menuId}">
                                	<c:if test="${empty systemMenu}">
                                	<input type="hidden" class="form-control" name="systemMenu.menuType" value="${empty parentMenu.menuType?1:parentMenu.menuType==1?2:0}">
                                    <input type="hidden" class="form-control" name="systemMenu.parentId" value='${empty parentMenu.menuId?1:parentMenu.menuId}'>
                                    </c:if>
                                    <button class="btn btn-primary" type="button" id="menu-submit">提交</button>
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
    <script src="${ctxsta}/admin/main/js/add-list.js"></script>
	</myfooter>  
</body>
</html>
