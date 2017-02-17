/*多选按钮插件*/
$(document).ready(function() {
	$('input').iCheck({
		checkboxClass : 'icheckbox_flat-green',
		radioClass : 'iradio_flat-green'
	});
});

var ztreeObject;
var setting = {
		data: {
			simpleData: {
				enable: true,
				idKey: "menuId",
				pIdKey: "parentId",
				rootPId: 0
			},
			key: {
				name:'menuName',
				title:'menuName'
			}
		},
		check:{
			enable:true,
			nocheckInherit:true
		}
};

/**初始化菜单树*/
function initMenuTree(treedata){
	treedata = eval('('+treedata+')');
	ztreeObject = $.fn.zTree.init($("#ztreedemo"), setting, treedata);
	//展开所有节点
	ztreeObject.expandAll(true);
}

/**角色添加/修改*/
$(function() {
	$("#submit").click(function() {
		var params = '';
		$("#roleform input,#roleform textarea").each(function() {
			params += $(this).serialize() + "&";
		});
		if ($("input[name='roleId']").val()==""){
			url = baselocation + '/administrator/role/create';
		}else{
			url = baselocation + '/administrator/role/edit';
		}
		ztreeObject = $.fn.zTree.getZTreeObj("ztreedemo");
		var nodes = ztreeObject.getCheckedNodes(true);
		var menuIds = '';
		if (nodes != null && nodes.length > 0) {
			for (var i = 0; i < nodes.length; i++) {
				menuIds += nodes[i].menuId + ',';
			}
		}
		params += "menuIds=" + menuIds;
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