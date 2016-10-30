<%@ page language="java" import="java.util.*"  contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <title>我的购物车 | Morning 猫宁</title>
	<link  rel="stylesheet" href="${ctxsta}/web/css/cart.css" />
  </head>
<body>
	<!-- 目录导航栏引入 -->
	<jsp:include page="/WEB-INF/views/web/common/topnav.jsp" />
	<!-- 目录导航栏引入 -->
        <!-- 中间内容栏开始 -->
        <div id="order-content">
        	<div id="content-details">
            	<table id="cartTable">
                    <thead>
                      <tr>
                        <th><label><input class="check-all check" type="checkbox"/>&nbsp;&nbsp;全选</label></th>
                        <th>商品名称</th>
                        <th>单价</th>
                        <th>数量</th>
                        <th>小计</th>
                        <th>操作</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:set var="index" value="-1" />
                    <c:forEach items="${shoppingCart.cartMessageList}" var="cartMessageList">
                    <c:set var="index" value="${index+1}" />
                      <tr>
                        <td class="checkbox"><input class="check-one check" type="checkbox"/></td>
                        <td class="goods"><img src="commodity/${cartMessageList.goods.goodsImagename}.jpg" alt=""/><span>${cartMessageList.goods.goodsName}</span></td>
                        <td class="price">${cartMessageList.goods.goodsPrice}</td>
                        <td class="count"><span class="reduce">-</span>
                          <input class="count-input" type="text" value="${cartMessageList.orderNumber}"/>
                          <span class="add">+</span></td>
                        <td class="subtotal">${cartMessageList.goods.goodsPrice*cartMessageList.orderNumber}</td>
                        <td class="operation"><span class="delete">x</span></td>
                        <input type="hidden" id="hidden" value="${index}" />
                      </tr>
                      <input type="hidden"  name="goodsId" value="${cartMessageList.goodsId}" />
                    </c:forEach>
                    </tbody>
                </table>
                <div class="foot" id="foot">
                    <label class="fl select-all"><input type="checkbox" class="check-all check"/>&nbsp;&nbsp;全选</label>
                    <div class="fr closing" onclick="location.href='buy';">结 算</div>
                    <input type="hidden" id="cartTotalPrice" />
                    <div class="fr total">合计：￥<span id="priceTotal">0.00</span></div>
                    <div class="fr selected" id="selected">已选商品<span id="selectedTotal">0</span>件</div>
   				</div>
            </div>
        </div>
        <!-- 中间内容栏结束 -->
        <myfooter>  
		<script src="${ctxsta}/web/js/cart.js"></script>
		</myfooter>  
</body>
</html>
