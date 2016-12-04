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
		$("#systemRoleform input,#systemRoleform textarea").each(function() {
			params += $(this).serialize() + "&";
		});
		ztreeObject = $.fn.zTree.getZTreeObj("ztreedemo");
		var nodes = ztreeObject.getCheckedNodes(true);
		var menuIds = '';
		if (nodes != null && nodes.length > 0) {
			for (var i = 0; i < nodes.length; i++) {
				if (nodes[i].isParent != true) {
					menuIds += nodes[i].menuId + ',';
				}
			}
		}
		params += "menuIds=" + menuIds;
		$.ajax({
			data : params,
			type : "post",
			dataType : "json",
			url : baselocation + '/system/sysuser/role/save',
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