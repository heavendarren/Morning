<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>管理员列表</title>
<link rel="stylesheet" href="${ctxsta}/admin/main/css/style.css" />
</head>
<body class="gray-bg">
	<div class="row">
		<div class="col-sm-12">
			<div class="wrapper wrapper-content">
				<div class="row animated fadeInRight">
					<div class="col-sm-12">
						<div class="ibox float-e-margins">
							<div class="text-center float-e-margins p-md">
								<span>预览：</span> <a href="#" class="btn btn-xs btn-primary"
									id="lightVersion">浅色</a> <a href="#"
									class="btn btn-xs btn-primary" id="darkVersion">深色</a> <a
									href="#" class="btn btn-xs btn-primary" id="leftVersion">布局切换</a>
							</div>
							<div id="ibox-content"></div>
							<button class="btn btn-primary btn-block m more-button" onclick="options()">
								<i class="fa fa-arrow-down"></i> 显示更多
							</button>
							<div id="end-content"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<myfooter> <script>
		$(document).ready(function() {
			// Local script for demo purpose only
			$('#lightVersion').click(function(event) {
				event.preventDefault()
				$('#ibox-content').removeClass('ibox-content');
				$('#vertical-timeline').removeClass('dark-timeline');
				$('#vertical-timeline').addClass('light-timeline');
			});

			$('#darkVersion').click(function(event) {
				event.preventDefault()
				$('#ibox-content').addClass('ibox-content');
				$('#vertical-timeline').removeClass('light-timeline');
				$('#vertical-timeline').addClass('dark-timeline');
			});

			$('#leftVersion').click(function(event) {
				event.preventDefault()
				$('#vertical-timeline').toggleClass('center-orientation');
			});

			$('.more-button').click(); //显示更多
		});

		var lodingHtml = '<div class="spiner-example"><div class="sk-spinner sk-spinner-chasing-dots"><div class="sk-dot1"></div><div class="sk-dot2"></div></div></div>', _timer = null;
		var endHtml = '<div class="spiner-example"><div class="sk-spinner sk-spinner-cube-grid"><div class="sk-cube"></div><div class="sk-cube"></div><div class="sk-cube"></div><div class="sk-cube"></div><div class="sk-cube"></div><div class="sk-cube"></div><div class="sk-cube"></div><div class="sk-cube"></div><div class="sk-cube"></div></div></div><h4 class="text-center">没有更多数据了...</h4>'
		function options() {
			var defaultpage = 1;//默认第一页
			var pagesize = 5; //默认显示的记录数
			var nowpage = $('#vertical-timeline').attr("data-nowpage");
			var nextpage =  Number(nowpage) + Number(1);
			var total = $('#vertical-timeline').attr("data-total")
			if (typeof (nowpage) == "undefined") {
				var e = "&nowpage=" + defaultpage + "&pagesize=" + pagesize;
			} else {
				if (nowpage * pagesize >= total) {
					$('.more-button').hide();
					$('#end-content').html(endHtml);
					return false;
				}
				var e = "&nowpage=" + nextpage + "&pagesize=" + pagesize;
			}
			$.ajax({
				url : baselocation + "/system/version/view",
				data : e,
				type : 'post',
				dataType : 'text',
				beforeSend : function() {
					$('#ibox-content').html(lodingHtml);
					clearTimeout(_timer);
				},
				success : function(result) {
					_timer = setTimeout(function() {
						$('#ibox-content').html(result);
					}, 300);
				}
			});
		}
	</script> </myfooter>
</body>
</html>