$(function() {
	showLocation();
})

/**
 * 订单详情
 */
$(function() {
	$('#J_showDetail').on("click", function() {
		$('#J_postInfo').toggleClass('post-info-hide');
		if ($('#J_postInfo').hasClass('post-info-hide')) {
			$('.order-detail').css('display', 'block');
		} else {
			$('.order-detail').css('display', 'none');
		}
	})
})

/**
 * 导航分类栏显示及颜色变换
 */
$(function() {
	$('#J_navCategory').mouseover(function() {
		$('.site-category').css('display', 'block');
	})
	$('#J_navCategory').mouseout(function() {
		$('.site-category').css('display', 'none');
	})
});

/**
 * 取消订单
 */
$(function() {
	$('#J_cancelOrder').on("click", function() {
		var orderNumber = $('#J_cancelOrder').attr('data-order-id');
		layer.confirm('你真的要取消此订单吗?', {
			btn : [ '确定', '取消' ] //按钮
		}, function() {
			$.ajax({
				type : 'put',
				dataType : 'json',
				url : baselocation + '/order/cancelOrder',
				data : {
					'orderNumber' : orderNumber
				},
				success : function(result) {
					if (result.code == 1) {
						window.location.reload(); //刷新当前页面.
					} else {
						layer.alert(result.message, {
							icon : 2
						});
					}
				}
			})
		});
	})
})

/**
 * 选择送货时间
 */
$(function() {
	$(".time-list li").on("click", function() {
		$(this).addClass("active").siblings().removeClass("active");
	})
})


/**
 * 修改送货时间
 */
$(function() {
	$(".J_editTime").on("click", function() {
		$("#J_modalEditTime").show();
		$(".modal-backdrop").show();
		var shipmentTime = $(".J_editTime").attr('data-shipment-time');
		var $elements = $('.time-list').children('li');
		$elements.each(function() {
			var shipment = $(this).attr('data-value');
			if (shipment == shipmentTime) {
				$(this).addClass("active").siblings().removeClass("active");
			}
		});
	})
	$("#J_cancelEditTime").on("click", function() {
		$("#J_modalEditTime").hide();
		$(".modal-backdrop").hide();
	})
	$(".close").on("click", function() {
		$("#J_modalEditTime").hide();
		$(".modal-backdrop").hide();
	})
})

/**
 * 确认修改送货时间
 */
$(function() {
	$("#J_submitEditTime").on("click", function() {
		var params = {};
		params.shipmentTime = $(".time-list").find(".active").attr('data-value');
		params.orderNumber = $(".J_editTime").attr('data-order-id');
		$.ajax({
			url : baselocation + '/order/time',
			type : 'put',
			dataType : 'json',
			data : params,
			success : function(result) {
				if (result.code == 1) {
					window.location.reload(); //刷新当前页面.
				} else {
					layer.alert(result.message, {
						icon : 2
					});
				}
			}
		});
	})
})

/**
 * 修改送货地址
 */
$(function() {
	$(".J_editAddr").on("click", function() {
		$("#J_modalVerify").show();
		$(".modal-backdrop").show();
		var loc = new Location();
		var b = $("#J_modalVerify"),
			province_id = b.attr("data-province_id"),
			province_name = b.attr("data-province_name"),
			city_id = b.attr("data-city_id"),
			city_name = b.attr("data-city_name"),
			district_id = b.attr("data-district_id"),
			district_name = b.attr("data-district_name");
		$("#loc_province").find("option[value='" + province_id + "']").prop("selected", !0),
		$("#select2-chosen-1").html(province_name),
		loc.fillOption('loc_city', '0,' + province_id),
		$("#loc_city").find("option[value='" + city_id + "']").prop("selected", !0),
		$("#select2-chosen-2").html(city_name),
		loc.fillOption('loc_town', '0,' + province_id + ',' + city_id),
		$("#loc_town").find("option[value='" + district_id + "']").prop("selected", !0),
		$("#select2-chosen-3").html(district_name);
	})
	$("#J_cancelEditAddr").on("click", function() {
		$("#J_modalVerify").hide();
		$(".modal-backdrop").hide();
	})
	$(".close").on("click", function() {
		$("#J_modalVerify").hide();
		$(".modal-backdrop").hide();
	})

	// 聚焦事件
	$(" input[ type='text' ] ").focus(function() {
		$(this).parent().addClass('form-section-focus').siblings().removeClass('form-section-focus');
	});
	$(" input[ type='text' ] ").blur(function() {
		$(this).parent().removeClass('form-section-focus');
	});
	$(" textarea ").focus(function() {
		$(this).parent().addClass('form-section-focus').siblings().removeClass('form-section-focus');
	});
	$(" textarea ").blur(function() {
		$(this).parent().removeClass('form-section-focus');
	});
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
	a && b ? $("#J_updateAddrTip").html(b).show() : $("#J_updateAddrTip").html("").hide()
}

/**
 * 关闭地址栏
 */
function Close() {
	$("#J_modalVerify").hide();
	$(".modal-backdrop").hide();
}


/**
 * 确认修改收货地址
 */
$(function() {
	$("#J_submitForm").on("click", function() {
		var c = $("#Consignee"),
			d = $("#loc_province"),
			e = $("#loc_city"),
			f = $("#loc_town"),
			g = $("#Street"),
			h = $("#Zipcode"),
			i = $("#Telephone"),
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
		if (G = !0, v && B && E && G && x)
			saveAddr(r), Close()
	})
})

/**
 * 保存收货地址
 */
function saveAddr(a) {
	a.orderShipmentId = $(".J_editAddr").attr('data-shipment-id');
	a.orderId = $(".J_editAddr").attr('data-order-id');
	$.ajax({
		type : "PUT",
		url : baselocation + '/order/shipment',
		data : a,
		dataType : "json",
		success : function(result) {
			if (result.code == 1) {
				window.location.reload();
			} else {
				layer.alert(result.message, {
					icon : 2
				});
			}
		}
	})
}