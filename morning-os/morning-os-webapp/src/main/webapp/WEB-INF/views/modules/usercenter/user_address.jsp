<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>我的收货地址 - 猫宁商城</title>
<link rel="stylesheet" href="${ctxsta}/web/css/main.css">
<link rel="stylesheet" href="${ctxsta}/web/css/address.css">
<link rel="stylesheet" href="${ctxsta}/web/area/css/select2.css" />
</head>
<body>
<!-- 轮播top菜单导航引入 -->
<jsp:include page="/WEB-INF/views/modules/common/site-header.jsp" />
<!-- 轮播top菜单导航引入 --> 

<!--     导航栏 begin       -->
<div class="breadcrumbs">
  <div class="container-fluid"> <a href="" >首页</a><span class="sep">&gt;</span><span>个人中心</span> </div>
</div>
<!--     导航栏 begin       --> 

<!--     个人中心 begin       -->
<div class="page-main user-main">
  <div class="container-fluid">
    <div class="row">
      <div class="span4">
        <div class="uc-box uc-sub-box">
          <div class="uc-nav-box">
            <div class="box-hd">
              <h3 class="title">收货地址</h3>
            </div>
            <div class="box-bd">
              <ul class="uc-nav-list">
                <li><a href="">我的订单</a></li>
                <li><a href="" data-count="comment" data-count-style="bracket">评价晒单</a></li>
              </ul>
            </div>
          </div>
          <div class="uc-nav-box">
            <div class="box-hd">
              <h3 class="title">个人中心</h3>
            </div>
            <div class="box-bd">
              <ul class="uc-nav-list">
                <li><a href="${ctx}/uc/user/portal">我的个人中心</a></li>
                <li><a href="http://order.mi.com/message/list?r=98069.1489505349">消息通知<i class="J_miMessageTotal"></i></a></li>
                <li><a href="${ctx}/uc/user/favorite">喜欢的商品</a></li>
                <li><a href="${ctx}/uc/user/address">收货地址</a></li>
              </ul>
            </div>
          </div>
          <div class="uc-nav-box">
            <div class="box-hd">
              <h3 class="title">账户管理</h3>
            </div>
            <div class="box-bd">
              <ul class="uc-nav-list">
                <li><a href="https://account.xiaomi.com/" target="_blank">个人信息</a></li>
                <li><a href="https://account.xiaomi.com/pass/auth/security/home#service=setPassword" target="_blank">修改密码</a></li>
                <li><a href="http://uvip.xiaomi.cn" target="_blank">社区VIP认证</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="span16">
        <div class="uc-box uc-main-box">
          <div class="uc-content-box">
            <div class="box-hd">
              <h1 class="title">收货地址<small>已保存了${fn:length(addresses)} 条收货地址!</small></h1>
              <div class="more clearfix hide">
                <ul class="filter-list J_addrType">
                  <li class="first active"><a href="">普通收货地址</a></li>
                  <li class=""><a href="">大型商品收货地址</a></li>
                </ul>
              </div>
            </div>
            <div class="box-bd">
              <div class="user-address-list J_addressList clearfix">
                <div class="address-item address-item-new" id="J_newAddress"> <i class="iconfont"><i class="glyphicon glyphicon-plus"></i></i> 添加新地址 </div>
                <c:forEach items="${addresses}" var="address">
                  <div class="address-item J_addressItem" data-address_id="${address.addressId }" data-consignee="${address.userName }" data-tel="${address.userPhone }" data-province_id="${address.provinceId}" data-province_name="${address.provinceName}" data-city_id="${address.cityId}" data-city_name="${address.cityName}" data-district_id="${address.districtId}" data-district_name="${address.districtName}" data-zipcode="${address.userZipcode }" data-address="${address.userAdress }" data-tag_name="${address.userTag }">
                    <dl>
                      <dt> <span class="tag">${address.userTag }</span> <em class="uname">${address.userName }</em> </dt>
                      <dd class="utel">${address.userPhone }</dd>
                      <dd class="uaddress">${address.provinceName}&nbsp;&nbsp;${address.cityName}&nbsp;&nbsp;${address.districtName} <br />
                        ${address.userAdress } (${address.userZipcode })</dd>
                    </dl>
                    <div class="actions"> <a class="modify J_addressModify" data-id="${address.addressId}" href="javascript:void(0);">修改</a> <a class="modify J_addressDel" href="javascript:void(0);" onclick="address_delete(this,${address.addressId})" data-id="${address.addressId}">删除</a> </div>
                  </div>
                </c:forEach>
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
                    <select  id="loc_province" class="select-1"></select>
                    <select  id="loc_city" class="select-2"></select>
                    <select  id="loc_town"  class="select-3"></select>
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
                	<a href="javascript:void(0);" class="btn btn-primary" id="J_save" >保存</a> <a href="javascript:void(0);" class="btn btn-gray" id="J_cancel">取消</a> 
                </div>
              </div>
              <!--点击弹出新增/收货地址界面end-->
              <div class="xm-edit-addr-backdrop" id="J_editAddrBackdrop"> </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!--     个人中心 end       -->
<div style="padding-bottom:130px;"></div>
<myfooter> 
  <!-- layer javascript --> 
  <script src="${ctxsta}/common/layer/layer.js"></script> 
  <!-- 地址选择 --> 
  <script src="${ctxsta}/web/area/js/area.js"></script> 
  <script src="${ctxsta}/web/area/js/location.js"></script> 
  <script src="${ctxsta}/web/area/js/select2.js"></script> 
  <script src="${ctxsta}/web/area/js/select2_locale_zh-CN.js"></script> 
  <script src="${ctxsta}/web/js/address.js"></script> 
</myfooter>
</body>
</html>