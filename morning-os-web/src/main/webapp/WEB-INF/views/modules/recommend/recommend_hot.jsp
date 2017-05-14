<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>

<!--     主产品区热门分类 begin       -->
<c:if test="${not empty categorys}">
  <c:forEach items="${categorys}" var="category" varStatus="productCategoryStat">
    <div class="row J_recommend_hot">
      <div class="col-md-12 col-sm-12">
        <div class="home-brick-box home-brick-row-2-box xm-plain-box" id="category-${productCategoryStat.index}">
          <div class="box-hd">
            <h2 class="title">${category.name}</h2>
            <div class="more J_brickNav">
              <ul class="tab-list J_brickTabSwitch">
                <c:forEach items="${category.childrenCategorys}" var="childrenCategory">
                  <li>${childrenCategory.name}</li>
                </c:forEach>
              </ul>
            </div>
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
                <div class="tab-container" id="category-${productCategoryStat.index}-content">
                  <c:forEach items="${category.childrenCategorys}" var="category" varStatus="categoryStat">
                    <ul class="brick-list">
                      <c:forEach items="${category.products}" var="product" varStatus="productStat">
                        <c:if test="${!productStat.last}">
                          <li class="brick-item brick-item-m" data-gid="${product.productNumber}">
                            <div class="figure figure-img"> <a target="_blank" title="${product.name}" href="${ctx}/detail/${product.productNumber}"> <img src="${ctximg}/${product.picImg}" width="160" height="160" alt="${product.name}"> </a> </div>
                            <h3 class="title"><a target="_blank" title="${product.name}" href="${ctx}/detail/${product.productNumber}">${product.name}</a></h3>
                            <p class="price"> <span class="num">${product.showPrice}</span>元 </p>
                            <p class="rank"> ${product.commentNumber}人评价 </p>
                            <c:if test="${not empty product.content}">
                              <div class="review-wrapper"> <a title="${product.name}" href="${ctx}/detail/${product.productNumber}"><span class="review">${product.content}</span><span class="author"> 来自于 ${product.userName} 的评价 <span class="date"></span></span></a> </div>
                            </c:if>
                            <c:if test="${not empty product.labelName}">
                              <div class="flag"> ${product.labelName} </div>
                            </c:if>
                          </li>
                        </c:if>
                        <c:if test="${productStat.last}" >
                          <li class="brick-item brick-item-s" data-gid="${product.productNumber}">
                            <div class="figure figure-img"> <a target="_blank" title="${product.name}" href="${ctx}/detail/${product.productNumber}"> <img src="${ctximg}/${product.picImg}"  width="80" height="80" alt="${product.name}"> </a> </div>
                            <h3 class="title"><a target="_blank" title="${product.name}" href="${ctx}/detail/${product.productNumber}">${product.name}</a></h3>
                            <p class="price"> <span class="num">${product.showPrice}</span>元 </p>
                            <c:if test="${not empty product.labelName}">
                              <div class="flag"> ${product.labelName} </div>
                            </c:if>
                          </li>
                          <li class="brick-item brick-item-s">
                            <div class="figure figure-more"> <a target="_blank" href="${ctx}/list?categoryId=${category.categoryId}"><i class="glyphicon glyphicon-upload"></i></a> </div>
                            <a class="more" target="_blank" href="${ctx}/list?categoryId=${category.categoryId}">浏览更多<small>${category.name}</small></a> </li>
                        </c:if>
                      </c:forEach>
                    </ul>
                  </c:forEach>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </c:forEach>
</c:if>
<!--     主产品区热门分类 end         -->
<script type="text/javascript">
	/**
	 * 随机分配产品标签颜色
	 */
	$(function() {
		var $elements = $('#J_hotCategory .flag');
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

	/**
 	 * TAB-list
 	 */
	$(function() {
		var $elements = $('#J_hotCategory .J_recommend_hot');
		var len = $elements.length;
		for (var i = 0; i < len; i++) {
			$('#category-' + i + '-content .brick-list').eq(0).show().siblings().hide();
			$('#category-' + i + ' .tab-list li').eq(0).show();
			$('#category-' + i + ' .tab-list li').eq(0).addClass('tab-active');

			$('#category-' + i + ' .tab-list li').mouseover(function(e) {
				var that = $(this).parents('.home-brick-box').attr('id');
				$(this).addClass('tab-active').siblings().removeClass('tab-active');
				var index = $(this).index();
				$('#' + that + ' .brick-list').eq(index).show().siblings().hide();
			})
		}
	})
</script>