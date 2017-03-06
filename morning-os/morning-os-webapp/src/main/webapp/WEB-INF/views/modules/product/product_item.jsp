<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>猫宁商城</title>
<link rel="stylesheet" href="${ctxsta}/web/css/goods.css">
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

<!-- 商品详情 begin -->
<div class="goods-detail"> 
  <!-- 商品简介begin-->
  <div class="goods-detail-info  clearfix J_goodsDetail">
    <div class="container-fluid">
      <div class="row">
        <div class="span13  J_mi_goodsPic_block goods-detail-left-info">
          <div class="goods-pic-box" id="J_mi_goodsPicBox">
            <div class="goods-big-pic J_bigPicBlock"> <img src="" class="J_goodsBigPic" id="J_BigPic"></div>
            <div class="goods-pic-loading">
              <div class="loader loader-gray"></div>
            </div>
            <div class="goods-small-pic clearfix">
              <ul id="goodsPicList">
                <c:forEach items="${productImages }" var="productImage">
                  <li > <img src="${ctximg }/${productImage.picImg}" alt="${product.name }" title="${product.name }"> </li>
                </c:forEach>
              </ul>
            </div>
          </div>
          <div class="span11 goods-batch-img-list-block J_goodsBatchImg"> </div>
        </div>
        <div class="span7 goods-info-rightbox">
          <div class="goods-info-leftborder"></div>
          <dl class="goods-info-box ">
            <dt class="goods-info-head">
              <dl id="J_goodsInfoBlock">
                <dt id="goodsName" class="goods-name"> ${product.name } </dt>
                <dd class="goods-subtitle">
                  <p> ${product.introduce } </p>
                </dd>
                <dd class="goods-info-head-tip">
                  <ul>
                    <c:if test="${not empty label.labelName }">
                      <li class="others"><i>${label.labelName }</i> </li>
                    </c:if>
                  </ul>
                </dd>
                <dd class="goods-info-head-price clearfix"> <b class="J_mi_goodsPrice sys_item_price">${product.showPrice }</b> <i>&nbsp;元</i> <del> 赠送积分:<span class="J_mi_marketPrice sys_item_score">79元</span> </del> </dd>
                <c:forEach items="${kindVOs }" var="kindVO">
                  <dd class="goods-info-head-size clearfix sys_item_specpara"  data-sid="${kindVO.specificationId }"> <span class="style-label">${kindVO.name }：</span>
                    <ul class="clearfix" id="J_goodsSize">
                      <c:forEach items="${kindVO.kindAttributes }" var="kindAttribute">
                        <li data-aid="${kindAttribute.specAttrId }"><a href="javascript:;" class="item goodsStyle" title="${kindAttribute.name }">${kindAttribute.name }</a><i></i></li>
                      </c:forEach>
                    </ul>
                  </dd>
                </c:forEach>
                <dd class="goods-info-head-cart" id="goodsDetailBtnBox"> <a href="" id="goodsDetailAddCartBtn" class="btn goods-add-cart-btn" data-gid="2164700027" data-package="0" data-stat-id="3d749b02d4ba8b20"> <i class="glyphicon glyphicon-shopping-cart"></i>加入购物车 </a> <a id="goodsDetailCollectBtn" data-isfavorite="false" class=" btn btn-gray  goods-collect-btn " data-stat-id="9d1c11913f946c7f"> <i class="glyphicon glyphicon-heart-empty"></i><i class="iconfont red J_redCopy"></i>&nbsp;喜欢&nbsp; </a> </dd>
                <dd class="goods-info-head-cart" id="goodsDetailBtnBoxForInform" style="display: none;"> <a href="" class="btn  btn-gray goods-over-btn" data-stat-id="01b1dbea83f08143"> <i class="iconfont "></i>到货通知 </a> <a id="goodsDetailCollectBtn" data-isfavorite="false" class=" btn btn-gray  goods-collect-btn " data-stat-id="9d1c11913f946c7f"> <i class="glyphicon glyphicon-heart-empty"></i><i class="iconfont red J_redCopy"></i>&nbsp;喜欢&nbsp; </a> </dd>
                <dd class="goods-info-head-userfaq">
                  <ul>
                    <li class="J_scrollHref" data-href="#goodsComment" data-index="2"> <i class="glyphicon glyphicon-edit"></i>&nbsp;评价&nbsp;<b>${productAttribute.commentNumber }</b> </li>
                    <li class="J_scrollHref mid" data-href="#goodsFaq" data-index="3"> <i class="glyphicon glyphicon-question-sign"></i>&nbsp;提问&nbsp;<b>${productAttribute.questionNumber }</b> </li>
                    <li class="J_scrollHref " data-href="#goodsComment" data-index="2"> <i class="glyphicon glyphicon-thumbs-up"></i>&nbsp;满意度&nbsp;<b>${productAttribute.commentAverage }</b> </li>
                  </ul>
                </dd>
              </dl>
            </dt>
          </dl>
        </div>
      </div>
    </div>
  </div>
  <!-- 商品简介end-->
  <div class="full-screen-border"></div>
  <!-- 商品详情导航栏 begin -->
  <div class="goods-detail-nav" id="goodsDetail">
    <div class="container-fluid">
      <ul class="detail-list J_detailNav J_originNav" >
        <li class='current detail-nav'> <a href="#goodsDesc" data-index='0'  class='J_scrollHref'>详情描述</a> </li>
        <li class='detail-nav'> <a href="#goodsParam" data-index='1' class='J_scrollHref'>规格参数</a> </li>
        <li class='detail-nav'> <a href="#goodsComment" data-index='2' class='J_scrollHref'>评价晒单 <i>(${productAttribute.commentNumber })</i></a> </li>
        <li class='last detail-nav'> <a href="#goodsFaq" data-index='3' class='J_scrollHref'>商品提问 <i>(${productAttribute.questionNumber })</i></a> </li>
      </ul>
    </div>
  </div>
  <!-- 商品详情导航栏 begin --> 
  
  <!-- 商品详情介绍 begin -->
  <div class="goods-detail-desc J_itemBox" id="goodsDesc" style="display: block;">
    <div class="container">
      <div class="shape-container">
        <p class="detailBlock">
        <p><img alt=""  src=""> <img alt=""  src=""> <img alt=""  src=""></p>
        </p>
      </div>
    </div>
  </div>
  <!-- 商品详情介绍 begin --> 
  
  <!-- 商品详情参数 begin -->
  <div class="goods-detail-nav-name-block J_itemBox" id="goodsParam">
    <div class="container-fluid main-block">
      <div class="border-line"></div>
      <h2 class="nav-name">规格参数</h2>
    </div>
  </div>
  <!--规格-->
  <div class="goods-detail-param  J_itemBox">
    <div class="container-fluid">
      <ul class='param-list'>
        <li class='goods-img'> <img alt="${pruduct.name }" src="${ctximg}/${product.picImg}" title="${pruduct.name }"> </li>
        <li class="goods-tech-spec">
          <dl>
            <dd>
              <ul>
                <c:forEach items="${productParameters }" var="productParameter">
                  <li> ${productParameter.name }：${productParameter.value } </li>
                </c:forEach>
              </ul>
            </dd>
          </dl>
        </li>
      </ul>
    </div>
  </div>
  <!-- 商品详情参数 begin --> 
  
  <!-- 商品详情评价晒单 begin -->
  <div class="goods-detail-nav-name-block J_itemBox" id="goodsComment">
    <div class="container-fluid main-block">
      <div class="border-line"></div>
      <h2 class="nav-name">评价晒单</h2>
    </div>
  </div>
  <div class="goods-detail-comment J_itemBox hasContent" id="goodsCommentContent" style="display: block;">
    <div class="goods-detail-comment-groom" id="J_recommendComment" style="display:${productAttribute.commentNumber eq 0?'none':'black'}">
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
    <div class="goods-detail-comment-content" id="J_commentDetailBlock" style="display:${productAttribute.commentNumber eq 0?'none':'black'}">
      <div class="container-fluid">
        <div class="row">
          <div class="span14 goods-detail-comment-list">
            <div class="comment-order-title">
              <div class="left-title">
                <h3 class="comment-name">最有帮助的评价</h3>
              </div>
            </div>
            <ul class="comment-box-list" id="J_supComment">
              <c:forEach items="${highCommentVOs }" var="highCommentVO">
                <li class="item-rainbow-5" data-id="${highCommentVO.comment.commentId }">
                  <div class="user-image"> <img src="${ctximg }/${highCommentVO.comment.picImg}" alt="${highCommentVO.comment.userName}"> </div>
                  <div class="user-emoj">&nbsp;超爱&nbsp;<i class="glyphicon glyphicon-thumbs-up"></i> </div>
                  <div class="user-name-info"> <span class="user-name"> ${highCommentVO.comment.userName}</span> <span class="user-time">${highCommentVO.comment.createTime}</span> <span class="pro-info">白色</span> </div>
                  <div class="user-hand-block"> <a href="javascript:void(0);" data-commentid="${highCommentVO.comment.commentId }" class="J_hasHelp "> <i class="glyphicon glyphicon-thumbs-up"></i>&nbsp;&nbsp;赞&nbsp;&nbsp;<span class="amount"> ${highCommentVO.comment.goodCount}</span></a> </div>
                  <dl class="user-comment">
                    <dt class="user-comment-content J_commentContent">
                      <p class="content-detail"><a href="/comment/commentDetail/comment_id/${highCommentVO.comment.commentId}" target="_blank"> ${highCommentVO.comment.content} </a> </p>
                    </dt>
                    <dd class="user-comment-self-input">
                      <div class="input-block">
                        <input type="text" placeholder="回复楼主" class="J_commentAnswerInput">
                        <a href="javascript:void(0);" class="btn  answer-btn J_commentAnswerBtn" data-commentid="${highCommentVO.comment.commentId }">回复</a> </div>
                    </dd>
                    <c:forEach items="${highCommentVO.commentReplies}" var="commentReply">
                      <c:if test="${commentReply.type eq 1 }">
                        <dd class="user-comment-answer"> <img class="self-image" src="${ctximg }/${commentReply.picImg}" alt="${commentReply.userName}">
                          <p>${commentReply.content}<span class="official-name">官方回复</span> <a href="javascript:void(0);" class="J_csLike " data-commentid="${commentReply.commentReplyId}"> <i class="glyphicon glyphicon-thumbs-up"></i>&nbsp;赞客服&nbsp; <span class="amount">${commentReply.goodCount}</span> </a></p>
                        </dd>
                      </c:if>
                      <c:if test="${commentReply.type eq 0 }">
                        <dd class="user-comment-answer"> <img class="self-image" src="${ctximg }/${commentReply.picImg}" alt="${commentReply.userName}">
                          <p>${commentReply.content}- <span class="answer-user-name">${commentReply.userName}</span> </p>
                        </dd>
                      </c:if>
                    </c:forEach>
                    <dd class="user-comment-answer-more"> <a href="//order.mi.com/comment/commentDetail/comment_id/11282674" target="_blank"> 查看全部7条回复&gt; </a> </dd>
                  </dl>
                </li>
              </c:forEach>
            </ul>
          </div>
          <div class="span6 goods-detail-comment-timeline">
            <h3 class="comment-name">最新评价</h3>
            <ul class="comment-timeline-list" id="J_timelineComment">
              <c:forEach items="${newComments }" var="newComment">
                <li class="purple timelineunit J_commentContent" data-id="${newComment.commentId }">
                  <h4 class="line-time">3小时前</h4>
                  <p class="line-content"> <a href="/comment/commentDetail/comment_id/${newComment.commentId }" target="_blank"> ${newComment.content } </a> </p>
                  <div class="line-foot">
                    <div class="line-left">来自于 ${newComment.userName }</div>
                    <div class="line-right J_hasHelp " data-commentid="${newComment.commentId}"> <i class="glyphicon glyphicon-thumbs-up"></i>&nbsp;&nbsp;有帮助&nbsp;&nbsp;<span class="amount">${newComment.goodCount }</span> </div>
                  </div>
                  <div class="line-dot"></div>
                </li>
              </c:forEach>
            </ul>
          </div>
          <div class="span20 goods-detail-comment-more" style="display:${productAttribute.commentNumber gt 10?'block':'none'}" id="J_loadMoreHref"> <a target="_blank" href="//item.mi.com/comment/commentList/gid/1164700049/pid/4943" data-stat-id="92e834619fcd20ef" >查看更多评价</a> </div>
        </div>
      </div>
    </div>
    <div class="goods-detail-null-content" style="display:${productAttribute.commentNumber eq 0?'block':'none'}" id="J_commentTipInfo">
      <div class="container">
        <h3>暂时还没有评价</h3>
        <p>期待你分享科技带来的乐趣</p>
      </div>
    </div>
  </div>
  <!-- 商品详情评价晒单 end --> 
  
  <!-- 商品详情商品提问 begin -->
  <div class="goods-detail-nav-name-block J_itemBox" id="goodsFaq" style="display: block;">
    <div class="container main-block">
      <div class="border-line"></div>
      <h2 class="nav-name">商品提问</h2>
    </div>
  </div>
  <div class="goods-detail-question-block J_itemBox hasContent" id="goodsFaqContent" style="display: block;">
    <div class="container-fluid">
      <div class="question-input">
        <input type="text" placeholder="输入你的提问" class="input-block J_inputQuestion" data-can-search="true" data-pagesize="6">
        <div class="btn question-btn J_btnQuestion">提问</div>
      </div>
      <div class="question-order J_questionOrderBlock" style="display:${productAttribute.questionNumber eq 0?'none':'block'}">
        <div class="order-block"> <a href="javascript:void(0);" class="J_questionHelp current" data-pagesize="6" data-stat-id="422e5161e39bf28f" onclick="_msq.push(['trackEvent', '9de9578f29e893b5-422e5161e39bf28f', 'javascript:void(0);', 'pcpid', '']);">最有帮助</a> <span class="sep">|</span> <a href="javascript:void(0);" class="J_questionNew" data-pagesize="6" data-stat-id="24e1681246710ec7" onclick="_msq.push(['trackEvent', '9de9578f29e893b5-24e1681246710ec7', 'javascript:void(0);', 'pcpid', '']);">最新</a> </div>
      </div>
      <ul class="question-content" id="J_goodsQuestionBlock">
        <c:forEach items="${highQuestions }" var="highQuestion">
          <li data-id="${highQuestion.questionId }">
            <div class="left-hand float ">
              <div class="hand-block J_questionLike " data-id="${highQuestion.questionId }"> <i class="glyphicon glyphicon-thumbs-up"></i><br>
                <span class="hand-number">${highQuestion.goodCount }</span> </div>
            </div>
            <div class="mid-detail float ">
              <h3 class="question-title"><a target="_blank" href="comment/askDetail/gid/1164700048/askid/1486143/pid/4943">${highQuestion.content }</a></h3>
              <div class="answer-content figcaption">
                <p> ${highQuestion.answerContent } </p>
              </div>
            </div>
            <div class="right-date float">
              <div class="question-title-date">${highQuestion.createTime }</div>
              <div class="answer-content-date">${highQuestion.answerTime }</div>
            </div>
          </li>
        </c:forEach>
      </ul>
      <div class="question-null-content J_nullInfo">抱歉，没有找到答案，您可以点击“提问”提交此条提问给已经购买者、小米官方客服和产品经理，我们会及时回复。</div>
      <div class="goods-detail-null-content" style="display:${productAttribute.questionNumber eq 0?'block':'none'}" id="J_questionTipInfo">
        <div class="container">
          <h3>暂时还没有提问</h3>
          <p>对商品还不太了解，问问看吧</p>
        </div>
      </div>
      <div class="more-question"> <a href="/comment/asklist/gid/1164700048/pid/4943" target="_blank" data-stat-id="a0830d605ae0b43e" style="display:${productAttribute.questionNumber gt 6?'block':'none'}">查看全部 <span id="J_goodsQuestionAmount"></span> ${productAttribute.questionNumber }条已回答的问题 &gt;</a> </div>
    </div>
  </div>
  <!-- 商品详情商品提问 end --> 
  
  <!-- 商品详情售后服务 begin -->
  <div class="goods-detail-nav-name-block " id="goodsService">
    <div class="container-fluid main-block">
      <div class="border-line"></div>
      <h2 class="nav-name">售后服务与退换货流程</h2>
    </div>
  </div>
  <!--售后服务与退换货流程-->
  <div class="goods-detail-service-block">
    <div class="container-fluid">
      <div class="row">
        <div class="span8 service-day-img"> <img src="${ctxsta}/web/img/timg.jpg" alt=""> </div>
        <div class="span11 service-detail-block">
          <div class="service-detail-content" id="J_serviceCon">
            <h3 class="title"></h3>
            <h4 class="sub-title">
              <div class="tit">A</div>
              phone飞车: </h4>
            <p class="content"> 1）产品自签收后7天内无理由退货，14日内保修<br>
              2）以下情况不能申请售后服务：<br>
              a. 未经授权的修理、改装、改动、碰撞、误用、进水、及不正确的使用所造成的问题。<br>
              b. 商品的外包装、附件、说明书不完整；发票缺失或涂改。<br>
              c. 产品已使用（产品自身质量问题除外）。<br>
              d. 其他不符合售后流程的情况。<br>
              3）产品自身质量问题范围：<br>
              a. 汽车不正常工作且不存在电量低、电池松动或接触点未连好、电池没电、电子部件损坏、开关键处于关的情况。<br>
              b. 电池不能充电且不存在电池连接点接触不好的情况。<br>
              c. 玩用时间短且不存在电池能量低、能量耗尽的情况。<br>
              d. 低速度且不存在电池没电、玩用的地面不平的情况。<br>
              e. wifi链接失败且不存在电量不足、超出遥控范围的情况。<br>
              3）小米之家暂不办理自提和退换货业务，现阶段仅提供网上办理及电话办理两种方式<br>
            </p>
            <h4 class="sub-title">
              <div class="tit">A</div>
              米兔积木机器人: </h4>
            <p class="content"> 1.产品自签收后7天内无理由退货；7天内质量问题，可以退货、换货；15日内产品质量问题可以换货或者维修；1年内，主控、电机、适配器产品质量问题可以维修，积木件不保。<br>
              2.以下情况不能申请售后服务：<br>
              a. 未经授权的修理、改装、改动、碰撞、误用、进水、及不正确的使用所造成的问题;<br>
              b. 已超过三包有效期；<br>
              c. 因不可抗力造成的损坏；<br>
              d. 不符合《产品性能故障表》所列性能故障的情况；<br>
              e. 因人为原因导致本产品及其配件产生《产品性能故障表》所列性能故障。<br>
              3.积木件超出15天，1年内：自您签收日起12个月内，积木件缺失、损坏可享受一次免费补换件的机会，补换件数量不超过10个。请联系北京爱其科技有限公司服务热线：400-012-6281。<br>
              4.小米之家暂不办理自提和退换货业务，现阶段仅提供网上办理及电话办理两种方式。<br>
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--售后服务与退换货流程--> 
  <!-- 商品详情售后服务 end -->
  <div id="J_alsoBuyWrap"  style='margin-top:100px;'></div>
  <div id="J_recentGoods"   style='margin-top:100px;padding-bottom:130px;'></div>
</div>
<!-- 商品详情 end --> 

<!-- 跟随 导航 begin -->
<div class="goods-sub-bar  goods-sub-bar-play" id="goodsSubBar"  style="top: 0px;display: none;">
  <div class="container-fluid">
    <div class="row">
      <div class="span4">
        <dl class="goods-sub-bar-info clearfix">
          <dt> <img alt="${pruduct.name }" src="${ctximg}/${product.picImg}"> </dt>
          <dd> <strong>${product.name }</strong>
            <p> <em><span class="J_mi_goodsPrice">${product.showPrice }</span>元</em> <del><span class="J_mi_marketPrice">79元</span></del> </p>
          </dd>
        </dl>
      </div>
      <div class="span12">
        <div class="goods-desc-menu" id="goodsSubMenu">
          <ul class="detail-list J_pro_related_btns  J_detailNav">
            <li class="current"> <a href="#goodsDesc"  data-index="1"  class="J_scrollHref">详情描述</a> </li>
            <li class=""> <a href="#goodsParam" data-index="1" class="J_scrollHref">规格参数</a> </li>
            <li class=""> <a href="#goodsComment" data-index="2" class="J_scrollHref">评价晒单 <i>(${productAttribute.commentNumber })</i></a> </li>
            <li> <a href="#goodsFaq" data-index="3" class="J_scrollHref">商品提问 <i>(${productAttribute.questionNumber })</i></a> </li>
          </ul>
        </div>
      </div>
      <div class="span4">
        <div class="fr" id="goodsSubBarBtnBox"> <a href="" class="btn goods-add-cart-btn" id="goodsSubBarAddCartBtn" data-disabled="false" data-gid="2164700027" data-package="0" data-stat-id="2123b909ff50987b"> <i class="glyphicon glyphicon-shopping-cart"></i>加入购物车</a> </div>
      </div>
    </div>
  </div>
</div>
<!-- 跟随 导航 end -->
<myfooter> 
  <script>
//价格json
var sys_item=${productSpecifications eq null ?"0":productSpecifications};
var default_price=${product.showPrice};
var score;
//商品规格选择
$(function(){
	$(".goods-info-head .sys_item_specpara").each(function(){
		var i=$(this);
		var p=i.find("ul>li");
		p.click(function(){
			if(!!$(this).hasClass("current")){
				$(this).removeClass("current");
				i.removeAttr("data-attrval");
			}else{
				$(this).addClass("current").siblings("li").removeClass("current");
				i.attr("data-attrval",$(this).attr("data-aid"))
			}
			getattrprice() //输出价格
		})
	})
	
	//获取对应属性的价格
	function getattrprice(){
		var defaultstats=true;
		var _val='';
		var _resp={
			score:".sys_item_score",
			price:".sys_item_price"
		}  //输出对应的class
		$(".goods-info-head .sys_item_specpara").each(function(){
			var i=$(this);
			var v=i.attr("data-attrval");
			if(!v){
				defaultstats=false;
				$('#goodsDetailBtnBox').css('display', 'block');
				$('#goodsDetailBtnBoxForInform').css('display', 'none');
			}else{
				_val+=_val!=""?",":"";
				_val+=v;
			}
		})
		if(!!defaultstats){
			if(typeof(sys_item[_val]) == "undefined"){
				$('#goodsDetailBtnBox').css('display', 'none');
				$('#goodsDetailBtnBoxForInform').css('display', 'block');
			}else {
				_score=sys_item[_val]['score'];
				_price=sys_item[_val]['price'];
				$('#goodsDetailBtnBox').css('display', 'block');
				$('#goodsDetailBtnBoxForInform').css('display', 'none');
			}

		}else{
			_score=sys_item['score'];
			_price=sys_item['price'];
		}
		//输出价格
		$(_resp.score).text(_score);  ///其中的math.round为截取小数点位数
		$(_resp.price).text(_price);
	}
})
</script> 
</myfooter>
</body>
</html>