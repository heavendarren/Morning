<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>广告位管理 - 猫宁Morning</title>
<link rel="stylesheet" href="${ctxsta}/common/bootstrap-table/bootstrap-table.min.css" />
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
  <div class="row">
    <div class="col-sm-12">
      <div class="ibox float-e-margins">
        <div class="ibox-title">
          <h5>广告位管理</h5>
          <div class="ibox-tools"> <a class="collapse-link"><i class="fa fa-chevron-up"></i></a> <a class="close-link"><i class="fa fa-times"></i></a> </div>
        </div>
        <div class="ibox-content">
          <div class="row row-lg">
            <div class="col-sm-12">
              <div class="example-wrap">
                <div class="example">
                  <div id="toolbar" class="btn-group m-t-sm">
                    <shiro:hasPermission name="online:advert:create">
                      <button type="button" class="btn btn-default"  title="创建广告位" onclick="layer_show('创建广告位','${ctx}/online/advert/create','800','700')"> <i class="glyphicon glyphicon-plus"></i> </button>
                    </shiro:hasPermission>
                  </div>
                  <table id="table"
                         data-toggle="table"
                         data-height="600"
                         data-search="true"
                         data-show-refresh="true"
                         data-show-toggle="true"
                         data-show-export="true"
                         data-show-pagination-switch="true"
                         data-show-columns="true"
                         data-url="${ctx}/online/advert/"
                         data-pagination="true"
                         data-page-size="20"
                         data-page-list="[20, 50, 100, 200]"
                         data-side-pagination="server"
                         data-striped="true"
                         data-pagination="true"
                         data-sort-order="desc"
                         data-toolbar="#toolbar">
                    <thead>
                      <tr>
                        <th data-field="advertId" data-halign="center" data-align="center" data-sortable="true">广告位编号</th>
                        <th data-field="code" data-halign="center" data-align="center" data-sortable="true">广告位标志</th>
                        <th data-field="name" data-halign="center" data-align="center" data-sortable="true">广告位名称</th>
                        <th data-field="status" data-formatter="statusFormatter" data-halign="center" data-align="center" data-sortable="true">状态</th> 
                        <th data-field="type" data-formatter="typeFormatter" data-halign="center" data-align="center" data-sortable="true">类型</th> 
                        <th data-field="number" data-halign="center" data-align="center" data-sortable="true">广告位栏数量</th>
                        <th data-field="defultNumber" data-halign="center" data-align="center" data-sortable="true">显示数量</th>
                        <th data-field="width" data-halign="center" data-align="center" data-sortable="true">宽度</th>
                        <th data-field="height" data-halign="center" data-align="center" data-sortable="true">高度</th>                 
                        <th data-field="description" data-halign="center" data-align="center" data-sortable="true">描述</th>
                        <th data-formatter="actionFormatter" data-events="actionEvents" data-halign="center" data-align="center" data-sortable="true">操作</th>
                      </tr>
                    </thead>
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
  <!-- Bootstrap table --> 
  <script src="${ctxsta}/common/bootstrap-table/bootstrap-table.min.js"></script> 
  <script src="${ctxsta}/common/bootstrap-table/extensions/export/bootstrap-table-export.js"></script> 
  <script src="${ctxsta}/common/bootstrap-table/tableExport.js"></script> 
  <script src="${ctxsta}/common/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script> 
  <!-- 自定义js --> 
  <script src="${ctxsta}/cms/js/onlineAdvert.js"></script> 
</myfooter>
</body>
</html>