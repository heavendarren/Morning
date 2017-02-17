 // 多选框插件
$(document).ready(function() {
	$('input').iCheck({
		checkboxClass : 'icheckbox_flat-green',
		radioClass : 'iradio_flat-green'
	});
});

//表单验证-添加用户验证
$(function(){
	$('#userform').bootstrapValidator({
        container: 'tooltip',
	    message: 'This value is not valid',
	    feedbackIcons: {
	        valid: 'glyphicon glyphicon-ok',
	        invalid: 'glyphicon glyphicon-remove',
	        validating: 'glyphicon glyphicon-refresh'
	    },
	    fields: {
	    	'user.loginName': {
	            message: '用户名验证失败',
	            validators: {
	                notEmpty: {
	                    message: '用户名不能为空'
	                }
	            }
	        },
	    	'user.loginPassword': {
	            message: '密码验证失败',
	            validators: {
	                notEmpty: {
	                    message: '密码不能为空'
	                }
	            }
	        },
	    	'user.userName': {
	            message: '真实姓名验证失败',
	            validators: {
	                notEmpty: {
	                    message: '真实姓名不能为空'
	                }
	            }
	        },
	        'user.telephone': {
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
	        'user.email': {
	            validators: {
	                notEmpty: {
	                    message: '电子邮箱不能为空'
	                },
	                regexp: {
	                    regexp: /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/,
	                    message: '电子邮箱格式不正确'
	                }
	            }
	        },
	        'user.userIdentity': {
	            validators: {
	                notEmpty: {
	                    message: '身份证不能为空'
	                },
	                regexp: {
	                    regexp: /^((1[1-5])|(2[1-3])|(3[1-7])|(4[1-6])|(5[0-4])|(6[1-5])|71|(8[12])|91)\d{4}(((((19|20)((\d{2}(0[13-9]|1[012])(0[1-9]|[12]\d|30))|(\d{2}(0[13578]|1[02])31)|(\d{2}02(0[1-9]|1\d|2[0-8]))|(([13579][26]|[2468][048]|0[48])0229)))|20000229)\d{3}(\d|X|x))|(((\d{2}(0[13-9]|1[012])(0[1-9]|[12]\d|30))|(\d{2}(0[13578]|1[02])31)|(\d{2}02(0[1-9]|1\d|2[0-8]))|(([13579][26]|[2468][048]|0[48])0229))\d{3}))$/,
	                    message: '身份证格式不正确'
	                }
	            }
	        }
	    }
	})
})


//表单验证-添加管理员验证
$(function(){
	$('#systemuserform').bootstrapValidator({
        container: 'tooltip',
	    message: 'This value is not valid',
	    feedbackIcons: {
	        valid: 'glyphicon glyphicon-ok',
	        invalid: 'glyphicon glyphicon-remove',
	        validating: 'glyphicon glyphicon-refresh'
	    },
	    fields: {
	    	'systemUser.loginName': {
	            message: '用户名验证失败',
	            validators: {
	                notEmpty: {
	                    message: '用户名不能为空'
	                }
	            }
	        },
	    	'systemUser.loginPassword': {
	            message: '密码验证失败',
	            validators: {
	                notEmpty: {
	                    message: '密码不能为空'
	                }
	            }
	        },
	        'systemUser.telephone': {
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
	        'systemUser.email': {
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
/*用户-编辑*/
$(function() {
	$(".usersubmit").click(function() {
		var params = '';
		$("#userform input").each(function() {
			params += $(this).serialize() + "&";
		});
		$.ajax({
			data : params,
			dataType : 'json',
			type : 'post',
			url : baselocation + '/system/user/list/save',
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

/*管理员-编辑*/
$(function() {
	$(".sysusersubmit").click(function() {
		var params = '';
		$("#systemuserform input").each(function() {
			params += $(this).serialize() + "&";
		});
		$.ajax({
			data : params,
			dataType : 'json',
			type : 'post',
			url : baselocation + '/system/sysuser/list/save',
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

/**菜单-编辑*/
$(function() {
	$("#menu-submit").click(function() {
		var params = '';
		$("form input,form textarea").each(function() {
			params += $(this).serialize() + "&";
		});
		$.ajax({
			data : params,
			dataType : 'json',
			type : 'post',
			url : baselocation + '/system/manage/menu/save',
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