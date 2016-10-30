$(function(){
	topNavigation();  //菜单栏的显示
})

/**
 * 选项控制显示
 * @param {} _in
 */
function showTab(_in){
	$(".c-tab-title > a.clickAvailable").click(function(){
		$(".c-tab-title > a.clickAvailable").removeClass('current');
		$(this).addClass('current');
		var _index = $(this).index()-1;
		$("#p_tCont > div").hide();
		$($("#p_tCont > div")[_index]).show();
	});
	$(".c-tab-title > a.clickAvailable").removeClass('current');
	$($(".c-tab-title > a.clickAvailable")[_in]).addClass('current');
	$("#p_tCont > div").hide();
	$($("#p_tCont > div")[_in]).show();
}

/**
 * 修改用户信息
 * @param userId 用户ID
 */
function updateUserInfo(userId){
	var params='';
	$("#updateForm input,#updateForm select").each(function(){
		params+=$(this).serialize()+"&";
    });
	$.ajax({
		url:baselocation+'/user/updateUser',
		type:'post',
		dataType:'json',
		data:params,
		success:function(result){
			if(result.success==true){
				swal({
					title: "提示信息",
					text: result.message,
					type: "success",   
					confirmButtonText: "确定"},
				function(){
					window.location.reload();
				});
			}else{
				dialog('提示信息',result.message,1);
			}
		}
	});
}

/**
 * 修改密码
 */
function updatePwd(){
	var oldPwd=$("input[name='nowPassword']").val();
	if(oldPwd.trim()==""){
		$("input[name='nowPassword']").next().html('<em class="u-a-cw icon16">&nbsp;</em>请输入原始密码');
		return;
	}else{
		$("input[name='nowPassword']").next().html('<em class="u-a-zq icon16">&nbsp;</em>');
	}
	
	var newPassword=$("input[name='newPassword']").val();
	if(newPassword.trim()==""){
		$("input[name='newPassword']").next().html('<em class="u-a-cw icon16">&nbsp;</em>请输入新密码');
		return;
	}else{
		$("input[name='newPassword']").next().html('<em class="u-a-zq icon16">&nbsp;</em>');
	}
	
	var confirmPwd=$("input[name='confirmPwd']").val();
	if(confirmPwd.trim()==""){
		$("input[name='confirmPwd']").next().html('<em class="u-a-cw icon16">&nbsp;</em>请输入确认密码');
		return;
	}else{
		$("input[name='confirmPwd']").next().html('<em class="u-a-zq icon16">&nbsp;</em>');
	}
	
	var params ='';
	$("#pwdForm input").each(function(){
		params+=$(this).serialize()+"&";
    });
	
	$.ajax({
		url:baselocation+'/user/updatePwd',
		type:'post',
		dataType:'json',
		data:params,
		success:function(result){
			if(result.success==true){
				sweetAlert({
					title: "提示信息",
					text: result.message,
					type: "success", 
					confirmButtonText: "确定"
				});
				$("input:password").val('');
			}else{
				sweetAlert({
					title: "提示信息",
					text: result.message,
					type: "error", 
					confirmButtonText: "确定"
				});
			}
		},
		error:function(error){
			sweetAlert("Oops...", "Something went wrong!", "error");
		}
	});
}

/**
 * 订单中心（json全部订单、待付款、待收货）
 */
var lodingHtml = '<div style="text-align: center" class="tac"><img src="'+baselocation+'/static/web/images/loading.gif"></div>',
	_timer = null;
function orderOptions(type,obj,e) {
	var search = $.trim($("input[name='order.search']").val());
	if(e == null){
		var e = "&queryOrder.orderState=" + type + "&queryOrder.orderSearch=" + search;
	}
	$.ajax({
		url : baselocation + "/user/ajax/myorder",
		data : e,
		type : 'post',
		dataType : 'text',
		beforeSend:function(){
			$("#orderOptions").html(lodingHtml);
			clearTimeout(_timer);
		},
		success : function(result) {
			$(obj).addClass("current").siblings().removeClass("current");
			$("input[name='order.search']").val("");
			_timer = setTimeout(function(){
				$("#orderOptions").html(result);
			}, 300);
		}
	});
}
