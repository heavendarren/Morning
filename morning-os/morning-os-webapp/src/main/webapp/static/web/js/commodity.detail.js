$(function(){
	topNavigation();  //菜单栏的显示
})

/**
 * 图片介绍动画切换效果
 */
$(function(){
	$(".clearfix").on('click', 'li' , function(){
		$(".clearfix li").css("border","1px #666666 solid");
		$(this).css("border-color","#1d7ad9");
		var largePath =  $(this).children("a").children("img").attr("src");
		$("#largeImg").attr({
			src:largePath
		})
	});
	$(".clearfix li:first").click();//第一张图片
})

/*商品选择样式默认选择开始*/
$(function(){
    $("#style-simg-color li:first").addClass("active");
    $("#style-simg-size li:first").addClass("active");
    $("#style-simg-color input:first").prop("checked",true);
    $("#style-simg-size input:first").prop("checked",true);
});
/*商品选择样式默认选择结束*/

/*商品选择样式选择动画开始*/	
$(function(){
	$("#style-simg-color").on('click', 'li' , function(){
	   $("#style-simg-color li").removeClass("active");
	   $(this).addClass("active");
	});
})
$(function(){
	$("#style-simg-size").on('click', 'li' , function(){
	   $("#style-simg-size li").removeClass("active");
	   $(this).addClass("active");
	});
})
/*商品选择样式选择动画开始*/	

/*商品数量*/
$(function(){
	//加
	$('.add_btn').click(function(){
			var save=Number($('.input-count').attr("data-save"));
			var onum=Number($('.input-count').val())+1;
			if(onum<=save){
				$('.input-count').attr('value',onum);
			}
	})
	//减
	$('.min_btn').click(function(){
			var onum=Number($('.input-count').val())-1;
			if(onum>=1){
				$('.input-count').attr('value',onum);
			}
	});
})

/**
 * 售后服务
 * @param {} thisObj
 * @param {} Num
 */
function nTabs(thisObj,Num){
	if(thisObj.className == "active")return;
	var tabObj = thisObj.parentNode.id;
	var tabList = document.getElementById(tabObj).getElementsByTagName("li");
	for(i=0; i <tabList.length; i++)
	{
	  if (i == Num)
	  {
	   thisObj.className = "active"; 
		  document.getElementById(tabObj+"_Content"+i).style.display = "block";
	  }else{
	   tabList[i].className = "normal"; 
	   document.getElementById(tabObj+"_Content"+i).style.display = "none";
	  }
	} 
}

/**
 * 控制导航悬浮
 */
$(function(){
	$(window).scroll(function(){
			var $this = $(this);
			var targetTop = $(this).scrollTop();
			var height = $(window).height();

			if(targetTop>850){
				$(".pro-detailed-left-title").addClass("detailed-title-top");
			}
			else{
				$(".pro-detailed-left-title").removeClass("detailed-title-top");
			}
	
			if(targetTop > $("#goodsDesc").offset().top-100 && targetTop < $("#goodsParam").offset().top-100){
				$(".pro-detailed-left-title").find("li").removeClass("active");
				$(".pro-detailed-left-title").find("li").eq(0).addClass("active");
			}else if(targetTop > $("#goodsParam").offset().top-100 && targetTop < $("#goodsComment").offset().top-100){
				$(".pro-detailed-left-title").find("li").removeClass("active");
				$(".pro-detailed-left-title").find("li").eq(1).addClass("active");
			}else if(targetTop > $("#goodsComment").offset().top-100 && targetTop < $("#goodsFaq").offset().top-100){
				$(".pro-detailed-left-title").find("li").removeClass("active");
				$(".pro-detailed-left-title").find("li").eq(2).addClass("active");
			}else if(targetTop > $("#goodsFaq").offset().top-100 && targetTop < $("#serQue").offset().top-100){
				$(".pro-detailed-left-title").find("li").removeClass("active");
				$(".pro-detailed-left-title").find("li").eq(3).addClass("active");
			}else if(targetTop > $("#serQue").offset().top-100){
				$(".pro-detailed-left-title").find("li").removeClass("active");
				$(".pro-detailed-left-title").find("li").eq(4).addClass("active");
			}
		});
})