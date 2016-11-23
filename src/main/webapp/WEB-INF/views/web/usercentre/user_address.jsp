<%@ page language="java" import="java.util.*"  contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <title>我的收货地址 - 猫宁Morning</title>
	<link rel="stylesheet" href="${ctxsta}/web/css/select2.css" />
	<link rel="stylesheet" href="${ctxsta}/web/css/usercentre/user-address.css" />
  </head>
  <body>
        <!-- 右侧，开始 -->
        <article class="uArtucle">              
            <div class="u-r-cont">
                <section>
                	<h1 class="title">
                    	我的收货地址
                        <small>
                        	已保存了${fn:length(userAddressList) } 条地址!
                        </small>
                    </h1>
                    <!-- 地址状态 0：默认选择；1：新增地址；2：修改地址 -->
					<input type="hidden"  id="addrState" value="0">
 					<!-- 收货地址 -->
					<div class="xm-box" id="profile">                        
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
                                        <span class="edit-btn J_deleteAddr">删除</span>
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
                </section>
            </div>
        </article>
        <!-- 右侧，结束 -->
        <myfooter>  
		<script src="${ctxsta}/web/js/area/area.js"></script>
		<script src="${ctxsta}/web/js/area/location.js"></script>
		<script src="${ctxsta}/web/js/area/select2.js"></script>
		<script src="${ctxsta}/web/js/area/select2_locale_zh-CN.js"></script>
	    <script src="${ctxsta}/web/js/usercentre/user.address.js"></script>
		</myfooter>  
  </body>
</html>
