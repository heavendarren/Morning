<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<c:forEach items="${questions}" var="question">
  <li data-id="${question.questionId}">
    <div class="left-hand float ">
      <div class="hand-block J_questionLike " data-id="${question.questionId}" onclick="question_like(this,${question.questionId})"> <i class="glyphicon glyphicon-thumbs-up"></i><br>
        <span class="hand-number">${question.goodCount}</span> </div>
    </div>
    <div class="mid-detail float ">
      <h3 class="question-title"><a target="_blank" title="${question.content}">${question.content}</a></h3>
      <div class="answer-content figcaption">
        <p title="${question.answerContent}"> ${question.answerContent} </p>
      </div>
    </div>
    <div class="right-date float">
      <div class="question-title-date"><fmt:formatDate value="${question.createTime}" pattern="yyyy年MM月dd日" /></div>
      <div class="answer-content-date"><fmt:formatDate value="${question.answerTime}" pattern="yyyy年MM月dd日" /></div>
    </div>
  </li>
</c:forEach>
<script type="text/javascript">
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
</script>