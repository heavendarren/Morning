<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>填写订单信息 - 猫宁商城</title>
<link rel="stylesheet" href="${ctxsta}/os/css/address.css">
<link rel="stylesheet" href="${ctxsta}/os/area/css/select2.css" />
<link rel="stylesheet" href="${ctxsta}/os/css/checkout.css">
</head>
<body>
<!-- 轮播top菜单导航引入 -->
<jsp:include page="/WEB-INF/views/modules/common/site_header.jsp" />
<!-- 轮播top菜单导航引入 -->

<div class="page-main">
  <div class="container-fluid">
    <div class="checkout-box">
      <div class="section section-address">
        <div class="section-header clearfix">
          <h3 class="title">收货地址</h3>
        </div>
        <div class="section-body clearfix" id="J_addressList">
          <c:forEach items="${addresses}" var="address">
            <div class="address-item J_addressItem" data-address_id="${address.addressId}" data-consignee="${address.userName}" data-tel="${address.userPhone}" data-province_id="${address.provinceId}" data-province_name="${address.provinceName}" data-city_id="${address.cityId}" data-city_name="${address.cityName}" data-district_id="${address.districtId}" data-district_name="${address.districtName}" data-zipcode="${address.userZipcode}" data-address="${address.userAdress}" data-tag_name="${address.userTag}">
              <dl>
                <dt> <span class="tag">${address.userTag}</span> <em class="uname">${address.userName}</em> </dt>
                <dd class="utel"> ${address.userPhone} </dd>
                <dd class="uaddress"> ${address.provinceName}&nbsp;&nbsp;${address.cityName}&nbsp;&nbsp;${address.districtName}<br>
                  ${address.userAdress} (${address.userZipcode}) </dd>
              </dl>
              <div class="actions"> <a href="javascript:void(0);" class="modify J_addressModify">修改</a> </div>
            </div>
          </c:forEach>
          <div class="address-item address-item-new" id="J_newAddress"> <i class="iconfont"><i class="glyphicon glyphicon-plus"></i></i> 添加新地址 </div>
        </div>
        <!--点击弹出新增/收货地址界面start-->
        <div class="address-edit-box">
          <div class="box-main">
            <div class="form-section">
              <input class="input-text J_addressInput" type="text" id="user_name" name="userName" placeholder="收货人姓名">
              <p class="tip-msg tipMsg"></p>
            </div>
            <div class="form-section">
              <input class="input-text J_addressInput" type="text" id="user_phone" name="user_phone" placeholder="11位手机号">
              <p class="tip-msg tipMsg"></p>
            </div>
            <div class="form-section">
              <select  id="loc_province" class="select-1">
              </select>
              <select  id="loc_city" class="select-2">
              </select>
              <select  id="loc_town"  class="select-3">
              </select>
              <p class="tip-msg tipMsg"></p>
            </div>
            <div class="form-section">
              <textarea class="input-text J_addressInput" type="text" id="user_adress" name="user_adress" placeholder="详细地址，路名或街道名称，门牌号"></textarea>
              <p class="tip-msg tipMsg"></p>
            </div>
            <div class="form-section">
              <input class="input-text J_addressInput" type="text" id="user_zipcode" name="user_zipcode" placeholder="邮政编码">
              <p class="tip-msg tipMsg"></p>
            </div>
            <div class="form-section">
              <input class="input-text J_addressInput" type="text" id="user_tag" name="user_tag" placeholder="如&quot;家&quot;、&quot;公司&quot;。限5个字内">
              <p class="tip-msg tipMsg"></p>
            </div>
          </div>
          <div class="form-confirm clearfix">
            <input class="input-text J_addressInput" type="hidden" id="address_id" name="address_id">
            <a href="javascript:void(0);" class="btn btn-primary" id="J_save" >保存</a> <a href="javascript:void(0);" class="btn btn-gray" id="J_cancel">取消</a> </div>
        </div>
        <!--点击弹出新增/收货地址界面end-->
        <div class="xm-edit-addr-backdrop" id="J_editAddrBackdrop"> </div>
      </div>
      <div class="section section-options section-payment clearfix">
        <div class="section-header">
          <h3 class="title">支付方式</h3>
        </div>
        <div class="section-body clearfix">
          <ul class="J_optionList options ">
            <li data-type="pay" class="J_option selected" data-value="1"> 在线支付 <span> （支持微信支付、支付宝、银联、财付通、小米钱包等） </span> </li>
          </ul>
        </div>
      </div>
      <div class="section section-options section-shipment clearfix">
        <div class="section-header">
          <h3 class="title">配送方式</h3>
        </div>
        <div class="section-body clearfix">
          <ul class="clearfix J_optionList options ">
            <li data-type="shipment" class="J_option selected" data-value="1"> 快递配送（免运费） </li>
            <li data-type="shipment" class="J_option hide" data-amount="10" data-value="2"> 快递配送（运费 10 元） </li>
          </ul>
          <div class="service-self-tip" id="J_serviceSelfTip"></div>
        </div>
      </div>
      <div class="section section-options section-time clearfix">
        <div class="section-header">
          <h3 class="title">配送时间</h3>
        </div>
        <div class="section-body clearfix">
          <ul class="J_optionList options options-list clearfix">
            <li data-type="time" class="J_option selected" data-value="1"> 不限送货时间：<span>周一至周日</span> </li>
            <li data-type="time" class="J_option " data-value="2"> 工作日送货：<span>周一至周五</span> </li>
            <li data-type="time" class="J_option " data-value="3"> 双休日、假日送货：<span>周六至周日</span> </li>
          </ul>
        </div>
      </div>
      <div class="section section-options section-invoice clearfix">
        <div class="section-header">
          <h3 class="title">发票</h3>
        </div>
        <div class="section-body clearfix">
          <ul class="J_optionList options options-list  J_tabSwitch clearfix">
            <li data-type="invoice" data-value="1" class="J_option selected"> 不开发票 </li>
            <li data-type="invoice" data-value="2" class="J_option"> 电子发票（非纸质） </li>
            <li data-type="invoice" data-value="3" class="J_option" id="J_paperInvoice"> 普通发票（纸质） </li>
          </ul>
          <div class="paper-invoice-company hide" id="J_invoiceTitleBox">
            <div class="form-section">
              <input class="input-text" type="text" id="invoice_title" placeholder="填写个人  / 单位名称" name="invoice_title" />
            </div>
            <p>发票内容：购买商品明细</p>
          </div>
          <div class="tab-container">
            <div class="tab-content hide e-invoice-detail"> 电子发票法律效力、基本用途及使用规定同纸质发票。不随商品寄送。<a href="javascript:void(0);" id="J_showEinvoiceDetail">什么是电子发票 <i class="icon-qa">?</i></a>
              <div class="e-invoice-qa hide" id="J_einvoiceDetail">
                <ul>
                  <li>感谢您选择电子发票，电子发票是税局认可的有效付款凭证，其法律效力、基本用户及使用规定同纸质发票，可作为用户维权、保修的有效凭据。如需纸质发票可自行下载打印；</li>
                  <li>您在订单详情的"发票信息"栏可查看、下载您的电子发票。</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="section section-goods">
        <div class="section-header clearfix">
          <h3 class="title">商品及优惠券</h3>
          <div class="more"> <a href="${ctx}/cart/list">返回购物车<i class="iconfont"><i class="glyphicon glyphicon-chevron-right"></i></i></a> </div>
        </div>
        <div class="section-body">
          <ul class="goods-list" id="J_goodsList">
            <c:forEach items="${cartVO.shoppingCartVOs}" var="shoppingCart">
              <li class="clearfix">
                <div class="col col-img"> <img src="${ctximg}/${shoppingCart.picImg}" alt="${shoppingCart.name}" width="30" height="30"> </div>
                <div class="col col-name"> <a href="${ctx}/item/${shoppingCart.productNumber}" target="_blank"> ${shoppingCart.name}
                  <c:forEach items="${shoppingCart.specificationName}" var="specificationName">&nbsp;${specificationName}</c:forEach>
                  </a> </div>
                <div class="col col-price"> ${shoppingCart.price}元  x ${shoppingCart.buyNumber} </div>
                <div class="col col-status"> 有货 </div>
                <div class="col col-total"> ${shoppingCart.buyNumber * shoppingCart.price}元 </div>
              </li>
            </c:forEach>
          </ul>
        </div>
      </div>
      <div class="section section-count clearfix">
        <div class="money-box" id="J_moneyBox">
          <ul>
            <li class="clearfix">
              <label>商品件数：</label>
              <span class="val">${cartVO.totalNumber}件</span> </li>
            <li class="clearfix">
              <label>金额合计：</label>
              <span class="val">${cartVO.totalPrice}元</span> </li>
            <li class="clearfix">
              <label>运费：</label>
              <span class="val"><i data-id="J_postageVal">0</i>元</span> </li>
            <li class="clearfix total-price">
              <label>应付总额：</label>
              <span class="val"><em data-id="J_totalPrice">${cartVO.totalPrice}</em>元</span> </li>
          </ul>
        </div>
      </div>
      <div class="section-bar clearfix">
        <div class="fl"> </div>
        <div class="fr"> <a href="javascript:void(0);" class="btn btn-primary" id="J_checkoutToPay">去结算</a> </div>
      </div>
    </div>
  </div>
</div>
<myfooter> 
  <!-- layer javascript --> 
  <script src="${ctxsta}/common/layer/layer.js"></script> 
  <!-- 地址选择 --> 
  <script src="${ctxsta}/os/area/js/area.js"></script> 
  <script src="${ctxsta}/os/area/js/location.js"></script> 
  <script src="${ctxsta}/os/area/js/select2.js"></script> 
  <script src="${ctxsta}/os/area/js/select2_locale_zh-CN.js"></script> 
  <script src="${ctxsta}/os/js/address.js"></script> 
  <script src="${ctxsta}/os/js/checkout.js"></script> 
</myfooter>
</body>
</html>