<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
  <head>
    <title>产品列表</title>
    <link rel="stylesheet" href="${ctxsta}/common/bootstrap-table-master/bootstrap-table.min.css" />
    <link rel="stylesheet" href="${ctxsta}/common/bootstrap-datepicker-master/css/bootstrap-datepicker.min.css" />
  </head>
  
  <body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight" >
        <div class="row">
            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>产品数量</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            <a class="close-link"><i class="fa fa-times"></i></a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins">${onGoodsNumber}/${allGoodsNumber}<span class="label label-warning pull-right">上架</span></h1>
                        <h1 class="no-margins">${outGoodsNumber}/${allGoodsNumber}<span class="label label-warning pull-right">下架</span></h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-9">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>搜索查询</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            <a class="close-link"><i class="fa fa-times"></i></a>
                        </div>
                    </div>
                    <div class="ibox-content search-query">
                    <form action="${ctx}/system/goods/list" method="post" id="searchForm">
                        <div class="col-sm-6">
                            <div class="form-group" id="data_5">
                                <label class="control-label">添加时间</label>
                                <div class="input-daterange input-group" id="datepicker">
                                    <input type="text" class="form-control" name="queryGoods.beginCreateTime" value="" />
                                    <span class="input-group-addon">到</span>
                                    <input type="text" class="form-control" name="queryGoods.endCreateTime" value="" />
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="control-label">产品信息</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" name="queryGoods.search"> 
                                    <span class="input-group-btn"><button type="button" class="btn btn-primary" onclick="javascript:$('#searchForm').submit();">搜索</button> </span>
                                </div>
                            </div>
                        </div>
                    </form>
                    </div>
                </div>
            </div>
       </div>
       <div class="row">
            <div class="col-sm-3">
                <div class="ibox">
                    <div class="ibox-content">
                        <h3>产品类目列表</h3>
                        <p class="small"><i class="fa fa-hand-o-up"></i> 在列表之间拖动产品分类</p>
                        <ul class="sortable-list connectList agile-list">
                        <c:forEach items="${goodsClassifies}" var="goodsClassify" varStatus="status">
                            <li class="<c:if test="${status.index % 3 == 0 }">success-element</c:if><c:if test="${status.index % 3 == 1 }">warning-element</c:if><c:if test="${status.index % 3 == 2 }">info-element</c:if>">
                                ${goodsClassify.classifyName }<span class="badge <c:if test="${status.index % 3 == 0 }">badge-primary</c:if><c:if test="${status.index % 3 == 1 }">badge-warning</c:if><c:if test="${status.index % 3 == 2 }">badge-success</c:if> m-l">${goodsClassify.number}</span>
                                <div class="agile-detail">
                                    <a onclick="member_show('${goodsClassify.classifyName }','${ctx }/system/goods/list','${goodsClassify.classifyId}','goods','1000',null)" class="pull-right btn btn-xs <c:if test="${status.index % 3 == 0 }">btn-primary</c:if><c:if test="${status.index % 3 == 1 }">btn-warning</c:if><c:if test="${status.index % 3 == 2 }">btn-success</c:if>">查看</a>
                                    <i class="fa fa-clock-o"></i> 
                                </div>
                            </li>
                        </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-sm-9">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>产品列表</h5>
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
                                        <div id="toolbar" class="btn-group m-t-sm">
                                            <button type="button" class="btn btn-default"  title="创建用户" onclick="member_show('创建用户','${ctx}/system/sysuser/list/add',null,null,'900',null)">
                                                <i class="glyphicon glyphicon-plus"></i>
                                            </button>
                                            <button type="button" class="btn btn-default"  title="刷新列表" onclick="javascript:window.location.reload()">
                                                <i class="glyphicon glyphicon-refresh"></i>
                                            </button>                                           
                                        </div>
                                        <table id="table"
                                           data-toggle="table"
                                           data-height="500"
                                           data-search="true"
                                           data-show-toggle="true"
                                           data-show-export="true"
                                           data-show-pagination-switch="true"
                                           data-show-columns="true"
                                           data-striped="true"
                                           data-pagination="true"
                                           data-sort-name="stargazers_count"
                                           data-sort-order="desc"
                                           data-toolbar="#toolbar">
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
    	</div>
    </div>
    <myfooter>
    <!-- jquery-ui-->
    <script src="${ctxsta}/common/jquery/jquery-ui.min.js"></script>
    <!-- layer javascript -->
    <script src="${ctxsta}/common/layer/layer.js"></script>
    <!-- Bootstrap table -->
    <script src="${ctxsta}/common/bootstrap-table-master/bootstrap-table.min.js"></script>
    <script src="${ctxsta}/common/bootstrap-table-master/extensions/export/bootstrap-table-export.js"></script>
    <script src="${ctxsta}/common/bootstrap-table-master/tableExport.js"></script>
    <script src="${ctxsta}/common/bootstrap-table-master/locale/bootstrap-table-zh-CN.min.js"></script>
    <!-- Data picker -->
    <script src="${ctxsta}/common/bootstrap-datepicker-master/js/bootstrap-datepicker.min.js"></script>
    <!-- 自定义js -->
    <script src="${ctxsta}/admin/main/js/systemGoodsList.js"></script>
    </myfooter>
  </body>
</html>
