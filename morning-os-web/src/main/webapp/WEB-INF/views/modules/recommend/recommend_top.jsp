<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>

<!--     主产品区置顶推荐 begin       -->
<c:if test="${not empty categorys}">
  <c:forEach items="${categorys}" var="category" >
    <div class="row">
      <div class="col-md-12 col-sm-12">
        <div class="home-brick-box home-brick-row-2-box xm-plain-box">
          <div class="box-hd">
            <h2 class="title">${category.name}</h2>
            <div class="more J_brickNav"> <a class="more-link" target="_blank" href="${ctx}/list?categoryId=${category.categoryId}">查看全部</a><span class="glyphicon glyphicon-circle-arrow-rights"></span> </div>
          </div>
          <div class="box-bd J_brickBd">
            <div class="row">
              <div class="span4 span-first">
                <ul class="brick-promo-list clearfix">
                  <c:forEach items="${category.categoryAdverts}" var="categoryAdvert">
                    <li class="brick-item2 brick-item-m" data-gid="${categoryAdvert.categoryAdvertId}"> <a title="${categoryAdvert.title}" href="${categoryAdvert.href}" target="_blank"><img src="${ctximg}/${categoryAdvert.picImg}" alt="${categoryAdvert.title}"></a> </li>
                  </c:forEach>
                </ul>
              </div>
              <div class="span16">
                <ul class="brick-list clearfix">
                  <c:forEach items="${category.products}" var="product">
                    <li class="brick-item brick-item-m brick-item-m-2" data-gid="${product.productNumber}">
                      <div class="figure figure-img"> <a target="_blank" title="${product.name}" href="${ctx}/detail/${product.productNumber}"> <img src="${ctximg}/${product.picImg}" width="160" height="160" alt="${product.name}"> </a> </div>
                      <h3 class="title"><a target="_blank" title="${product.name}" href="${ctx }/detail/${product.productNumber}">${product.name}</a></h3>
                      <p class="desc"> ${product.introduce} </p>
                      <p class="price"> <span class="num">${product.showPrice }</span>元 </p>
                      <c:if test="${not empty product.labelName}">
                        <div class="flag"> ${product.labelName} </div>
                      </c:if>
                    </li>
                  </c:forEach>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </c:forEach>
</c:if>
<!--     主产品区置顶推荐 end         --> 

<script type="text/javascript">
	/**
	 * 随机分配产品标签颜色
	 */
	$(function() {
		var $elements = $('#J_topCategory .flag');
		var len = $elements.length;
		// alert('有 ' + len + ' 个相同class');
		$elements.each(function() {
			var $this = $(this);
			var num = (Math.floor(Math.random() * 4) + 1); //输出1-4的随机数搜索
			switch (num) { //然后判断
			case 1:
				$this.addClass("flag-new");
				break;
			case 2:
				$this.addClass("flag-saleoff");
				break;
			case 3:
				$this.addClass("flag-postfree");
				break;
			default:
				$this.addClass("flag-gift");
				break;
			}
		});
	})
</script>