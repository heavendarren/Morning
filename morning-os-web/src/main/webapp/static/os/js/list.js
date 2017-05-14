$(function() {
	show_new_product(); //新品推荐
});

/**
 * 分页
 */
$(function() {
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
});

/**
 * 新品推荐
 */
function show_new_product() {
	$.ajax({
		url : baselocation + "/recommend/new",
		type : 'get',
		dataType : 'text',
		success : function(result) {
			$("#J_newPrudoct").html(result);
		}
	});
}

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
 * 分类页面,对类目进行判断,点击打开更多类目
 */
$(function() {
	// 对类目数量进行判断
	var $elements = $('.filter-list');
	var len = $elements.length;
	// alert('有 ' + len + ' 个相同class');
	$elements.each(function() {
		var $this = $(this);
		var length = $this.children('dd').length;
		var num;
		if (length <= 6) {
			num = 1;
		} else if (length <= 12) {
			num = 2;
		} else if (length <= 18) {
			num = 3;
		} else if (length <= 24) {
			num = 4;
		} else if (length <= 30) {
			num = 5;
		}
		if (length > 6) {
			$this.siblings().css('display', 'block');
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
function showMornCategory(obj) {
	$(obj).parent().toggleClass("filter-list-wrap-toggled");
}

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
			$this.addClass("flag-gift");
			break;
		}
	});
})