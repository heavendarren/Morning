<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>产品分类列表</title>
    <link rel="stylesheet" href="${ctxsta}/common/bootstrap-table-master/bootstrap-table.min.css" />
    <link rel="stylesheet" href="${ctxsta}/common/bootstrap-datepicker-master/css/bootstrap-datepicker.min.css" />
  </head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>产品分类信息</h5>
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
                                   data-height="400"
                                   data-search="true"
                                   data-show-refresh="true"
                                   data-show-toggle="true"
                                   data-show-export="true"
                                   data-show-pagination-switch="true"
                                   data-show-columns="true"
                                   data-striped="true"
                                   data-pagination="true"
                                   data-sort-name="stargazers_count"
                                   data-sort-order="desc">
                                <thead>
                                <tr>
                                     <th data-halign="center" data-align="center" data-sortable="true">产品编号</th>
                                     <th data-halign="center" data-align="center" data-sortable="true">产品名称</th>
                                     <th data-halign="center" data-align="center" data-sortable="true">价格</th>
                                     <th data-halign="center" data-align="center" data-sortable="true">库存</th>
                                     <th data-halign="center" data-align="center" data-sortable="true">总销量</th>
                                     <th data-halign="center" data-align="center" data-sortable="true">发布时间</th>
                                     <th data-halign="center" data-align="center" data-sortable="true">状态</th>
                                     <th data-halign="center" data-align="center">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${goodsList}" var="goods">
                                    <tr>
                                        <td>
                                            <a href="javascript:void(0)" onclick="member_show('${systemUsers.userName}','${ctx}/system/sysuser/list','${systemUsers.accountId}','detail','500','400')">${goods.goodsNumber}</a>
                                        </td>
                                        <td><a href="${ctx}/front/detail/${goods.goodsId}" target="_blank" title="${goods.goodsDescript}">${goods.goodsName}</a></td>
                                        <td>${goods.goodsPrice}</td>
                                        <td>${goods.goodsSaveInfo}</td>
                                        <td>${goods.goodsBuyNum}</td>
                                        <td><fmt:formatDate value="${goods.createTime}" pattern="yyyy/MM/dd HH:mm" /></td>
                                        <td class="td-status">
                                        <c:if test="${goods.status==1}"><span class="label label-primary">出售中</span></c:if>
                                        <c:if test="${goods.status==0}"><span class="label label-danger">已下架</span></c:if>
                                        </td>
                                        <td class="td-manage">  
                                        <c:if test="${goods.status==1}"><a class="like text-info" href="javascript:void(0)" onClick="member_stop(this,${goods.goodsId})" title="下架"><i class="glyphicon glyphicon-pause"></i></a></c:if>
                                        <c:if test="${goods.status==0}"><a class="like text-info" href="javascript:void(0)" onClick="member_start(this,${goods.goodsId})" title="上架"><i class="glyphicon glyphicon-play"></i></a></c:if>
                                        <a class="edit m-l-sm text-warning" href="javascript:void(0)" onclick="member_show('${systemUsers.userName}','${ctx}/system/sysuser/list','${systemUsers.accountId}','edit','900',null)" title="编辑">
                                        <i class="glyphicon glyphicon-edit"></i>
                                        </a>
                                        <a class="remove m-l-sm text-danger" href="javascript:void(0)" onclick="member_del(this,${goods.goodsId})" title="删除">
                                        <i class="glyphicon glyphicon-remove"></i>
                                        </a>
                                        <a class="remove m-l-sm text-primary" href="javascript:void(0)" onclick="member_show('${systemUsers.userName}','${ctx}/system/sysuser/list','${systemUsers.accountId}','log','900',null)" title="日志">
                                        <i class="glyphicon glyphicon-list-alt"></i>
                                        </a>
                                        </td>
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
    <myfooter>
    <!-- jquery-ui-->
    <script src="${ctxsta}/common/jquery/jquery-ui.min.js"></script>
    <!-- Bootstrap table -->
    <script src="${ctxsta}/common/bootstrap-table-master/bootstrap-table.min.js"></script>
    <script src="${ctxsta}/common/bootstrap-table-master/extensions/export/bootstrap-table-export.js"></script>
    <script src="${ctxsta}/common/bootstrap-table-master/tableExport.js"></script>
    <script src="${ctxsta}/common/bootstrap-table-master/locale/bootstrap-table-zh-CN.min.js"></script>
    <!-- layer javascript -->
    <script src="${ctxsta}/common/layer/layer.js"></script>
    <!-- Data picker -->
    <script src="${ctxsta}/common/bootstrap-datepicker-master/js/bootstrap-datepicker.min.js"></script>
    <!-- 自定义js -->
    <script src="${ctxsta}/admin/main/js/systemGoodsList.js"></script>
    </myfooter>
</body>
</html>