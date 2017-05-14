<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>

<c:forEach items="${commentVOs}" var="comment">
  <li data-id="${comment.commentId}">
    <div class="user-image"> <img src="${ctximg}/${comment.picImg}" alt="${comment.userName}"> </div>
    <div class="user-emoj">&nbsp;超爱&nbsp;<i class="glyphicon glyphicon-thumbs-up"></i> </div>
    <div class="user-name-info"> <span class="user-name"> ${comment.userName}</span> <span class="user-time"><fmt:formatDate value="${comment.createTime}" pattern="yyyy年MM月dd日" /></span> <span class="pro-info">白色</span> </div>
    <div class="user-hand-block"> <a href="javascript:void(0);" data-commentid="${comment.commentId}" class="J_hasHelp" onclick="comment_like(this,${comment.commentId})"> <i class="glyphicon glyphicon-thumbs-up"></i>&nbsp;&nbsp;赞&nbsp;&nbsp;<span class="amount"> ${comment.goodCount}</span></a> </div>
    <dl class="user-comment">
      <dt class="user-comment-content J_commentContent">
        <p class="content-detail"><a href="" target="_blank"> ${comment.content} </a> </p>
      </dt>
      <dd class="user-comment-self-input">
        <div class="input-block">
          <input type="text" placeholder="回复楼主" class="J_commentAnswerInput">
          <a href="javascript:void(0);" class="btn  answer-btn J_commentAnswerBtn" data-commentid="${comment.commentId}">回复</a> </div>
      </dd>
      <c:forEach items="${comment.commentReplies}" var="commentReply">
        <c:if test="${commentReply.type eq 1}">
          <dd class="user-comment-answer"> <img class="self-image" src="${ctximg}/${commentReply.picImg}" alt="${commentReply.userName}">
            <p>${commentReply.content}<span class="official-name">&nbsp;&nbsp;官方回复</span> <a href="javascript:void(0);" class="J_csLike" data-commentid="${commentReply.commentReplyId}" onclick="comment_csLike(this,${commentReply.commentReplyId})"> <i class="glyphicon glyphicon-thumbs-up"></i>&nbsp;赞客服&nbsp; <span class="amount">${commentReply.goodCount}</span> </a></p>
          </dd>
        </c:if>
        <c:if test="${commentReply.type eq 0}">
          <dd class="user-comment-answer"> <img class="self-image" src="${ctximg}/${commentReply.picImg}" alt="${commentReply.userName}">
            <p>${commentReply.content}&nbsp;&nbsp;- <span class="answer-user-name">${commentReply.userName}</span> </p>
          </dd>
        </c:if>
      </c:forEach>
    </dl>
  </li>
</c:forEach>
<script type="text/javascript">
/**
 * input 聚焦事件
 */
$(function() {
	$(" input[ type='text' ] ").focus(function() {
		$(this).parent().parent().addClass('showIn');
	});
	$(" input[ type='text' ] ").blur(function() {
		$(this).parent().parent().removeClass('showIn');
	});
});
/**
 * 随机分配评论颜色（最有帮助）
 */
$(function() {
	var $elements = $('#J_supComment').children('li');
	var len = $elements.length;
	// alert('有 ' + len + ' 个相同class');
	$elements.each(function() {
		var $this = $(this);
		var num = (Math.floor(Math.random() * 10) + 1); //输出1-10的随机数搜索
		$this.addClass('item-rainbow-' + num);
	});
})

/**
 * 商品评论点赞
 */
function comment_like(obj, commentId) {
	var data = {};
	data.commentId = commentId;
	$.ajax({
		type : 'put',
		dataType : 'json',
		data : data,
		url : baselocation + '/comment/like',
		success : function(result) {
			if (result.code == 1) {
				$(obj).addClass("current");
				$(obj).children(".amount").text(result.data);
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
 * 客服评论点赞
 */
function comment_csLike(obj, commentReplyId) {
	var data = {};
	data.commentReplyId = commentReplyId;
	$.ajax({
		type : 'put',
		dataType : 'json',
		data : data,
		url : baselocation + '/comment/csLike',
		success : function(result) {
			if (result.code == 1) {
				$(obj).addClass("current");
				$(obj).children(".amount").text(result.data);
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
</script>