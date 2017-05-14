/**
 * 进行格式转换
 */
function timeFormatter(value) {
	return new Date(value).Format("yyyy-MM-dd HH:mm:ss");
}
function statusFormatter(value) {
	if (value == 1) {
		return '<span class="label label-primary">正常</span>'
	} else if (value == 0) {
		return '<span class="label label-danger">冻结</span>'
	}
}
function systemFormatter(value) {
	if (value == 1) {
		return '<span class="label label-danger">是</span>'
	} else if (value == 0) {
		return '<span class="label label-primary">否</span>'
	}
}

function actionFormatter(value, row, index) {
	if (row.status == 1) {
		return [
			'<a class="freeze m-r-sm text-info" href="javascript:void(0)" title="冻结">',
			'<i class="glyphicon glyphicon-pause"></i>',
			'</a>',
			'<a class="edit m-r-sm text-warning" href="javascript:void(0)" title="编辑">',
			'<i class="glyphicon glyphicon-edit"></i>',
			'</a>',
			'<a class="remove m-r-sm text-danger" href="javascript:void(0)" title="删除">',
			'<i class="glyphicon glyphicon-remove"></i>',
			'</a>',
			'<a class="log m-r-sm text-primary" href="javascript:void(0)" title="日志">',
			'<i class="glyphicon glyphicon-list-alt"></i>',
			'</a>',
		].join('');
	} else {
		return [
			'<a class="normal m-r-sm text-info" href="javascript:void(0)" title="启用">',
			'<i class="glyphicon glyphicon-play"></i>',
			'</a>',
			'<a class="edit m-r-sm text-warning" href="javascript:void(0)" title="编辑">',
			'<i class="glyphicon glyphicon-edit"></i>',
			'</a>',
			'<a class="remove m-r-sm text-danger" href="javascript:void(0)" title="删除">',
			'<i class="glyphicon glyphicon-remove"></i>',
			'</a>',
			'<a class="log m-r-sm text-primary" href="javascript:void(0)" title="日志">',
			'<i class="glyphicon glyphicon-list-alt"></i>',
			'</a>',
		].join('');
	}
}

window.actionEvents = {
	'click .freeze' : function(e, value, row, index) {
		status_stop(index, row.organizationId);
	},
	'click .normal' : function(e, value, row, index) {
		status_start(index, row.organizationId);
	},
	'click .edit' : function(e, value, row, index) {
		layer_show(row.organizationName, baselocation + '/administrator/organization/' + row.organizationId + '/edit', 900, 600)
	},
	'click .remove' : function(e, value, row, index) {
		admin_delete(index, row.organizationId);
	},
	'click .log' : function(e, value, row, index) {
		layer_show(row.organizationName, baselocation + '/administrator/organization/' + row.organizationId + '/list', 1000, 650)
	}
};

/**
 * 冻结组织
 */
function status_stop(index, value) {
	layer.confirm('确认要冻结该组织吗？', {
		btn : [ '确定', '取消' ] //按钮
	}, function() {
		$.ajax({
			dataType : 'json',
			type : 'put',
			url : baselocation + '/administrator/organization/' + value + '/audit',
			success : function(result) {
				if (result.code == 1) {
					$('#table').bootstrapTable('updateRow', {
						index : index,
						row : {
							status : 0,
						}
					});
					layer.msg('该组织冻结成功!', {
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
 * 启用组织
 */
function status_start(index, value) {
	layer.confirm('确认要启用该组织吗？', {
		btn : [ '确定', '取消' ] //按钮
	}, function() {
		$.ajax({
			dataType : 'json',
			type : 'put',
			url : baselocation + '/administrator/organization/' + value + '/audit',
			success : function(result) {
				if (result.code == 1) {
					$('#table').bootstrapTable('updateRow', {
						index : index,
						row : {
							status : 1,
						}
					});
					layer.msg('该组织启用成功!', {
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
 * 删除组织
 */
function admin_delete(index, value) {
	layer.confirm('确认要删除该组织吗？', {
		btn : [ '确定', '取消' ] //按钮
	}, function() {
		$.ajax({
			type : 'delete',
			dataType : 'json',
			url : baselocation + '/administrator/organization/' + value,
			success : function(result) {
				if (result.code == 1) {
					$('#table').bootstrapTable('hideRow', {
						index : index
					});
					layer.msg('该组织删除成功!', {
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