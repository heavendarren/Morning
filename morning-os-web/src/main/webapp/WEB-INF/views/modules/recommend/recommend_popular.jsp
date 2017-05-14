<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>

<!--     为你推荐 begin       -->
<c:if test="${not empty products}">
  <div class="row" id="J_recommend_popular">
    <div class="col-md-12 col-sm-12">
      <div class="box-hd">
        <h2 class="title">为你推荐</h2>
        <div class="more J_brickNav">
          <ul class="pagination">
            <li><span class="glyphicon glyphicon-menu-left"></span></li>
            <li><span class="glyphicon glyphicon-menu-right"></span></li>
          </ul>
        </div>
      </div>
      <div class="box-bd J_brickBd J_recommend-like xm-carousel-container">
        <div class="xm-recommend">
          <div class="xm-carousel-wrapper" style="height: 320px; overflow: hidden;">
            <ul class="xm-carousel-col-5-list xm-carousel-list clearfix J_popularList" data-carousel-list="true" style="width: 4960px; margin-left: 0px; transition: margin-left 0.5s ease;">
              <c:forEach items="${products}" var="product">
                <li class="J_xm-recommend-list" data-gid="${product.productNumber}">
                  <dl>
                    <dt> <a href="${ctx}/detail/${product.productNumber}" target="_blank" data-recommend-product-id="${product.recommendProductId}"> <img title="${product.name}" src="${ctximg}/${product.picImg}" alt="${product.name}" width="140" height="140"> </a> </dt>
                    <dd class="xm-recommend-name"> <a title="${product.name}" href="${ctx}/detail/${product.productNumber}" target="_blank" data-recommend-product-id="${product.recommendProductId}">${product.name}</a> </dd>
                    <dd class="xm-recommend-price">${product.showPrice}</dd>
                    <dd class="xm-recommend-tips"> ${product.commentNumber}人好评 </dd>
                    <dd class="xm-recommend-notice"></dd>
                  </dl>
                </li>
              </c:forEach>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</c:if>
<!--     为你推荐 end         -->
<script type="text/javascript">
	/**
	 * 为你推荐
	 */
	$(function() {
		//手动滚动
		$('#J_recommend_popular .pagination li').hover(function() {
			clearInterval(timer);
		}, function() {
			timer = setInterval(active, 5000);
		})

		$('#J_recommend_popular .pagination li').eq(1).click(function() {

			$('.J_popularList').css({
				marginLeft : '-1233px'
			});
			$('#J_recommend_popular .pagination li').eq(1).addClass('pager-active').siblings().removeClass('pager-active');

		});
		$('#J_recommend_popular .pagination li').eq(0).click(function() {
			$('.J_popularList').css({
				marginLeft : '0'
			});
			$('#J_recommend_popular .pagination li').eq(0).addClass('pager-active').siblings().removeClass('pager-active');
		});
		//自动轮播
		var timer = setInterval(active, 5000);

		function active() {
			$('.J_popularList').css({
				marginLeft : '-1233px'
			});
			$('#J_recommend_popular .pagination li').eq(1).addClass('pager-active').siblings().removeClass('pager-active');
			var num = parseInt($('.J_popularList').css('marginLeft'));
			if (num == -1233) {
				$('.J_popularList').css({
					marginLeft : '0'
				});
				$('#J_recommend_popular .pagination li').eq(0).addClass('pager-active').siblings().removeClass('pager-active');
			}
		}

		//鼠标事件
		$('.J_popularList').hover(function() {
			clearInterval(timer);
		}, function() {
			timer = setInterval(active, 5000);
		})
	});
</script>
