/** 多选按钮插件 */
$(document).ready(function() {
	$('input').iCheck({
		checkboxClass : 'icheckbox_flat-green',
		radioClass : 'iradio_flat-green'
	});
});


/** 组织添加/修改 */
$(function() {
	$("#submit").click(function() {
		var params = '';
		$("#form input,#form textarea").each(function() {
			params += $(this).serialize() + "&";
		});
		if ($("input[name='organizationId']").val()==""){
			url = baselocation + '/administrator/organization/create';
		}else{
			url = baselocation + '/administrator/organization/edit';
		}
		$.ajax({
			data : params,
			type : "post",
			dataType : "json",
			url : url,
			success : function(result) {
				if (result.success == true) {
					parent.layer.msg(result.message, {
						shade : 0.3,
						time : 1500
					}, function() {
						window.parent.location.reload(); // 刷新父页面
					});
				} else {
					layer.msg(result.message, {
						icon : 2,
						time : 1000
					});
				}
			}
		})
	})
})