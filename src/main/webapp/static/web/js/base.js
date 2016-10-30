$(function(){
	showsectime();//网站计时器
	cssLeftNavigation();//设置个人中心左侧导航选中样式
	$("#zySearch").zySearch({});//搜索栏
})

/**
 * 网站计时器
 * @param {} str
 * @return {}
 */
function NewDate(str) { 
	str = str.split('-'); 
	var date = new Date(); 
	date.setUTCFullYear(str[0], str[1] - 1, str[2]); 
	date.setUTCHours(0, 0, 0, 0); 
	return date; 
} 
function showsectime() {
	var birthDay =NewDate("2016-04-28");
	var today=new Date();
	var timeold=today.getTime()-birthDay.getTime();
	
	var sectimeold=timeold/1000
	var secondsold=Math.floor(sectimeold);
	var msPerDay=24*60*60*1000;

	var e_daysold=timeold/msPerDay;
	var daysold=Math.floor(e_daysold);
	var e_hrsold=(daysold-e_daysold)*-24;
	var hrsold=Math.floor(e_hrsold);
	var e_minsold=(hrsold-e_hrsold)*-60;
	var minsold=Math.floor((hrsold-e_hrsold)*-60);

	var seconds=Math.floor((minsold-e_minsold)*-60).toString();
	document.getElementById("showsectime").innerHTML = "网站运行："+daysold+"天"+hrsold+"小时"+minsold+"分"+seconds+"秒";
	setTimeout(showsectime, 1000);
}

/**
 * 设置个人中心左侧导航选中样式 
 */
function cssLeftNavigation(){
	var url=window.document.location.pathname;
	$("a[href$='"+url+"']").parent().addClass("current");
}

/**
 * 顶部导航栏（商品菜单栏）
 */
function topNavigation(){
	$("#content_menu_wrap").children().hover(function(){
		$(this).css("background","#1d7ad9");
		$(this).children(".item").children("a").css("color","#fff");
		$(this).children(".content_menu_content").css("border","1px solid #F0F0F0").show();
	},function(){
		$(this).children(".item").children("a").css("color","#424242");
		$(this).css("background","none");
		$(this).children(".content_menu_content").css("border","0px solid #F0F0F0").hide();
	})
}

/**
 * 购物车
 */
var lodingHtml = '<div style="text-align: center" class="tac"><img src="static/web/images/loading.gif"></div>',
	_timer = null;
$(function(){
	$("#mian-nav-right-car").hover(function(){
		$("#car-content").show();
		//学生动态
		$.ajax({
			url :baselocation +  "/ajax/shoppingCart",
			data : {
			},
			type : 'post',
			dataType : 'text',
			beforeSend:function(){
				$("#car-content").html(lodingHtml);
			},
			success : function(result) {
				$("#car-content").html(result);
			}
		});
	 },function(){
        $("#car-content").hide();
    });
})

/**
 * 导航栏分类显示
 */
$(function(){
	$("#header-content-subpage").hover(function(){
		$(this).children("a").css("color","#1d7ad9");
		$("#content").css({"width":"235px"}).animate({
			height:"460px"
		},400);
		$("#content").css("display", "block");
	},function(){
		$(this).children("a").css("color", "#333");
		$("#content").css({"width":"235px"}).animate({
			height:"0px"
		},400);
		$("#content").css("display", "none");
	})
})

/**
 * 返回顶部栏
 */
$(function(){
	var $bottomTools = $('.bottom_tools');
	var $qrTools = $('.qr_tool');
	var qrImg = $('.qr_img');
	
	$(window).scroll(function () {
		var scrollHeight = $(document).height();
		var scrollTop = $(window).scrollTop();
		var $windowHeight = $(window).innerHeight();
		scrollTop > 50 ? $("#scrollUp").fadeIn(200).css("display","block") : $("#scrollUp").fadeOut(200);			
		$bottomTools.css("bottom", scrollHeight - scrollTop > $windowHeight ? 40 : $windowHeight + scrollTop + 40 - scrollHeight);
	});
	
	$('#scrollUp').click(function (e) {
		e.preventDefault();
		$('html,body').animate({ scrollTop:0});
	});
	
	$qrTools.hover(function () {
		qrImg.fadeIn();
	}, function(){
		 qrImg.fadeOut();
	});
	
});

/**
 * 搜索栏
 */
(function($,undefined){
	$.fn.zySearch = function(options,param){
		var otherArgs = Array.prototype.slice.call(arguments, 1);
		if (typeof options == 'string') {
			var fn = this[0][options];
			if($.isFunction(fn)){
				return fn.apply(this, otherArgs);
			}else{
				throw ("zySearch - No such method: " + options);
			}
		}

		return this.each(function(){
			var para = {};    // 保留参数
			var self = this;  // 保存组件对象
			
			var defaults = {
					"width":"355",
					"height":"33",
					"callback":function(keyword){
						$("input[name='queryGoods.search']").val(keyword);
						$("input[name='queryGoods.condition']").val("goodsViewNum");
						$("input[name='pageInfo.totalPage']").val(0);
						$("input[name='pageInfo.currentPage']").val(1);
						$("input[name='queryGoods.classifyId']").val(null);
						$("#searchForm").submit();
					}
			};
			
			para = $.extend(defaults,options);
			
			this.init = function(){
				this.createHtml();  // 创建组件html
			};
			
			/**
			 * 功能：创建上传所使用的html
			 * 参数: 无
			 * 返回: 无 
			 */
			this.createHtml = function(){
				
				var html = '';
				html += '<b class="search-img"></b>'; 
				html += '<input id="searchInput" class="search-input" type="text" placeholder="憋说话,搜我~">';
				html += '<button class="search-btn btn">搜索</button>';
				
				$(self).append(html);
				
	            // 初始化html之后绑定按钮的点击事件
	            this.addEvent();
			};
			
			
			/**
			 * 功能：绑定事件
			 * 参数: 无
			 * 返回: 无
			 */
			this.addEvent = function(){
				// 判断现在是否在移动设备上或屏幕小的情况下点击
				if($("."+para.parentClass).css("width")!="320px"){  // 不是
					// 解除事件
					$('#searchInput').unbind('focus').unbind('blur');
					// 需要修改图片当前top值
					$(".search-img").css({"top": "0px","height":"0px"});
					$('#searchInput').blur();  // 移除焦点
					$("#searchInput").bind("focus",function(){
						$(".search-img").animate({"top": "-23px","height":"24px"}, "slow");
					});
					$("#searchInput").bind("blur",function(){
						$(".search-img").animate({"top": "0px","height":"0"}, "slow");
					});
				}else{  // 是
					$('#searchInput').unbind('focus').unbind('blur');
					$(".search-img").css({"top":"1px","height":"0px"});
					$('#searchInput').blur();  // 移除焦点
					$("#searchInput").bind("focus",function(){
						$(".search-img").animate({"top": "-40px","height":"24px"}, "slow");
					});
					$("#searchInput").bind("blur",function(){
						$(".search-img").animate({"top": "1px","height":"0px"}, "slow");
					});
				}
				
				// 监听浏览器变化
				$(window).resize(function(){
					if($("."+para.parentClass).css("width")!="320px"){  // 不是
						// 解除事件
						$('#searchInput').unbind('focus').unbind('blur');
						// 需要修改图片当前top值
						$(".search-img").css({"top": "0px","height":"0px"});
						$('#searchInput').blur();  // 移除焦点
						$("#searchInput").bind("focus",function(){
							$(".search-img").animate({"top": "-23px","height":"24px"}, "slow");
						});
						$("#searchInput").bind("blur",function(){
							$(".search-img").animate({"top": "0px","height":"0"}, "slow");
						});
					}else{
						$('#searchInput').unbind('focus').unbind('blur');
						$(".search-img").css({"top":"1px","height":"0px"});
						$('#searchInput').blur();  // 移除焦点
						$("#searchInput").bind("focus",function(){
							$(".search-img").animate({"top": "-40px","height":"24px"}, "slow");
						});
						$("#searchInput").bind("blur",function(){
							$(".search-img").animate({"top": "1px","height":"0px"}, "slow");
						});
					}
				});
				
//				//添加搜索回车事件
//				document.onkeydown=function(event){
//		            var e = event || window.event || arguments.callee.caller.arguments[0];
//		            if(e && e.keyCode==13){ // enter 键
//		            	// 回调方法
//		            	para.callback($("#searchInput").val());
//		            }
//		        }; 
		        
		        $(".search-btn").bind("click",function(){
		        	// 回调方法
	            	para.callback($("#searchInput").val()); 
				});
		        
			};
			
			// 初始化上传控制层插件
			this.init();
		});
	};
})(jQuery);

/**
 * 不同条件查询商品
 * @param type 1类别 2排序条件 
 * @param keyWord type==1(类别) type=2(排序条件)
 */
function submitForm(type,keyWord){
	var myDate = new Date();
	if(type==1){
		$("input[name='queryGoods.classifyId']").val(keyWord);
		$("input[name='queryGoods.condition']").val("goodsViewNum");
		$("input[name='pageInfo.totalPage']").val(0);
		$("input[name='queryGoods.search']").val("");
	}else if(type==2){
		if(keyWord=='goodsViewNum'){
			$("input[name='queryGoods.condition']").val('goodsViewNum');
		}else if(keyWord=='goodsBuyNum'){
			$("input[name='queryGoods.condition']").val('goodsBuyNum');
		}else if(keyWord=='goodsPrice'){
			$("input[name='queryGoods.condition']").val('goodsPrice');
		}else if(keyWord=='goodsDate'){
			$("input[name='queryGoods.condition']").val('goodsDate');
		}else if(keyWord=='goodsReviews'){
			$("input[name='queryGoods.condition']").val('goodsReviews');
		}else if(keyWord=='goodsQuery'){
			$("input[name='queryGoods.condition']").val('goodsQuery');
		}else if(keyWord=='goodsFavorites'){
			$("input[name='queryGoods.condition']").val('goodsFavorites');
		}
		
	}
	$("input[name='pageInfo.currentPage']").val(1);
	$("#searchForm").submit();
}

/**
 * 页面打开时间耗时计时器
 */
window.onload = function() { 
	document.getElementById("TimeShow").innerHTML = "本次耗时："+ (new Date().getTime()-t1)/1000 +" 秒"; 
} 