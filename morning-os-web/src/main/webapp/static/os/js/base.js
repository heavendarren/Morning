$(function() {
	showsectime(); //网站计时器
	show_cart_umber(); // 购物车商品数量
})

/**
 * 网站计时器
 * @param {} str
 * @return {}
 */
function NewDate(str) {
	str = str.split('-');
	var date = new Date();
	date.setUTCFullYear(str[0], str[1] - 1, str[2]);
	date.setUTCHours(0, 0, 0, 0);
	return date;
}
function showsectime() {
	var birthDay = NewDate("2016-04-28");
	var today = new Date();
	var timeold = today.getTime() - birthDay.getTime();

	var sectimeold = timeold / 1000
	var secondsold = Math.floor(sectimeold);
	var msPerDay = 24 * 60 * 60 * 1000;

	var e_daysold = timeold / msPerDay;
	var daysold = Math.floor(e_daysold);
	var e_hrsold = (daysold - e_daysold) * -24;
	var hrsold = Math.floor(e_hrsold);
	var e_minsold = (hrsold - e_hrsold) * -60;
	var minsold = Math.floor((hrsold - e_hrsold) * -60);

	var seconds = Math.floor((minsold - e_minsold) * -60).toString();
	document.getElementById("showsectime").innerHTML = "网站运行：" + daysold + "天" + hrsold + "小时" + minsold + "分" + seconds + "秒";
	setTimeout(showsectime, 1000);
}

/**
 * 搜索栏
 */
$(function() {
	$("#zySearch").zySearch({
		"width" : "355",
		"height" : "35",
		"parentClass" : "pageTitle",
		"callback" : function(keyword) {
			window.location.href = baselocation + '/search?search=' + keyword;
		}
	});
})

/**
 * 回到顶部
 */
$(function() {
	//当滚动条的位置处于距顶部100像素以下时，跳转链接出现，否则消失  
	$(window).scroll(function() {
		if ($(window).scrollTop() > 100) {
			$("#back-to-top").fadeIn(1000);
		} else {
			$("#back-to-top").fadeOut(1000);
		}
	});

	//当点击跳转链接后，回到页面顶部位置  
	$("#back-to-top").click(function() {
		$('body,html').animate({
			scrollTop : 0
		}, 1000);
		return false;
	});
});

/**
 * 设置分类导航排序样式 
 */
$(function() {
	var url = window.document.location.pathname;
	$("a[href$='" + url + "']").parent().addClass("active").siblings().removeClass('active');
});

/**
 * 轮播top菜单导航
 */
$(function() {
	$('.site-category .category-item').mouseover(function() {
		$(this).addClass('category-item-active').siblings().removeClass('category-item-active');
		var index = $(this).index();
		i = index;
		$('.children').eq(index).css('display', 'block');
	})
	$('.site-category .category-item').mouseout(function() {
		$(this).removeClass('category-item-active');
		var i = $(this).index();
		$('.children').eq(i).css('display', 'none');
	})
});

/**
 * input 聚焦事件
 */
$(function() {
	$(" input[ type='text' ] ").focus(function() {
		$(this).addClass('current').siblings().removeClass('current');
	});
	$(" input[ type='text' ] ").blur(function() {
		$(this).removeClass('current');
	});
});


/**
 * 页面打开时间耗时计时器
 */
window.onload = function() {
	document.getElementById("TimeShow").innerHTML = "本次耗时：" + (new Date().getTime() - t1) / 1000 + " 秒";
}

/**
 * 展示用户登陆下拉菜单
 */
$(function() {
	$("#J_userInfo .user").hover(function() {
		$(this).addClass('user-active');
		$(this).children(".user-menu").css('display', 'block').animate({
			height : "165px"
		}, 165);
	}, function() {
		$(this).removeClass('user-active');
		$(this).children(".user-menu").css('display', 'none');
	})
});

/**
 * 导航栏购物车
 */
var lodingHtml = '<div style="text-align: center" class="tac"><img src="' + baselocation + '/static/os/images/loading.gif"></div>';
$(function() {
	$('.topbar-cart').hover(function() {
		$('.site-topbar .cart-menu').css('display', 'block');
		$.ajax({
			url : baselocation + "/cart/topbar",
			type : 'get',
			dataType : 'text',
			beforeSend : function() {
				$(".site-topbar .cart-menu").children(".loading").html(lodingHtml);
			},
			success : function(result) {
				$(".site-topbar .cart-menu").html(result);
				$('.site-topbar .cart-mini').css({
					display : 'block',
					background : '#fff',
					color : '#ff6700'
				});
			}
		});
	}, function() {
		$('.site-topbar .cart-menu').css('display', 'none');
		var len = $('.site-topbar .cart-menu .cart-list').children('li').length;
		if (len > 0) {
			$('.site-topbar .cart-mini').css({
				background : '#ff6700',
				color : '#fff'
			});
		} else {
			$('.site-topbar .cart-mini').css({
				background : '#424242',
				color : '#b0b0b0'
			});
		}
	});
})

/**
 * 购物车删除商品
 */
function cart_delete(obj, data) {
	$.ajax({
		type : 'delete',
		dataType : 'json',
		url : baselocation + '/cart/' + data,
		success : function(result) {
			if (result.code == 1) {
				$(obj).parent().parent().parent("li").remove();
				show_cart_umber();
			} else {
				layer.alert(result.message, {
					icon : 2
				});
			}
		}
	})
}

/**
 * 购物车商品数量
 */
function show_cart_umber() {
	$.ajax({
		url : baselocation + "/cart/cartNumber",
		type : 'get',
		dataType : 'json',
		success : function(result) {
			if (result.code == 1) {
				$('.site-topbar .cart-mini').css({
					background : '#ff6700',
					color : '#fff'
				});
				$('.site-topbar .cart-mini').children('span').text("（" + result.data + "）");
			} else {
				$('.site-topbar .cart-mini').css({
					background : '#424242',
					color : '#b0b0b0'
				});
				$('.site-topbar .cart-mini').children('span').text("（0） ");
			}
		}
	});
}