<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>我的收藏夹 - 猫宁商城</title>
</head>
<body>
<div class="span16">
  <div class="uc-box uc-main-box">
    <div class="uc-content-box">
      <div class="box-hd">
        <h1 class="title">喜欢的商品<small class="hide">已收藏了${pageInfo.total} 个喜欢的商品!</small></h1>
        <div class="more clearfix hide">
          <ul class="filter-list J_addrType">
            <li class="first active"><a href="">喜欢的商品</a></li>
            <li><a href="">已下架的商品</a></li>
          </ul>
        </div>
      </div>
      <c:if test="${empty favorites}">
        <div class="box-bd">
          <p class="empty">您暂未收藏任何商品。</p>
        </div>
      </c:if>
      <c:if test="${not empty favorites}">
        <div class="box-bd">
          <div class="xm-goods-list-wrap">
            <ul class="xm-goods-list clearfix">
              <c:forEach items="${favorites}" var="favorite">
                <li class="xm-goods-item">
                  <div class="figure figure-img"><a href="${ctx}/detail/${favorite.productNumber}" target="_blank"><img src="${ctximg}/${favorite.picImg}" alt="${favorite.name}" title="${favorite.name}"/></a></div>
                  <h3 class="title"><a href="${ctx}/detail/${favorite.productNumber}" target="_blank">${favorite.name}</a></h3>
                  <p class="price"> ${favorite.showPrice}元 </p>
                  <p class="rank"></p>
                  <div class="actions"> <a class="btn btn-small btn-line-gray J_delFav" href="javascript:void(0)" onclick="favorite_delete(this,${favorite.productNumber})">删除</a> <a class="btn btn-small btn-primary" target="_blank" href="${ctx}/detail/${favorite.productNumber}">查看详情</a> </div>
                </li>
              </c:forEach>
            </ul>
          </div>
          <div class="xm-pagenavi">
            <c:if test="${pageInfo.total gt pageInfo.limit}">
              <div id="pager" data-pager-href="${ctx}/uc/user/favorite?page=" data-pager-totalPage="${pageInfo.totalPage}" data-pager-current="${pageInfo.current}"></div>
            </c:if>
          </div>
        </div>
      </c:if>
    </div>
  </div>
</div>
<myfooter> 
  <!-- layer javascript --> 
  <script src="${ctxsta}/common/layer/layer.js"></script> 
  <!-- 分页js --> 
  <script src="${ctxsta}/common/pager/jquery.pager.js"></script> 
  <script type="text/javascript">
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
  
  	//删除收藏商品
  	function favorite_delete(obj, data) {
  		layer.confirm('确认要删除吗？', {
  			btn : [ '确定', '取消' ] //按钮
  		}, function() {
  			$.ajax({
  				type : 'delete',
  				dataType : 'json',
  				url : baselocation + '/uc/user/favorite/' + data,
  				success : function(result) {
  					if (result.code == 1) {
  						$(obj).parent().parent("li").remove();
  						layer.msg('已删除!', {
  							icon : 1,
  							time : 1000
  						});
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