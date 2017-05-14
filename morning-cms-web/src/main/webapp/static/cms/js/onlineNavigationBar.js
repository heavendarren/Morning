/**
 * 进行格式转换
 */
function statusFormatter(value) {
	if (value == 1) {
		return '<span class="label label-primary">显示</span>'
	} else if (value == 0) {
		return '<span class="label label-danger">隐藏</span>'
	}
}
function actionFormatter(value, row, index) {
	if (row.status == 1) {
		return [
			'<a class="freeze m-r-sm text-info" href="javascript:void(0)" title="隐藏">',
			'<i class="glyphicon glyphicon-pause"></i>',
			'</a>',
			'<a class="edit m-r-sm text-warning" href="javascript:void(0)" title="编辑">',
			'<i class="glyphicon glyphicon-edit"></i>',
			'</a>',
			'<a class="remove m-r-sm text-danger" href="javascript:void(0)" title="删除">',
			'<i class="glyphicon glyphicon-remove"></i>',
			'</a>',
		].join('');
	} else {
		return [
			'<a class="normal m-r-sm text-info" href="javascript:void(0)" title="显示">',
			'<i class="glyphicon glyphicon-play"></i>',
			'</a>',
			'<a class="edit m-r-sm text-warning" href="javascript:void(0)" title="编辑">',
			'<i class="glyphicon glyphicon-edit"></i>',
			'</a>',
			'<a class="remove m-r-sm text-danger" href="javascript:void(0)" title="删除">',
			'<i class="glyphicon glyphicon-remove"></i>',
			'</a>',
		].join('');
	}
}

window.actionEvents = {
	'click .freeze' : function(e, value, row, index) {
		var url = $('#table').attr('data-url');
		status_stop(index, row.navigationBarId, url);
	},
	'click .normal' : function(e, value, row, index) {
		var url = $('#table').attr('data-url');
		status_start(index, row.navigationBarId, url);
	},
	'click .edit' : function(e, value, row, index) {
		var url = $('#table').attr('data-url');
		layer_show(row.name, url + row.navigationBarId + '/edit', 900, 650)
	},
	'click .remove' : function(e, value, row, index) {
		var url = $('#table').attr('data-url');
		admin_delete(index, row.navigationBarId, url);
	},
};

/**
 * 隐藏导航栏
 */
function status_stop(index, value, url) {
	layer.confirm('确认要隐藏该导航栏吗？', {
		btn : [ '确定', '取消' ] //按钮
	}, function() {
		$.ajax({
			dataType : 'json',
			type : 'put',
			url : url + value + '/audit',
			success : function(result) {
				if (result.code == 1) {
					$('#table').bootstrapTable('updateRow', {
						index : index,
						row : {
							status : 0,
						}
					});
					layer.msg('该导航隐藏栏成功!', {
						icon : 5,
						time : 1000
					});
				} else {
					layer.alert(result.message, {
						icon : 2
					});
				}
			}
		})
	});
}

/**
 * 显示导航栏
 */
function status_start(index, value, url) {
	layer.confirm('确认要显示该导航栏吗？', {
		btn : [ '确定', '取消' ] //按钮
	}, function() {
		$.ajax({
			dataType : 'json',
			type : 'put',
			url : url + value + '/audit',
			success : function(result) {
				if (result.code == 1) {
					$('#table').bootstrapTable('updateRow', {
						index : index,
						row : {
							status : 1,
						}
					});
					layer.msg('该导航显示栏成功!', {
						icon : 6,
						time : 1000
					});
				} else {
					layer.alert(result.message, {
						icon : 2
					});
				}
			}
		})
	});
}

/**
 * 删除导航
 */
function admin_delete(index, value, url) {
	layer.confirm('确认要删除该导航栏吗？', {
		btn : [ '确定', '取消' ] //按钮
	}, function() {
		$.ajax({
			type : 'delete',
			dataType : 'json',
			url : url + value,
			success : function(result) {
				if (result.code == 1) {
					$('#table').bootstrapTable('hideRow', {
						index : index
					});
					layer.msg('该导航栏删除成功!', {
						icon : 1,
						time : 1000
					});
				} else {
					layer.alert(result.message, {
						icon : 2
					});
				}
			}
		})
	});
}

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
	$('.status-tip').on("click", function() {
		layer.tips('"显示" 代表此数据可用<br>"隐藏" 代表此数据不可用', '.status-tip');
	})
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
			'name' : {
				message : '导航栏名称验证失败',
				validators : {
					notEmpty : {
						message : '导航名称栏不能为空'
					}
				}
			},
			'href' : {
				message : '链接地址验证失败',
				validators : {
					notEmpty : {
						message : '链接地址不能为空'
					}
				}
			},	
			'sort' : {
				message : '排序验证失败',
				validators : {
					notEmpty : {
						message : '排序不能为空'
					},
		            regexp: {
		                regexp: /^[0-9]*$/,
		                message: '排序只能为数字'
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
			
			var method = $('#form').attr('data-method');
			// Use Ajax to submit form data
			if (method == 'put') {
				$.ajax({
					data : $form.serialize(),
					dataType : 'json',
					type : 'put',
					url : $form.attr('action'),
					success : function(result) {
						if (result.code == 1) {
							parent.layer.msg("更新导航栏成功!", {
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
					data : $form.serialize(),
					dataType : 'json',
					type : 'post',
					url : $form.attr('action'),
					success : function(result) {
						if (result.code == 1) {
							parent.layer.msg("创建导航栏成功!", {
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