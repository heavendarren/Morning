<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>用户评价</title>
<link rel="stylesheet" href="${ctxsta}/web/css/goods-comment.css">
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

<!--     商品评论 begin       -->
<div class="goods-comment">
  <div class="goods-comment-groom" id="J_recommendComment" style="display:${productAttribute.commentNumber eq 0?'none':'black'}">
    <div class="container-fluid">
      <ul class="main-block">
        <li class="percent">
          <div class="per-num"> <i>${productAttribute.commentAverage }</i>% </div>
          <div class="per-title"> 购买后满意 </div>
          <div class="per-amount"> <i>${productAttribute.commentNumber }</i>名用户投票 </div>
        </li>
      </ul>
    </div>
  </div>
  <div class="goods-comment-order-block" id="J_commentOrder">
    <div class="container-fluid">
      <div class="row">
        <div class="span14">
          <div class="left-title J_commentOrder"> <a href="${ctx}/comment/gid/${product.productNumber}?sort=1" class="${sort eq 1 ? 'current':''} J_helpOrder">最有帮助的评价</a> <span class="sep">|</span> <a href="${ctx }/comment/gid/${product.productNumber}?sort=0"  class="${sort eq 0 ? 'current':''}">最新的评价</a> </div>
        </div>
      </div>
    </div>
  </div>
  <div class="goods-comment-list-detail-block">
    <div class="container-fluid">
      <div class="row">
        <div class="span14 goods-comment-list-detail">
          <ul class="comment-box-list" id="J_supComment">
            <c:forEach items="${commentVOs }" var="commentVO">
              <li class="" data-id="${commentVO.comment.commentId}">
                <div class="user-image"> <img src="${ctximg}/${commentVO.comment.picImg}" alt="${commentVO.comment.userName }"> </div>
                <div class="user-emoj">&nbsp;超爱&nbsp;<i class="glyphicon glyphicon-thumbs-up"></i> </div>
                <div class="user-name-info"> <span class="user-name"> ${commentVO.comment.userName } </span> <span class="user-time">${commentVO.comment.createTime }</span> <span class="pro-info">蓝色</span> </div>
                <div class="user-hand-block"> <a href="javascript:void(0);" data-commentid="${commentVO.comment.commentId }" class="J_hasHelp "><i class="glyphicon glyphicon-thumbs-up"></i>&nbsp;赞&nbsp;<span class="amount"> ${commentVO.comment.goodCount }</span></a> </div>
                <dl class="user-comment">
                  <dt class="user-comment-content J_commentContent">
                    <p class="content-detail"><a href="" target="_blank">${commentVO.comment.content }</a></p>
                  </dt>
                  <dd class="user-comment-self-input">
                    <div class="input-block">
                      <input type="text" placeholder="回复楼主" class="J_commentAnswerInput">
                      <a href="javascript:void(0);" class="btn  answer-btn J_commentAnswerBtn" data-commentid="${commentVO.comment.commentId }">回复</a> </div>
                  </dd>
                  <c:forEach items="${commentVO.commentReplies}" var="commentReply">
                    <c:if test="${commentReply.type eq 1 }">
                      <dd class="user-comment-answer"> <img class="self-image" src="${ctximg }/${commentReply.picImg}" alt="${commentReply.userName}">
                        <p>${commentReply.content}<span class="official-name">&nbsp;&nbsp;官方回复&nbsp;</span> <a href="javascript:void(0);" class="J_csLike " data-commentid="${commentReply.commentReplyId}"> <i class="glyphicon glyphicon-thumbs-up"></i>&nbsp;赞客服&nbsp; <span class="amount">${commentReply.goodCount}</span> </a></p>
                      </dd>
                    </c:if>
                    <c:if test="${commentReply.type eq 0 }">
                      <dd class="user-comment-answer"> <img class="self-image" src="${ctximg }/${commentReply.picImg}" alt="${commentReply.userName}">
                        <p>${commentReply.content}- <span class="answer-user-name">${commentReply.userName}</span> </p>
                      </dd>
                    </c:if>
                  </c:forEach>
                </dl>
              </li>
            </c:forEach>
          </ul>
          <div class="goods-detail-null-content" style="display:${empty commentVOs ? 'block':'none'}" id="J_commentTipInfo">
            <h3>暂时还没有更多评价</h3>
            <p>期待你分享科技带来的乐趣</p>
          </div>
          <div class="comment-page-nav-list" id="J_commentPagenav">
            <c:if test="${pageInfo.total gt pageInfo.pagesize and not empty commentVOs}">
              <div id="pager" data-pager-href="${ctx}/comment/gid/${product.productNumber}?&sort=${sort}&page=" data-pager-totalPage="${pageInfo.totalPage}" data-pager-nowpage="${pageInfo.nowpage}" data-sort="${sort}"></div>
            </c:if>
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
</div>
<!--     商品评论 end       -->

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