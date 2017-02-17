 // 多选框插件
$(document).ready(function() {
	$('input').iCheck({
		checkboxClass : 'icheckbox_flat-green',
		radioClass : 'iradio_flat-green'
	});
});

/**菜单-编辑*/
$(function() {
	$("#menu-submit").click(function() {
		var params = '';
		var url = '';
		$("form input,form textarea").each(function() {
			params += $(this).serialize() + "&";
		});
		if ($("input[name='menuId']").val()==""){
			url = baselocation + '/system/menu/create';
		}else{
			url = baselocation + '/system/menu/edit';
		}
		$.ajax({
			data : params,
			dataType : 'json',
			type : 'post',
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