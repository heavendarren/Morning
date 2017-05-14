<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>我的订单 - 猫宁商城</title>
</head>
<body>
<div class="span16">
  <div class="uc-box uc-main-box">
    <div class="uc-content-box order-list-box">
      <div class="box-hd">
        <h1 class="title">我的订单<small>请谨防钓鱼链接或诈骗电话，<a href="" target="_blank">了解更多&gt;</a></small></h1>
        <div class="more clearfix">
          <ul class="filter-list J_orderType">
            <li class="first ${type eq 0 ? 'active':''}"><a href="${ctx}/uc/order/list?type=0" data-type="0">全部有效订单</a></li>
            <li class="${type eq 1 ? 'active':''}"><a id="J_unpaidTab" href="${ctx}/uc/order/list?type=1" data-type="1">待支付</a></li>
            <li class="${type eq 2 ? 'active':''}"><a id="J_sendTab" href="${ctx}/uc/order/list?type=2" data-type="2">待收货</a></li>
            <li class="${type eq 3 ? 'active':''}"><a href="${ctx}/uc/order/list?type=3" data-type="3">已关闭</a></li>
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
        <div id="J_orderList" >
          <div class="loading hide">
            <div class="loader"></div>
          </div>
        </div>
        <div id="J_orderList">
          <ul class="order-list">
            <c:forEach items="${orderVOs}" var="orderVO">
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
                          <th class="col-main"> <p class="caption-info">
                              <fmt:formatDate value="${orderVO.createTime}" pattern="yyyy年MM月dd日 hh:mm" />
                              <span class="sep">|</span>陈星星<span class="sep">|</span>订单号： <a href="${ctx}/uc/order/${orderVO.orderNumber}">${orderVO.orderNumber}</a><span class="sep">|</span>在线支付</p>
                          </th>
                          <th class="col-sub"> <p class="caption-price">订单金额：<span class="num">${orderVO.payAmount}</span>元</p>
                          </th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td class="order-items"><ul class="goods-list">
                              <c:forEach items="${orderVO.orderProducts}" var="orderProduct">
                                <li>
                                  <div class="figure figure-thumb"> <a href="${ctx}/detail/${orderProduct.productNumber}" target="_blank"> <img src="${ctximg}/${orderProduct.picImg}" width="80" height="80" alt="${orderProduct.name}&nbsp;&nbsp;${orderProduct.productSpecName}" title="${orderProduct.name}&nbsp;&nbsp;${orderProduct.productSpecName}"> </a> </div>
                                  <p class="name"> <a target="_blank" href="${ctx}/detail/${orderProduct.productNumber}">${orderProduct.name}&nbsp;&nbsp;${orderProduct.productSpecName}</a> </p>
                                  <p class="price">${orderProduct.price}元 × ${orderProduct.buyNumber}</p>
                                </li>
                              </c:forEach>
                            </ul></td>
                          <td class="order-actions"><a class="btn btn-small btn-primary" href="${ctx}/buy/confirm/${orderVO.orderNumber}" target="_blank">立即支付</a> <a class="btn btn-small btn-line-gray" href="${ctx}/uc/order/${orderVO.orderNumber}">订单详情</a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </li>
              </c:if>
              <c:if test="${orderVO.orderStatus eq 2 || orderVO.orderStatus eq 3}">
                <li class="uc-order-item uc-order-item-shipping">
                  <div class="order-detail">
                    <div class="order-summary">
                      <div class="order-status">待出库</div>
                      <p class="order-desc J_deliverDesc"> 我们将尽快为您发货 </p>
                    </div>
                    <table class="order-detail-table">
                      <thead>
                        <tr>
                          <th class="col-main"> <p class="caption-info">
                              <fmt:formatDate value="${orderVO.createTime}" pattern="yyyy年MM月dd日 hh:mm" />
                              <span class="sep">|</span>陈星星<span class="sep">|</span>订单号： <a href="${ctx}/uc/order/${orderVO.orderNumber}">${orderVO.orderNumber}</a><span class="sep">|</span>在线支付</p>
                          </th>
                          <th class="col-sub"> <p class="caption-price">订单金额：<span class="num">${orderVO.payAmount}</span>元</p>
                          </th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td class="order-items"><ul class="goods-list">
                              <c:forEach items="${orderVO.orderProducts}" var="orderProduct">
                                <li>
                                  <div class="figure figure-thumb"> <a href="${ctx}/detail/${orderProduct.productNumber}" target="_blank"> <img src="${ctximg}/${orderProduct.picImg}" width="80" height="80" alt="${orderProduct.name}&nbsp;&nbsp;${orderProduct.productSpecName}" title="${orderProduct.name}&nbsp;&nbsp;${orderProduct.productSpecName}"> </a> </div>
                                  <p class="name"> <a target="_blank" href="${ctx}/detail/${orderProduct.productNumber}">${orderProduct.name}&nbsp;&nbsp;${orderProduct.productSpecName}</a> </p>
                                  <p class="price">${orderProduct.price}元 × ${orderProduct.buyNumber}</p>
                                </li>
                              </c:forEach>
                            </ul></td>
                          <td class="order-actions"><a class="btn btn-small btn-line-gray" href="${ctx}/uc/order/${orderVO.orderNumber}">订单详情</a></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </li>
              </c:if>
              <c:if test="${orderVO.orderStatus eq 6}">
                <li class="uc-order-item uc-order-item-finish">
                  <div class="order-detail">
                    <div class="order-summary">
                      <div class="order-status">已收货</div>
                    </div>
                    <table class="order-detail-table">
                      <thead>
                        <tr>
                          <th class="col-main"> <p class="caption-info">
                              <fmt:formatDate value="${orderVO.createTime}" pattern="yyyy年MM月dd日 hh:mm" />
                              <span class="sep">|</span>陈星星<span class="sep">|</span>订单号： <a href="${ctx}/uc/order/${orderVO.orderNumber}">${orderVO.orderNumber}</a><span class="sep">|</span>在线支付</p>
                          </th>
                          <th class="col-sub"> <p class="caption-price">订单金额：<span class="num">${orderVO.payAmount}</span>元</p>
                          </th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td class="order-items"><ul class="goods-list">
                              <c:forEach items="${orderVO.orderProducts}" var="orderProduct">
                                <li>
                                  <div class="figure figure-thumb"> <a href="${ctx}/detail/${orderProduct.productNumber}" target="_blank"> <img src="${ctximg}/${orderProduct.picImg}" width="80" height="80" alt="${orderProduct.name}&nbsp;&nbsp;${orderProduct.productSpecName}" title="${orderProduct.name}&nbsp;&nbsp;${orderProduct.productSpecName}"> </a> </div>
                                  <p class="name"> <a target="_blank" href="${ctx}/detail/${orderProduct.productNumber}">${orderProduct.name}&nbsp;&nbsp;${orderProduct.productSpecName}</a> </p>
                                  <p class="price">${orderProduct.price}元 × ${orderProduct.buyNumber}</p>
                                </li>
                              </c:forEach>
                            </ul></td>
                          <td class="order-actions"><a class="btn btn-small btn-line-gray" href="${ctx}/uc/order/${orderVO.orderNumber}">订单详情</a> <a class="btn btn-small btn-line-gray" href="" target="_blank">申请售后</a></td>
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
                          <th class="col-main"> <p class="caption-info">
                              <fmt:formatDate value="${orderVO.createTime}" pattern="yyyy年MM月dd日 hh:mm" />
                              <span class="sep">|</span>陈星星<span class="sep">|</span>订单号： <a href="${ctx}/uc/order/${orderVO.orderNumber}">${orderVO.orderNumber}</a><span class="sep">|</span>在线支付</p>
                          </th>
                          <th class="col-sub"> <p class="caption-price">订单金额：<span class="num">${orderVO.payAmount}</span>元</p>
                          </th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td class="order-items"><ul class="goods-list">
                              <c:forEach items="${orderVO.orderProducts}" var="orderProduct">
                                <li>
                                  <div class="figure figure-thumb"> <a href="${ctx}/detail/${orderProduct.productNumber}" target="_blank"> <img src="${ctximg}/${orderProduct.picImg}" width="80" height="80" alt="${orderProduct.name}&nbsp;&nbsp;${orderProduct.productSpecName}" title="${orderProduct.name}&nbsp;&nbsp;${orderProduct.productSpecName}"> </a> </div>
                                  <p class="name"> <a target="_blank" href="${ctx}/detail/${orderProduct.productNumber}">${orderProduct.name}&nbsp;&nbsp;${orderProduct.productSpecName}</a> </p>
                                  <p class="price">${orderProduct.price}元 × ${orderProduct.buyNumber}</p>
                                </li>
                              </c:forEach>
                            </ul></td>
                          <td class="order-actions"><a class="btn btn-small btn-line-gray" href="${ctx}/uc/order/${orderVO.orderNumber}">订单详情</a></td>
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
          <c:if test="${pageInfo.total gt pageInfo.limit and not empty orderVOs}">
            <div id="pager" data-pager-href="${ctx}/uc/order/list?type=${type}&search=${search}&page=" data-pager-totalPage="${pageInfo.totalPage}" data-pager-nowpage="${pageInfo.current}" data-pager-total="${pageInfo.total}"></div>
          </c:if>
        </div>
      </div>
    </div>
  </div>
</div>
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