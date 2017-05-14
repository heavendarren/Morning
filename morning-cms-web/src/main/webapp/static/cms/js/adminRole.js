/**
 * 多选框插件
 */
$(document).ready(function() {
	$('input').iCheck({
		checkboxClass : 'icheckbox_flat-green',
		radioClass : 'iradio_flat-green'
	});
});

/**
 * 系统提示
 */
$(function() {
	$('.system-tip').on("click", function() {
		layer.tips('"是" 只有超级管理员能修改<br>"否" 拥有角色修改权限能修改', '.system-tip');
	})
	$('.status-tip').on("click", function() {
		layer.tips('"开启" 代表此数据可用<br>"冻结" 代表此数据不可用', '.status-tip');
	})
})

/**
 * 初始化菜单树
 */
var ztreeObject;
var setting = {
	data : {
		simpleData : {
			enable : true,
			idKey : "menuId",
			pIdKey : "parentId",
			rootPId : 0
		},
		key : {
			name : 'menuName',
			title : 'menuName'
		}
	},
	check : {
		enable : true,
		nocheckInherit : true
	}
};
$(function() {
	treedata = eval('(' + treedata + ')');
	ztreeObject = $.fn.zTree.init($("#ztree"), setting, treedata);
	//展开所有节点
	ztreeObject.expandAll(true);
})


/**
 * 表单验证
 */
$(function() {
	$('#form').bootstrapValidator({
		container : 'tooltip',
		message : 'This value is not valid',
		feedbackIcons : {
			valid : 'glyphicon glyphicon-ok',
			invalid : 'glyphicon glyphicon-remove',
			validating : 'glyphicon glyphicon-refresh'
		},
		fields : {
			'roleName' : {
				message : '角色名称验证失败',
				validators : {
					notEmpty : {
						message : '角色名称不能为空'
					}
				}
			},
			'roleSign' : {
				message : '角色标志验证失败',
				validators : {
					notEmpty : {
						message : '角色标志不能为空'
					}
				}
			},
		}
	})
		.on('success.form.bv', function(e) {
			// Prevent form submission
			e.preventDefault();

			// Get the form instance
			var $form = $(e.target);

			// Get the BootstrapValidator instance
			var bv = $form.data('bootstrapValidator');
			
			ztreeObject = $.fn.zTree.getZTreeObj("ztree");
			var nodes = ztreeObject.getCheckedNodes(true);
			var menuIds = '';
			if (nodes != null && nodes.length > 0) {
				for (var i = 0; i < nodes.length; i++) {
					menuIds += nodes[i].menuId + ',';
				}
			}
			
			var params = '';
			params += $form.serialize();
			params += "&menuIds=" + menuIds;
			var method = $('#form').attr('data-method');
			// Use Ajax to submit form data
			if (method == 'put') {
				$.ajax({
					data : params,
					dataType : 'json',
					type : 'put',
					url : $form.attr('action'),
					success : function(result) {
						if (result.code == 1) {
							parent.layer.msg("更新角色成功!", {
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
			} else if (method == 'post') {
				$.ajax({
					data : params,
					dataType : 'json',
					type : 'post',
					url : $form.attr('action'),
					success : function(result) {
						if (result.code == 1) {
							parent.layer.msg("创建角色成功!", {
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
			}
		});
})