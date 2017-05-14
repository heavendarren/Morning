<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>广告详情管理 - 猫宁Morning</title>
<link rel="stylesheet" href="${ctxsta}/common/bootstrap-table/bootstrap-table.min.css" />
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
  <div class="row">
    <div class="col-sm-12">
      <div class="ibox float-e-margins">
        <div class="ibox-title">
          <h5>${advert.name} -- 广告详情管理</h5>
          <div class="ibox-tools"> <a class="collapse-link"><i class="fa fa-chevron-up"></i></a> <a class="close-link"><i class="fa fa-times"></i></a> </div>
        </div>
        <div class="ibox-content">
          <div class="row row-lg">
            <div class="col-sm-12">
              <div class="example-wrap">
                <div class="example">
                  <div id="toolbar" class="btn-group m-t-sm">
                    <shiro:hasPermission name="online:advert:create">
                      <button type="button" class="btn btn-default"  title="创建广告详情" onclick="layer_show('创建广告详情','${ctx}/online/advert/${advert.advertId}/detail/create','800','700')"> <i class="glyphicon glyphicon-plus"></i> </button>
                    </shiro:hasPermission>
                 	<button type="button" class="btn btn-default"  title="返回上一页" onclick="javascript:window.history.back();"> <i class="glyphicon glyphicon-circle-arrow-left"></i> </button>
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
                         data-url="${ctx}/online/advert/${advert.advertId}/detail/"
                         data-pagination="true"
                         data-page-size="20"
                         data-page-list="[20, 50, 100, 200]"
                         data-side-pagination="server"
                         data-striped="true"
                         data-pagination="true"
                         data-sort-order="asc"
                         data-sort-name="sort"
                         data-toolbar="#toolbar">
                    <thead>
                      <tr>
                        <th data-field="advertDetailId" data-halign="center" data-align="center" data-sortable="true">广告详情编号</th>
                        <th data-field="title" data-halign="center" data-align="center" data-sortable="true">广告详情标题</th>
                        <th data-field="status" data-formatter="statusFormatter" data-halign="center" data-align="center" data-sortable="true">状态</th> 
                        <th data-field="sort" data-halign="center" data-align="center" data-sortable="true">排序</th>
                        <th data-field="href" data-halign="center" data-align="center" data-sortable="true">链接地址</th>
                        <c:if test="${advert.type eq 1}"><th data-field="picImg" data-formatter="picImgFormatter" data-halign="center" data-align="center" data-sortable="true">展示图片</th></c:if>
                        <c:if test="${advert.type eq 0}"><th data-field="content" data-halign="center" data-align="center" data-sortable="true">广告内容</th></c:if>                           
                        <th data-field="beginTime" data-formatter="timeFormatter" data-halign="center" data-align="center" data-sortable="true">起始时间</th>
                        <th data-field="endTime" data-formatter="timeFormatter" data-halign="center" data-align="center" data-sortable="true">结束时间</th>
                        <th data-field="remarks" data-halign="center" data-align="center" data-sortable="true">备注</th>
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
  <script src="${ctxsta}/cms/js/onlineAdvertDetail.js"></script> 
</myfooter>
</body>
</html>