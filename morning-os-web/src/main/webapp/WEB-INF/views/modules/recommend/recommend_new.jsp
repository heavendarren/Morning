<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>

<!--     新品推荐 begin       -->
<c:if test="${not empty products}">
  <div class="row" id="J_recommend_new">
    <div class="col-md-12 col-sm-12">
      <h2 class="xm-recommend-title"><span>新品推荐</span></h2>
      <div class="xm-recommend">
        <div class="xm-carousel-wrapper" style="height: 320px; overflow: hidden;">
          <ul class="xm-carousel-col-5-list xm-carousel-list clearfix J_newList" data-carousel-list="true" style="width: 2480px; margin-left: 0px; transition: margin-left 0.5s ease;">
            <c:forEach items="${products}" var="product">
              <li class="J_xm-recommend-list">
                <dl>
                  <dt> <a href="${ctx}/detail/${product.productNumber}" target="_blank" data-recommend-product-id="${product.recommendProductId}"><img title="${product.name}" src="${ctximg}/${product.picImg}" alt="${product.name}" width="160" height="160"></a> </dt>
                  <dd class="xm-recommend-name"> <a href="${ctx}/detail/${product.productNumber}" target="_blank">${product.name}</a></dd>
                  <dd class="xm-recommend-price">${product.showPrice}元</dd>
                  <dd class="xm-recommend-tips"> ${product.commentNumber}人好评 </dd>
                  <dd class="xm-recommend-notice"></dd>
                </dl>
              </li>
            </c:forEach>
          </ul>
        </div>
        <div class="xm-pagers-wrapper">
          <ul class="xm-pagers">
            <li class="pager pager-active"><span class="dot">1</span></li>
            <li class="pager"><span class="dot">2</span></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</c:if>
<!--     新品推荐 end         --> 
<script type="text/javascript">
	/**
	 * 新品推荐
	 */
	$(function() {
		//手动滚动
		$('.xm-pagers-wrapper .xm-pagers li').hover(function() {
			clearInterval(timer);
		}, function() {
			timer = setInterval(active, 5000);
		})

		$('.xm-pagers-wrapper .xm-pagers li').eq(1).click(function() {

			$('.J_newList').css({
				marginLeft : '-1233px'
			});
			$('.xm-pagers-wrapper .xm-pagers li').eq(1).addClass('pager-active').siblings().removeClass('pager-active');

		});
		$('.xm-pagers-wrapper .xm-pagers li').eq(0).click(function() {
			$('.J_newList').css({
				marginLeft : '0'
			});
			$('.xm-pagers-wrapper .xm-pagers li').eq(0).addClass('pager-active').siblings().removeClass('pager-active');
		});
		//自动轮播
		var timer = setInterval(active, 5000);

		function active() {
			$('.J_newList').css({
				marginLeft : '-1233px'
			});
			$('.xm-pagers-wrapper .xm-pagers li').eq(1).addClass('pager-active').siblings().removeClass('pager-active');
			var num = parseInt($('.J_newList').css('marginLeft'));
			if (num == -1233) {
				$('.J_newList').css({
					marginLeft : '0'
				});
				$('.xm-pagers-wrapper .xm-pagers li').eq(0).addClass('pager-active').siblings().removeClass('pager-active');
			}
		}

		//鼠标事件
		$('.J_newList').hover(function() {
			clearInterval(timer);
		}, function() {
			timer = setInterval(active, 5000);
		})
	});
</script> 
