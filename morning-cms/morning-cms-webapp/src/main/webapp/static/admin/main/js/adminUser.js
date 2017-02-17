// 多选框插件
$(document).ready(function() {
	$('input').iCheck({
		checkboxClass : 'icheckbox_flat-green',
		radioClass : 'iradio_flat-green'
	});
});
//表单验证-添加管理员验证
$(function(){
	$('#form').bootstrapValidator({
        container: 'tooltip',
	    message: 'This value is not valid',
	    feedbackIcons: {
	        valid: 'glyphicon glyphicon-ok',
	        invalid: 'glyphicon glyphicon-remove',
	        validating: 'glyphicon glyphicon-refresh'
	    },
	    fields: {
	    	'loginName': {
	            message: '用户名验证失败',
	            validators: {
	                notEmpty: {
	                    message: '用户名不能为空'
	                }
	            }
	        },
	    	'loginPassword': {
	            message: '密码验证失败',
	            validators: {
	                notEmpty: {
	                    message: '密码不能为空'
	                }
	            }
	        },
	    	'userName': {
	            message: '真实姓名验证失败',
	            validators: {
	                notEmpty: {
	                    message: '真实姓名不能为空'
	                }
	            }
	        },	        
	        'telephone': {
	            validators: {
	                notEmpty: {
	                    message: '移动电话不能为空'
	                },
	                regexp: {
	                    regexp: /^1[3|4|5|7|8]\d{9}$/,
	                    message: '手机号码格式不正确'
	                }
	            }
	        },
	        'email': {
	            validators: {
	                notEmpty: {
	                    message: '电子邮箱不能为空'
	                },
	                regexp: {
	                    regexp: /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/,
	                    message: '电子邮箱格式不正确'
	                }
	            }
	        }
	    }
	})
})

var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
/**管理员-编辑*/
$(function() {
	$("#submit").click(function() {
		var params = '';
		$("#form input,#form select").each(function() {
			params += $(this).serialize() + "&";
		});
		if ($("input[name='userId']").val()==""){
			var url = baselocation + '/administrator/list/create';
		}else{
			var url = baselocation + '/administrator/list/edit';
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