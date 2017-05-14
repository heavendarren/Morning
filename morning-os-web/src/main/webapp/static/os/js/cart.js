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
	//var selectInputs = document.getElementsByClassName('check-one'); // 所有勾选框
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
		if (seleted == 0) {
			$('#J_noSelectTip').removeClass('hide');
			$('#J_goCheckout').removeClass('btn-primary').addClass('btn-disabled');
		} else {
			$('#J_noSelectTip').addClass('hide');
			$('#J_goCheckout').addClass('btn-primary').removeClass('btn-disabled');
		}
	}

	// 购物车商品是否存在
	function cartEmpty() {
		var len = tr.length;
		if (len < 1) {
			console.info(len);
			$('#J_cartEmpty').removeClass('hide');
			$('#J_cartBox').addClass('hide');

		} else {
			$('#J_cartBox').removeClass('hide');
			$('#J_cartEmpty').addClass('hide');
		}
	}

	// 计算单行价格
	function getSubtotal(tr) {
		var cells = tr.cells;
		var price = cells[2]; //单价
		var subtotal = cells[4]; //小计td
		var countInput = tr.getElementsByTagName('input')[1]; //数目input
		var a = tr.getElementsByTagName('a')[2]; //-号
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
			var productSpecNumber = this.previousSibling.getAttribute('data-sid');

			if (this.previousSibling.getAttribute('data-check-status') == 1 && this.previousSibling.getAttribute('data-initial') == 'false') {
				// 选中状态
				this.previousSibling.setAttribute('data-check-status', 0) ;
				$.ajax({
					type : 'PUT',
					datatype : 'json',
					url : baselocation + '/cart/' + productSpecNumber + '/status',
					data : {
						'checkStatus' : 1
					}
				});
			} else if (this.previousSibling.getAttribute('data-check-status') == 0) {
				// 未选中状态
				this.previousSibling.setAttribute('data-check-status', 1) ;
				$.ajax({
					type : 'PUT',
					datatype : 'json',
					url : baselocation + '/cart/' + productSpecNumber + '/status',
					data : {
						'checkStatus' : 0
					}
				});
			}
			getTotal(); //选完更新总计
		}
	}

	// 点击底部导航栏更新价格
	cartBar.onclick = function() {
		getTotal(); //选完更新总计
		cartEmpty(); // 购物车商品是否存在
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
				var productSpecNumber = this.getAttribute('data-sid');
				var buyNumber = countInout.value;
				getSubtotal(this);
				$.ajax({
					type : 'put',
					datatype : 'json',
					url : baselocation + '/cart/' + productSpecNumber,
					data : {
						'buyNumber' : buyNumber
					}
				});
				break;
			case 'reduce': //点击了减号
				if (value > 1) {
					countInout.value = value - 1;
					var productSpecNumber = this.getAttribute('data-sid');
					var buyNumber = countInout.value;
					getSubtotal(this);
					$.ajax({
						type : 'put',
						datatype : 'json',
						url : baselocation + '/cart/' + productSpecNumber,
						data : {
							'buyNumber' : buyNumber
						}
					});
				}
				break;
			}
			getTotal();
		}
	}

	// 默认全选
	for (var j = 0; j < selectInputs.length; j++) {
		if (selectInputs[j].previousSibling.getAttribute('data-check-status') == 1) {

			selectInputs[j].click();
			selectInputs[j].previousSibling.setAttribute('data-initial', false);
		} else {
			selectInputs[j].previousSibling.setAttribute('data-initial', false);
		}
	}

	// 更新总数
	getTotal();
	// 购物车商品是否存在
	cartEmpty();
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
				if (result.code == 1) {
					$(obj).parent().parent().parent("tr").remove();
					$('#J_cartBar').click();
					show_cart_umber();
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

/**
 * 跳转确认订单页面
 */
function J_goCheckout() {
	if ($('#J_goCheckout').hasClass('btn-primary')) {
		window.location.href = baselocation + '/buy/checkout'
	}
}

/**
 * 导航分类栏显示及颜色变换
 */
$(function() {
	$('#J_navCategory').mouseover(function() {
		$('.site-category').css('display', 'block');
	})
	$('#J_navCategory').mouseout(function() {
		$('.site-category').css('display', 'none');
	})
});

