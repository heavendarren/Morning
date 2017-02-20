/**
 * 购物车
 */
$(function(){
	$("#car-content ul li ins").click(function(){
		$(this).parents('li').remove();
	})
})