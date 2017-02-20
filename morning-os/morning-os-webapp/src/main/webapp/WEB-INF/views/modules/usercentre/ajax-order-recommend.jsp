<%@ page language="java" import="java.util.*"  contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<script src="${ctxsta}/web/js/jquery.pager.js"></script>
<script src="${ctxsta}/web/js/order/page.js"></script>
								<c:forEach items="${orderList}" var="orderList">
                            	<li class="uc-order-item 
                            				   <c:choose>
			                                        <c:when test="${orderList.orderState == '1'}">uc-order-item-pay</c:when>
			                                        <c:when test="${orderList.orderState == '2'}">uc-order-item-shipping</c:when>
			                                        <c:when test="${orderList.orderState == '3'}">uc-order-item-receipt</c:when>
			                                        <c:when test="${orderList.orderState == '4'}">uc-order-item-finish</c:when>
			                                    </c:choose>">
                                	<div class="order-detail">
                                    	<div class="order-summary">
                                        	<div class="order-status">
			                                    <c:choose>
			                                        <c:when test="${orderList.orderState == '1'}">待付款</c:when>
			                                        <c:when test="${orderList.orderState == '2'}">待发货</c:when>
			                                        <c:when test="${orderList.orderState == '3'}">待收货</c:when>
			                                        <c:otherwise>已收货</c:otherwise>
			                                    </c:choose>	
											</div>
                                        </div>
                                        <table class="order-detail-table">
      										<thead>
        										<tr>
          											<th class="col-main">
            											<p class="caption-info">
                                                             <fmt:formatDate value="${orderList.orderDate }" pattern="yyyy年MM月dd日 HH:mm分" /><span class="sep">|</span>
								                             ${orderList.userAddress.orderUserName }<span class="sep">|</span>
								                                                          订单号：<a href="">${orderList.orderNumber }</a><span class="sep">|</span>
								                             <c:choose>
						                                        <c:when test="${orderList.payType == '1'}">在线支付</c:when>
						                                        <c:otherwise>货到付款</c:otherwise>
						                                    </c:choose>	
                                                        </p>
          											</th>
          											<th class="col-sub">
            											<p class="caption-price">
                                                        	订单金额：<span class="num">${orderList.totalMoney }</span>元
                                                        </p>
          											</th>
        										</tr>
      										</thead>
     									 	<tbody>
        										<tr>
                                                	<td class="order-items">
                                               			<ul class="goods-list">
                                               				<c:forEach items="${orderList.orderMessageList}" var="orderMessageList">
                                                        	<li>
                												<div class="figure figure-thumb">
                                                                	<a href="${ctx}/front/detail/${orderMessageList.goods.goodsId}" target="_blank">
                                                                    	<img src="${ctx}/commodity/${orderMessageList.goods.goodsImagename}.jpg" width="80" height="80" alt="" />
                                                                    </a>
                												</div>
                                                                <p class="name">
                  													<a href="${ctx}/front/detail/${orderMessageList.goods.goodsId}" target="_blank">
																		${orderMessageList.goods.goodsName }  ${orderMessageList.goodsColor }  ${orderMessageList.goodsStandard } 
                                                                    </a>
                												</p>
                												<p class="price">
                                                                	${orderMessageList.orderMoney }元 &times; ${orderMessageList.orderNumber }
                                                                </p>
                                                        	</li>
                                                        	</c:forEach>
                                                		</ul>
                                                	</td>
                                                    <td class="order-actions">
                                                    <c:choose>
				                                        <c:when test="${orderList.orderState == '1'}"><a class="btn btn-small btn-ocean" href="${ctx}/order/${orderList.orderNumber }/payment">立即支付</a></c:when>
				                                        <c:when test="${orderList.orderState == '3'}"><a class="btn btn-small btn-primary" onclick="checkoutToReceiving(${orderList.orderNumber},this)">确认收货</a></c:when>
				                                    </c:choose>	
                                                    	<a class="btn btn-small btn-line-gray" href="${ctx}/user/orderView/${orderList.orderNumber }">订单详情</a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </li>
                                </c:forEach>
                                <c:if test="${pageInfo != null && pageInfo.totalNumber>2}">
				                 <div class="page">
									<div id="pager" data-type="${queryOrder.orderState}" data-search="${queryOrder.orderSearch}" data-currentPage="${pageInfo.currentPage}" data-totalPage="${pageInfo.totalPage}"></div>
					    		</div>  
					    		</c:if>
