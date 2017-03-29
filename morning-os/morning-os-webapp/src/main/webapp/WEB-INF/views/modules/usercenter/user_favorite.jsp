<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>我的收藏夹 - 猫宁商城</title>
<link rel="stylesheet" href="${ctxsta}/web/css/main.css">
</head>
<body>
<!-- 轮播top菜单导航引入 -->
<jsp:include page="/WEB-INF/views/modules/common/site-header.jsp" />
<!-- 轮播top菜单导航引入 --> 

<!--     导航栏 begin       -->
<div class="breadcrumbs">
  <div class="container-fluid"> <a href="" >首页</a><span class="sep">&gt;</span><span>个人中心</span> </div>
</div>
<!--     导航栏 begin       --> 

<!--     个人中心 begin       -->
<div class="page-main user-main">
  <div class="container-fluid">
    <div class="row">
      <div class="span4">
        <div class="uc-box uc-sub-box">
          <div class="uc-nav-box">
            <div class="box-hd">
              <h3 class="title">我的收藏夹</h3>
            </div>
            <div class="box-bd">
              <ul class="uc-nav-list">
                <li><a href="${ctx}/uc/order/list">我的订单</a></li>
                <li><a href="${ctx}/uc/order/comment" data-count="comment" data-count-style="bracket">评价晒单</a></li>
              </ul>
            </div>
          </div>
          <div class="uc-nav-box">
            <div class="box-hd">
              <h3 class="title">个人中心</h3>
            </div>
            <div class="box-bd">
              <ul class="uc-nav-list">
                <li><a href="${ctx}/uc/user/portal">我的个人中心</a></li>
                <li><a href="">消息通知<i class="J_miMessageTotal"></i></a></li>
                <li><a href="${ctx}/uc/user/favorite">喜欢的商品</a></li>
                <li><a href="${ctx}/uc/user/address">收货地址</a></li>
              </ul>
            </div>
          </div>
          <div class="uc-nav-box">
            <div class="box-hd">
              <h3 class="title">账户管理</h3>
            </div>
            <div class="box-bd">
              <ul class="uc-nav-list">
                <li><a href="" target="_blank">个人信息</a></li>
                <li><a href="" target="_blank">修改密码</a></li>
                <li><a href="" target="_blank">社区VIP认证</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="span16">
        <div class="uc-box uc-main-box">
          <div class="uc-content-box">
            <div class="box-hd">
              <h1 class="title">喜欢的商品<small>已收藏了${pageInfo.total} 个喜欢的商品!</small></h1>
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
            <div class="box-bd">
              <div class="xm-goods-list-wrap">
                <ul class="xm-goods-list clearfix">
                <c:forEach items="${favorites}" var="favorite">
                  <li class="xm-goods-item">
                    <div class="figure figure-img"><a href="${ctx}/item/${favorite.productNumber}" target="_blank"><img src="${ctximg }/${favorite.picImg}" alt="${favorite.name}" title="${favorite.name}"/></a></div>
                    <h3 class="title"><a href="${ctx}/item/${favorite.productNumber}" target="_blank">${favorite.name}</a></h3>
                    <p class="price"> ${favorite.showPrice}元 </p>
                    <p class="rank"></p>
                    <div class="actions"> <a class="btn btn-small btn-line-gray J_delFav" href="javascript:void(0)" onclick="favorite_delete(this,${favorite.productNumber})">删除</a> <a class="btn btn-small btn-primary" target="_blank" href="${ctx}/item/${favorite.productNumber}">查看详情</a> </div>
                  </li>
                </c:forEach>
                </ul>
              </div>
              <div class="xm-pagenavi">
              <c:if test="${pageInfo.total gt pageInfo.pagesize and not empty favorites}">
	          	<div id="pager" data-pager-href="${ctx}/uc/user/favorite?page=" data-pager-totalPage="${pageInfo.totalPage}" data-pager-nowpage="${pageInfo.nowpage}" data-sort="${sort}"></div>
              </c:if>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!--     个人中心 end       -->

<myfooter> 
  <!-- layer javascript -->
  <script src="${ctxsta}/common/layer/layer.js"></script>
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
  					if (result.success == true) {
						window.location.reload();
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