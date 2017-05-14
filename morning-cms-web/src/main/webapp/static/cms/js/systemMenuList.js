/**
 * 树形表格显示
 */
$(document).ready(function() {
	$("#treeTable").treeTable({
		theme : 'default',
		expandLevel : 2
	}).show();
});

/**
 * 隐藏菜单
 */
function status_stop(obj, value) {
	layer.confirm('确认要隐藏该菜单吗？', {
		btn : [ '确定', '取消' ] //按钮
	}, function() {
		$.ajax({
			dataType : 'json',
			type : 'put',
			url : baselocation + '/system/menu/' + value + '/audit',
			success : function(result) {
				if (result.code == 1) {
					layer.msg('该菜单隐藏成功!', {
						icon : 5,
						time : 1000
					}, function() {
						window.location.reload(); // 刷新页面
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
 * 显示菜单
 */
function status_start(index, value) {
	layer.confirm('确认要显示该菜单吗？', {
		btn : [ '确定', '取消' ] //按钮
	}, function() {
		$.ajax({
			dataType : 'json',
			type : 'put',
			url : baselocation + '/system/menu/' + value + '/audit',
			success : function(result) {
				if (result.code == 1) {
					layer.msg('该菜单显示成功!', {
						icon : 6,
						time : 1000
					}, function() {
						window.location.reload(); // 刷新页面
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
 * 删除菜单
 */
function menu_delete(index, value) {
	layer.confirm('确认要删除该菜单吗？', {
		btn : [ '确定', '取消' ] //按钮
	}, function() {
		$.ajax({
			type : 'delete',
			dataType : 'json',
			url : baselocation + '/system/menu/' + value,
			success : function(result) {
				if (result.code == 1) {
					layer.msg('该菜单删除成功!', {
						icon : 1,
						time : 1000
					}, function() {
						window.location.reload(); // 刷新页面
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