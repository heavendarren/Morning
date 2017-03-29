<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>我的订单 - 猫宁商城</title>
<link rel="stylesheet" href="${ctxsta}/web/css/main.css">
</head>
<body>
<!-- 轮播top菜单导航引入 -->
<jsp:include page="/WEB-INF/views/modules/common/site-header.jsp" />
<!-- 轮播top菜单导航引入 --> 

<!--     导航栏 begin       -->
<div class="breadcrumbs">
  <div class="container-fluid"> <a href="" >首页</a><span class="sep">&gt;</span><span>交易订单</span> </div>
</div>
<!--     导航栏 begin       --> 

<!--     个人中心 begin       -->
<div class="page-main user-main">
  <div class="container-fluid">
    <div class="row">
      <div class="span4">
        <div class="uc-box uc-sub-box">
          <div class="uc-nav-box">
            <div class="box-hd">
              <h3 class="title">收货地址</h3>
            </div>
            <div class="box-bd">
              <ul class="uc-nav-list">
                <li><a href="${ctx}/uc/order/list">我的订单</a></li>
                <li><a href="${ctx}/uc/order/comment" data-count="comment" data-count-style="bracket">评价晒单</a></li>
              </ul>
            </div>
          </div>
          <div class="uc-nav-box">
            <div class="box-hd">
              <h3 class="title">个人中心</h3>
            </div>
            <div class="box-bd">
              <ul class="uc-nav-list">
                <li><a href="${ctx}/uc/user/portal">我的个人中心</a></li>
                <li><a href="">消息通知<i class="J_miMessageTotal"></i></a></li>
                <li><a href="${ctx}/uc/user/favorite">喜欢的商品</a></li>
                <li><a href="${ctx}/uc/user/address">收货地址</a></li>
              </ul>
            </div>
          </div>
          <div class="uc-nav-box">
            <div class="box-hd">
              <h3 class="title">账户管理</h3>
            </div>
            <div class="box-bd">
              <ul class="uc-nav-list">
                <li><a href="" target="_blank">个人信息</a></li>
                <li><a href="" target="_blank">修改密码</a></li>
                <li><a href="" target="_blank">社区VIP认证</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="span16">
        <div class="uc-box uc-main-box">
          <div class="uc-content-box order-list-box">
            <div class="box-hd">
              <h1 class="title">我的订单<small>请谨防钓鱼链接或诈骗电话，<a href="" target="_blank">了解更多&gt;</a></small></h1>
              <div class="more clearfix">
                <ul class="filter-list J_orderType">
                  <li class="first ${type eq 0 ? 'active':'' }"><a href="${ctx}/uc/order/list?type=0" data-type="0">全部有效订单</a></li>
                  <li class="${type eq 1 ? 'active':'' }"><a id="J_unpaidTab" href="${ctx}/uc/order/list?type=1" data-type="1">待支付</a></li>
                  <li class="${type eq 2 ? 'active':'' }"><a id="J_sendTab" href="${ctx}/uc/order/list?type=2" data-type="2">待收货</a></li>
                  <li class="${type eq 3 ? 'active':'' }"><a href="${ctx}/uc/order/list?type=3" data-type="3">已关闭</a></li>
                </ul>
                <form id="J_orderSearchForm" class="search-form clearfix" action="" method="get">
                  <label for="search" class="hide">站内搜索</label>
                  <input class="search-text" type="search" id="J_orderSearchKeywords" name="search" value="${search}" autocomplete="off" placeholder="输入商品名称、商品编号、订单号" />
                  <input type="hidden" name="type" value="4" />
                  <input type="submit" class="search-btn iconfont" value="搜索" />
                </form>
              </div>
            </div>
            <div class="box-bd">
              <div id="J_orderList">
                <div class="loading">
                  <div class="loader"></div>
                </div>
              </div>
              <div id="J_orderList">
                <ul class="order-list">
                <c:forEach items="${orderVOs }" var="orderVO">
                <c:if test="${orderVO.orderStatus eq 1}">
                  <li class="uc-order-item uc-order-item-pay">
                    <div class="order-detail">
                      <div class="order-summary">
                        <div class="order-status">等待付款</div>
                        <p class="order-desc J_deliverDesc"> 我们将尽快为您发货 </p>
                      </div>
                      <table class="order-detail-table">
                        <thead>
                          <tr>
                            <th class="col-main"> <p class="caption-info">${orderVO.createTime}<span class="sep">|</span>陈星星<span class="sep">|</span>订单号： <a href="">${orderVO.orderNumber}</a><span class="sep">|</span>在线支付</p>
                            </th>
                            <th class="col-sub"> <p class="caption-price">订单金额：<span class="num">${orderVO.payAmount}</span>元</p>
                            </th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td class="order-items">
                            <ul class="goods-list">
                            <c:forEach items="${orderVO.orderProducts }" var="orderProduct">
                                <li>
                                  <div class="figure figure-thumb"> <a href="${ctx }/item/${orderProduct.productNumber}" target="_blank"> <img src="${ctximg }/${orderProduct.picImg}" width="80" height="80" alt="${orderProduct.name}&nbsp;&nbsp;${orderProduct.productSpecName}" title="${orderProduct.name}&nbsp;&nbsp;${orderProduct.productSpecName}"> </a> </div>
                                  <p class="name"> <a target="_blank" href="${ctx }/item/${orderProduct.productNumber}">${orderProduct.name}&nbsp;&nbsp;${orderProduct.productSpecName}</a> </p>
                                  <p class="price">${orderProduct.price}元 × ${orderProduct.buyNumber}</p>
                                </li>
                              </c:forEach>  
                              </ul>
                              </td>
                            <td class="order-actions"><a class="btn btn-small btn-primary" href="" target="_blank">立即支付</a> <a class="btn btn-small btn-line-gray" href="">订单详情</a></td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </li>
                </c:if>
                <c:if test="${orderVO.orderStatus eq 3 || orderVO.orderStatus eq 4}">
                  <li class="uc-order-item uc-order-item-shipping">
                    <div class="order-detail">
                      <div class="order-summary">
                        <div class="order-status">待出库</div>
                        <p class="order-desc J_deliverDesc"> 我们将尽快为您发货 </p>
                      </div>
                      <table class="order-detail-table">
                        <thead>
                          <tr>
                            <th class="col-main"> <p class="caption-info">${orderVO.createTime}<span class="sep">|</span>陈星星<span class="sep">|</span>订单号： <a href="">${orderVO.orderNumber}</a><span class="sep">|</span>在线支付</p>
                            </th>
                            <th class="col-sub"> <p class="caption-price">订单金额：<span class="num">${orderVO.payAmount}</span>元</p>
                            </th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td class="order-items">
                            <ul class="goods-list">
                            <c:forEach items="${orderVO.orderProducts }" var="orderProduct">
                                <li>
                                  <div class="figure figure-thumb"> <a href="${ctx }/item/${orderProduct.productNumber}" target="_blank"> <img src="${ctximg }/${orderProduct.picImg}" width="80" height="80" alt="${orderProduct.name}&nbsp;&nbsp;${orderProduct.productSpecName}" title="${orderProduct.name}&nbsp;&nbsp;${orderProduct.productSpecName}"> </a> </div>
                                  <p class="name"> <a target="_blank" href="${ctx }/item/${orderProduct.productNumber}">${orderProduct.name}&nbsp;&nbsp;${orderProduct.productSpecName}</a> </p>
                                  <p class="price">${orderProduct.price}元 × ${orderProduct.buyNumber}</p>
                                </li>
                              </c:forEach>  
                              </ul>
                              </td>
                            <td class="order-actions"><a class="btn btn-small btn-line-gray" href="">订单详情</a></td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </li>
                </c:if>                
                <c:if test="${orderVO.orderStatus eq 5}">
                  <li class="uc-order-item uc-order-item-finish">
                    <div class="order-detail">
                      <div class="order-summary">
                        <div class="order-status">已收货</div>
                      </div>
                      <table class="order-detail-table">
                        <thead>
                          <tr>
                            <th class="col-main"> <p class="caption-info">${orderVO.createTime}<span class="sep">|</span>陈星星<span class="sep">|</span>订单号： <a href="">${orderVO.orderNumber}</a><span class="sep">|</span>在线支付</p>
                            </th>
                            <th class="col-sub"> <p class="caption-price">订单金额：<span class="num">${orderVO.payAmount}</span>元</p>
                            </th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td class="order-items"><ul class="goods-list">
                            <c:forEach items="${orderVO.orderProducts }" var="orderProduct">
                                <li>
                                  <div class="figure figure-thumb"> <a href="${ctx }/item/${orderProduct.productNumber}" target="_blank"> <img src="${ctximg }/${orderProduct.picImg}" width="80" height="80" alt="${orderProduct.name}&nbsp;&nbsp;${orderProduct.productSpecName}" title="${orderProduct.name}&nbsp;&nbsp;${orderProduct.productSpecName}"> </a> </div>
                                  <p class="name"> <a target="_blank" href="${ctx }/item/${orderProduct.productNumber}">${orderProduct.name}&nbsp;&nbsp;${orderProduct.productSpecName}</a> </p>
                                  <p class="price">${orderProduct.price}元 × ${orderProduct.buyNumber}</p>
                                </li>
                              </c:forEach>  
                              </ul></td>
                            <td class="order-actions"><a class="btn btn-small btn-line-gray" href="">订单详情</a> <a class="btn btn-small btn-line-gray" href="" target="_blank">申请售后</a></td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </li>                
                </c:if>
                <c:if test="${orderVO.orderStatus eq 11 || orderVO.orderStatus eq 12}">
                  <li class="uc-order-item uc-order-item-finish">
                    <div class="order-detail">
                      <div class="order-summary">
                        <div class="order-status">已关闭</div>
                      </div>
                      <table class="order-detail-table">
                        <thead>
                          <tr>
                            <th class="col-main"> <p class="caption-info">${orderVO.createTime}<span class="sep">|</span>陈星星<span class="sep">|</span>订单号： <a href="">${orderVO.orderNumber}</a><span class="sep">|</span>在线支付</p>
                            </th>
                            <th class="col-sub"> <p class="caption-price">订单金额：<span class="num">${orderVO.payAmount}</span>元</p>
                            </th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td class="order-items"><ul class="goods-list">
                            <c:forEach items="${orderVO.orderProducts }" var="orderProduct">
                                <li>
                                  <div class="figure figure-thumb"> <a href="${ctx }/item/${orderProduct.productNumber}" target="_blank"> <img src="${ctximg }/${orderProduct.picImg}" width="80" height="80" alt="${orderProduct.name}&nbsp;&nbsp;${orderProduct.productSpecName}" title="${orderProduct.name}&nbsp;&nbsp;${orderProduct.productSpecName}"> </a> </div>
                                  <p class="name"> <a target="_blank" href="${ctx }/item/${orderProduct.productNumber}">${orderProduct.name}&nbsp;&nbsp;${orderProduct.productSpecName}</a> </p>
                                  <p class="price">${orderProduct.price}元 × ${orderProduct.buyNumber}</p>
                                </li>
                              </c:forEach>  
                              </ul></td>
                            <td class="order-actions"><a class="btn btn-small btn-line-gray" href="">订单详情</a></td>
                          </tr>
                        </tbody>
                      </table>
                    </div>
                  </li>                
                </c:if>
                </c:forEach>
                </ul>
              </div>
              <div id="J_orderListPages">
              <c:if test="${pageInfo.total gt pageInfo.pagesize and not empty orderVOs}">
	          	<div id="pager" data-pager-href="${ctx}/uc/order/list?page=" data-pager-totalPage="${pageInfo.totalPage}" data-pager-nowpage="${pageInfo.nowpage}" data-pager-total="${pageInfo.total}"></div>
              </c:if>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!--     个人中心 end       -->
<div style="padding-bottom:130px;"></div>
              
<myfooter> 
  <!-- layer javascript --> 
  <script src="${ctxsta}/common/layer/layer.js"></script> 
  <!-- 分页js --> 
  <script src="${ctxsta}/common/pager/jquery.pager.js"></script> 
  <script type="text/javascript">
		var pagecount = $('#pager').attr('data-pager-totalPage'); // 总页面数
		var nowpage = $('#pager').attr('data-pager-nowpage'); // 当前页数
		var href = $('#pager').attr('data-pager-href'); // 链接地址
		$(document).ready(function() {
			$("#pager").pager({
				pagenumber : nowpage,
				pagecount : pagecount,
				buttonClickCallback : PageClick
			});
		});
		PageClick = function(number) {
			$("#pager").pager({
				pagenumber : number,
				pagecount : pagecount,
				buttonClickCallback : PageClick
			});
			window.location.href = href + number;
  	}
  </script> 
</myfooter>
</body>
</html>