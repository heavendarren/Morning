<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>商品提问</title>
<link rel="stylesheet" href="${ctxsta}/web/css/goods-question.css">
</head>
<body>
<!-- 轮播top菜单导航引入 -->
<jsp:include page="/WEB-INF/views/modules/common/site-header.jsp" />
<!-- 轮播top菜单导航引入 --> 

<!--     分类导航栏 begin       -->
<div class="breadcrumbs">
  <div class="container-fluid"><a href='${ctx }/index'>首页</a>
    <c:forEach items="${upperCategories }" var="upperCategory"><span class="sep">&gt;</span><a href="${ctx}/list?categoryId=${upperCategory.categoryId}">${upperCategory.name }</a></c:forEach>
    <span class="sep">&gt;</span><a href="${ctx}/item/${product.productNumber}">${product.name }</a> </div>
</div>
<!--     分类导航栏 end       --> 

<!--     商品提问 begin       -->
<div class="goods-question">
  <div class="container-fluid">
    <div class="row">
      <div class="span14 goods-question-list-block">
        <div class="goods-question-order-block"> <a href="${ctx}/question/gid/${product.productNumber}?sort=1" class="${sort eq 1 ? 'current':''} J_questionHelp">最有帮助</a> <span class="sep">|</span> <a href="${ctx}/question/gid/${product.productNumber}?sort=0" class="${sort eq 0 ? 'current':''} J_questionNew">最新</a> </div>
        <div class="goods-question-ask-block">
          <input type="text" placeholder="输入你的提问" class="input-block J_inputQuestion" data-pagesize="10">
          <div class="btn question-btn J_btnQuestion">提问</div>
        </div>
        <ul class="goods-question-list-detail" id="J_goodsQuestionBlock">
          <c:forEach items="${questions}" var="question">
            <li data-id="${question.questionId }">
              <div class="left-hand float ">
                <div class="hand-block J_questionLike " data-id="${question.questionId }"><i class="glyphicon glyphicon-thumbs-up"></i><br>
                  <span class="hand-number">${question.goodCount}</span></div>
              </div>
              <div class="mid-detail float ">
                <h3 class="question-title"><a target="_blank">${question.content}</a></h3>
                <div class="answer-content figcaption">
                  <p>${question.answerContent}</p>
                </div>
              </div>
              <div class="right-date float">
                <div class="question-title-date">${question.createTime}</div>
                <div class="answer-content-date">${question.answerTime}</div>
              </div>
            </li>
          </c:forEach>
        </ul>
        <div class="question-null-content J_nullInfo">抱歉，没有找到答案，您可以点击“提问”提交此条提问给已经购买者、小米官方客服和产品经理，我们会及时回复。</div>
        <div class="goods-detail-null-content" style="display:${empty questions ? 'block':'none'}" id="J_commentTipInfo">
          <h3>暂时还没有更多提问</h3>
          <p>对商品还不太了解，问问看吧</p>
        </div>
        <div class="comment-page-nav-list" id="J_issuePagenav" data-pagesize="10">
          <div class="xm-pagenavi">
            <c:if test="${pageInfo.total gt pageInfo.pagesize and not empty questions}">
              <div id="pager" data-pager-href="${ctx}/question/gid/${product.productNumber}?&sort=${sort}&page=" data-pager-totalPage="${pageInfo.totalPage}" data-pager-nowpage="${pageInfo.nowpage}" data-sort="${sort}"></div>
            </c:if>
          </div>
        </div>
      </div>
      <div class="span6 goods-detail-info-block">
        <div class="goods-detail-info">
          <div class="goods-img-block"> <a target="_blank" href="${ctx }/item/${product.productNumber}" title="${product.name}"> <img src="${ctximg}/${product.picImg}" class="J_cartBigImg" alt="${product.name}"> </a> </div>
          <div class="goods-name J_cartGoodsName"> ${product.name} </div>
          <div class="goods-price"> <b>${product.showPrice}</b><i>&nbsp;元</i> </div>
        </div>
        <div class="goods-cart-btn-block " id="J_cartBtnBlock"> <a href="" class="btn btn-gray goods-over-btn">加入购物车</a> </div>
      </div>
    </div>
  </div>
</div>
<!--     商品提问 end       -->

<myfooter> 
  <!-- 分页js --> 
  <script src="${ctxsta}/common/pager/jquery.pager.js"></script> 
  <script type="text/javascript">
  	var pagecount = $('#pager').attr('data-pager-totalPage'); // 总页面数
  	var nowpage = $('#pager').attr('data-pager-nowpage'); // 当前页数
  	var href = $('#pager').attr('data-pager-href'); // 链接地址
  	$(document).ready(function() {
  		$("#pager").pager({
  			pagenumber : nowpage,
  			pagecount : pagecount,
  			buttonClickCallback : PageClick
  		});
  	});
  	PageClick = function(number) {
  		$("#pager").pager({
  			pagenumber : number,
  			pagecount : pagecount,
  			buttonClickCallback : PageClick
  		});
  		window.location.href = href + number;
  	}
  </script> 
</myfooter>
</body>
</html>