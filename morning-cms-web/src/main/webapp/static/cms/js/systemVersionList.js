/**
 * 样式转换
 */
$(document).ready(function() {
	// Local script for demo purpose only
	$('#lightVersion').click(function(event) {
		event.preventDefault()
		$('#ibox-content').removeClass('ibox-content');
		$('#vertical-timeline').removeClass('dark-timeline');
		$('#vertical-timeline').addClass('light-timeline');
	});

	$('#darkVersion').click(function(event) {
		event.preventDefault()
		$('#ibox-content').addClass('ibox-content');
		$('#vertical-timeline').removeClass('light-timeline');
		$('#vertical-timeline').addClass('dark-timeline');
	});

	$('#leftVersion').click(function(event) {
		event.preventDefault()
		$('#vertical-timeline').toggleClass('center-orientation');
	});
});

/**
 * 显示更多按钮
 */
function options(obj) {
	var limit = $(obj).attr('data-pager-limit'); // 总页面数
	var current = $(obj).attr('data-pager-current'); // 当前页数
	var nowCurrent = parseInt(current) + parseInt(1);
	window.location.href = baselocation + '/system/version/view?current=' + nowCurrent + '&limit=' + limit;
}


/**
 * 随机分配标签颜色
 */
$(function() {
	var $elements = $('.vertical-timeline-block');
	var len = $elements.length;
	// alert('有 ' + len + ' 个相同class');
	$elements.each(function() {
		var $this = $(this);
		var num = (Math.floor(Math.random() * 5) + 1); //输出1-5的随机数搜索
		switch (num) { //然后判断
		case 1:
			$this.children('.vertical-timeline-icon').addClass("navy-bg");
			$this.children('.vertical-timeline-icon').children('i').addClass("fa-briefcase");
			break;
		case 2:
			$this.children('.vertical-timeline-icon').addClass("blue-bg");
			$this.children('.vertical-timeline-icon').children('i').addClass("fa-file-text");
			break;
		case 3:
			$this.children('.vertical-timeline-icon').addClass("lazur-bg");
			$this.children('.vertical-timeline-icon').children('i').addClass("fa-coffee");
			break;
		case 4:
			$this.children('.vertical-timeline-icon').addClass("yellow-bg");
			$this.children('.vertical-timeline-icon').children('i').addClass("fa-phone");
			break;
		default:
			$this.children('.vertical-timeline-icon').addClass("lazur-bg");
			$this.children('.vertical-timeline-icon').children('i').addClass("fa-user-md");
			break;
		}
	});
})