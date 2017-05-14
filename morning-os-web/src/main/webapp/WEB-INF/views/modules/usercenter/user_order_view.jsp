<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>订单详情 - 猫宁商城</title>
<link rel="stylesheet" href="${ctxsta}/os/css/address.css">
<link rel="stylesheet" href="${ctxsta}/os/area/css/select2.css" />
</head>
<body>
<div class="span16">
  <div class="uc-box uc-main-box">
    <div class="uc-content-box order-view-box">
      <div class="box-hd">
        <h1 class="title"><span class="text">订单详情</span><small>请谨防钓鱼链接或诈骗电话，<a href="" target="_blank">了解更多&gt;</a></small></h1>
        <div class="more clearfix">
          <h2 class="subtitle">订单号：${orderVO.orderNumber} <span class="tag tag-subsidy"></span> </h2>
          <div class="actions">
            <c:if test="${orderVO.orderStatus eq 1}"> <a id="J_cancelOrder" class="btn btn-small btn-line-gray" title="取消订单" data-order-id="${orderVO.orderNumber}" href="javascript:;" data-confirm="你真的要取消此订单吗?">取消订单</a><a id="J_payOrder" class="btn btn-small btn-primary" title="立即支付" href="${ctx}/buy/confirm/${orderVO.orderNumber}" target="_blank" data-order-id="${orderVO.orderNumber}">立即支付</a> </c:if>
            <c:if test="${orderVO.orderStatus eq 6}"> <a title="申请售后" href="" class="btn btn-small btn-line-gray" data-order-id="${orderVO.orderNumber}">申请售后</a> </c:if>
          </div>
        </div>
      </div>
      <div class="box-bd">
        <div class="uc-order-item uc-order-item-finish">
          <div class="order-detail">
            <div class="order-summary">
              <div class="order-status">
                <c:if test="${orderVO.orderStatus eq 1}">等待付款</c:if>
                <c:if test="${orderVO.orderStatus eq 2 || orderVO.orderStatus eq 3}">待出库</c:if>
                <c:if test="${orderVO.orderStatus eq 2 || orderVO.orderStatus eq 6}">已收货</c:if>
                <c:if test="${orderVO.orderStatus eq 11 || orderVO.orderStatus eq 12}">已关闭</c:if>
              </div>
              <div class="order-progress">
                <ol class="progress-list clearfix">
                  <c:set var="status" value="false"/>
                  <c:set var="info"/>
                  <c:forEach items="${orderVO.orderStatusList}" var="orderStatus">
                    <c:if test="${orderStatus.orderStatus eq 1}">
                      <c:set var="status" value="true"/>
                      <c:set var="info" value="${orderStatus.createTime}"/>
                    </c:if>
                  </c:forEach>
                  <li class="step step-first ${status == true ? 'step-done':''}">
                    <div><span class="text">下单</span></div>
                    <div class="info">
                      <fmt:formatDate value="${info}" pattern="yyyy年MM月dd日 hh:mm" />
                    </div>
                  </li>
                  <c:set var="status" value="false"/>
                  <c:set var="info"/>
                  <c:forEach items="${orderVO.orderStatusList}" var="orderStatus">
                    <c:if test="${orderStatus.orderStatus eq 2}">
                      <c:set var="status" value="true"/>
                      <c:set var="info" value="${orderStatus.createTime}"/>
                    </c:if>
                  </c:forEach>
                  <li class="step ${status == true ? 'step-done':''}">
                    <div><span class="text">付款</span></div>
                    <div class="info">
                      <fmt:formatDate value="${info}" pattern="yyyy年MM月dd日 hh:mm" />
                    </div>
                  </li>
                  <c:set var="status" value="false"/>
                  <c:set var="info"/>
                  <c:forEach items="${orderVO.orderStatusList}" var="orderStatus">
                    <c:if test="${orderStatus.orderStatus eq 3}">
                      <c:set var="status" value="true"/>
                      <c:set var="info" value="${orderStatus.createTime}"/>
                    </c:if>
                  </c:forEach>
                  <li class="step ${status == true ? 'step-done':''}">
                    <div><span class="text">配货</span></div>
                    <div class="info">
                      <fmt:formatDate value="${info}" pattern="yyyy年MM月dd日 hh:mm" />
                    </div>
                  </li>
                  <c:set var="status" value="false"/>
                  <c:set var="info"/>
                  <c:forEach items="${orderVO.orderStatusList}" var="orderStatus">
                    <c:if test="${orderStatus.orderStatus eq 4}">
                      <c:set var="status" value="true"/>
                      <c:set var="info" value="${orderStatus.createTime}"/>
                    </c:if>
                  </c:forEach>
                  <li class="step ${status == true ? 'step-done':''}">
                    <div><span class="text">出库</span></div>
                    <div class="info">
                      <fmt:formatDate value="${info}" pattern="yyyy年MM月dd日 hh:mm" />
                    </div>
                  </li>
                  <c:set var="status" value="false"/>
                  <c:set var="info"/>
                  <c:forEach items="${orderVO.orderStatusList}" var="orderStatus">
                    <c:if test="${orderStatus.orderStatus eq 6}">
                      <c:set var="status" value="true"/>
                      <c:set var="info" value="${orderStatus.createTime}"/>
                    </c:if>
                  </c:forEach>
                  <li class="step step-last ${status == true ? 'step-done':''}">
                    <div><span class="text">交易成功</span></div>
                    <div class="info">
                      <fmt:formatDate value="${info}" pattern="yyyy年MM月dd日 hh:mm" />
                    </div>
                  </li>
                </ol>
              </div>
            </div>
            <!-- 首次查看密码 -->
            <div class="order-liwu J_giftcard_active hide">
              <div class="box">
                <h3>激活并获取 小米礼物码 密码</h3>
                <p>点击获取密码后，我们将向账户绑定的手机  发送一条验证码<br>
                  由于密码的特殊性，获取后不再支持7天无理由退货</p>
                <a href="javascript:void(0);" class="btn btn-primary J_getGiftViewcode" data-stat-id="a23d55b9e18fc08a" onclick="_msq.push(['trackEvent', 'ad6d0503ac0c92d8-a23d55b9e18fc08a', 'javascript:void0', 'pcpid', '']);">获取密码</a> </div>
            </div>
            <!-- 账号未绑定手机号 -->
            <div class="order-liwu J_giftcard_bind hide">
              <div class="box">
                <h3>您的账号尚未绑定手机号</h3>
                <p>为了密码的安全性，获取密码以及每次查看密码都需要通过小米账号绑定的手机号进行验证<br>
                  您的账号尚未绑定手机号，需要绑定手机号后继续操作</p>
                <a href="//account.xiaomi.com/" target="_blank" class="btn btn-primary " data-stat-id="045af825eddc79cb" onclick="_msq.push(['trackEvent', 'ad6d0503ac0c92d8-045af825eddc79cb', '//account.xiaomi.com/', 'pcpid', '']);">前往 账号中心</a> </div>
            </div>
            <!-- Token已过期，再次查看密码 -->
            <div class="order-liwu J_giftcard_view hide">
              <div class="box">
                <h3>查看 小米礼物码 密码</h3>
                <p>点击查看密码后，我们将向账户绑定的手机  发送一条验证码</p>
                <a href="javascript:void(0);" class="btn btn-primary J_getGiftcode" data-stat-id="b95059948ec21a01" onclick="_msq.push(['trackEvent', 'ad6d0503ac0c92d8-b95059948ec21a01', 'javascript:void0', 'pcpid', '']);">查看密码</a> </div>
            </div>
            <!-- 礼物码领取后 -->
            <div class="order-liwu-list J_liwulist hide">
              <h3>小米礼物码 密码</h3>
              <table>
              </table>
              <p>* 电脑访问 <a href="//www.mi.com/giftcode/" target="_blank" data-stat-id="6636cdbc657762ae" onclick="_msq.push(['trackEvent', 'ad6d0503ac0c92d8-6636cdbc657762ae', '//www.mi.com/giftcode/', 'pcpid', '']);">http://www.mi.com/giftcode/</a> 根据提示使用礼物码，或在小米商城App中以此点击「服务」-「使用礼物码」</p>
            </div>
            <table class="order-items-table">
              <tbody>
                <c:forEach items="${orderVO.orderProducts}" var="orderProduct">
                  <tr>
                    <td class="col col-thumb"><div class="figure figure-thumb"> <a target="_blank" href="${ctx}/detail/${orderProduct.productNumber}" data-stat-id="${orderProduct.productNumber}"> <img src="${ctximg}/${orderProduct.picImg}" width="80" height="80" alt="${orderProduct.name}"> </a> </div></td>
                    <td class="col col-name"><p class="name"> <a target="_blank" href="${ctx}/detail/${orderProduct.productNumber}" data-stat-id="${orderProduct.productNumber}">${orderProduct.name}&nbsp;&nbsp;${orderProduct.productSpecName}</a> </p></td>
                    <td class="col col-price"><p class="price">${orderProduct.price}元 × ${orderProduct.buyNumber}</p></td>
                    <td class="col col-actions"></td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
          <div id="editAddr" class="order-detail-info">
            <h3>收货信息</h3>
            <table class="info-table">
              <tbody>
                <tr>
                  <th>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</th>
                  <td>${orderVO.orderShipment.userName}</td>
                </tr>
                <tr>
                  <th>联系电话：</th>
                  <td>${orderVO.orderShipment.userPhone}</td>
                </tr>
                <tr>
                  <th>收货地址：</th>
                  <td>${orderVO.orderShipment.provinceName}&nbsp;${orderVO.orderShipment.cityName}&nbsp;${orderVO.orderShipment.districtName}&nbsp;${orderVO.orderShipment.userAdress}</td>
                </tr>
              </tbody>
            </table>
            <div class="actions">
              <c:if test="${orderVO.orderStatus eq 1}"><a class="btn btn-small btn-line-gray J_editAddr" data-shipment-id="${orderVO.orderShipment.orderShipmentId}" data-order-id="${orderVO.orderId}"> 修改 </a></c:if>
            </div>
          </div>
          <div id="editTime" class="order-detail-info">
            <h3>支付方式及送货时间</h3>
            <table class="info-table">
              <tbody>
                <tr>
                  <th>支付方式：</th>
                  <td><c:choose>
                      <c:when test="${orderVO.payType eq 1}">在线支付</c:when>
                      <c:when test="${orderVO.payType eq 0}">线下支付</c:when>
                    </c:choose></td>
                </tr>
                <tr>
                  <th>送货时间：</th>
                  <td><c:if test="${orderVO.shipmentTime eq 1}">不限送货时间</c:if>
                    <c:if test="${orderVO.shipmentTime eq 2}">工作日送货</c:if>
                    <c:if test="${orderVO.shipmentTime eq 3}">双休日、假日送货</c:if></td>
                </tr>
              </tbody>
            </table>
            <div class="actions">
              <c:if test="${orderVO.orderStatus eq 1}"><a class="btn btn-small btn-line-gray J_editTime" data-shipment-time="${orderVO.shipmentTime}" data-order-id="${orderVO.orderNumber}"> 修改 </a></c:if>
            </div>
          </div>
          <div class="order-detail-info">
            <h3>发票信息</h3>
            <table class="info-table">
              <tbody>
                <tr>
                  <th>发票类型：</th>
                  <td><c:choose>
                      <c:when test="${orderVO.invoiceType eq 1}">不开发票</c:when>
                      <c:when test="${orderVO.invoiceType eq 2}">电子发票</c:when>
                      <c:when test="${orderVO.invoiceType eq 3}">普通发票</c:when>
                    </c:choose></td>
                </tr>
                <tr>
                  <th>发票内容：</th>
                  <td>购买商品明细</td>
                </tr>
                <c:if test="${orderVO.invoiceType eq 2 || orderVO.invoiceType eq 3}">
                  <tr>
                    <th>发票抬头：</th>
                    <td>${orderVO.invoiceTitle}</td>
                  </tr>
                </c:if>
              </tbody>
            </table>
            <div class="actions"> </div>
          </div>
          <div class="order-detail-total">
            <table class="total-table">
              <tbody>
                <tr>
                  <th>商品总价：</th>
                  <td><span class="num">${orderVO.orderAmount}</span>元</td>
                </tr>
                <tr>
                  <th>运&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;费：</th>
                  <td><span class="num">${orderVO.shipmentAmount}</span>元</td>
                </tr>
                <tr>
                  <th>订单金额：</th>
                  <td><span class="num">${orderVO.orderAmount}</span>元</td>
                </tr>
                <tr>
                  <th class="total">实付金额：</th>
                  <td class="total"><span class="num">${orderVO.payAmount}</span>元</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div id="J_modalVerify" class="modal modal-verify modal-hide in disabled" aria-hidden="false" style="display: none;" data-province_id="${orderVO.orderShipment.provinceId}" data-province_name="${orderVO.orderShipment.provinceName}" data-city_id="${orderVO.orderShipment.cityId}" data-city_name="${orderVO.orderShipment.cityName}" data-district_id="${orderVO.orderShipment.districtId}" data-district_name="${orderVO.orderShipment.districtName}">
  <div class="modal-hd">
    <h3 class="title">修改地址</h3>
    <a class="close" data-dismiss="modal" href="javascript: void(0);"><i class="glyphicon glyphicon-remove"></i></a> </div>
  <div class="modal-bd">
    <form id="J_updateAddrForm" class="form-update-addr" method="post" action="">
      <div class="form-row  clearfix">
        <fieldset class="form-section form-section-active">
          <label class="input-label" for="Consignee">收货人姓名</label>
          <input class="input-text" type="text" id="Consignee" name="Order[consignee]" value="${orderVO.orderShipment.userName}" maxlength="15" placeholder="必填" required>
        </fieldset>
        <fieldset class="form-section form-section-active">
          <label class="input-label" for="Telephone">联系电话</label>
          <input class="input-text" type="text" value="${orderVO.orderShipment.userPhone}" id="Telephone" name="Order[tel]" placeholder="11位手机号（必填）" required>
          <p class="msg-tip hide">11位手机号</p>
        </fieldset>
      </div>
      <div class="form-row clearfix">
        <div class="form-section form-section-province">
          <select id="loc_province" class="select-1">
          </select>
        </div>
        <div class="form-section form-section-province">
          <select id="loc_city" class="select-2">
          </select>
        </div>
      </div>
      <div class="form-row clearfix">
        <fieldset class="form-section form-section-active">
          <select id="loc_town"  class="select-3">
          </select>
        </fieldset>
      </div>
      <div class="form-row clearfix">
        <fieldset class="form-section form-section-active">
          <label class="input-label" for="Street">详细地址</label>
          <textarea class="input-text" id="Street" name="Order[address]" placeholder="路名或街道地址，门牌号">${orderVO.orderShipment.userAdress}</textarea>
        </fieldset>
      </div>
      <div class="form-row clearfix">
        <fieldset class="form-section form-section-active">
          <label class="input-label" for="Zipcode">邮政编码</label>
          <input class="input-text" type="text" id="Zipcode" name="Order[zipcode]" value="${orderVO.orderShipment.userZipcode}" maxlength="6" placeholder="必填" required>
        </fieldset>
      </div>
      <div class="tip-msg" id="J_updateAddrTip"></div>
    </form>
  </div>
  <div class="modal-ft"> <a id="J_cancelEditAddr" class="btn btn-gray" data-dismiss="modal" href="javascript: void(0);">取消</a> <a id="J_submitForm" class="btn btn-primary" href="javascript: void(0);">确认</a> </div>
</div>
<div id="J_modalEditTime" class="modal modal-edit-time modal-hide in" aria-hidden="false" style="display: none;">
  <div class="modal-hd">
    <h3 class="title">送货时间</h3>
    <a class="close" data-dismiss="modal" href="javascript: void(0);"><i class="glyphicon glyphicon-remove"></i></a> </div>
  <div class="modal-bd">
    <div class="field-edit-time">
      <ul class="time-list clearfix">
        <li data-value="1"><b>不限送货时间</b>周一至周日</li>
        <li data-value="2"><b>工作日送货</b>周一至周五</li>
        <li data-value="3"><b>双休日、假日送货</b>周六至周日</li>
      </ul>
    </div>
  </div>
  <div class="modal-ft"> <a id="J_cancelEditTime" class="btn btn-gray J_cancel" data-dismiss="modal" href="javascript: void(0);">取消</a> <a id="J_submitEditTime" class="btn btn-primary" href="javascript: void(0);">保存</a> </div>
</div>
<div class="modal-backdrop in" style="display: none; width: 100%; height: 1854px;"></div>
<myfooter> 
  <!-- layer javascript --> 
  <script src="${ctxsta}/common/layer/layer.js"></script> 
  <script src="${ctxsta}/os/area/js/area.js"></script> 
  <script src="${ctxsta}/os/area/js/location.js"></script> 
  <script src="${ctxsta}/os/area/js/select2.js"></script> 
  <script src="${ctxsta}/os/area/js/select2_locale_zh-CN.js"></script> 
  <script src="${ctxsta}/os/js/order.js"></script> 
</myfooter>
</body>
</html>