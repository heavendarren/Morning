var $parentNode = window.parent.document;

function $childNode(name) {
    return window.frames[name]
}

// tooltips
$('.tooltip-demo').tooltip({
    selector: "[data-toggle=tooltip]",
    container: "body"
});

// 使用animation.css修改Bootstrap Modal
$('.modal').appendTo("body");

$("[data-toggle=popover]").popover();

//折叠ibox
$('.collapse-link').click(function () {
    var ibox = $(this).closest('div.ibox');
    var button = $(this).find('i');
    var content = ibox.find('div.ibox-content');
    content.slideToggle(200);
    button.toggleClass('fa-chevron-up').toggleClass('fa-chevron-down');
    ibox.toggleClass('').toggleClass('border-bottom');
    setTimeout(function () {
        ibox.resize();
        ibox.find('[id^=map-]').resize();
    }, 50);
});

//关闭ibox
$('.close-link').click(function () {
    var content = $(this).closest('div.ibox');
    content.remove();
});

//判断当前页面是否在iframe中
if (top == this) {
    var gohome = '<div class="gohome"><a class="animated bounceInUp" href="'+baselocation+'/system/main" title="返回首页"><i class="fa fa-home"></i></a></div>';
    $('body').append(gohome);
}

//animation.css
function animationHover(element, animation) {
    element = $(element);
    element.hover(
        function () {
            element.addClass('animated ' + animation);
        },
        function () {
            //动画完成之前移除class
            window.setTimeout(function () {
                element.removeClass('animated ' + animation);
            }, 2000);
        });
}

//拖动面板
function WinMove() {
    var element = "[class*=col]";
    var handle = ".ibox-title";
    var connect = "[class*=col]";
    $(element).sortable({
            handle: handle,
            connectWith: connect,
            tolerance: 'pointer',
            forcePlaceholderSize: true,
            opacity: 0.8,
        })
        .disableSelection();
};

//删除某行
function member_delete(obj,url,message){
	layer.confirm('确认要删除吗？',{btn: ['确定','取消'] //按钮
	}, function(){
		$.ajax({
			type:'delete',
			dataType:'json',
			url:url,
			success:function(result){
				if(result.success==true){
					$(obj).parents("tr").remove();
					layer.msg('已删除!',{icon:1,time:1000});
				}else{
				}
			}
		})
	});
}

//状态冻结
function member_stop(obj,url){
	layer.confirm('确认要冻结吗？',{btn: ['确定','取消'] //按钮
	}, function(){
		$.ajax({
			data:{'status':0},
			dataType:'json',
			type:'post',
			url:url,
			success:function(result){
				if(result.success==true){
					$(obj).parents("tr").find(".td-manage").prepend('<a class="like text-info" href="javascript:void(0)" onClick="member_start(this,&#39;'+url+'&#39;)" title="启用"><i class="glyphicon glyphicon-play"></i></a>');
					$(obj).parents("tr").find(".td-status").html('<span class="label label-danger">冻结</span>');
					$(obj).remove();
					layer.msg('已冻结!',{icon: 5,time:1000});
				}else{
					layer.alert(result.message, {icon: 2});
				}
			}
		})
	});
}

//状态启用
function member_start(obj,url){
	layer.confirm('确认要启用吗？',{btn: ['确定','取消'] //按钮
	}, function(){
		$.ajax({
			data:{'status':1},
			dataType:'json',
			type:'post',
			url:url,
			success:function(result){
				if(result.success==true){
					$(obj).parents("tr").find(".td-manage").prepend('<a class="like text-info" href="javascript:void(0)" onClick="member_stop(this,&#39;'+url+'&#39;)" title="冻结"><i class="glyphicon glyphicon-pause"></i></a>');
					$(obj).parents("tr").find(".td-status").html('<span class="label label-primary">正常</span>');
					$(obj).remove();
					layer.msg('已启用!',{icon: 6,time:1000});
				}else{
					layer.alert(result.message, {icon: 2});
				}
			}
		})
	});
}

//弹出层查看
function member_show(title,url,id,ope,w,h){
	if(id == null){
		layer_show(title,url,w,h);
	}else{
		layer_show(title,url+'/'+id+'/'+ope,w,h);
	}
}
    
/*
	参数解释：
	title	标题
	url		请求的url
	id		需要操作的数据id
	w		弹出层宽度（缺省调默认值）
	h		弹出层高度（缺省调默认值）
*/
function layer_show(title,url,w,h){
	if (title == null || title == '') {
		title=false;
	};
	if (w == null || w == '') {
		w=800;
	};
	if (h == null || h == '') {
		h=($(window).height() - 50);
	};
	layer.open({
		type: 2,
		area: [w+'px', h +'px'],
		fix: false, //不固定
		maxmin: true,
		scrollbar: false,//屏蔽游览器滚动条
		shade:0.4,
		title: title,
		content: url
	});
}
