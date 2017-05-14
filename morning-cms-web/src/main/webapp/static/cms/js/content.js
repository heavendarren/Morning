var $parentNode = window.parent.document;

function $childNode(name) {
	return window.frames[name]
}

// tooltips
$('.tooltip-demo').tooltip({
	selector : "[data-toggle=tooltip]",
	container : "body"
});

// 使用animation.css修改Bootstrap Modal
$('.modal').appendTo("body");

$("[data-toggle=popover]").popover();

//折叠ibox
$('.collapse-link').click(function() {
	var ibox = $(this).closest('div.ibox');
	var button = $(this).find('i');
	var content = ibox.find('div.ibox-content');
	content.slideToggle(200);
	button.toggleClass('fa-chevron-up').toggleClass('fa-chevron-down');
	ibox.toggleClass('').toggleClass('border-bottom');
	setTimeout(function() {
		ibox.resize();
		ibox.find('[id^=map-]').resize();
	}, 50);
});

//关闭ibox
$('.close-link').click(function() {
	var content = $(this).closest('div.ibox');
	content.remove();
});

//判断当前页面是否在iframe中
if (top == this) {
	var gohome = '<div class="gohome"><a class="animated bounceInUp" href="' + baselocation + '/index" title="返回首页"><i class="fa fa-home"></i></a></div>';
	$('body').append(gohome);
}

//animation.css
function animationHover(element, animation) {
	element = $(element);
	element.hover(
		function() {
			element.addClass('animated ' + animation);
		},
		function() {
			//动画完成之前移除class
			window.setTimeout(function() {
				element.removeClass('animated ' + animation);
			}, 2000);
		});
}

//拖动面板
function WinMove() {
	var element = "[class*=col]";
	var handle = ".ibox-title";
	var connect = "[class*=col]";
	$(element).sortable({
		handle : handle,
		connectWith : connect,
		tolerance : 'pointer',
		forcePlaceholderSize : true,
		opacity : 0.8,
	})
		.disableSelection();
}

// 时间格式化
Date.prototype.Format = function(fmt) {
	var o = {
		"M+" : this.getMonth() + 1, //月份 
		"d+" : this.getDate(), //日 
		"H+" : this.getHours(), //小时 
		"m+" : this.getMinutes(), //分 
		"s+" : this.getSeconds(), //秒 
		"q+" : Math.floor((this.getMonth() + 3) / 3), //季度 
		"S" : this.getMilliseconds() //毫秒 
	};
	if (/(y+)/.test(fmt))
		fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	for (var k in o)
		if (new RegExp("(" + k + ")").test(fmt))
			fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	return fmt;
}

/**
 * 弹出层 
 * title	标题
 * url		请求的url
 * id		需要操作的数据id
 * w		弹出层宽度（缺省调默认值）
 * h		弹出层高度（缺省调默认值）
 */
function layer_show(title, url, w, h) {
	if (title == null || title == '') {
		title = false;
	}
	if (w == null || w == '') {
		w = 800;
	}
	if (h == null || h == '') {
		h = ($(window).height() - 50);
	}
	layer.open({
		type : 2,
		area : [ w + 'px', h + 'px' ],
		shadeClose : true,
		shade : false,
		anim : 1, //0-6的动画形式，-1不开启
		maxmin : true, //开启最大化最小化按钮
		fix : false, //不固定
		scrollbar : false, //屏蔽游览器滚动条
		title : title,
		content : url
	});
}

/**
 * 相册层
 * url		请求的url
 */
function photos_show(url) {
	$.getJSON(url + '?v=' + new Date, function(json) {
		layer.photos({
			photos : json, //格式见API文档手册页
			anim : 5 //0-6的选择，指定弹出图片动画类型，默认随机
		});
	});
}