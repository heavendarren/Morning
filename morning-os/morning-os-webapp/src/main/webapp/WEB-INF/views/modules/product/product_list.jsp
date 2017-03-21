<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>猫宁商城</title>
<link rel="stylesheet" href="${ctxsta}/web/css/list.css">
</head>
<body>
<!-- 轮播top菜单导航引入 -->
<jsp:include page="/WEB-INF/views/modules/common/site-header.jsp" />
<!-- 轮播top菜单导航引入 --> 

<!--     分类导航栏 begin       -->
<div class="breadcrumbs">
  <div class="container-fluid"><a href='${ctx }/index'>首页</a>
    <c:forEach items="${upperCategories }" var="upperCategory"><span class="sep">&gt;</span><a href="${ctx}/list?categoryId=${upperCategory.categoryId}">${upperCategory.name }</a></c:forEach>
  </div>
</div>
<!--     分类导航栏 end       --> 

<!--     产品分类目录begin       -->
<div class="category">
  <div class="container-fluid">
    <div class="filter-box">
      <div class="filter-list-wrap">
        <dl class="filter-list clearfix">
          <dt>分类：</dt>
          <c:if test="${category.categoryId eq 1 }">
            <dd class="active">全部</dd>
          </c:if>
          <c:if test="${category.categoryId ne 1 }">
            <dd ><a href="${ctx}/list?categoryId=${upperCategory.categoryId}" title="${upperCategory.name}">全部</a></dd>
          </c:if>
          <c:forEach items="${lowerCategories }" var="lowerCategoriy">
            <dd class="${lowerCategoriy.categoryId eq category.categoryId ? 'active':''}"><a href="${ctx}/list?categoryId=${lowerCategoriy.categoryId}">${lowerCategoriy.name }</a></dd>
          </c:forEach>
        </dl>
        <a class="more J_filterToggle" href="javascript:void(0);" onclick="showMornCategory(this);" >更多<i class="glyphicon glyphicon-chevron-down"></i></a> </div>
    </div>
  </div>
</div>
<!--     产品分类目录end       --> 

<!--     产品分类内容begin       -->
<div class="content">
  <div class="container-fluid">
    <div class="order-list-box clearfix">
      <ul class="order-list">
        <li class="${sort eq 0 ? 'active':''} first"><a href="${ctx}/list?categoryId=${category.categoryId}&sort=0" rel="nofollow">推荐</a></li>
        <li class="${sort eq 1 ? 'active':''}"><a href="${ctx}/list?categoryId=${category.categoryId}&sort=1" rel="nofollow">新品</a></li>
        <li class="${sort eq 2 ? 'active':''}"><a href="${ctx}/list?categoryId=${category.categoryId}&sort=2" rel="nofollow">销量</a></li>
        <li class="${sort eq 6 ? 'active':''}"><a href="${ctx}/list?categoryId=${category.categoryId}&sort=6" rel="nofollow">价格 <i class="glyphicon glyphicon-arrow-up"></i></a></li>
        <li class="${sort eq 7 ? 'active':''}"><a href="${ctx}/list?categoryId=${category.categoryId}&sort=7" rel="nofollow">价格 <i class="glyphicon glyphicon-arrow-down"></i></a></li>
        <li class="${sort eq 3 ? 'active':''}"><a href="${ctx}/list?categoryId=${category.categoryId}&sort=3"  rel="nofollow">评论最多</a></li>
      </ul>
    </div>
    <div class="goods-list-box">
      <div class="goods-list clearfix">
        <c:forEach items="${productVOs }" var="product">
          <div class="goods-item">
            <div class="figure figure-img"><a title="${product.introduce}" href="${ctx }/item/${product.productNumber}"><img src="${ctximg}/${product.picImg}" title="${product.introduce}" width="200" height="200" alt="${product.name}" /></a></div>
            <p class="desc"></p>
            <h2 class="title"><a title="${product.name}" href="${ctx }/item/${product.productNumber}">${product.name}</a></h2>
            <p class="price">${product.showPrice}元</p>
            <div class="thumbs">
              <ul class="thumb-list clearfix">
                <li data-config='{"cid":"1161200063","gid":"2161200069","discount":"0","price":"99\u5143","new":0,"is-cos":0,"package":0,"hasgift":0,"postfree":0,"postfreenum":1,"cfrom":"list"}'><img src="${ctximg}/${product.picImg}" width="34" height="34" title="${product.introduce}" alt="${product.name}" /></li>
              </ul>
              <p class="desc"> ${product.introduce} </p>
            </div>
            <div class="actions clearfix"> <a class="btn-like J_likeGoods" data-cid="1161200061" href="javascript: void(0);"><i class="glyphicon glyphicon-heart-empty"></i> <span>喜欢</span></a> <a class="btn-buy J_buyGoods" data-gid="2161200067" href=""><span>加入购物车</span> <i class="glyphicon glyphicon-shopping-cart"></i></a> </div>
            <div class="flags">
              <c:if test="${not empty product.labelName}">
                <div class="flag">${product.labelName}</div>
              </c:if>
            </div>
            <div class="notice"></div>
          </div>
        </c:forEach>
      </div>
      <div class="xm-pagenavi">
        <c:if test="${fn:length(productVOs)>=9 || pageInfo.nowpage ne 1 }">
          <div id="pager" data-pager-href="${ctx }/list?categoryId=${category.categoryId}&sort=${sort}&page=" data-pager-totalPage="${pageInfo.totalPage}" data-pager-nowpage="${pageInfo.nowpage}" data-sort="${sort}"></div>
        </c:if>
      </div>
    </div>
  </div>
  <div id="J_renovateWrap" class="xm-recommend-container container-fluid xm-carousel-container">
    <h2 class="xm-recommend-title"><span>为你推荐</span></h2>
    <div class="xm-recommend">
      <div class="xm-carousel-wrapper" style="height: 340px; overflow:hidden;">
        <ul class=" list3">
          <li class="rainbow-item-1"> <a class="thumb" href="#"><img src="" srcset="//i3.mifile.cn/a4/T1fNK_BCLv1RXrhCrK.jpg 2x" alt="小米手机4"></a>
            <h3><a href="#">小米手机4</a></h3>
            <p class="desc">工艺和手感超乎想象</p>
            <p class="price">1299元起</p>
          </li>
          <li class="rainbow-item-2"> <a class="thumb" href=#><img src="" srcset="//i3.mifile.cn/a4/T1zMhgBmLv1RXrhCrK.jpg 2x" alt="小米电视主机"></a>
            <h3 class="title"><a href="#">小米电视主机</a></h3>
            <p class="desc">次世代智能电视主机，内置独立音响</p>
            <p class="price">999元</p>
          </li>
          <li class="rainbow-item-3"> <a class="thumb" href="#"><img src="" srcset="//i3.mifile.cn/a4/T1euDjBgET1R4cSCrK.png 2x" alt="小米盒子mini版(礼品装)"></a>
            <h3 class="title"><a href="#">小米盒子mini版(礼品装)</a></h3>
            <p class="desc">10亿美金影视库，内容新增83%</p>
            <p class="price">199元</p>
          </li>
          <li class="rainbow-item-4"> <a class="thumb" href="#"><img src="" srcset="//i3.mifile.cn/a4/T1aiAvBX_v1RXrhCrK.jpg 2x" alt="小米Note 女神版"></a>
            <h3 class="title"><a href="#">小米Note 女神版</a></h3>
            <p class="desc">科技与时尚的理想结合</p>
            <p class="price">1799元起</p>
          </li>
          <li class="rainbow-item-5"> <a class="thumb" href="#"><img src="" srcset="//i3.mifile.cn/a4/T1F0WjBCCT1RXrhCrK.jpg 2x" alt="小米路由器 mini"></a>
            <h3 class="title"><a href="#">小米路由器 mini</a></h3>
            <p class="desc">主流双频AC智能路由器</p>
            <p class="price">129元</p>
          </li>
          <li class="rainbow-item-6"> <a class="thumb" href="#"><img src="" srcset="//i3.mifile.cn/a4/T1nNK_B5dv1RXrhCrK.jpg 2x" alt="小米空气净化器"></a>
            <h3 class="title"><a href="#">小米空气净化器</a></h3>
            <p class="desc">双风机 净化能力高达 406m³/h</p>
            <p class="price">899元</p>
          </li>
          <li class="rainbow-item-7"> <a class="thumb" href="#"><img src="" srcset="//i3.mifile.cn/a4/T1SPVjBmWT1RXrhCrK.jpg 2x" alt="小米蓝牙耳机"></a>
            <h3 class="title"><a href="#">小米蓝牙耳机</a></h3>
            <p class="desc">2015德国IF大奖，高清通话音质</p>
            <p class="price">79元</p>
          </li>
          <li class="rainbow-item-8"> <a class="thumb" href="#"><img src="" srcset="//i3.mifile.cn/a4/T1wgAgB7ET1RXrhCrK.jpg 2x" alt="小米活塞耳机"></a>
            <h3 class="title"><a href="#">小米活塞耳机</a></h3>
            <p class="desc">2015红点奖，音质优化专利</p>
            <p class="price">69元</p>
          </li>
          <li class="rainbow-item-9"> <a class="thumb" href="#"><img src="" srcset="//i3.mifile.cn/a4/T1NnbjBmYT1RXrhCrK.jpg 2x" alt="小米移动电源10000mAh"></a>
            <h3 class="title"><a href="#">小米移动电源10000mAh</a></h3>
            <p class="desc">高密度进口电芯，仅名片大小</p>
            <p class="price">69元起</p>
          </li>
          <li class="rainbow-item-10"> <a class="thumb" href="#"><img src="" srcset="//i3.mifile.cn/a4/T1XIEjBCxT1RXrhCrK.jpg 2x" alt="全新小米路由器"></a>
            <h3 class="title"><a href="#">全新小米路由器</a></h3>
            <p class="desc">高配版路由器，企业级性能</p>
            <p class="price">699元起</p>
          </li>
        </ul>
      </div>
      <div class="xm-pagers-wrapper">
        <ul class="xm-pagers">
          <li class="pager pager-active"><span class="dot">1</span></li>
          <li class="pager"><span class="dot">2</span></li>
        </ul>
      </div>
    </div>
  </div>

</div>
<!--     产品分类内容begin       -->
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