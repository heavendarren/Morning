<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>我的收货地址 - 猫宁商城</title>
<link rel="stylesheet" href="${ctxsta}/os/css/address.css">
<link rel="stylesheet" href="${ctxsta}/os/area/css/select2.css" />
</head>
<body>
<div class="span16">
  <div class="uc-box uc-main-box">
    <div class="uc-content-box">
      <div class="box-hd">
        <h1 class="title">收货地址</h1>
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
            <div class="address-item J_addressItem" data-address_id="${address.addressId}" data-consignee="${address.userName}" data-tel="${address.userPhone}" data-province_id="${address.provinceId}" data-province_name="${address.provinceName}" data-city_id="${address.cityId}" data-city_name="${address.cityName}" data-district_id="${address.districtId}" data-district_name="${address.districtName}" data-zipcode="${address.userZipcode}" data-address="${address.userAdress}" data-tag_name="${address.userTag}">
              <dl>
                <dt> <span class="tag">${address.userTag}</span> <em class="uname">${address.userName}</em> </dt>
                <dd class="utel">${address.userPhone}</dd>
                <dd class="uaddress">${address.provinceName}&nbsp;&nbsp;${address.cityName}&nbsp;&nbsp;${address.districtName} <br />
                  ${address.userAdress} (${address.userZipcode})</dd>
              </dl>
              <div class="actions"> <a class="modify J_addressModify" data-id="${address.addressId}" href="javascript:void(0);">修改</a> <a class="modify J_addressDel" href="javascript:void(0);" onclick="address_delete(this,${address.addressId})" data-id="${address.addressId}">删除</a> </div>
            </div>
          </c:forEach>
        </div>
        <div class="xm-pagenavi">
          <c:if test="${pageInfo.total gt pageInfo.limit and not empty addresses}">
            <div id="pager" data-pager-href="${ctx}/uc/user/address?page=" data-pager-totalPage="${pageInfo.totalPage}" data-pager-current="${pageInfo.current}"></div>
          </c:if>
        </div>
        <!--点击弹出新增/收货地址界面start-->
        <div class="address-edit-box">
          <div class="box-main">
            <div class="form-section">
              <input class="input-text J_addressInput" type="text" id="user_name" name="userName" placeholder="收货人姓名">
              <p class="tip-msg tipMsg"></p>
            </div>
            <div class="form-section">
              <input class="input-text J_addressInput" type="text" maxlength="11" id="user_phone" name="user_phone" placeholder="11位手机号">
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
              <input class="input-text J_addressInput" type="text" maxlength="6" id="user_zipcode" name="user_zipcode" placeholder="邮政编码">
              <p class="tip-msg tipMsg"></p>
            </div>
            <div class="form-section">
              <input class="input-text J_addressInput" type="text" maxlength="5" id="user_tag" name="user_tag" placeholder="如&quot;家&quot;、&quot;公司&quot;。限5个字内">
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
    </div>
  </div>
</div>
<myfooter> 
  <!-- layer javascript --> 
  <script src="${ctxsta}/common/layer/layer.js"></script> 
  <!-- 分页js --> 
  <script src="${ctxsta}/common/pager/jquery.pager.js"></script> 
  <!-- 地址选择 --> 
  <script src="${ctxsta}/os/area/js/area.js"></script> 
  <script src="${ctxsta}/os/area/js/location.js"></script> 
  <script src="${ctxsta}/os/area/js/select2.js"></script> 
  <script src="${ctxsta}/os/area/js/select2_locale_zh-CN.js"></script> 
  <script src="${ctxsta}/os/js/address.js"></script> 
  <script type="text/javascript">
		var pagecount = $('#pager').attr('data-pager-totalPage'); // 总页面数
		var current = $('#pager').attr('data-pager-current'); // 当前页数
		var href = $('#pager').attr('data-pager-href'); // 链接地址
		$(document).ready(function() {
			$("#pager").pager({
				pagenumber : current,
				pagecount : pagecount,
				buttonClickCallback : PageClick
			});
		});
		PageClick = function(number) {
			$("#pager").pager({
				pagenumber : number,
				pagecount : pagecount,
				buttonClickCallback : PageClick
			});
			window.location.href = href + number;
  	}
  </script> 
</myfooter>
</body>
</html>