<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>用户评价</title>
<link rel="stylesheet" href="${ctxsta}/web/css/goods-comment.css">
</head>
<body>
<!--     轮播top菜单导航 begin       -->
<div class="site-header">
  <div class="container-fluid">
    <div class="header-logo"> <a class="logo ir" href="//www.mi.com/index.html" title="小米官网"><img src="${ctxsta}/web/img/logo.png"></a> </div>
    <div class="header-nav">
      <ul class="nav-list J_navMainList clearfix">
        <li id="J_navCategory" class="nav-category"> <a class="link-category" href="${ctx }/list?categoryId=1"><span class="text">全部商品分类</span></a> 
          <!--     轮播top菜单导航begin       -->
          <div class="site-category">
            <ul id="J_categoryList" class="site-category-list clearfix">
              <c:forEach items="${categoryInNavVOs }" var="categoryInNavVO">
                <li class="category-item"> <a class="title" href="${ctx }/list?categoryId=${categoryInNavVO.categoryId}">${categoryInNavVO.name }<span class="glyphicon glyphicon-chevron-right"></span></a>
                  <c:choose>
                    <c:when test="${fn:length(categoryInNavVO.products)<=6}">
                      <div class="children clearfix children-col-1">
                        <ul class="children-list clearfix">
                          <c:forEach items="${categoryInNavVO.products}" var="product" begin="0" end="5">
                            <li> <a class="link" title="${product.name}" href="${ctx }/item/${product.productNumber}"><img class="thumb" src="${ctximg}/${product.picImg}" width="40" height="40" alt="${product.name}"><span class="text">${product.name}</span></a> </li>
                          </c:forEach>
                        </ul>
                      </div>
                    </c:when>
                    <c:when test="${fn:length(categoryInNavVO.products)<=12}">
                      <div class="children clearfix children-col-2">
                        <ul class="children-list children-list-col children-list-col-1">
                          <c:forEach items="${categoryInNavVO.products}" var="product" begin="0" end="5">
                            <li> <a class="link" title="${product.name}" href="${ctx }/item/${product.productNumber}"><img class="thumb" src="${ctximg}/${product.picImg}" width="40" height="40" alt="${product.name}"><span class="text">${product.name}</span></a> </li>
                          </c:forEach>
                        </ul>
                        <ul class="children-list children-list-col children-list-col-2">
                          <c:forEach items="${categoryInNavVO.products}" var="product" begin="6" end="11">
                            <li> <a class="link" title="${product.name}" href="${ctx }/item/${product.productNumber}"><img class="thumb" src="${ctximg}/${product.picImg}" width="40" height="40" alt="${product.name}"><span class="text">${product.name}</span></a> </li>
                          </c:forEach>
                        </ul>
                      </div>
                    </c:when>
                    <c:when test="${fn:length(categoryInNavVO.products)<=18}">
                      <div class="children clearfix children-col-3">
                        <ul class="children-list children-list-col children-list-col-1">
                          <c:forEach items="${categoryInNavVO.products}" var="product" begin="0" end="5">
                            <li> <a class="link" title="${product.name}" href="${ctx }/item/${product.productNumber}"><img class="thumb" src="${ctximg}/${product.picImg}" width="40" height="40" alt="${product.name}"><span class="text">${product.name}</span></a> </li>
                          </c:forEach>
                        </ul>
                        <ul class="children-list children-list-col children-list-col-2">
                          <c:forEach items="${categoryInNavVO.products}" var="product" begin="6" end="11">
                            <li> <a class="link" title="${product.name}" href="${ctx }/item/${product.productNumber}"><img class="thumb" src="${ctximg}/${product.picImg}" width="40" height="40" alt="${product.name}"><span class="text">${product.name}</span></a> </li>
                          </c:forEach>
                        </ul>
                        <ul class="children-list children-list-col children-list-col-3">
                          <c:forEach items="${categoryInNavVO.products}" var="product" begin="12" end="17">
                            <li> <a class="link" title="${product.name}" href="${ctx }/item/${product.productNumber}"><img class="thumb" src="${ctximg}/${product.picImg}" width="40" height="40" alt="${product.name}"><span class="text">${product.name}</span></a> </li>
                          </c:forEach>
                        </ul>
                      </div>
                    </c:when>
                    <c:otherwise>
                      <div class="children clearfix children-col-4">
                        <ul class="children-list children-list-col children-list-col-1">
                          <c:forEach items="${categoryInNavVO.products}" var="product" begin="0" end="5">
                            <li> <a class="link" title="${product.name}" href="${ctx }/item/${product.productNumber}"><img class="thumb" src="${ctximg}/${product.picImg}" width="40" height="40" alt="${product.name}"><span class="text">${product.name}</span></a> </li>
                          </c:forEach>
                        </ul>
                        <ul class="children-list children-list-col children-list-col-2">
                          <c:forEach items="${categoryInNavVO.products}" var="product" begin="6" end="11">
                            <li> <a class="link" title="${product.name}" href="${ctx }/item/${product.productNumber}"><img class="thumb" src="${ctximg}/${product.picImg}" width="40" height="40" alt="${product.name}"><span class="text">${product.name}</span></a> </li>
                          </c:forEach>
                        </ul>
                        <ul class="children-list children-list-col children-list-col-3">
                          <c:forEach items="${categoryInNavVO.products}" var="product" begin="12" end="17">
                            <li> <a class="link" title="${product.name}" href="${ctx }/item/${product.productNumber}"><img class="thumb" src="${ctximg}/${product.picImg}" width="40" height="40" alt="${product.name}"><span class="text">${product.name}</span></a> </li>
                          </c:forEach>
                        </ul>
                        <ul class="children-list children-list-col children-list-col-4">
                          <c:forEach items="${categoryInNavVO.products}" var="product" begin="17" end="23">
                            <li> <a class="link" title="${product.name}" href="${ctx }/item/${product.productNumber}"><img class="thumb" src="${ctximg}/${product.picImg}" width="40" height="40" alt="${product.name}"><span class="text">${product.name}</span></a> </li>
                          </c:forEach>
                        </ul>
                      </div>
                    </c:otherwise>
                  </c:choose>
                </li>
              </c:forEach>
            </ul>
          </div>
          <!--     轮播top菜单导航end       --> 
        </li>
        <c:forEach items="${indexClassify }" var="indexClassify">
          <li class="nav-item"> <a class="link" href="${indexClassify.href }" target="${indexClassify.target }"><span class="text">${indexClassify.name }</span><span class="arrow"></span></a> </li>
        </c:forEach>
      </ul>
    </div>
    <div class="header-search">
      <form id="J_searchForm" class="search-form clearfix" action="//search.mi.com/search" method="get">
        <label for="search" class="hide">站内搜索</label>
        <input class="search-text" type="search" id="search" name="keyword" autocomplete="off">
        <input type="submit" class="search-btn iconfont" value="">
        <div class="search-hot-words" style="display: block;"> <a href="#">手环</a><a href="#">小米手机4</a> </div>
        <div id="J_keywordList" class="keyword-list" style="display:none;">
          <ul class="result-list">
            <li data-key="移动电源"> <a href="#">移动电源<span class="result">约有22件</span></a> </li>
            <li data-key="空气净化器"> <a href="#">空气净化器<span class="result">约有2件</span></a> </li>
            <li data-key="小米手环"><a href="#">小米手环<span class="result">约有5件</span></a> </li>
            <li data-key="WiFi"><a href="//search.mi.com/search_WiFi">WiFi<span class="result">约有7件</span></a> </li>
            <li data-key="自拍杆"><a href="#">自拍杆<span class="result">约有4件</span></a> </li>
            <li data-key="小米体重秤"><a href="#">小米体重秤<span class="result">约有1件</span></a> </li>
            <li data-key="小蚁摄像机"><a href="#">小蚁摄像机<span class="result">约有2件</span></a> </li>
            <li data-key="运动相机"><a href="#">运动相机<span class="result">约有2件</span></a> </li>
            <li data-key="智能插座"><a href="#">智能插座<span class="result">约有5件</span></a> </li>
            <li data-key="配件优惠套装"><a href="#">配件优惠套装<span class="result">约有15件</span></a> </li>
          </ul>
        </div>
      </form>
    </div>
  </div>
</div>
<!--     轮播top菜单导航 end         --> 

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
                  <p class="content-detail"> <a href="" target="_blank">${commentVO.comment.content }</a> </p>
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
          <div class="comment-page-nav-list" id="J_commentPagenav">
            <c:if test="${pageInfo.total gt pageInfo.pagesize}">
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