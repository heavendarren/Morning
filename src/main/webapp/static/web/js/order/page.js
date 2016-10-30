/**
 * 分页栏
 */
$(function(){
	$(document).ready(function() {
		var b = $("#pager"),
			e = b.attr("data-currentPage"),
			f = b.attr("data-totalPage");
    	$("#pager").pager({ pagenumber: e, pagecount: f, buttonClickCallback: PageClick });
	});
	PageClick = function(number) {
		var b = $("#pager"),
			c = b.attr("data-type"),
			d = b.attr("data-search");
		var e = "&queryOrder.orderState=" + c + "&queryOrder.orderSearch=" + d + "&pageInfo.currentPage=" + number;
		orderOptions(null,null,e);
	}	
})
