/** 多选按钮插件 */
$(document).ready(function() {
	$('input').iCheck({
		checkboxClass : 'icheckbox_flat-orange',
		radioClass : 'iradio_flat-orange'
	});
});

/**
 * Created by an www.jq22.com
 */
window.onload = function() {
	if (!document.getElementsByClassName) {
		document.getElementsByClassName = function(cls) {
			var ret = [];
			var els = document.getElementsByTagName('*');
			for (var i = 0, len = els.length; i < len; i++) {

				if (els[i].className.indexOf(cls + ' ') >= 0 || els[i].className.indexOf(' ' + cls + ' ') >= 0 || els[i].className.indexOf(' ' + cls) >= 0) {
					ret.push(els[i]);
				}
			}
			return ret;
		}
	}

	var table = document.getElementById('cartTable'); // 购物车表格
	var selectInputs = document.getElementsByClassName('iCheck-helper'); // 所有勾选框
	var tr = table.children[1].rows; //行
	var numberTotal = document.getElementById('J_cartTotalNum'); //总共商品数目容器
	var selectedTotal = document.getElementById('J_selTotalNum'); //已选商品数目容器
	var priceTotal = document.getElementById('J_cartTotalPrice'); //总计
	var cartBar = document.getElementById('J_cartBar'); //购物车底部导航栏


	// 更新总数和总价格
	function getTotal() {
		var seleted = 0;
		var number = 0;
		var price = 0;
		for (var i = 0, len = tr.length; i < len; i++) {
			if (tr[i].getElementsByTagName('input')[0].checked) {
				tr[i].className = 'on';
				seleted += parseInt(tr[i].getElementsByTagName('input')[1].value);
				price += parseFloat(tr[i].cells[4].innerHTML);
			} else {
				tr[i].className = '';
			}
			number += parseInt(tr[i].getElementsByTagName('input')[1].value);
		}
		selectedTotal.innerHTML = seleted;
		priceTotal.innerHTML = price.toFixed(2);
		numberTotal.innerHTML = number;
	}
	// 计算单行价格
	function getSubtotal(tr) {
		var cells = tr.cells;
		var price = cells[2]; //单价
		var subtotal = cells[4]; //小计td
		var countInput = tr.getElementsByTagName('input')[1]; //数目input
		var a = tr.getElementsByTagName('a')[0]; //-号
		//写入HTML
		subtotal.innerHTML = (parseInt(countInput.value) * parseFloat(price.innerHTML)).toFixed(2);
		//如果数目只有一个，把-号去掉
		if (countInput.value == 1) {
			a.innerHTML = '';
		} else {
			a.innerHTML = '-';
		}
	}

	// 点击选择框
	for (var i = 0; i < selectInputs.length; i++) {
		selectInputs[i].onclick = function() {
			if (this.previousSibling.className.indexOf('check-all') >= 0) { //如果是全选，则吧所有的选择框选中
				for (var j = 0; j < selectInputs.length; j++) {
					selectInputs[j].click();
				}
			}
			getTotal(); //选完更新总计
		}
	}

	// 点击底部导航栏更新价格
	cartBar.onclick = function() {
		getTotal(); //选完更新总计
	}

	//为每行元素添加事件
	for (var i = 0; i < tr.length; i++) {
		//将点击事件绑定到tr元素
		tr[i].onclick = function(e) {
			var e = e || window.event;
			var el = e.target || e.srcElement; //通过事件对象的target属性获取触发元素
			var cls = el.className; //触发元素的class
			var countInout = this.getElementsByTagName('input')[1]; // 数目input
			var value = parseInt(countInout.value); //数目
			//通过判断触发元素的class确定用户点击了哪个元素
			switch (cls) {
			case 'add': //点击了加号
				countInout.value = value + 1;
				getSubtotal(this);
				break;
			case 'reduce': //点击了减号
				if (value > 1) {
					countInout.value = value - 1;
					getSubtotal(this);
				}
				break;
			}
			getTotal();
		}
		// 给数目输入框绑定keyup事件
		tr[i].getElementsByTagName('input')[1].onkeyup = function() {
			var val = parseInt(this.value);
			if (isNaN(val) || val <= 0) {
				val = 1;
			}
			if (this.value != val) {
				this.value = val;
			}
			getSubtotal(this.parentNode.parentNode); //更新小计
			getTotal(); //更新总数
		}
	}
	// 默认全选
	for (var j = 0; j < selectInputs.length; j++) {
		selectInputs[j].click();
	}
}

/**
 * 购物车商品删除
 */
function cart_list_delete(obj, data) {
	layer.confirm('确认要删除吗？', {
		btn : [ '确定', '取消' ] //按钮
	}, function() {
		$.ajax({
			type : 'delete',
			dataType : 'json',
			url : baselocation + '/cart/' + data,
			success : function(result) {
				if (result.success == true) {
					$(obj).parent().parent().parent("tr").remove();
					$('#J_cartBar').click();
					layer.msg('已删除!', {
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