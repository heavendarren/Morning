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
		params.invoiceType = $(".section-invoice").find(".selected").attr('data-value');
		params.invoiceTitle = $("#invoice_title").val();
		$.ajax({
			url : baselocation + '/buy/confirm',
			type : 'post',
			dataType : 'json',
			data : params,
			success : function(result) {
				if (result.code == true) {
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