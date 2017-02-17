<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <title>首页</title>
    <link rel="stylesheet" href="${ctxsta}/admin/main/css/style.css" />
  </head>
  
<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="row">
        	<div class="col-sm-3">
            	<div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>游览量</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            <a class="close-link"><i class="fa fa-times"></i></a>
                        </div>
                    </div>
                    <div class="ibox-content">
                    	<h1 class="no-margins">600<span class="label label-danger pull-right">今天</span></h1>
                        <h1 class="no-margins">1,800<span class="label label-danger pull-right">昨天</span></h1>
                        <div class="stat-percent font-bold text-danger">66.7%&nbsp;<i class="fa fa-level-down"></i>
                        </div>
                        <small>同比</small>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                    	<h5>访客数</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            <a class="close-link"><i class="fa fa-times"></i></a>
                        </div>
                    </div>
                    <div class="ibox-content">
                    	<h1 class="no-margins">1,600<span class="label label-warning pull-right">今天</span></h1>
                        <h1 class="no-margins">1,800<span class="label label-warning pull-right">昨天</span></h1>
                        <div class="stat-percent font-bold text-warning">11.1%&nbsp;<i class="fa fa-level-down"></i>
                        </div>
                        <small>同比</small>
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
            	<div class="ibox float-e-margins">
                    <div class="ibox-title">
                    	<h5>订单</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            <a class="close-link"><i class="fa fa-times"></i></a>
                        </div>
                    </div>
                    <div class="ibox-content">
                    	<h1 class="no-margins">${webCountMap.payOrder}<span class="label label-success pull-right">已支付</span></h1>
                        <h1 class="no-margins">${webCountMap.unpayOrder}<span class="label label-success pull-right">未支付</span></h1>
                        <div class="stat-percent font-bold text-success">${webCountMap.orderPercent}&nbsp;<i class="fa fa-bolt"></i>
                        </div>
                        <small>转化率</small>
                    </div>
                </div>   
            </div>
            <div class="col-sm-3">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                    	<h5>支付金额</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            <a class="close-link"><i class="fa fa-times"></i></a>
                        </div>
                    </div>
                    <div class="ibox-content">
                    	<h1 class="no-margins">¥ ${webCountMap.payMoney}<span class="label label-info pull-right">今天</span></h1>
                        <h1 class="no-margins">¥ ${webCountMap.ytdPayMoney}<span class="label label-info pull-right">昨天</span></h1>
                        <c:choose>
                            <c:when test="${fn:contains(webCountMap.payPercent, '-')}">
	                            <div class="stat-percent font-bold text-info">${fn:replace(webCountMap.payPercent, '-', '')}&nbsp;<i class="fa fa-level-down"></i>
	                        	</div>
                            </c:when>
                            <c:otherwise>
                               	<div class="stat-percent font-bold text-info">${webCountMap.payPercent}&nbsp;<i class="fa fa-level-up"></i>
	                        	</div>
                            </c:otherwise>
                        </c:choose>	
                        <small>同比</small>
                    </div>
                </div>
            </div>
        </div>        
        
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>订单</h5>
                        <div class="pull-right">
                            <div class="btn-group">
                                <button type="button" onclick="drawCartogramOrder(7)" class="btn btn-xs btn-white active">近7天</button>
                                <button type="button" onclick="drawCartogramOrder(15)" class="btn btn-xs btn-white">近15天</button>
                                <button type="button" onclick="drawCartogramOrder(30)" class="btn btn-xs btn-white">近30天</button>
                            </div>
                            <div class="ibox-tools m-l">
                                <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                <a class="close-link"><i class="fa fa-times"></i></a>
                        	</div>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="flot-chart" style="height:280px">
                                    <div class="flot-chart-content" id="echarts-line-chart"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <myfooter>  
    <script src="${ctxsta}/common/echarts/echarts.min.js"></script>
    <script src="${ctxsta}/common/echarts/theme/macarons.js"></script>
    <script>
    $(function() {
	//近7天订单数量
		drawCartogramOrder(7);
		$(".btn-group > .btn-white").click(function(){
			$(".btn-group > .btn-white").removeClass('active');
			$(this).addClass('active');
		});
	});
    
    //订单数按天数
    function drawCartogramOrder(days){
    	var dateTime = '';
    	var updateTime = '';
    	var unpayOrder = '';
    	var payOrder = '';
    	$.ajax({
	        url:baselocation +"/system/statistics/detailajax",
	        type:"post",
	        data:{"days":days,"type":"ORDER_NUM"},
	        dataType:"json",
	        async:false,
	        success:function(result){
	            if(result.success){
	                dateTime=result.entity.showDate;
	                updateTime=result.entity.updateTime;
	                unpayOrder= result.entity.unpayOrder ;
	                payOrder= result.entity.payOrder;
	            }else{
	                alert("请求错误!");
	            }
	        }
        })
    // 图表实例化------------------
	// srcipt标签式引入
	var myChart = echarts.init(document.getElementById("echarts-line-chart"),'macarons');
	
	// 过渡---------------------
	myChart.showLoading({
		text: '正在努力的读取数据中...',    //loading技术
	});
	
	// ajax getting data...............
	
	// ajax callback
	myChart.hideLoading();
	
	// 图表使用-------------------
	option = {
		title: {
			text: '近'+days+'天订单变化',
			subtext: '更新时间：'+updateTime
		},
		tooltip: {
			trigger: 'axis'
		},
		legend: {
			data:['已支付','未支付']
		},
		toolbox: {
			show: true,
			feature: {
				dataZoom: {
					yAxisIndex: 'none'
				},
				dataView: {readOnly: false},
				magicType: {type: ['line', 'bar']},
				restore: {},
				saveAsImage: {}
			}
		},
		xAxis:  {
			type: 'category',
			boundaryGap: false,
			data: dateTime
		},
		yAxis: {
			type: 'value',
			axisLabel: {
				formatter: '{value}'
			}
		},
		series: [
			{
				name:'已支付',
				type:'line',
				data:payOrder,
				markPoint: {
					data: [
						{type: 'max', name: '最大值'},
						{type: 'min', name: '最小值'}
					]
				},
				markLine: {
					data: [
						{type: 'average', name: '平均值'}
					]
				}
			},
			{
				name:'未支付',
				type:'line',
				data:unpayOrder,
				markPoint: {
					data: [
						{type: 'max', name: '最大值'},
						{type: 'min', name: '最小值'}
					]
				},
				markLine: {
					data: [
						{type: 'average', name: '平均值'}
					]
				}
			}
		]
	};
    myChart.setOption(option);
    }
    </script>
    </myfooter> 
</body>
</html>
