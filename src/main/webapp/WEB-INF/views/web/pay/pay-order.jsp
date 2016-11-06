<%@ page language="java" import="java.util.*"  contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <title>填写订单信息 | Morning 猫宁</title>
    <link rel="stylesheet" href="${ctxsta}/web/css/select2.css" />
    <link rel="stylesheet" href="${ctxsta}/web/css/order-buy.css" />
  </head>
<body>
	<!-- 目录导航栏引入 -->
	<jsp:include page="/WEB-INF/views/web/common/topnav.jsp" />
	<!-- 目录导航栏引入 -->
        <div class="order_container">
        	<div class="container">
            <form id="creatOrder" method="post">
            	<div class="checkout-box">
					<!-- 地址状态 0：默认选择；1：新增地址；2：修改地址 -->
					<input type="hidden"  id="addrState" value="0">
					<!-- 收货地址 -->
					<div class="xm-box" id="profile">
						<div class="box-hd ">
							<h2 class="title">收货地址</h2>
						</div>
                        <div class="box-bd">
                            <div class="clearfix xm-address-list" id="checkoutAddrList" >
                            	<c:forEach items="${userAddressList }" var="userAddressList">
                                <dl class="item" data-isnew="N" data-tag_name="${userAddressList.tagName }" data-address="${userAddressList.orderUserAddress }"
                                 data-area="${userAddressList.area }" data-district_name="${userAddressList.districtName }" data-district_id="${userAddressList.districtId }" 
                                 data-city_name="${userAddressList.cityName }" data-city_id="${userAddressList.cityId }" data-province_name="${userAddressList.provinceName}" 
                                 data-province_id="${userAddressList.provinceId}" data-tel="${userAddressList.orderUserTelphone}" data-consignee="${userAddressList.orderUserName}" 
                                 data-address_id="${userAddressList.addressId}">
                                    <dt>
                                        <strong class="itemConsignee">${userAddressList.orderUserName}</strong>
                                        <span class="itemTag tag">${userAddressList.tagName }</span>
                                    </dt>
                                    <dd>
                                        <p class="tel itemTel">${userAddressList.orderUserTelphone}</p>
                                        <p class="itemRegion">${userAddressList.provinceName} ${userAddressList.cityName } ${userAddressList.districtName }</p>
                                        <p class="itemStreet">${userAddressList.orderUserAddress }</p>
                                        <span class="edit-btn J_editAddr">编辑</span>
                                    </dd>
                                    <dd style="display:none">
                                    <input type="radio" name="order.addressId" class="addressId" value="${userAddressList.addressId}">
                                    </dd>
                                </dl>
                                </c:forEach>
                                <div class="item use-new-addr" id="J_useNewAddr" data-state="off">
                                    <span class="iconfont icon-add"><img src="${ctxsta}/web/images/add_cart.png"/></span> 
            						使用新地址
                                </div>
                            </div>
                            <!--点击弹出新增/收货地址界面start-->
                            <div class="xm-edit-addr-box" id="J_editAddrBox">
                                <div class="bd">
                                    <div class="item">
                                        <label>收货人姓名<span>*</span></label>
                                        <input type="text"  id="Consignee" class="input" placeholder="收货人姓名" maxlength="15" autocomplete='off'>
                                        <p class="tip-msg tipMsg">
                                        </p>
                                    </div>
                                    <div class="item">
                                        <label>联系电话<span>*</span></label>
                                        <input type="text"  class="input" id="Telephone" placeholder="11位手机号" autocomplete='off'>
                                        <p class="tel-modify-tip" id="telModifyTip">
                                        </p>
                                        <p class="tip-msg tipMsg">
                                        </p>
                                    </div>
                                    <div class="item">
                                        <label>地址<span>*</span></label>
                                        <select  id="loc_province" class="select-1"></select>
                                        <select  id="loc_city" class="select-2"></select>
										<select  id="loc_town"  class="select-3"></select>
                                        <textarea  class="input-area" id="Street" placeholder="路名或街道地址，门牌号"></textarea>
                                        <p class="tip-msg tipMsg">
                                        </p>
                                    </div>
                                    <div class="item">
                                        <label>邮政编码<span>*</span></label>
                                        <input type="text"  id="Zipcode" class="input" placeholder="邮政编码" autocomplete='off'>
                                        <p class="zipcode-tip" id="zipcodeTip">
                                        </p>
                                        <p class="tip-msg tipMsg">
                                        </p>
                                    </div>
                                    <div class="item">
                                        <label>地址标签<span>*</span></label>
                                        <input type="text"  id="Tag" class="input" placeholder='地址标签：如"家"、"公司"。限5个字内'>
                                        <p class="tip-msg tipMsg">
                                        </p>
                                    </div>
                                </div>
                                <div class="ft clearfix">
                                    <button type="button" class="btn btn-lineDake btn-small " id="J_editAddrCancel">取消</button>
                                    <button type="button" class="btn btn-primary btn-small " id="J_editAddrOk">保存</button>
                                </div>
                            </div>
                            <!--点击弹出新增/收货地址界面end-->
                            <div class="xm-edit-addr-backdrop" id="J_editAddrBackdrop">
                            </div>
                        </div>                  
                    </div>
                    <!-- 收货地址 END-->
                    
                    <div id="checkoutPayment">
                    <!-- 支付方式 -->
                    <div class="xm-box">
                        <div class="box-hd ">
                        	<h2 class="title">支付方式</h2>
                        </div>
                        <div class="box-bd">
                            <ul id="checkoutPaymentList" class="checkout-option-list clearfix J_optionList">
                                <li class="item selected">
                                    <input type="radio" name="order.payType" checked="checked" value="1">
                                    <p>在线支付<span></span></p>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- 支付方式 END-->
                    
                    <!-- 配送方式 -->   
                    <div class="xm-box">
                        <div class="box-hd ">
                        	<h2 class="title">配送方式</h2>
                        </div>
                        <div class="box-bd">
                            <ul id="checkoutShipmentList" class="checkout-option-list clearfix J_optionList">
                                <li class="item selected">
                                    <input type="radio" data-price="0" name="order.sendType" checked="checked" value="1">
                                    <p>快递配送（免运费）<span></span></p>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- 配送方式 END-->
                    </div>
                    
                    <!-- 送货时间 -->
                    <div class="xm-box">
                        <div class="box-hd">
                            <h2 class="title">送货时间</h2>
                        </div>
                        <div class="box-bd">
                            <ul class="checkout-option-list clearfix J_optionList">
                            	<li class="item selected"><input type="radio" checked="checked" name="order.sendTime" value="1"><p>不限送货时间<span>周一至周日</span></p></li>
                                <li class="item "><input type="radio"  name="order.sendTime" value="2"><p>工作日送货<span>周一至周五</span></p></li>
                                <li class="item "><input type="radio"  name="order.sendTime" value="3"><p>双休日、假日送货<span>周六至周日</span></p></li>     
                           </ul>
                        </div>
                    </div>
                    <!-- 送货时间 END-->
                    
                    <!-- 发票信息 -->
                    <div id="checkoutInvoice">
                    <div class="xm-box">
                        <div class="box-hd">
                            <h2 class="title">发票信息</h2>
                        </div>
                        <div class="box-bd">
                            <ul class="checkout-option-list checkout-option-invoice clearfix J_optionList J_optionInvoice">
                                <li class="item selected">
                                    <input type="radio"    checked="checked"  value="4" name="Checkout[invoice]">
                                    <p>电子发票（非纸质）</p>
                                </li>
                                <li class="item ">
                                    <input type="radio"   value="1" name="Checkout[invoice]">
                                    <p>普通发票（纸质）</p>
                                </li>
                            </ul>
                            <p id="eInvoiceTip" class="e-invoice-tip ">
                            	电子发票是税务局认可的有效凭证，可作为售后维权凭据，不随商品寄送。开票后不可更换纸质发票，如需报销请选择普通发票。
                    		</p>
                            <div class="invoice-info nvoice-info-1" id="checkoutInvoiceElectronic" style="display:none;">
                                <p class="tip">电子发票目前仅对个人用户开具，不可用于单位报销 ，不随商品寄送</p>
                                <p>发票内容：购买商品明细</p>
                                <p>发票抬头：个人</p>
                                <p>
                                    <span class="hide"><input type="radio" value="4" name="order.invoicelType"   checked="checked"   id="electronicPersonal" class="invoiceType"></span>
                                    <dl>
                                        <dt>什么是电子发票?</dt>
                                        <dd>&#903; 电子发票是纸质发票的映像，是税务局认可的有效凭证，与传统纸质发票具有同等法律效力，可作为售后维权凭据。</dd>
                                        <dd>&#903; 开具电子服务于个人，开票后不可更换纸质发票，不可用于单位报销。</dd>
                                        <dd>&#903; 您在订单详情的"发票信息"栏可查看、下载您的电子发票。<a href="http://bbs.xiaomi.cn/thread-9285999-1-1.html" target="_blank">什么是电子发票？</a></dd>
                                    </dl>
                                </p>
                            </div>
                            <div class="invoice-info invoice-info-2" id="checkoutInvoiceDetail"  style="display:none;" >
                                <p>发票内容：购买商品明细</p>
                                <p> 发票抬头：请确认单位名称正确,以免因名称错误耽搁您的报销。注：合约机话费仅能开个人发票</p>
                                <ul class="type clearfix J_invoiceType">
                                    <li class="hide">
                                        <input type="radio" value="0" name="order.invoicelType" id="noNeedInvoice" > 
                                    </li>
                                    <li class="">
                                        <input  class="invoiceType" type="radio" id="commonPersonal" name="order.invoicelType" value="1" > 个人
                                    </li>
                                    <li class="">
                                         <input  class="invoiceType" type="radio" name="order.invoicelType" value="2" > 单位
                                    </li>
                                </ul>
                                <div  id='CheckoutInvoiceTitle' class="invoice-title">
                                    <label for="order.invoicelTitle">单位名称：</label>
                                    <input name="order.invoicelTitle" type="text" maxlength="49" value="" class="input"> 
                                    <span class="tip-msg J_tipMsg"></span>
                                </div>
                    		</div>
                        </div>
                    </div>
                    </div>
                    <!-- 发票信息 END-->

                </div>
            
            	<div class="checkout-box-ft">
                     <!-- 商品清单 -->
                    <div id="checkoutGoodsList" class="checkout-goods-box">
                    <div class="xm-box">
                        <div class="box-hd">
                            <h2 class="title">确认订单信息</h2>
                        </div>
                        <div class="box-bd">
                            <dl class="checkout-goods-list">
                                <dt class="clearfix">
                                    <span class="col col-1">商品名称</span>
                                    <span class="col col-2">购买价格</span>
                                    <span class="col col-3">购买数量</span>
                                    <span class="col col-4">小计(元)</span>
                                </dt>
                                <c:forEach items="${shoppingCart.cartMessageList}" var="cartMessageList">
                                <dd class="item clearfix">
                                    <div class="item-row">
                                        <div class="col col-1">
                                            <div class="g-pic">
                                                <img src="commodity/${cartMessageList.goods.goodsImagename}.jpg" width="40" height="40" />
                                            </div>
                                            <div class="g-info">
                                            	<a href="${ctx }/front/detail/${cartMessageList.goodsId}" target="_blank">${cartMessageList.goods.goodsName} ${cartMessageList.goodsColor} ${cartMessageList.goodsStandard}</a>
                                            </div>
                                        </div>
                                        <div class="col col-2">${cartMessageList.goods.goodsPrice}元</div>
                                        <div class="col col-3">${cartMessageList.orderNumber}</div>
                                        <div class="col col-4">${cartMessageList.goods.goodsPrice*cartMessageList.orderNumber}元</div>
                                    </div>
                                </dd>
 								</c:forEach>
                            </dl>
                            <div class="checkout-count clearfix">
                                <div class="checkout-count-extend xm-add-buy">
                                    <h3 class="title">会员留言</h3>
                                    <textarea class="input-area" name="order.userMessage" placeholder="对本次交易的说明（建议填写已和卖家协商一致的内容）"></textarea>
                                </div>
                                <div class="checkout-price">
                                    <ul>
                                        <li>订单总额：<span>${shoppingCart.totalMoney}元</span></li>
                                        <li>活动优惠：<span>-0元</span></li>
                                        <li>优惠券抵扣：<span id="couponDesc">-0元</span></li>
                                        <li>运费：<span id="postageDesc">0元</span></li>
                                    </ul>
                                    <p class="checkout-total">应付总额：<span><strong id="totalPrice">${shoppingCart.totalMoney}</strong>元</span></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 商品清单 END -->
                    <div class="checkout-confirm">
                         <a href="${ctx }/cart" class="btn btn-buy btn-lineDakeLight btn-back-cart">返回购物车</a>
                         <input type="submit" class="btn  btn-buy btn-primary" value="立即下单" id="checkoutToPay" />
                    </div>
            	</div>
				</div>
            </form>
            </div>
        </div>
        <myfooter>  
		<script src="${ctxsta}/web/js/area/area.js"></script>
		<script src="${ctxsta}/web/js/area/location.js"></script>
		<script src="${ctxsta}/web/js/area/select2.js"></script>
		<script src="${ctxsta}/web/js/area/select2_locale_zh-CN.js"></script>
		<script src="${ctxsta}/web/js/buy.js"></script>
		</myfooter>  
</body>
</html>
