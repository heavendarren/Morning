<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>

<!--     热评产品 begin       -->
<c:if test="${not empty products}">
  <div class="row" id="J_recommend_comment">
    <div class="col-md-12 col-sm-12">
      <div class="box-hd">
        <h2 class="title">热评产品</h2>
      </div>
      <div class="box-bd J_brickBd">
        <ul class="review-list clearfix">
          <c:forEach items="${products}" var="product">
            <li class="review-item review-item-first" data-gid="${product.productNumber}">
              <div class="figure1 figure-img"> <a href="${ctx}/detail/${product.productNumber}" target="_blank" data-recommend-product-id="${product.recommendProductId}"> <img title="${product.name}" src="${ctximg}/${product.picImg}" alt="${product.name}" width="296" height="296"> </a> </div>
              <p class="review"> <a href="${ctx}/detail/${product.productNumber}" target="_blank" data-recommend-product-id="${product.recommendProductId}">${product.content}</a> </p>
              <p class="author"> 来自于 ${product.userName} 的评价 <span class="date" data-date="${product.commentId}"></span> </p>
              <div class="info">
                <h3 class="title"><a title="${product.name}" href="${ctx}/detail/${product.productNumber}" target="_blank" data-recommend-product-id="${product.recommendProductId}">${product.name}</a></h3>
                <span class="sep">|</span>
                <p class="price"> <span class="num">${product.showPrice}</span>元 </p>
              </div>
            </li>
          </c:forEach>
        </ul>
      </div>
    </div>
  </div>
</c:if>
<!--     热评产品 end         -->
<script type="text/javascript">
	/**
	 * 热评产品图片放大缩小 
	 */
	$(function() {
		$(".review-item").mouseenter(function() {
			var i = $(this).index();
			$('.review-item .figure-img img').eq(i).stop().animate({
				"top" : "-25px",
				"left" : "-25px",
				"width" : "280px",
				"height" : "280px"
			}, 500);
		}).mouseleave(function() {
			var i = $(this).index();
			$('.review-item .figure-img img').eq(i).stop().animate({
				"top" : "0px",
				"left" : "0px",
				"width" : "220px",
				"height" : "220px"
			}, 500);
		});
	})
</script>