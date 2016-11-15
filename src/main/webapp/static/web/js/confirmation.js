/**
 * 确认支付
 * @param orderNumber
 * @param obj
 * @param e
 */
function checkoutToPay(orderNumber,obj) {
	$.ajax({
		url : baselocation + "/order/"+orderNumber+"/confirmation",
		data : {"order.payment":$.trim($("input[name='order.payment']").val())},
		type : 'post',
		dataType : 'json',
		success : function(result) {
			if(result.success==true){
				layer.msg('恭喜你,购买成功!', function(){
						window.location.href = baselocation+"/user/myorder/list"; 
					});
			}else{
				layer.alert(result.message, {
					  icon: 2,
				});				
			}
		}
	});
}

/**
 * 取消订单
 * @param orderNumber
 * @param obj
 * @param e
 */
function cancellationToPay(orderNumber,obj) {
	layer.confirm('您确定要取消该订单?',{btn: ['确定','取消'] //按钮
	}, function(){
		$.ajax({
			url : baselocation + "/order/"+orderNumber+"/delete",
			type : 'delete',
			dataType : 'json',
			success : function(result) {
				if(result.success==true){
					layer.msg('恭喜你,取消成功!', function(){
							window.location.href = baselocation+"/index"; 
						});
				}else{
					layer.alert(result.message, {
						  icon: 2,
					});				
				}
			}
		})
	});
}