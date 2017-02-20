$(function(){
	topNavigation();  //菜单栏的显示
})
/**
 * 商品列表动画
 */
$(function(){
	$("#products-list").find("li").hover(function(){
		$(this).addClass("active");
	},function(){
		$(this).removeClass("active");
	})
})

/**
 * 分页栏
 */
$(function(){
	var totalPage=$("input[name='pageInfo.totalPage']").val();
	var currentPage=$("input[name='pageInfo.currentPage']").val();
	$(document).ready(function() {
    	$("#pager").pager({ pagenumber: currentPage, pagecount: totalPage, buttonClickCallback: PageClick });
	});
	PageClick = function(number) {
		$("input[name='pageInfo.currentPage']").val(number);
		$("#searchForm").submit();
	}	
})

