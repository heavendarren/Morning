 $(function() {
	showUserInfo();
});
 
 /**
 * 验证前台学员是否已经登录 
 * @returns true登录 false未登录
 */
function isLogin(){
	var is = false;
	var user = getLoginUser();
	if(user!=null && user.userId>0){
		is=true;
	}
	return is;
}

/**
 * 获取登录学员
 * @returns User
 */
function getLoginUser(){
	var user = null;
	$.ajax({
		url:baselocation+'/user/getloginUser',
		type:'post',
		async:false,
		dataType:'json',
		success:function(result){
			user = result.entity;
		}
	});
	return user;
}

/**
 * 学员退出登录
 */
function exit(){
	$.ajax({
		url:baselocation+'/user/userExit',
		type:'post',
		dataType:'json',
		async:true,
		success:function(result){
			if(result.success==true){
				window.location.href = baselocation + '/index';
			}
		}
	});
}

/**
 * 展示用户登陆下拉菜单
 */
 function  showUserMenu(){
	$(".mian-nav-right-user").hover(function(){
		$(this).css("background-color","#FFF");
		$(this).children("a").css("color","#1d7ad9");
		$(".user-content").show();
		$(".user-content-ul").children().hover(function(){
			$(this).css("background","#f5f5f5");
			$(this).children("a").css("color","#1d7ad9");
		},function(){
			$(this).css("background","#FFF");
			$(this).children("a").css("color","#424242");
		})
	},function(){
		$(".user-content").hide();
		$(this).children("a").css("color","#b0b0b0");
		$(this).css("background-color","#333");	
	}) 	
}

/**
 * 头部显示用户信息
 */
function showUserInfo() {
	var user = getLoginUser();
	if(user!=null && user.accountId>=0){
		$("#mian-nav-right-login").hide();
		$(".mian-nav-right-user").show();
		$(".mian-nav-right-order").show();
		showUserMenu();
	}else{
		$(".mian-nav-right-user").hide();
		$(".mian-nav-right-order").hide();
	}
}

/**
 * 设置导航选中样式
 */
function cssNavigation() {
	var url = window.document.location.pathname;
	$("a[href$='" + url + "']").parent().addClass("current");
}
