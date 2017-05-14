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
 * 导航栏标题
 */
$(function() {
	var url = window.document.location.pathname;
	var title = $('.page-main').find("a[href$='" + url + "']").text();
	if (title == null || title == "") {
		var title = $('.span16 .uc-content-box .title').find(".text").text();
	}
	$('.breadcrumbs').find('.title').text(title);
});