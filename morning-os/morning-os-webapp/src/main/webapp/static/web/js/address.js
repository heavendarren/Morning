/**
 * 添加地址
 */
$(function() {
	$("#J_newAddress").on("click", function() {
		resetData();
		if ("object" != typeof $(this)) return !1;
		var b = $(this).offset().left - 15,
			c = $(this).offset().top,
			d = $(this).outerWidth() + 70;
		$(".address-edit-box").css({
			width : d,
			top : c,
			left : b
		}).show();
		var e = $(document).width(),
			f = $(document).height();
		$("#J_editAddrBackdrop").css({
			width : e,
			height : f
		}).show()
	})
})

/**
 * 关闭添加地址栏
 */
$(function() {
	$("#J_cancel").click(function() {
		$(".address-edit-box").hide(),
		$("#J_editAddrBackdrop").hide()
	})
})

/**
 * 保存收货地址
 */
$(function() {
	$("#J_save").click(function() {
		var c = $("#user_name"),
			d = $("#loc_province"),
			e = $("#loc_city"),
			f = $("#loc_town"),
			g = $("#user_adress"),
			h = $("#user_zipcode"),
			i = $("#user_phone"),
			j = $("#user_tag"),
			s = $("#address_id"),
			k = /^[1-9]+\d*$/,
			l = /^\d{6}$/,
			m = /^1[0-9]{10}$/,
			n = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/,
			o = /^\d+$/,
			p = /^[0-9a-zA-Z]+$/,
			q = /^[a-zA-Z\u4e00-\u9fa5]+$/,
			r = {},
			v = !1;
		var t = $.trim(c.val()),
			u = c.attr("placeholder");
		if (t === u && (t = ""), !(strLen(t) >= 4)) return c.focus(), setMsg(c, "收货人姓名 太短 (最小值为 2 个中文字)"), !1;
		if (!q.test(t)) return c.focus(), setMsg(c, "收货人姓名不正确（只能是英文、汉字）"), !1;
		setMsg(c, ""), r.userName = t, v = !0;
		var w = $.trim(i.val()),
			x = !1;
		a = !0;
		if (w === i.attr("placeholder") && (w = ""), !(strLen(w) == 11)) return i.focus(), setMsg(i, "请填写11位手机号"), !1;
		if (a && w && w !== i.attr("placeholder") ? a = !1 : !a && w && w === i.attr("placeholder") ? i.attr("placeholder", "") : a || w || i.attr("placeholder", "11位手机号"), !a && w !== i.attr("placeholder") && !m.test(w)) return i.focus(), setMsg(i, "请填写11位手机号"), !1;
		setMsg(i, ""), r.userPhone = w, x = !0;
		var y = d.val(),
			z = e.val(),
			A = f.val(),
			B = !1;
		if (!(k.test(y) && k.test(z) && k.test(A))) return setMsg(d, "收货地址不正确"), !1;
		setMsg(d, ""), r.provinceId = y, r.cityId = z, r.districtId = A, r.provinceName = $("#select2-chosen-1").html(), r.cityName = $("#select2-chosen-2").html(), r.districtName = $("#select2-chosen-3").html(), B = !0;
		var C = $.trim(g.val()).replace(/</g, "").replace(/>/g, "").replace(/\//g, "").replace(/\\/g, ""),
			D = g.attr("placeholder"),
			E = !1;
		if (C === D && (C = ""), !(C.length >= 5 && C.length <= 32)) return g.focus(), setMsg(g, "详细地址长度不对，最小为 5 个字，最大32个字"), !1;
		if (n.test(C) || o.test(C) || p.test(C)) return g.focus(), setMsg(g, "详细地址不正确"), !1;
		setMsg(g, ""), r.userAdress = C, E = !0;
		var F = $.trim(h.val()),
			G = !1;
		if (!l.test(F)) return h.focus(), setMsg(h, "邮编是6位数字"), !1;
		setMsg(h, ""), r.userZipcode = F, G = !0;
		var H = $.trim(j.val()),
			I = j.attr("placeholder"),
			J = !1;
		if (H === I && (H = ""), H.length > 5) return j.focus(), setMsg(j, "地址标签最长5个字"), !1;
		setMsg(j, ""), r.userTag = H, J = !0;
		var S = $.trim(s.val());
		r.addressId = S;
		if (J = !0, v && B && E && G && x && J)
			saveAddr(r), Close(), resetData()
	})
})

/**
 * 验证长度
 */
function strLen(a) {
	return a.replace(/[^\x00-\xff]/g, "**").length
}

/**
 * 显示错误信息
 */
function setMsg(a, b) {
	a && b ? a.siblings(".tipMsg").html(b).show() : a.siblings(".tipMsg").html("").hide()
}

/**
 * 关闭地址栏
 */
function Close() {
	$(".address-edit-box").hide(),
	$("#J_editAddrBackdrop").hide()
}

/**
 * 保存收货地址
 */
function saveAddr(a) {
	if (a.addressId == null && a.addressId == "") {
		$.ajax({
			type : "POST",
			url : baselocation + '/uc/user/address',
			data : a,
			dataType : "json",
			success : function(result) {
				if (result.success == true) {
					window.location.reload();
				} else {
					layer.alert(result.message, {
						icon : 2
					});
				}
			}
		})
	} else {
		$.ajax({
			type : "POST",
			url : baselocation + '/uc/user/address/' + a.addressId,
			data : a,
			dataType : "json",
			success : function(result) {
				if (result.success == true) {
					window.location.reload();
				} else {
					layer.alert(result.message, {
						icon : 2
					});
				}
			}
		})
	}
}

/**
 * 删除收获地址
 */
function address_delete(obj, data) {
	layer.confirm('确认要删除吗？', {
		btn : [ '确定', '取消' ] //按钮
	}, function() {
		$.ajax({
			type : 'delete',
			dataType : 'json',
			url : baselocation + '/uc/user/address/' + data,
			success : function(result) {
				if (result.success == true) {
					$(obj).parent().parent("div").remove();
					layer.msg('已删除!', {
						icon : 1,
						time : 1000
					});
				} else {
					layer.alert(result.message, {
						icon : 2
					});
				}
			}
		})
	});
}

/**
*打开地址栏
*/
function Show(a) {
	if ("object" != typeof a) return !1;
	var b = a.offset().left - 15,
		c = a.offset().top,
		d = a.outerWidth() + 70;
	$(".address-edit-box").css({
		width : d,
		top : c,
		left : b
	}).show();
	var e = $(document).width(),
		f = $(document).height();
	$("#J_editAddrBackdrop").css({
		width : e,
		height : f
	}).show()
}

/**
*修改收货地址
*/
$(function() {
	$(".J_addressModify").on("click", function() {
		resetData();
		var loc = new Location();
		var b = $(this).parent().parent(),
			c = b.attr("data-consignee"),
			d = b.attr("data-province_id"),
			e = b.attr("data-province_name"),
			f = b.attr("data-city_id"),
			g = b.attr("data-city_name"),
			h = b.attr("data-district_id"),
			i = b.attr("data-district_name"),
			j = b.attr("data-address"),
			k = b.attr("data-zipcode"),
			l = b.attr("data-tel"),
			m = b.attr("data-tag_name"),
			n = b.attr("data-address_id");
		return $("#user_name").val(c),
			$("#user_adress").val(j),
			$("#user_tag").val(m),
			$("#user_zipcode").val(k),
			$("#user_phone").val(l),
			$("#address_id").val(n),
			$("#loc_province").find("option[value='" + d + "']").prop("selected", !0),
			$("#select2-chosen-1").html(e),
			loc.fillOption('loc_city', '0,' + d),
			$("#loc_city").find("option[value='" + f + "']").prop("selected", !0),
			$("#select2-chosen-2").html(g),
			loc.fillOption('loc_town', '0,' + d + ',' + f),
			$("#loc_town").find("option[value='" + h + "']").prop("selected", !0),
			$("#select2-chosen-3").html(i),
			Show(b), !1
	})
})

/**
 * 重置收货地址
 */
function resetData() {
	var loc = new Location();
	loc.fillOption('loc_province', '0');
	loc.fillOption('loc_city', '');
	loc.fillOption('loc_town', '');
	$("#user_name").val(""),
	$("#user_adress").val(""),
	$("#user_phone").val("").attr("placeholder", "11位手机号"),
	$("#user_tag").val(""),
	$("#user_zipcode").val(""),
	$("#address_id").html(""),
	$(".tipMsg").html("").hide();
}

/**
 * 地址选择
 */
$(function() {
	$(".J_addressItem").on("click", function() {
		$(this).addClass("selected").siblings().removeClass("selected");
		var b = $(this),
			c = b.attr("data-consignee"),
			e = b.attr("data-province_name"),
			g = b.attr("data-city_name"),
			i = b.attr("data-district_name"),
			j = b.attr("data-address"),
			k = b.attr("data-zipcode"),
			l = b.attr("data-tel"),
			m = b.attr("data-tag_name"),
			n = b.attr("data-address_id");
		var html = '<div class="seleced-address" id="J_confirmAddress">' + c + '&nbsp;&nbsp;' + l + '<br>'
			+ e + '&nbsp;&nbsp;' + g + '&nbsp;&nbsp;' + i + '&nbsp;&nbsp;' + j + '&nbsp;&nbsp;';
		$(".section-bar").find(".fl:first-child").html(html);
	})
})

/**
 * 选择送货时间
 */
$(function() {
	$(".section-time .J_option").on("click", function() {
		$(this).addClass("selected").siblings().removeClass("selected");
	})
})

/**
 * 选择发票抬头
 */
$(function() {
	$(".section-invoice .J_option").on("click", function() {
		$(this).addClass("selected").siblings().removeClass("selected");
		var a = $(this).attr('data-value');
		if (a === "1") {
			$('.paper-invoice-company').addClass('hide')
			$('.tab-container .tab-content').addClass('hide')
		} else if (a === "2") {
			$('.paper-invoice-company').removeClass('hide')
			$('.tab-container .tab-content').addClass('hide')
		} else {
			$('.paper-invoice-company').removeClass('hide')
			$('.tab-container .tab-content').removeClass('hide')
		}
	})

	// 隐藏弹出框
	function e(obj) {
		return document.getElementById(obj)
	}
	e('J_showEinvoiceDetail').onclick = function(event) {
		$("#J_einvoiceDetail").removeClass('hide');
		stopBubble(event);
		document.onclick = function() {
			$("#J_einvoiceDetail").addClass('hide');
			document.onclick = null;
		}
	}

	e('J_einvoiceDetail').onclick = function(event) {
		//只阻止了向上冒泡，而没有阻止向下捕获，所以点击con的内部对象时，仍然可以执行这个函数
		stopBubble(event);
	}
	//阻止冒泡函数
	function stopBubble(e) {
		if (e && e.stopPropagation) {
			e.stopPropagation(); //w3c
		} else {
			window.event.cancelBubble = true; //IE
		}
	}
})

/**
 * 去结算
 */
$(function() {
	$("#J_checkoutToPay").on("click", function() {
		var b = $("#J_addressList").find(".selected").length;
		if (0 >= b) {
			layer.alert("请选择地址！", {
				icon : 2
			});
			return !1;
		}
		var a = $(".section-invoice").find(".selected").attr('data-value');
		var t = $("#invoice_title").val();
		if (a !== "1" && (strLen(t) < 1)) {
			layer.alert("发票抬头名称不能为空!", {
				icon : 2
			});
			return !1;
		}
		var params = {};
		params.addressId = $("#J_addressList").find(".selected").attr('data-address_id');
		params.payType = $(".section-payment").find(".selected").attr('data-value');
		params.shipmentType = $(".section-shipment").find(".selected").attr('data-value');
		params.shipmentAmount = $(".section-shipment").find(".selected").attr('data-amount');
		params.shipmentTime = $(".section-time").find(".selected").attr('data-value');
		params.shipmentTime = $(".section-time").find(".selected").attr('data-value');
		params.invoiceType = $(".section-invoice").find(".selected").attr('data-value');
		params.invoiceTitle = $("#invoice_title").val();
		$.ajax({
			url : baselocation + '/buy/confirm',
			type : 'post',
			dataType : 'json',
			data : params,
			success : function(result) {
				if (result.success == true) {
					window.location.href = baselocation + '/buy/confirm/' + result.data;
				} else {
					layer.alert(result.message, {
						icon : 2
					});
				}
			}
		});
	})
})