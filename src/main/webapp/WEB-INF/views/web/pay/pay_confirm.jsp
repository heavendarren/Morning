<%@ page language="java" import="java.util.*"  contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <title>选择在线支付方式 | Morning 猫宁</title>
    <link rel="stylesheet" href="${ctxsta}/web/css/buyConfirm.css" />
  </head>
 <body>
  	<!-- 目录导航栏引入 -->
	<jsp:include page="/WEB-INF/views/web/common/topnav.jsp" />
	<div class="border_top_cart">
	    <div class="container payment-con">
	        <form action="#" method="post">
	            <div class="order-info">
	                <div class="msg">
	                    <h3>您的订单已提交成功！付款咯～</h3>
	                    <p class="post-date">成功付款后，7天发货</p>
	                </div>
	                <div class="info">
	                    <p>金额：<span class="pay-total">${order.totalMoney }</span></p>
	                    <p>订单：${order.orderNumber }</p>
	                    <p>配送：${order.userAddress.orderUserName }<span class="line">/</span>${order.userAddress.orderUserTelphone }
	                    <span class="line">/</span>${orderShip.provinceName },${orderShip.cityName },${orderShip.districtName },${orderShip.orderUserAddress }
	                    <span class="line">/</span><c:if test="${order.sendTime==1 }">不限送货时间</c:if><c:if test="${order.sendTime==2 }">工作日送货</c:if><c:if test="${order.sendTime==3 }">双休日、假日送货</c:if>
	                    <span class="line">/</span><c:if test="${order.invoicelType == 1 }">个人普通发票</c:if><c:if test="${order.invoicelType == 4 }">电子发票</c:if></p>
	                </div>
	                <div class="icon-box">
	                    <i class="iconfont"><img src="${ctxsta}/web/images/yes_ok.png"></i>
	                </div>
	            </div>
	            <div class="xm-plain-box">
	                <!-- 选择支付方式 -->
	                <div class="box-hd bank-title clearfix">
	                    <div class="title-wrap">
	                        <h2 class="title">选择以下支付方式付款 </h2>
	                        <span class="tip-tag"></span>
	                    </div>
	                </div>
	                <div class="box-bd">
	                    <div class="payment-bd">
	                        <dl class="clearfix payment-box" >
	                            <dt  class="terrace">
	                                <strong>支付平台</strong>
	                            </dt>
	                            <dd>
                                    <ul class="payment-list clearfix" >
                                   		<li><label  for="alipay"><input type="radio" name="order.payment" id="alipay" value="alipay" checked="checked"/> <img src="${ctxsta}/web/images/zfb.png" alt=""/></label></li>
                                   		<li><label  for="unionpay"><input type="radio" name="order.payment" id="unionpay" value="unionpay" /> <img src="${ctxsta}/web/images/zxzf.png" alt=""/></label></li>
                                    </ul>
	                            </dd>
	                        </dl>
	                        <dl class="clearfix payment-box" >
	                            <dt class="bank">
	                                <strong>银行网银</strong>
	                            </dt>
	                            <dd>
	                                <ul class="payment-list clearfix">
	                                    <li><label  for="CMB"><input type="radio" name="order.payment" id="CMB" value="CMB" /> <img src="http://s1.mi.com/images/payOnline_zsyh.gif" alt=""/></label></li>
	                                    <li><label  for="ICBCB2C"><input type="radio" name="order.payment" id="ICBCB2C" value="ICBCB2C" /> <img src="http://s1.mi.com/images/payOnline_gsyh.gif" alt=""/></label></li>
	                                    <li><label  for="CCB"><input type="radio" name="order.payment" id="CCB" value="CCB" /> <img src="http://s1.mi.com/images/payOnline_jsyh.gif" alt=""/></label></li>
	                                    <li><label  for="ABC"><input type="radio" name="order.payment" id="ABC" value="ABC" /> <img src="http://s1.mi.com/images/payOnline_nyyh.gif" alt=""/></label></li>
	                                    <li><label  for="BOCB2C"><input type="radio" name="order.payment" id="BOCB2C" value="BOCB2C" /> <img src="http://s1.mi.com/images/payOnline_zgyh.gif" alt=""/></label></li>
	                                    <li><label  for="COMM"><input type="radio" name="order.payment" id="COMM" value="COMM" /> <img src="http://s1.mi.com/images/payOnline_jtyh.gif" alt=""/></label></li>
	                                    <li><label  for="PSBC-DEBIT"><input type="radio" name="order.payment" id="PSBC-DEBIT" value="PSBC-DEBIT" /> <img src="http://s1.mi.com/images/payOnline_youzheng.gif" alt=""/></label></li>
	                                    <li><label  for="GDB"><input type="radio" name="order.payment" id="GDB" value="GDB" /> <img src="http://s1.mi.com/images/payOnline_gfyh.gif" alt=""/></label></li>
	                                    <li><label  for="SPDB"><input type="radio" name="order.payment" id="SPDB" value="SPDB" /> <img src="http://s1.mi.com/images/payOnline_pufa.gif" alt=""/></label></li>
	                                </ul>
	                            </dd>
	                        </dl>                   
	                    </div>
	                </div>
                    <div class="checkout-confirm">
                         <input type="button" class="btn btn-buy btn-lineDakeLight btn-back-cart" value="取消订单" onclick="cancellationToPay(${order.orderNumber },this)" />
                         <input type="button" class="btn  btn-buy btn-primary" value="确认付款" onclick="checkoutToPay(${order.orderNumber},this)"/>
                    </div>
	            </div>
	    	</form>  
	    </div>
	</div>
    <myfooter>  
    <!-- layer javascript -->
    <script src="${ctxsta}/common/layer/layer.js"></script>
    
	<script src="${ctxsta}/web/js/confirmation.js"></script>
	</myfooter>  
 
</body>
</html>
