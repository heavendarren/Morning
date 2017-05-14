<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>创建菜单 - 猫宁Morning</title>
<link rel="stylesheet" href="${ctxsta}/common/icheck/flat/green.css" />
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
  <div class="row">
    <div class="col-sm-12">
      <div class="ibox float-e-margins">
        <div class="ibox-title">
          <h5>创建菜单<small> 菜单信息应当遵循合法、正当、必要的原则，明示目的、方式和范围。</small></h5>
          <div class="ibox-tools"> <a class="collapse-link"><i class="fa fa-chevron-up"></i></a> <a class="close-link"><i class="fa fa-times"></i></a> </div>
        </div>
        <div class="ibox-content">
          <form id="form" class="form-horizontal" action="${ctx}/system/menu/${menu.menuId}" data-method="put">
            <div class="form-group m-t">
              <label class="col-sm-2 col-xs-offset-1 control-label">菜单名称：</label>
              <div class="col-sm-7">
                <input type="text" class="form-control" name="menuName" value="${menu.menuName}">
              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <label class="col-sm-2 col-xs-offset-1 control-label">上级菜单：</label>
              <div class="col-sm-7">
                <input type="text" disabled="" placeholder="${parentMenu.menuName}" class="form-control">
              </div>
            </div>
            <div class="hr-line-dashed"></div>            
            <div class="form-group">
              <label class="col-sm-2 col-xs-offset-1 control-label">权限代码：</label>
              <div class="col-sm-7">
                <input type="text"  class="form-control" name="menuCode" value="${menu.menuCode}">
              </div>
            </div>
            <div class="hr-line-dashed"></div>            
            <div class="form-group">
              <label class="col-sm-2 col-xs-offset-1 control-label">链接：</label>
              <div class="col-sm-7">
                <input type="text" class="form-control" name="href" value="${menu.href}">
              </div>
            </div>            
            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <label class="col-sm-2 col-xs-offset-1 control-label">图标：</label>
              <div class="col-sm-7">
                <div class="input-group m-b"> <span class="input-group-btn">
                  <button type="button" class="btn btn-primary" onclick="layer_show('菜单图标','${ctx}/system/menu/icon','800','600')" title="图标">选择</button>
                  </span>
                  <input type="text" class="form-control" name="icon" value="${menu.icon}">
                </div>
              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <label class="col-sm-2 col-xs-offset-1 control-label">排序：</label>
              <div class="col-sm-7">
                <input type="text" class="form-control" name="sort" value="${menu.sort}">
              </div>
            </div>            
            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <label class="col-sm-2 col-xs-offset-1 control-label">是否显示：</label>
              <div class="col-sm-6 text-center">
                <label class="radio-inline">
                  <input type="radio" name="status" value="1" ${menu.status eq '1'?'checked="checked"':''}> 正常</label>
                <label class="radio-inline">
                  <input type="radio" name="status" value="0" ${menu.status eq '0'?'checked="checked"':''}> 隐藏</label>
              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <c:if test="${menu.menuType==0 || parentMenu.menuType==2}">
              <div class="form-group">
                <label class="col-sm-2 col-xs-offset-1 control-label">权限标识：</label>
                <div class="col-sm-7">
                  <input type="text" class="form-control" name="permission" value="${menu.permission}">
                </div>
                <label class="col-sm-2 col-xs-offset-1 control-label"></label>
                <label class="radio-inline"><strong>说明：</strong>控制器中定义的权限标识，如：@RequiresPermissions("权限标识")</label>
              </div>
              <div class="hr-line-dashed"></div>
            </c:if>
            <div class="form-group">
              <label class="col-sm-2 col-xs-offset-1 control-label">备注信息：</label>
              <div class="col-sm-7">
                <textarea class="form-control" rows="2" name="remarks" placeholder="请输入消息...">${menu.remarks}</textarea>
              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <div class="col-sm-12 text-center">
                <button class="btn btn-primary" type="submit">提交</button>
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
  <script src="${ctxsta}/common/bootstrapvalidator/js/bootstrapValidator.min.js"></script> 
  <!-- 自定义js --> 
  <script src="${ctxsta}/cms/js/systemMenu.js"></script> 
</myfooter>
</body>
</html>
