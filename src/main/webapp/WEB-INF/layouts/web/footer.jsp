<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!-- 底部页脚栏开始 -->
<footer id="footer">
	<div class="footer">
		<div class="footer-content">
			<div class="footer-content-top">
				<ul>
					<li><p><span class="glyphicon glyphicon-wrench"></span>1小时快修服务</p></li>
					<li class="font_top_i">|</li>
					<li><p><span class="glyphicon glyphicon-phone-alt"></span>7天无理由退货</p></li>
					<li class="font_top_i">|</li>
					<li><p><span class="glyphicon glyphicon-usd"></span>15天免费换货</p></li>
					<li class="font_top_i">|</li>
					<li><p><span class="glyphicon glyphicon-gift"></span>满150元包邮</p></li>
					<li class="font_top_i">|</li>
					<li><p><span class="glyphicon glyphicon-map-marker"></span>520余家售后网点</p></li>
				</ul>
			</div>
			<div class="footer-links clearfix">
				<dl class="col-links col-links-first">
					<dt>帮助中心</dt>
					<dd><a rel="nofollow" href="#">购物指南</a></dd>
					<dd><a rel="nofollow" href="#">支付方式</a></dd>
					<dd><a rel="nofollow" href="#">配送方式</a></dd>
				</dl>
				<dl class="col-links ">
					<dt>服务支持</dt>
					<dd><a rel="nofollow" href="#">售后政策</a></dd>
					<dd><a rel="nofollow" href="#">自助服务</a></dd>
					<dd><a rel="nofollow" href="#">相关下载</a></dd>
				</dl>
				<dl class="col-links ">
					<dt>猫宁之家</dt>
					<dd><a rel="nofollow" href="#">猫宁之家</a></dd>
					<dd><a rel="nofollow" href="#">服务网点</a></dd>
					<dd><a rel="nofollow" href="#">预约服务</a></dd>
				</dl>
				<dl class="col-links ">
					<dt>关于猫宁</dt>
					<dd><a rel="nofollow" href="#">了解猫宁</a></dd>
					<dd><a rel="nofollow" href="#">加入猫宁</a></dd>
					<dd><a rel="nofollow" href="#">联系我们</a></dd>
				</dl>
				<dl class="col-links ">
					<dt>关注我们</dt>
					<dd><a rel="nofollow" href="http://weibo.com/u/3809177977" target="_Blank">新浪微博</a></dd>
					<dd><a rel="nofollow" href="#">猫宁部落</a></dd>
					<dd><a rel="nofollow" href="#">官方微信</a></dd>
				</dl>
				<dl class="col-links ">
					<dt>特色服务</dt>
					<dd><a rel="nofollow" href="#">F 码通道</a></dd>
					<dd><a rel="nofollow" href="#">猫宁移动</a></dd>
					<dd><a rel="nofollow" href="#">防伪查询</a></dd>
				</dl>
				<div class="col-contact">
					<p class="phone">188-5710-5127</p>
					<p><span class="J_serviceTime-normal" style="">周一至周日8:00-18:00</span><span class="J_serviceTime-holiday"style="display: none;">2月7日至13日服务时间 9:00-18:00</span><br>（仅收市话费）</p>
					<a rel="nofollow" class="btn-content btn-line-primary btn-small" href="http://wpa.qq.com/msgrd?v=3&uin=810170512&site=qq&menu=yes" target="_Blank"><span class="glyphicon glyphicon-earphone"></span> 24小时在线客服</a>
				</div>
			</div>
		</div>
		<div class="site-info">
			<div class="container-fluid">
				<div class="img-rounded"></div>
				<div class="info-text">
					<p class="sites">
						<a href="#">猫宁商城</a><span class="sep">/</span> <a href="#">公益频道</a><span class="sep">/</span> <a href="#">益行者</a><span class="sep">/</span>
						<a href="#">嗨社区</a><span class="sep">/</span> <a href="#">关于我们</a><span class="sep">/</span> <a href="#">问题反馈</a><span class="sep">/</span>
						<a href="#">成长日记</a><span class="sep">/</span> <a href="#">Select Region</a>
					</p>
					<p>
						© 2016<a href="#"> 猫宁Morning。</a>
						<span class="sep">/</span><span id="showsectime"></span><span class="sep">/</span>
						<span id="TimeShow"></span><span class="sep">/</span><span>当前在线用户人数：${userNumber }</span>
					</p>
				</div>
				<div class="info-links">
					<a href="#"><img src="${ctxsta}/web/images/v-logo-2.png" alt="诚信网站"></a> 
					<a href="#"><img src="${ctxsta}/web/images/v-logo-1.png" alt="可信网站"></a> <a href="#">
					<img src="${ctxsta}/web/images/v-logo-3.png" alt="网上交易保障中心"></a>
				</div>
			</div>
		</div>
	</div>
</footer>
<div class="bottom_tools">
       <div class="qr_tool">二维码</div>
       <a id="feedback" href="#" title="意见反馈">意见反馈</a>
       <a id="scrollUp" href="javascript:;" title="飞回顶部"></a>
       <img class="qr_img" src="${ctxsta}/web/images/qr_img.png">
</div>
<!-- 底部页脚栏结束 -->
