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

/**
 * 确认收货
 * @param orderNumber
 * @param obj
 * @param e
 */
function checkoutToReceiving(orderNumber,obj) {
	layer.prompt({
		  title: '输入支付密码，并确认',
		  formType: 1 //prompt风格，支持0-2
		}, function(pass){
			$.ajax({
				url : baselocation + "/order/"+orderNumber+"/receiving",
				data : {"loginPassword":pass},
				type : 'post',
				dataType : 'json',
				success : function(result) {
					if(result.success==true){
						layer.alert("确认收货成功!", {
							  icon: 1,
						}, function(){
								window.location.href = baselocation+"/user/myorder/list"; 
						});
					}else{
						layer.alert(result.message, {
							  icon: 2,
						});				
					}
				}
			});
	});
}
