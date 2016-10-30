<%@ page language="java" import="java.util.*"  contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<script src="${ctxsta}/web/header/ajax.cart.js"></script>
									<c:if test="${empty shoppingCart.cartMessageList}"><div class="cart_content_null">购物车中还没有商品，赶紧选购吧！</div></c:if>
									<c:if test="${!empty shoppingCart.cartMessageList}">
                                    <div class="cart_content_all" >
                                        <ul>
                                        <c:forEach items="${shoppingCart.cartMessageList}" var="cartMessageList">
	                                        <li>
	                                            <a href="${ctx }/front/detail/${cartMessageList.goodsId}"><img src="" /></a>
	                                            <p><a href="${ctx }/front/detail/${cartMessageList.goodsId}">${cartMessageList.goods.goodsName } ${cartMessageList.goodsStandard } ${cartMessageList.goodsColor }</a></p>
	                                            <span class="price">${cartMessageList.orderMoney }元 x ${cartMessageList.orderNumber }</span>
	                                            <ins>x</ins>
	                                        </li>
	                                    </c:forEach>
	                                    </ul>
	                                    <div class="cart-btn">
	                                        <p>共计 ${shoppingCart.totalNumber } 件商品 <span class="price">${shoppingCart.totalMoney }元</span></p>
	                                        <button class="btn"  onclick="location.href='${ctx}/cart';">去结算</button>
	                                         <div class="clear"></div>
	                                    </div>
                                    </div>
                                    </c:if>