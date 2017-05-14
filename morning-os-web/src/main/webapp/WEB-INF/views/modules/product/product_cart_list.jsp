<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>我的购物车 - 猫宁商城</title>
<link rel="stylesheet" href="${ctxsta}/os/css/cart.css">
<link rel="stylesheet" href="${ctxsta}/common/icheck/flat/orange.css" />
</head>
<body>
<!-- 轮播top菜单导航引入 -->
<jsp:include page="/WEB-INF/views/modules/common/site_header.jsp" />
<!-- 轮播top菜单导航引入 --> 

<!-- 我的购物车begin -->
<div class="page-main">
  <div class="container-fluid">
    <div class="catbox hide" id="J_cartBox">
      <table id="cartTable">
        <thead>
          <tr>
            <th>选择商品</th>
            <th>商品名称</th>
            <th>单价</th>
            <th>数量</th>
            <th>小计</th>
            <th>操作</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${cartVO.shoppingCartVOs}" var="shoppingCart">
            <tr data-sid="${shoppingCart.productSpecNumber}">
              <td class="checkbox"><input data-initial="true" data-sid="${shoppingCart.productSpecNumber}" data-check-status="${shoppingCart.checkStatus}" class="check-one check" type="checkbox"/></td>
              <td class="goods"><a href="${ctx}/detail/${shoppingCart.productNumber}" target="_blank"><img src="${ctximg}/${shoppingCart.picImg}" alt="${shoppingCart.name}"/></a> <a href="${ctx}/detail/${shoppingCart.productNumber}" target="_blank"><span>${shoppingCart.name}
                <c:forEach items="${shoppingCart.specificationName}" var="specificationName">&nbsp;${specificationName}</c:forEach>
                </span></a></td>
              <td class="price">${shoppingCart.price}</td>
              <td class="count"><div class="change-goods-num clearfix J_changeGoodsNum"> <a href="javascript:void(0)" class="reduce">-</a>
                  <input class="count-input goods-num J_goodsNum" type="text" value="${shoppingCart.buyNumber}" readonly/>
                  <a href="javascript:void(0)" class="add">+</a> </div></td>
              <td class="subtotal">${shoppingCart.buyNumber * shoppingCart.price}</td>
              <td class="operation"><div class="col-action"><a href="javascript:void(0);" title="删除" class="del J_delGoods"  data-sid="${shoppingCart.productSpecNumber}" onclick="cart_list_delete(this,${shoppingCart.productSpecNumber})"><i class="glyphicon glyphicon-remove"></i></a> </div></td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
      <div class="cart-bar clearfix" id="J_cartBar">
        <div class="section-left"> <a href="${ctx}/list?categoryId=1">继续购物</a> <span class="cart-total">共 <i id="J_cartTotalNum"></i> 件商品，已选择 <i id="J_selTotalNum"></i> 件</span></div>
        <span class="total-price"> 合计（不含运费）：<em id="J_cartTotalPrice"></em>元 </span> <a href="javascript:void(0);" class="btn btn-a btn btn-primary" id="J_goCheckout" onclick="J_goCheckout();">去结算</a>
        <div class="no-select-tip hide" id="J_noSelectTip"> 请勾选需要结算的商品 <i class="arrow arrow-a"></i> <i class="arrow arrow-b"></i> </div>
      </div>
    </div>
  <div class="cart-empty hide" id="J_cartEmpty">
            <h2>您的购物车还是空的！</h2>
            <p class="login-desc">登录后将显示您之前加入的商品</p>
            <a href="#" class="btn btn-primary btn-login" id="J_loginBtn">立即登录</a>
            <a href="${ctx}/list?categoryId=1" class="btn btn-primary btn-shoping J_goShoping">马上去购物</a>
        </div>
  </div>
</div>
<!-- 我的购物车end -->
<myfooter> 
  <script src="${ctxsta}/common/jquery/jquery-2.1.4.min.js"></script>
  <script src="${ctxsta}/os/js/zySearch.js"></script>	
  <!-- iCheck --> 
  <script src="${ctxsta}/common/icheck/icheck.min.js"></script> 
  <!-- layer javascript --> 
  <script src="${ctxsta}/common/layer/layer.js"></script> 
  <script src="${ctxsta}/os/js/cart.js"></script> 
</myfooter>
</body>
</html>/html>