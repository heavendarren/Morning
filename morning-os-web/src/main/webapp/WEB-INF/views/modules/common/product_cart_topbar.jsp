<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!--     导航栏购物车 begin       -->

<c:if test="${not empty cartVO}">
  <ul class="cart-list">
    <c:forEach items="${cartVO.shoppingCartVOs}" var="shoppingCart">
      <li>
        <div class="cart-item clearfix first"><a class="thumb" href="${ctx }/item/${shoppingCart.productNumber}"><img alt="${shoppingCart.name}" src="${ctximg }/${shoppingCart.picImg}" width="60" height="60"></a><a class="name" href="${ctx }/item/${shoppingCart.productNumber}">${shoppingCart.name}
          <c:forEach items="${shoppingCart.specificationName }" var="specificationName">&nbsp;${specificationName}</c:forEach>
          </a><span class="price">${shoppingCart.price}元 × ${shoppingCart.buyNumber}</span><a class="btn-del J_delItem" href="javascript: void(0);"><i class="glyphicon glyphicon-remove" onclick="cart_delete(this, ${shoppingCart.productSpecNumber})"></i></a></div>
      </li>
    </c:forEach>
  </ul>
  <div class="cart-total clearfix"><span class="total">共 <em>${cartVO.totalNumber }</em> 件商品<span class="price"><em>${cartVO.totalPrice }</em>元</span></span><a href="${ctx}/cart/" class="btn btn-primary btn-cart">去购物车结算</a></div>
</c:if>
<c:if test="${empty cartVO}">
  <div class="loading"> 购物车中还没有商品，赶紧选购吧！ </div>
</c:if>
<!--     导航栏购物车 end         --> 