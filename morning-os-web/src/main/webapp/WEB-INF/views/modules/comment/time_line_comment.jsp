<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>

<c:forEach items="${commentVOs}" var="comment">
  <li class="purple timelineunit J_commentContent" data-id="${comment.commentId}">
    <h4 class="line-time"><fmt:formatDate value="${comment.createTime}" pattern="yyyy年MM月dd日" /></h4>
    <p class="line-content"> <a href="/comment/commentDetail/comment_id/${comment.commentId}" target="_blank"> ${comment.content} </a> </p>
    <div class="line-foot">
      <div class="line-left">来自于 ${comment.userName}</div>
      <div class="line-right J_hasHelp" data-commentid="${comment.commentId}" onclick="comment_like(this,${comment.commentId})"> <i class="glyphicon glyphicon-thumbs-up"></i>&nbsp;&nbsp;有帮助&nbsp;&nbsp;<span class="amount">${comment.goodCount}</span> </div>
    </div>
    <div class="line-dot"></div>
  </li>
</c:forEach>
<script type="text/javascript">
/**
 * 随机分配评论颜色（最新评论）
 */
$(function() {
	var $elements = $('.line-dot');
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
</script>