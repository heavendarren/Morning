
/*菜单栏的显示开始*/
$(function(){
	$("#content_menu_wrap").children().hover(function(){
		$(this).css("background","#1d7ad9");
		$(this).children(".content_menu_content").css("border","1px solid #F0F0F0").show();
	},function(){
		$(this).css("background","none");
		$(this).children(".content_menu_content").css("border","0px solid #F0F0F0").hide();
	})
})
/*菜单栏的显示结束*/

/*轮播图按钮开始*/
$(function(){
	$('#demo01').flexslider({
		animation: "slide",
		direction:"horizontal",
		easing:"swing"
	});
	
	$('#demo02').flexslider({
		animation: "slide",
		direction:"vertical",
		easing:"swing"
	});
});
/*轮播图按钮结束*/

/*明星产品border-top color设置开始*/
$(function(){
    $("#star-goods-content-goods").children().children().eq(0).css("border-color","#ff7600");
    $("#star-goods-content-goods").children().children().eq(1).css("border-color","red");
    $("#star-goods-content-goods").children().children().eq(2).css("border-color","#adff2f");
    $("#star-goods-content-goods").children().children().eq(3).css("border-color","#6495ed");
    $("#star-goods-content-goods").children().children().eq(4).css("border-color","#6a5acd");
    $("#star-goods-content-goods").children().children().eq(5).css("border-color","#ff7600");
    $("#star-goods-content-goods").children().children().eq(6).css("border-color","red");
    $("#star-goods-content-goods").children().children().eq(7).css("border-color","#adff2f");
    $("#star-goods-content-goods").children().children().eq(8).css("border-color","#6495ed");
    $("#star-goods-content-goods").children().children().eq(9).css("border-color","#6a5acd");
})
/*明星产品border-top color设置结束*/

/*主要展示栏（一）按钮开始*/
$(function(){
	$("#star-goods-content-next").click(function(){
		 $("#star-goods-content-goods").children("ul").animate({
			 left:"-1226px"
		 },300)
	})
	$("#star-goods-content-prave").click(function(){
		$("#star-goods-content-goods").children("ul").animate({
			left:"0"
		},300)
	})
	$("#star-goods-content-next").hover(function(){
		$(this).css("color","#1d7ad9");
	},function(){
		$(this).css("color","#BEBEBE");
	})
	$("#star-goods-content-prave").hover(function(){
		$(this).css("color","#1d7ad9");
	},function(){
		$(this).css("color","#BEBEBE");
	})
})
/*主要展示栏（一）按钮结束*/

/*主要展示栏（二）动画效果开始*/
$(function(){
	$(".floor_goods_wrap_li").hover(function () {
		   $(this).css({"top":"-5px",
			   "box-shadow":"0px 15px 30px rgba(0,0,0,0.2)"
		   });
	},function(){
		$(this).css({"top":"0px",
			"box-shadow":"none"
		});
	})
})
/*主要展示栏（二）动画效果结束*/




