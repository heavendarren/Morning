$(function() {
	//粒子背景特效
	$('body').particleground({
		dotColor : '#5cbdaa',
		lineColor : '#5cbdaa'
	});
	//网站计时器
	showsectime();
})

/**
 * 网站计时器
 */
function NewDate(str) {
	str = str.split('-');
	var date = new Date();
	date.setUTCFullYear(str[0], str[1] - 1, str[2]);
	date.setUTCHours(0, 0, 0, 0);
	return date;
}
function showsectime() {
	var birthDay = NewDate("2016-04-28");
	var today = new Date();
	var timeold = today.getTime() - birthDay.getTime();

	var sectimeold = timeold / 1000
	var secondsold = Math.floor(sectimeold);
	var msPerDay = 24 * 60 * 60 * 1000;

	var e_daysold = timeold / msPerDay;
	var daysold = Math.floor(e_daysold);
	var e_hrsold = (daysold - e_daysold) * -24;
	var hrsold = Math.floor(e_hrsold);
	var e_minsold = (hrsold - e_hrsold) * -60;
	var minsold = Math.floor((hrsold - e_hrsold) * -60);

	var seconds = Math.floor((minsold - e_minsold) * -60).toString();
	document.getElementById("showsectime").innerHTML = "网站运行：" + daysold + "天" + hrsold + "小时" + minsold + "分" + seconds + "秒";
	setTimeout(showsectime, 1000);
}

/**
 * 验证码更改
 */
$(function() {
	$('#kaptchaImage').click(function() {
		$(this).attr('src', baselocation + '/captcha-image.jpg?' + Math.floor(Math.random() * 100));
	})
});

/**
 * 用户登录
 */
$(function() {
	$('.submit_btn').click(function() {
		var loginName = $("input[name='loginName']").val();
		if (loginName.length <= 0) {
			$("input[name='loginName']").attr("placeholder", "请输入帐号");
			return false;
		}
		var loginPassword = $("input[name='loginPassword']").val();
		if (loginPassword.length <= 0) {
			$("input[name='loginPassword']").attr("placeholder", "请输入密码");
			return false;
		}
		var registerCode = $("input[name='registerCode']").val();
		if (registerCode.length <= 0) {
			$("input[name='registerCode']").attr("placeholder", "输入验证码");
			return false;
		}
		var modulus = $("input[name='loginPassword']").attr("data-modulus"),
			exponent = $("input[name='loginPassword']").attr("data-exponent")
		if (loginPassword.length != 256) {
			var publicKey = RSAUtils.getKeyPair(exponent, '', modulus);
			loginPassword = RSAUtils.encryptedString(publicKey, loginPassword);
		}
		$.ajax({
			url : baselocation + '/login',
			type : 'post',
			dataType : 'json',
			data : {
				"loginName" : loginName,
				"loginPassword" : loginPassword,
				"registerCode" : registerCode
			},
			success : function(result) {
				console.info(result);
				if (result.code == 1) {
					window.location.href = baselocation + '/index';
				} else if (result.code == 10005) {
					$("input[name='registerCode']").val("");
					$("input[name='registerCode']").attr("placeholder", result.message);
					$(".ver_btn").trigger("click");
				} else if (result.code == 10002) {
					$("input[name='loginPassword']").val("");
					$("input[name='loginPassword']").attr("placeholder", result.message);
					$(".ver_btn").trigger("click");
				} else {
					layer.alert(result.message, {
						icon : 2
					});
				}
			}
		});
	})
});

/**
 * 回车登录实现
 */
$(document).keyup(function(event) {
	if (event.keyCode == 13) {
		$(".submit_btn").trigger("click");
	}
});