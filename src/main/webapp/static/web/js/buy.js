$(function(){
	selectAddr();
	showNewAddr();
	addrCancel();
	addrOk();
	toEdit();
	showLocation();
	chooseInvoice();
	toPay();
	topNavigation();  //菜单栏的显示
})

/**
*地址选择
*/
function selectAddr(){
	$("#checkoutAddrList").find("dl").on("click", function() {
		$(this).addClass("selected").siblings().removeClass("selected"),
		$(this).find(".addressId").prop("checked", !0),  //!0 ==true
		$(this).siblings().find(".addressId").prop("checked", !1)
	})
}

/**
*添加地址
*/
function showNewAddr(){
	$("#J_useNewAddr").on("click", function() {
		setAddrState("1");
		resetData();
		if ("object" != typeof $(this)) return !1;
		var b = $(this).offset().left-15,
			c = $(this).offset().top,
			d = $(this).outerWidth() +70;
		$("#J_editAddrBox").css({
			width: d,
			top: c,
			left: b
		}).show();
		var e = $(document).width(),
			f = $(document).height();
		$("#J_editAddrBackdrop").css({
			width: e,
			height: f
		}).show()
	})
}

/**
*关闭添加地址栏
*/
function  addrCancel(){
	$("#J_editAddrCancel").click(function() {
			$("#J_editAddrBox").hide(), 
			$("#J_editAddrBackdrop").hide(),
			$("html,body").scrollTop(
				$("#checkoutAddrList").find(".selected").length > 0 ? $("#checkoutAddrList").find(".selected").offset().top : 0						            ),
			resetData(),	
			setAddrState()
	})
}

/**
*保存收货地址
*/
function addrOk(){
	$("#J_editAddrOk").click(function() {
	var c = $("#Consignee"),
			d = $("#loc_province"),
			e = $("#loc_city"),
			f = $("#loc_town"),
			g = $("#Street"),
			h = $("#Zipcode"),
			i = $("#Telephone"),
			j = $("#Tag"),
			k = /^[1-9]+\d*$/,
			l = /^\d{6}$/,
			m = /^1[0-9]{10}$/,
			n = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/,
			o = /^\d+$/,
			p = /^[0-9a-zA-Z]+$/,
			q = /^[a-zA-Z\u4e00-\u9fa5]+$/,
			r = {},
			s = $("#addrState").val(),
			t = $.trim(c.val()),
			u = c.attr("placeholder"),
			v = !1;
		if (t === u && (t = ""), !(strLen(t) >= 4)) return c.focus(), setMsg(c, "收货人姓名 太短 (最小值为 2 个中文字)"), !1;
		if (!q.test(t)) return c.focus(), setMsg(c, "收货人姓名不正确（只能是英文、汉字）"), !1;
		setMsg(c, ""), r.consignee = t, v = !0;
		var w = $.trim(i.val()),
			x = !1;
			a = !0;
		if (a && w && w !== i.attr("placeholder") ? a = !1 : !a && w && w === i.attr("placeholder") ? i.attr("placeholder", "") : a || w || i.attr("placeholder", "11位手机号"), !a && w !== i.attr("placeholder") && !m.test(w)) return i.focus(), setMsg(i, "请填写11位手机号"), !1;
		setMsg(i, ""), r.tel = w, r.telPlaceholder = i.attr("placeholder"), x = !0;
		var y = d.val(),
			z = e.val(),
			A = f.val(),
			B = !1;
		if (!(k.test(y) && k.test(z) && k.test(A))) return setMsg(d, "收货地址不正确"), !1;
		setMsg(d, ""), r.province = y, r.city = z, r.county = A, r.provinceName = $("#select2-chosen-1").html(), r.cityName = $("#select2-chosen-2").html(), r.countyName = $("#select2-chosen-3").html(), B = !0;
		var C = $.trim(g.val()).replace(/</g, "").replace(/>/g, "").replace(/\//g, "").replace(/\\/g, ""),
			D = g.attr("placeholder"),
			E = !1;
		if (C === D && (C = ""), !(C.length >= 5 && C.length <= 32)) return g.focus(), setMsg(g, "详细地址长度不对，最小为 5 个字，最大32个字"), !1;
		if (n.test(C) || o.test(C) || p.test(C)) return g.focus(), setMsg(g, "详细地址不正确"), !1;
		setMsg(g, ""), r.street = C, E = !0;
		var F = $.trim(h.val()),
			G = !1;
		if (!l.test(F)) return h.focus(), setMsg(h, "邮编是6位数字"), !1;
		setMsg(h, ""), r.zipcode = F, G = !0;
		var H = $.trim(j.val()),
			I = j.attr("placeholder"),
			J = !1;
		if (H === I && (H = ""), H.length > 5) return j.focus(), setMsg(j, "地址标签最长5个字"), !1;
		setMsg(j, ""), r.tag = H, J = !0;
		if (r.tag = H, J = !0, v && B && E && G && x && J) if ("1" === s) {
			 saveAddr(r,s),Close(), resetData()
		} else saveAddr(r,null);
		
	})
}

/**
*验证长度
*/
function strLen(a) {
	return a.replace(/[^\x00-\xff]/g, "**").length
}

/**
*地址状态
*/
function setAddrState(a) {
	if ("1" === a) $("#addrState").val(a);
	else {
		var b = $("#checkoutAddrList").find(".selected"),
			c = b.attr("data-isnew");
		$("#addrState").val("true" === c ? "1" : "0")
	}
}
/**
*显示错误信息
*/
function setMsg(a, b) {
	a && b ? a.siblings(".tipMsg").html(b).show() : a.siblings(".tipMsg").html("").hide()
}
/**
*关闭地址栏
*/
function Close(){
	$("#J_editAddrBox").hide(), 
	$("#J_editAddrBackdrop").hide(),
	$("html,body").scrollTop(
		$("#checkoutAddrList").find(".selected").length > 0 ? $("#checkoutAddrList").find(".selected").offset().top : 0						    )
}

/**
*打开地址栏
*/
function Show(a){
	if ("object" != typeof a) return !1;
	var b = a.offset().left-15,
		c = a.offset().top,
		d = a.outerWidth() +70;
	$("#J_editAddrBox").css({
		width: d,
		top: c,
		left: b
	}).show();
	var e = $(document).width(),
		f = $(document).height();
	$("#J_editAddrBackdrop").css({
		width: e,
		height: f
	}).show()
}

/**
*重置收货地址
*/
function resetData() {
	var loc	= new Location();
	loc.fillOption('loc_province' , '0');
	loc.fillOption('loc_city' , '');
	loc.fillOption('loc_town' , '');
	$("#Consignee").val(""), 
	$("#Street").val(""), 
	$("#Telephone").val("").attr("placeholder", "11位手机号"), 
	$("#Zipcode").val(""),
	$("#Tag").val(""), 
	$("#zipcodeTip").html(""), 
	$(".tipMsg").html("").hide()
}
/**
*修改收货地址
*/
function toEdit() {
	$(".J_editAddr").on("click", function() {
			setAddrState();
			var loc	= new Location();
			var b = $(this).parent().parent(),
				c = (b.attr("data-editable"), b.attr("data-consignee")),
				d = b.attr("data-province_id"),
				e = b.attr("data-province_name"),
				f = b.attr("data-city_id"),
				g = b.attr("data-city_name"),
				h = b.attr("data-district_id"),
				i = b.attr("data-district_name"),
				j = b.attr("data-address"),
				k = b.attr("data-area"),
				l = b.attr("data-tel"),
				m = b.attr("data-tag_name");
			return $("#Consignee").val(c),
				   $("#Street").val(j), 
				   m && $("#Tag").val(m),
				   $("#Zipcode").val(k),
				   $("#Telephone").val(l),
				   $("#loc_province").find("option[value='" + d + "']").prop("selected", !0),
				   $("#select2-chosen-1").html(e),
				   loc.fillOption('loc_city' , '0,'+d),
				   $("#loc_city").find("option[value='" + f + "']").prop("selected", !0),
				   $("#select2-chosen-2").html(g),
				   loc.fillOption('loc_town' , '0,' + d + ',' + f),
				   $("#loc_town").find("option[value='" + h + "']").prop("selected", !0),
				   $("#select2-chosen-3").html(i),
				   Show(b),
 !1
		})
}


/**
*保存收货地址
*/
function saveAddr(a,s) {
	var b = this,
		c = $("#checkoutAddrList").find(".selected").find(".addressId").val(),
		d = $("#newType").val();
	if ("1" === s){
		var e = "&userAddress.orderUserName=" + a.consignee + "&userAddress.provinceId=" + a.province + 
	"&userAddress.cityId=" + a.city + "&userAddress.districtId=" + a.county + "&userAddress.orderUserAddress=" + a.street + 
	"&userAddress.area=" + a.zipcode + "&userAddress.orderUserTelphone=" + a.tel + "&userAddress.tagName=" + a.tag +  
	"&userAddress.provinceName=" + a.provinceName + "&userAddress.cityName=" + a.cityName + "&userAddress.districtName=" + a.countyName;
	}else{
		var e = "userAddress.addressId=" + c + "&userAddress.orderUserName=" + a.consignee + "&userAddress.provinceId=" + a.province + 
	"&userAddress.cityId=" + a.city + "&userAddress.districtId=" + a.county + "&userAddress.orderUserAddress=" + a.street + 
	"&userAddress.area=" + a.zipcode + "&userAddress.orderUserTelphone=" + a.tel + "&userAddress.tagName=" + a.tag +  
	"&userAddress.provinceName=" + a.provinceName + "&userAddress.cityName=" + a.cityName + "&userAddress.districtName=" + a.countyName;
	}
	$.ajax({
		type: "POST",
		url: baselocation+'/user/saveAddress',
		data: e,
		dataType: "json",
		success:function(result){
			if(result.success==true){
				window.location.reload();
			}else{
				dialog('提示信息',result.message,1);
			}
		}
	})
}


/**
*选择送货时间
*/
$(document).on("click", ".J_optionList > .item", function() {
	$(this).addClass("selected").children("input").prop("checked", !0), 
	$(this).siblings().removeClass("selected")
})


/**
*选择发票抬头
*/
function chooseInvoice() {
	$(".J_optionInvoice").children(".item").on("click", function() {
		var a = $(this).children("input").val();
		$("#eInvoiceTip").hide(),
		 a === "1" ? ($("#checkoutInvoiceDetail").fadeIn(), 
		 			  $("#checkoutInvoiceElectronic").hide(),
					  $(".invoiceType").prop("checked", !1),
					  $(".J_invoiceType").children("li").eq(1).trigger("click")) 
		: a === "4" ? ($("#checkoutInvoiceDetail").hide(),
					   $("#checkoutInvoiceElectronic").fadeIn(),
					   $(".invoiceType").prop("checked", !1), 
					   $("#electronicPersonal").prop("checked", !0))
	    : ($("#checkoutInvoiceDetail").hide(), 
		   $("#checkoutInvoiceElectronic").hide(),
		   $(".invoiceType").prop("checked", !1), 
		   $("#noNeedInvoice").prop("checked", !0))
	}), 
	$(".J_invoiceType").children("li").on("click", function() {
		var a = $(this).children("input").prop("checked", !0).val();
		a === "2" ? $("#CheckoutInvoiceTitle").show() : $("#CheckoutInvoiceTitle").hide().children("input").val(""), 
		$(this).addClass("selected").siblings().removeClass("selected")
	})
}

/**
*
*/
function toPay() {
	$("#checkoutToPay").on("click", function() {
		var t =	$.trim($("input[name='order.invoicelTitle']").val());
		var b = $("#checkoutAddrList").find(".selected").length;
		if (0 >= b) return sweetAlert({title: "提示信息",text: "请选择地址!",type: "error",confirmButtonText: "确定"}), !1;
		if ($("input[name='order.invoicelType']:checked").val() === "2"&&(strLen(t) >= 1)){
			return sweetAlert({title: "提示信息",text: "单位名称不能为空!",type: "error",confirmButtonText: "确定"}),!1
		};
		var params='';
		$("#creatOrder input,#creatOrder textarea").each(function(){
			params+=$(this).serialize()+"&";
	    });
		$.ajax({
			url:baselocation+'/oder/creatOrder',
			type:'post',
			dataType:'json',
			data:params,
			success:function(result){
				if(result.success==true){
					swal({
						title: "提示信息",
						text: result.message,
						type: "success",   
						confirmButtonText: "确定"},
					function(){
						window.location.reload();
					});
				}else{
					dialog('提示信息',result.message,1);
				}
			}
		});
	})
}