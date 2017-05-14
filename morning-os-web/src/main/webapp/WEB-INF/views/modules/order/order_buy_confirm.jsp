<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>选择在线支付方式 - 猫宁商城</title>
<link rel="stylesheet" href="${ctxsta}/os/css/order-confirm.css">
</head>
<body>
<!-- 轮播top菜单导航引入 -->
<jsp:include page="/WEB-INF/views/modules/common/site_header.jsp" />
<!-- 轮播top菜单导航引入 -->

<div class="page-main page-mini-main">
  <div class="container-fluid confirm-box">
    <form target="_blank" action="#" id="J_payForm" method="post">
      <div class="section section-order">
        <div class="order-info clearfix">
          <div class="fl">
            <h2 class="title">订单提交成功！去付款咯～</h2>
            <p class="order-time" id="J_deliverDesc">我们将尽快为您发货</p>
            <p class="order-time">请在<span class="pay-time-tip">23小时55分</span>内完成支付, 超时后将取消订单</p>
            <p class="post-info" id="J_postInfo"> 收货信息：${orderShipment.userName} ${orderShipment.userPhone}&nbsp;&nbsp;
              ${orderShipment.provinceName}&nbsp;&nbsp;${orderShipment.cityName}&nbsp;&nbsp;${orderShipment.districtName}&nbsp;&nbsp;${orderShipment.userAdress} </p>
          </div>
          <div class="fr">
            <p class="total"> 应付总额：<span class="money"><em>${order.payAmount }</em>元</span> </p>
            <a href="javascript:void(0);" class="show-detail" id="J_showDetail">订单详情&nbsp;<i class="glyphicon glyphicon-chevron-down"></i></a> </div>
        </div>
        <i class="iconfont icon-right">&#x221a;</i>
        <div class="order-detail">
          <ul>
            <li class="clearfix">
              <div class="label">订单号：</div>
              <div class="content"> <span class="order-num"> ${order.orderNumber } </span> </div>
            </li>
            <li class="clearfix">
              <div class="label">收货信息：</div>
              <div class="content"> ${orderShipment.userName} ${orderShipment.userPhone}&nbsp;&nbsp;
                ${orderShipment.provinceName}&nbsp;&nbsp;${orderShipment.cityName}&nbsp;&nbsp;${orderShipment.districtName}&nbsp;&nbsp;${orderShipment.userAdress} </div>
            </li>
            <li class="clearfix">
              <div class="label">商品名称：</div>
              <div class="content">
                <c:forEach items="${orderProducts}" var="orderProduct"> ${orderProduct.name}&nbsp;${orderProduct.productSpecName} <br>
                </c:forEach>
              </div>
            </li>
            <li class="clearfix">
              <div class="label">配送时间：</div>
              <div class="content">
                <c:if test="${order.shipmentTime eq 1}">不限送货时间</c:if>
                <c:if test="${order.shipmentTime eq 2}">工作日送货</c:if>
                <c:if test="${order.shipmentTime eq 3}">双休日、假日送货</c:if>
              </div>
            </li>
            <li class="clearfix">
              <div class="label">发票信息：</div>
              <div class="content">
                <c:if test="${order.invoiceType eq 1}">不开发票</c:if>
                <c:if test="${order.invoiceType eq 2}">电子发票&nbsp; ${order.invoiceTitle }</c:if>
                <c:if test="${order.invoiceType eq 3}">普通发票&nbsp; ${order.invoiceTitle }</c:if>
              </div>
            </li>
          </ul>
        </div>
      </div>
      <div class="section section-payment">
        <div class="cash-title" id="J_cashTitle"> 选择以下支付方式付款 </div>
        <div class="payment-box ">
          <div class="payment-header clearfix">
            <h3 class="title">支付平台</h3>
            <span class="desc"></span> </div>
          <div class="payment-body">
            <ul class="clearfix payment-list J_paymentList J_linksign-customize">
              <li id="J_weixin"><img src="//c1.mifile.cn/f/i/15/pay/wechat0715.jpg" alt="微信支付" style="margin-left: 0;"/></li>
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="alipay" value="alipay" />
                <img src="//c1.mifile.cn/f/i/15/pay/alipay-0718-1.png" alt="支付宝" style="margin-left: 0;"/></li>
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="unionpay" value="unionpay" />
                <img src="//s01.mifile.cn/i/banklogo/unionpay.png?ver2015" alt="银联" style="margin-left: 0;"/></li>
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="cft" value="cft" />
                <img src="//s01.mifile.cn/i/banklogo/cft.png" alt="财付通" style="margin-left: 0;"/></li>
            </ul>
            <div class="event-desc">
              <p>微信支付：关注小米手机微信公众号，支付成功后可领取3-10元电影票红包。</p>
              <p>支 付 宝：支付宝扫码支付满38元，参与赢取1999元红包</p>
              <a href="" class="more" target="_blank">了解更多&gt;</a> </div>
          </div>
        </div>
        <div class="payment-box ">
          <div class="payment-header clearfix">
            <h3 class="title">银行借记卡及信用卡</h3>
          </div>
          <div class="payment-body">
            <ul class="clearfix payment-list payment-list-much J_paymentList J_linksign-customize">
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="CMB" value="CMB" />
                <img src="//s01.mifile.cn/i/banklogo/payOnline_zsyh.png?ver2015" alt=""/></li>
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="ICBCB2C" value="ICBCB2C" />
                <img src="//s01.mifile.cn/i/banklogo/payOnline_gsyh.png?ver2015" alt=""/></li>
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="CCB" value="CCB" />
                <img src="//s01.mifile.cn/i/banklogo/payOnline_jsyh.png?ver2015" alt=""/></li>
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="COMM" value="COMM" />
                <img src="//s01.mifile.cn/i/banklogo/payOnline_jtyh.png?ver2015" alt=""/></li>
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="ABC" value="ABC" />
                <img src="//s01.mifile.cn/i/banklogo/payOnline_nyyh.png?ver2015" alt=""/></li>
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="BOCB2C" value="BOCB2C" />
                <img src="//s01.mifile.cn/i/banklogo/payOnline_zgyh.png?ver2015" alt=""/></li>
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="PSBC-DEBIT" value="PSBC-DEBIT" />
                <img src="//s01.mifile.cn/i/banklogo/payOnline_youzheng.png?ver2015" alt=""/></li>
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="GDB" value="GDB" />
                <img src="//s01.mifile.cn/i/banklogo/payOnline_gfyh.png?ver2015" alt=""/></li>
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="SPDB" value="SPDB" />
                <img src="//s01.mifile.cn/i/banklogo/payOnline_pufa.png?ver2015" alt=""/></li>
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="CEBBANK" value="CEBBANK" />
                <img src="//s01.mifile.cn/i/banklogo/payOnline_gdyh.png?ver2015" alt=""/></li>
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="CIB" value="CIB" />
                <img src="//s01.mifile.cn/i/banklogo/payOnline_xyyh.png?ver2015" alt=""/></li>
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="CMBC" value="CMBC" />
                <img src="//s01.mifile.cn/i/banklogo/payOnline_msyh.png?ver2015" alt=""/></li>
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="CITIC" value="CITIC" />
                <img src="//s01.mifile.cn/i/banklogo/payOnline_zxyh.png?ver2015" alt=""/></li>
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="SHBANK" value="SHBANK" />
                <img src="//s01.mifile.cn/i/banklogo/payOnline_shyh.png?ver2015" alt=""/></li>
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="BJRCB" value="BJRCB" />
                <img src="//s01.mifile.cn/i/banklogo/payOnline_bjnsyh.png?ver2015" alt=""/></li>
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="NBBANK" value="NBBANK" />
                <img src="//s01.mifile.cn/i/banklogo/payOnline_nbyh.png?ver2015" alt=""/></li>
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="HZCBB2C" value="HZCBB2C" />
                <img src="//s01.mifile.cn/i/banklogo/payOnline_hzyh.png?ver2015" alt=""/></li>
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="SHRCB" value="SHRCB" />
                <img src="//s01.mifile.cn/i/banklogo/payOnline_shnsyh.png?ver2015" alt=""/></li>
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="FDB" value="FDB" />
                <img src="//s01.mifile.cn/i/banklogo/payOnline_fcyh.png?ver2015" alt=""/></li>
            </ul>
          </div>
        </div>
        <div class="payment-box payment-box-last ">
          <div class="payment-header clearfix">
            <h3 class="title">快捷支付</h3>
            <span class="desc">（支持以下各银行信用卡以及部分银行借记卡）</span> </div>
          <div class="payment-body">
            <ul class="clearfix payment-list  J_paymentList J_linksign-customize">
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="CMB-KQ" value="CMB-KQ" />
                <img src="//s01.mifile.cn/i/banklogo/payOnline_zsyh.png?ver2015" alt=""/></li>
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="COMM-KQ" value="COMM-KQ" />
                <img src="//s01.mifile.cn/i/banklogo/payOnline_jtyh.png?ver2015" alt=""/></li>
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="CCB-KQ" value="CCB-KQ" />
                <img src="//s01.mifile.cn/i/banklogo/payOnline_jsyh.png?ver2015" alt=""/></li>
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="ICBCB2C-KQ" value="ICBCB2C-KQ" />
                <img src="//s01.mifile.cn/i/banklogo/payOnline_gsyh.png?ver2015" alt=""/></li>
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="CITIC-KQ" value="CITIC-KQ" />
                <img src="//s01.mifile.cn/i/banklogo/payOnline_zxyh.png?ver2015" alt=""/></li>
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="CEBBANK-KQ" value="CEBBANK-KQ" />
                <img src="//s01.mifile.cn/i/banklogo/payOnline_gdyh.png?ver2015" alt=""/></li>
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="BOCB2C-KQ" value="BOCB2C-KQ" />
                <img src="//s01.mifile.cn/i/banklogo/payOnline_zgyh.png?ver2015" alt=""/></li>
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="SRCB-KQ" value="SRCB-KQ" />
                <img src="//s01.mifile.cn/i/banklogo/payOnline_shncsyyh.png?ver2015" alt=""/></li>
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="JSB-KQ" value="JSB-KQ" />
                <img src="//s01.mifile.cn/i/banklogo/payOnline_jiangsshuyh.png?ver2015" alt=""/></li>
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="CIB-KQ" value="CIB-KQ" />
                <img src="//s01.mifile.cn/i/banklogo/payOnline_xyyh.png?ver2015" alt=""/></li>
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="ABC-KQ" value="ABC-KQ" />
                <img src="//s01.mifile.cn/i/banklogo/payOnline_nyyh.png?ver2015" alt=""/></li>
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="SPABANK-KQ" value="SPABANK-KQ" />
                <img src="//s01.mifile.cn/i/banklogo/payOnline_payh.png?ver2015" alt=""/></li>
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="HXB-KQ" value="HXB-KQ" />
                <img src="//s01.mifile.cn/i/banklogo/payOnline_hyyh.png?ver2015" alt=""/></li>
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="GDB-KQ" value="GDB-KQ" />
                <img src="//s01.mifile.cn/i/banklogo/payOnline_gfyh.png?ver2015" alt=""/></li>
              <li class="J_bank">
                <input type="radio" name="payOnlineBank" id="BOB-KQ" value="BOB-KQ" />
                <img src="//s01.mifile.cn/i/banklogo/payOnline_bjyh.png?ver2015" alt=""/></li>
            </ul>
          </div>
        </div>
      </div>
    </form>
  </div>
</div>
<myfooter> 
  <!-- layer javascript --> 
  <script src="${ctxsta}/common/layer/layer.js"></script> 
  <script src="${ctxsta}/os/js/order.js"></script> 
</myfooter>
</body>
</html>