<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>

<!--     明星产品 begin       -->
<c:if test="${not empty products}">
  <div class="row" id="J_recommend_stat">
    <div class="col-md-12 col-sm-12">
      <div class="xm-plain-box">
        <div class="box-hd">
          <h2 class="title">小米明星单品</h2>
          <div class="more">
            <ul class="pagination">
              <li><span class="glyphicon glyphicon-menu-left"></span></li>
              <li><span class="glyphicon glyphicon-menu-right"></span></li>
            </ul>
          </div>
        </div>
        <div class="box-bd">
          <div class="xm-carousel-wrapper" style="height: 340px; overflow: hidden;">
            <ul class="xm-carousel-list xm-carousel-col-5-list goods-list rainbow-list clearfix J_carouselList J_statList" style="width: 2480px; margin-left: 0px; transition: margin-left 0.5s ease;">
              <c:forEach items="${products}" var="product">
                <li data-gid="${product.productNumber}"> <a class="thumb" href="${ctx}/detail/${product.productNumber}" target="_blank" data-recommend-product-id="${product.recommendProductId}"><img title="${product.name}" src="${ctximg}/${product.picImg}" alt="${product.name}" width="160" height="160"></a>
                  <h3 class="title"><a href="${ctx}/detail/${product.productNumber}" target="_blank">${product.name}</a></h3>
                  <p class="desc"> ${product.introduce} </p>
                  <p class="price"> ${product.showPrice} </p>
                </li>
              </c:forEach>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</c:if>
<!--     明星产品 end         -->
<script type="text/javascript">
	/**
	 * 明星产品滚动动画
	 */
	$(function() {
		//手动滚动
		$('#J_recommend_stat .pagination li').hover(function() {
			clearInterval(timer);
		}, function() {
			timer = setInterval(active, 5000);
		})

		$('#J_recommend_stat .pagination li').eq(1).click(function() {
			$('.J_statList').css({
				marginLeft : '-1233px'
			});
			$('#J_recommend_stat .pagination li').eq(1).addClass('pager-active').siblings().removeClass('pager-active');

		});
		$('#J_recommend_stat .pagination li').eq(0).click(function() {
			$('.J_statList').css({
				marginLeft : '0'
			});
			$('#J_recommend_stat .pagination li').eq(0).addClass('pager-active').siblings().removeClass('pager-active');
		});
		//自动轮播
		var timer = setInterval(active, 5000);

		function active() {
			$('.J_statList').css({
				marginLeft : '-1233px'
			});
			$('#J_recommend_stat .pagination li').eq(1).addClass('pager-active').siblings().removeClass('pager-active');
			var num = parseInt($('.J_statList').css('marginLeft'));
			if (num == -1233) {
				$('.J_statList').css({
					marginLeft : '0'
				});
				$('#J_recommend_stat .pagination li').eq(0).addClass('pager-active').siblings().removeClass('pager-active');
			}
		}

		//鼠标事件
		$('.J_statList').hover(function() {
			clearInterval(timer);
		}, function() {
			timer = setInterval(active, 5000);
		})
	});

	/**
	 * 明星产品标签颜色
	 */
	$(function() {
		var $elements = $('.J_statList li');
		$elements.each(function(index, element) {
			var $this = $(this);
			var number = parseInt(index) + 1;
			$this.addClass("rainbow-item-" + number);
		});
	})
</script>
