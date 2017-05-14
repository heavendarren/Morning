<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>商品提问</title>
<link rel="stylesheet" href="${ctxsta}/os/css/goods-question.css">
</head>
<body>
<!-- 轮播top菜单导航引入 -->
<jsp:include page="/WEB-INF/views/modules/common/site_header.jsp" />
<!-- 轮播top菜单导航引入 --> 

<!--     分类导航栏 begin       -->
<div class="breadcrumbs">
  <div class="container-fluid"><a href='${ctx}/index'>首页</a>
    <c:forEach items="${upperCategories}" var="upperCategory"><span class="sep">&gt;</span><a href="${ctx}/list?categoryId=${upperCategory.categoryId}">${upperCategory.name}</a></c:forEach>
    <span class="sep">&gt;</span><a href="${ctx}/detail/${product.productNumber}">${product.name}</a> </div>
</div>
<!--     分类导航栏 end       --> 

<!--     商品提问 begin       -->
<div class="goods-question">
  <div class="container-fluid">
    <div class="row">
      <div class="span14 goods-question-list-block">
        <div class="goods-question-order-block"> <a href="${ctx}/question/asklist?productNumber=${product.productNumber}&sort=1" class="${sort eq 1 ? 'current':''} J_questionHelp">最有帮助</a> <span class="sep">|</span> <a href="${ctx}/question/asklist?productNumber=${product.productNumber}&sort=0" class="${sort eq 0 ? 'current':''} J_questionNew">最新</a> </div>
        <div class="goods-question-ask-block">
          <input type="text" placeholder="输入你的提问" class="input-block J_inputQuestion" data-pagesize="10">
          <div class="btn btn-primary question-btn J_btnQuestion" onclick="add_question(this);">提问</div>
        </div>
        <ul class="goods-question-list-detail" id="J_goodsQuestionBlock">
          <c:forEach items="${questions}" var="question">
            <li data-id="${question.questionId}">
              <div class="left-hand float">
                <div class="hand-block J_questionLike" data-id="${question.questionId}" onclick="question_like(this,${question.questionId})"><i class="glyphicon glyphicon-thumbs-up"></i><br>
                  <span class="hand-number">${question.goodCount}</span></div>
              </div>
              <div class="mid-detail float">
                <h3 class="question-title"><a target="_blank">${question.content}</a></h3>
                <div class="answer-content figcaption">
                  <p>${question.answerContent}</p>
                </div>
              </div>
              <div class="right-date float">
                <div class="question-title-date"><fmt:formatDate value="${question.createTime}" pattern="yyyy年MM月dd日" /></div>
                <div class="answer-content-date"><fmt:formatDate value="${question.answerTime}" pattern="yyyy年MM月dd日" /></div>
              </div>
            </li>
          </c:forEach>
        </ul>
        <div class="question-null-content J_nullInfo">抱歉，没有找到答案，您可以点击“提问”提交此条提问给已经购买者、小米官方客服和产品经理，我们会及时回复。</div>
        <div class="goods-detail-null-content" style="display:${empty questions ? 'block':'none'}" id="J_commentTipInfo">
          <h3>暂时还没有更多提问</h3>
          <p>对商品还不太了解，问问看吧</p>
        </div>
        <div class="comment-page-nav-list" id="J_issuePagenav">
          <div class="xm-pagenavi">
            <c:if test="${pageInfo.total gt pageInfo.limit and not empty questions}">
              <div id="pager" data-pager-href="${ctx}/question/asklist?productNumber=${product.productNumber}&sort=${sort}&page=" data-pager-totalPage="${pageInfo.totalPage}" data-pager-current="${pageInfo.current}"></div>
            </c:if>
          </div>
        </div>
      </div>
      <div class="span6 goods-detail-info-block">
        <div class="goods-detail-info">
          <div class="goods-img-block"> <a target="_blank" href="${ctx}/detail/${product.productNumber}" title="${product.name}"> <img src="${ctximg}/${product.picImg}" class="J_cartBigImg" alt="${product.name}"> </a> </div>
          <div class="goods-name J_cartGoodsName"> ${product.name} </div>
          <div class="goods-price"> <b>${product.showPrice}</b><i>&nbsp;元</i> </div>
        </div>
        <div class="goods-cart-btn-block" id="J_cartBtnBlock"> <a target="_blank" href="${ctx}/detail/${product.productNumber}" class="btn btn-primary goods-add-cart-btn">加入购物车</a> </div>
      </div>
    </div>
  </div>
</div>
<!--     商品提问 end       -->

<myfooter> 
  <!-- 分页js --> 
  <script src="${ctxsta}/common/pager/jquery.pager.js"></script> 
  <!-- layer javascript --> 
  <script src="${ctxsta}/common/layer/layer.js"></script> 
  <script type="text/javascript">
	var productNumber = ${product.productNumber};
	var productId = ${product.productId};
  	var pagecount = $('#pager').attr('data-pager-totalPage'); // 总页面数
  	var current = $('#pager').attr('data-pager-current'); // 当前页数
  	var href = $('#pager').attr('data-pager-href'); // 链接地址
  	$(document).ready(function() {
  		$("#pager").pager({
  			pagenumber : current,
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
  	
  	/**
	 * 商品提问点赞
	 */
	function question_like(obj, questionId) {
		var data = {};
		data.questionId = questionId;
		$.ajax({
			type : 'put',
			dataType : 'json',
			data : data,
			url : baselocation + '/question/like',
			success : function(result) {
				if (result.code == 1) {
					$(obj).addClass("current");
					$(obj).children(".hand-number").text(result.data);
				} else if (result.code == 401) {
					window.location.href = baselocation + '/pass/login';
				} else {
					layer.alert(result.message, {
						icon : 2
					});
				}
			}
		})
	}
  	
	/**
	 * 商品提问
	 */
	function add_question(obj) {
		var data = {};
		data.productId = productId;
		data.content = $(obj).prev().val()  ;
		layer.confirm('您确认提交此问题吗？', {
			btn : [ '确定', '取消' ] //按钮
		}, function() {
			$.ajax({
				type : 'post',
				dataType : 'json',
				data : data,
				url : baselocation + '/question/ask',
				success : function(result) {
					if (result.code == 1) {
						layer.msg('发表问题成功!', {
							icon : 1,
							time : 1000
						});
					} else if (result.code == 401) {
						window.location.href = baselocation + '/pass/login';
					} else {
						layer.alert(result.message, {
							icon : 2
						});
					}
				}
			})
		});
	}
  </script> 
</myfooter>
</body>
</html>