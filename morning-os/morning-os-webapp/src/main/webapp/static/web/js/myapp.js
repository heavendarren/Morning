/**
 * 购物车
 */
$(function() {
	$('.topbar-cart').mouseover(function() {

		$('.site-topbar .cart-menu').css('display', 'block');
		$('.site-topbar .cart-mini').css({
			display : 'block',
			background : '#fff',
			color : '#ff6700'
		});
	})
	$('.topbar-cart').mouseout(function() {
		$('.site-topbar .cart-menu').css('display', 'none');
		$('.site-topbar .cart-mini').css({
			background : '#424242',
			color : '#b0b0b0'
		});
	})
});


/**
 * 轮播top菜单导航
 */
$(function() {
	$('.site-category .category-item').mouseover(function() {
		var index = $(this).index();
		i = index;
		$('.children').eq(index).css('display', 'block');
	})
	$('.site-category .category-item').mouseout(function() {
		var i = $(this).index();
		$('.children').eq(i).css('display', 'none');

	})
});


/**
 * 轮播图
 */
$(function() {
	//代码初始化
	var size = $('.ull li').size();
	for (var i = 1; i <= size; i++) {
		var li = "<li></li>";
		$('.oll').append(li);
	}
	;
	//手动控制轮播图
	$('.ull li').eq(0).show();
	$('.oll li').eq(0).addClass('active');
	$('.oll li').mouseover(function() {
		$(this).addClass('active').siblings().removeClass('active');
		var index = $(this).index();
		i = index;
		$('.ull li').eq(index).stop().fadeIn(300).siblings().stop().fadeOut(300);
	})
	//自动播放
	var i = 0;
	var t = setInterval(move, 1500);
	//自动播放核心函数

	function move() {
		i++;
		if (i == size) {
			i = 0;
		}
		$('.oll li').eq(i).addClass('active').siblings().removeClass('active');
		$('.ull li').eq(i).fadeIn(300).siblings().fadeOut(300);
	}

	//向右播放核心函数

	function moveL() {
		i--;
		if (i == -1) {
			i = size - 1;
		}
		$('.oll li').eq(i).addClass('active').siblings().removeClass('active');
		$('.ull li').eq(i).fadeIn(300).siblings().fadeOut(300);
	}
	$('.box .left').click(function() {
		moveL();
	})
	$('.box .right').click(function() {
		move();
	})
	//鼠标移入移除
	$('.box').hover(function() {
		clearInterval(t);
	}, function() {
		t = setInterval(move, 1500);
	})
})


/**
 * 小米明星产品
 */
$(function() {
	//手动滚动
	$('.pagination li').hover(function() {
		clearInterval(timer);
	}, function() {
		timer = setInterval(active, 5000);
	})

	$('.pagination li').click(function() {

		$('.list3').css({
			marginLeft : '-1233px'
		});
		$('.pagination li').eq(1).addClass('active2').siblings().removeClass('active2');

	});
	$('.pagination li').eq(0).click(function() {
		$('.list3').css({
			marginLeft : '0'
		});
		$('.pagination li').eq(0).addClass('active2').siblings().removeClass('active2');
	});
	//自动轮播
	var timer = setInterval(active, 5000);

	function active() {
		$('.list3').css({
			marginLeft : '-1233px'
		});
		$('.pagination li').eq(0).addClass('active2').siblings().removeClass('active2');
		var num = parseInt($('.list3').css('marginLeft'));
		if (num == -1233) {
			$('.list3').css({
				marginLeft : '0'
			});
			$('.pagination li').eq(1).addClass('active2').siblings().removeClass('active2');
		}
	}

	//鼠标事件
	$('.list3').hover(function() {
		clearInterval(timer);
	}, function() {
		timer = setInterval(active, 5000);
	})

});


/**
 * TAB-list
 */
$(function() {
	var number = $(".page-main").attr("data-category-number");
	for (var i = 0; i < number; i++) {
		$('#category-' + i + '-content .brick-list').eq(0).show().siblings().hide();
		$('#category-' + i + ' .tab-list li').eq(0).show();
		$('#category-' + i + ' .tab-list li').eq(0).addClass('tab-active');

		$('#category-' + i + ' .tab-list li').mouseover(function(e) {
			var that = $(this).parents('.home-brick-box').attr('id');
			$(this).addClass('tab-active').siblings().removeClass('tab-active');
			var index = $(this).index();
			$('#' + that + ' .brick-list').eq(index).show().siblings().hide();
		})
	}
})



/**
 * 回到顶部
 */
//当滚动条的位置处于距顶部100像素以下时，跳转链接出现，否则消失  
$(function() {
	$(window).scroll(function() {
		if ($(window).scrollTop() > 100) {
			$("#back-to-top").fadeIn(1500);
		} else {
			$("#back-to-top").fadeOut(1500);
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
 * 图片放大缩小 
 */
$(function() {
	$(".review-item").mouseenter(function() {
		var i = $(this).index();
		$('.review-item .figure-img img').eq(i).stop().animate({
			"top" : "-25px",
			"left" : "-25px",
			"width" : "356px",
			"height" : "280px"
		}, 500);
	}).mouseleave(function() {
		var i = $(this).index();
		$('.review-item .figure-img img').eq(i).stop().animate({
			"top" : "0px",
			"left" : "0px",
			"width" : "296px",
			"height" : "220px"
		}, 500);
	});
})

/**
 * 随机分配产品标签颜色
 */
$(function() {
	var $elements = $('.flag');
	var len = $elements.length;
	// alert('有 ' + len + ' 个相同class');
	$elements.each(function() {
		var $this = $(this);
		var num = (Math.floor(Math.random() * 4) + 1); //输出1-4的随机数搜索
		switch (num) { //然后判断
		case 1:
			$this.addClass("flag-new");
			break;
		case 2:
			$this.addClass("flag-saleoff");
			break;
		case 3:
			$this.addClass("flag-postfree");
			break;
		default:
			$this.addClass("flag-saleoff2");
			break;
		}
	});
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

	$("#J_categoryList").children().hover(function() {
		$(this).children("a").css("color", "#fff");
	}, function() {
		$(this).children("a").css("color", "#424242");
	})
});

/**
 * 分类页面,对类目进行判断,点击打开更多类目
 */
$(function() {
	// 对类目数量进行判断
	var $elements = $('.filter-list');
	var len = $elements.length;
	// alert('有 ' + len + ' 个相同class');
	$elements.each(function() {
		var $this = $(this);
		var length = $this.children().length;
		var num;
		if (length <= 5) {
			num = 1;
		} else if (length <= 11) {
			num = 2;
		} else if (length <= 17) {
			num = 3;
		} else if (length <= 23) {
			num = 4;
		} else if (length <= 29) {
			num = 5;
		}
		switch (num) { //然后判断
		case 1:
			$this.addClass("filter-list-row-1");
			break;
		case 2:
			$this.addClass("filter-list-row-2");
			break;
		case 3:
			$this.addClass("filter-list-row-3");
			break;
		case 4:
			$this.addClass("filter-list-row-4");
			break;
		default:
			$this.addClass("filter-list-row-5");
			break;
		}
	});
})
// 打开更多类目
function showMornCategory(obj) {
	$(obj).parent().toggleClass("filter-list-wrap-toggled");
}


/**
 * 为你推荐
 */
$(function() {
	//手动滚动
	$('.xm-pagers li').hover(function() {
		clearInterval(timer);
	}, function() {
		timer = setInterval(active, 5000);
	})

	$('.xm-pagers li').click(function() {

		$('.list3').css({
			marginLeft : '-1233px'
		});
		$('.xm-pagers li').eq(1).addClass('pager-active').siblings().removeClass('pager-active');

	});
	$('.xm-pagers li').eq(0).click(function() {
		$('.list3').css({
			marginLeft : '0'
		});
		$('.xm-pagers li').eq(0).addClass('pager-active').siblings().removeClass('pager-active');
	});
	//自动轮播
	var timer = setInterval(active, 5000);

	function active() {
		$('.list3').css({
			marginLeft : '-1233px'
		});
		$('.xm-pagers li').eq(0).addClass('pager-active').siblings().removeClass('pager-active');
		var num = parseInt($('.list3').css('marginLeft'));
		if (num == -1233) {
			$('.list3').css({
				marginLeft : '0'
			});
			$('.xm-pagers li').eq(1).addClass('pager-active').siblings().removeClass('pager-active');
		}
	}

	//鼠标事件
	$('.list3').hover(function() {
		clearInterval(timer);
	}, function() {
		timer = setInterval(active, 5000);
	})

});