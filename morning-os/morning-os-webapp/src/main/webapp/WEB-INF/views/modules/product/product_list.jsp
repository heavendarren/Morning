<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>猫宁商城</title>
<link rel="stylesheet" href="${ctxsta}/web/css/list.css">
</head>
<body>
<!--     轮播top菜单导航 begin       -->
<div class="site-header">
  <div class="container-fluid">
    <div class="header-logo"> <a class="logo ir" href="//www.mi.com/index.html" title="小米官网"><img src="${ctxsta}/web/img/logo.png"></a> </div>
    <div class="header-nav">
      <ul class="nav-list J_navMainList clearfix">
        <li id="J_navCategory" class="nav-category"> <a class="link-category" href="${ctx }/list/1"><span class="text">全部商品分类</span></a> 
        <!--     轮播top菜单导航begin       -->
        <div class="site-category">
          <ul id="J_categoryList" class="site-category-list clearfix">
            <c:forEach items="${categoryInNavVOs }" var="categoryInNavVO">
              <li class="category-item"> <a class="title" href="${ctx }/list/${categoryInNavVO.categoryId}">${categoryInNavVO.name }<span class="glyphicon glyphicon-chevron-right"></span></a>
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
  <div class="container-fluid"> <a href='#'>首页</a><span class="sep">&gt;</span><a href="#">所有商品</a><span class="sep">&gt;</span><span>米兔 / 生活周边</span> </div>
</div>
<!--     分类导航栏 end       -->

<!--     产品分类目录begin       -->
<div class="category">
  <div class="container-fluid">
    <div class="filter-box">
      <div class="filter-list-wrap">
        <dl class="filter-list clearfix">
          <dt>分类：</dt>
          <dd class="active">全部</dd>
          <dd ><a href="#">路由器 / 智能硬件</a></dd>
          <dd ><a href="#">移动电源 / 插线板</a></dd>
          <dd ><a href="#">电池 / 存储卡</a></dd>
          <dd ><a href="#">耳机 / 音箱</a></dd>
          <dd ><a href="#">保护套 / 贴膜</a></dd>
          <dd ><a href="#">线材 / 支架 / 存储卡</a></dd>
          <dd ><a href="#">箱包 / 服饰</a></dd>
          <dd ><a href="#">米兔 / 生活周边</a></dd>
          <dd ><a href="#">配件优惠套装</a></dd>
          <dd ><a href="#">小米电视主机</a></dd>
          <dd ><a href="#">手机套装</a></dd>
          <dd ><a href="#">笔记本电脑</a></dd>
          <dd ><a href="#">小米电视</a></dd>
          <dd ><a href="#">低音炮</a></dd>
          <dd ><a href="">小米平板</a></dd>
          <dd ><a href="#">电视配件</a></dd>
          <dd ><a href="#">小米盒子</a></dd>
          <dd ><a href="#">笔记本电脑配件</a></dd>
        </dl>
        <a class="more J_filterToggle" href="javascript:void(0);" onclick="showMornCategory(this);">更多<i class="glyphicon glyphicon-chevron-down"></i></a> </div>
      <div class="filter-list-wrap">
        <dl class="filter-list clearfix">
          <dt>机型：</dt>
          <dd class="active">全部</dd>
          <dd><a href="#">小米Note2</a></dd>
          <dd><a href="#">小米MIX</a></dd>
          <dd><a href="#">小米5S</a></dd>
          <dd><a href="#">小米5S Plus</a></dd>
          <dd><a href="#">红米Note 4X</a></dd>
          <dd><a href="#">红米Note4</a></dd>
          <dd><a href="#">红米Pro</a></dd>
          <dd><a href="#">小米Max</a></dd>
          <dd><a href="#">小米手机5</a></dd>
          <dd><a href="#">小米手机4S</a></dd>
          <dd><a href="#">红米4高配版</a></dd>
          <dd><a href="#">红米4标准版</a></dd>
          <dd><a href="#">红米4A</a></dd>
          <dd><a href="#">红米手机3高配版</a></dd>
          <dd><a href="#">红米手机3S</a></dd>
          <dd><a href="#">红米手机3标准版</a></dd>
        </dl>
        <a class="more J_filterToggle" href="javascript:void(0);" onclick="showMornCategory(this);">更多<i class="glyphicon glyphicon-chevron-down"></i></a> </div>
    </div>
  </div>
</div>
<!--     产品分类目录end       -->

<!--     产品分类内容begin       -->
<div class="content">
  <div class="container-fluid">
    <div class="order-list-box clearfix">
      <ul class="order-list">
        <li class="active first"><a href="#/0-0-0-0-0-0-0-0-1" rel="nofollow">推荐</a></li>
        <li ><a href="#/0-0-0-0-1-0-0-0-1" rel="nofollow">新品</a></li>
        <li class="up"><a href="#/0-0-0-0-10-0-0-0-1" rel="nofollow">价格 <i class="glyphicon glyphicon-arrow-up"></i></a></li>
        <li ><a href="#/0-0-0-0-3-0-0-0-1" rel="nofollow">评论最多</a></li>
      </ul>
    </div>
    <div class="goods-list-box">
      <div class="goods-list clearfix">
        <div class="goods-item">
          <div class="figure figure-img"><a href=""><img src="" width="200" height="200" alt="" /></a></div>
          <p class="desc"></p>
          <h2 class="title"><a href="">1MORE入耳式耳机（活塞复刻版）</a></h2>
          <p class="price">99元</p>
          <div class="thumbs">
            <ul class="thumb-list clearfix">
              <li><img src="" width="34" height="34" title="1MORE入耳式耳机（活塞复刻版） 玫瑰金" alt="1MORE入耳式耳机（活塞复刻版） 玫瑰金" /></li>
              <li><img src="" width="34" height="34" title="1MORE入耳式耳机（活塞复刻版） 玫瑰金" alt="1MORE入耳式耳机（活塞复刻版） 玫瑰金" /></li>
              <li data-config='{"cid":"1161200063","gid":"2161200069","discount":"0","price":"99\u5143","new":0,"is-cos":0,"package":0,"hasgift":0,"postfree":0,"postfreenum":1,"cfrom":"list"}'><img src="//i1.mifile.cn/a1/T1NGKjBbCT1RXrhCrK!34x34.jpg" width="34" height="34" title="1MORE入耳式耳机（活塞复刻版） 丝箔金" alt="1MORE入耳式耳机（活塞复刻版） 丝箔金" /></li>
            </ul>
          </div>
          <div class="actions clearfix"> <a class="btn-like J_likeGoods" data-cid="1161200061" href="javascript: void(0);"><i class="glyphicon glyphicon-heart-empty"></i> <span>喜欢</span></a> <a class="btn-buy J_buyGoods" data-gid="2161200067" href=""><span>加入购物车</span> <i class="glyphicon glyphicon-shopping-cart"></i></a> </div>
          <div class="flags"> </div>
          <div class="notice"></div>
        </div>
        <div class="goods-item">
          <div class="figure figure-img"><a href=""><img src="" width="200" height="200" alt="" /></a></div>
          <p class="desc"></p>
          <h2 class="title"><a href="">1MORE三单元圈铁耳机</a></h2>
          <p class="price">599元</p>
          <div class="thumbs">
            <ul class="thumb-list clearfix">
              <li><img src="" width="34" height="34" title="1MORE三单元圈铁耳机 金色" alt="1MORE三单元圈铁耳机 金色" /></li>
            </ul>
          </div>
          <div class="actions clearfix"> <a class="btn-like J_likeGoods" data-cid="1161200061" href="javascript: void(0);"><i class="glyphicon glyphicon-heart-empty"></i> <span>喜欢</span></a> <a class="btn-buy J_buyGoods" data-gid="2161200067" href=""><span>加入购物车</span> <i class="glyphicon glyphicon-shopping-cart"></i></a> </div>
          <div class="flags"> </div>
          <div class="notice"></div>
        </div>
        <div class="goods-item">
          <div class="figure figure-img"><a href="//www.mi.com/hezimini/?cfrom=list"><img src="" width="200" height="200" alt="" /></a></div>
          <p class="desc"></p>
          <h2 class="title"><a href="//www.mi.com/hezimini/?cfrom=list">小米盒子mini版（小米小盒子） 白色橙底</a></h2>
          <p class="price">179元 <del>199元</del></p>
          <div class="thumbs">
            <ul class="thumb-list clearfix">
              <li><img src="" width="34" height="34" alt="小米盒子mini版（小米小盒子） 白色橙底" /></li>
            </ul>
          </div>
          <div class="actions clearfix"> <a class="btn-like J_likeGoods" data-cid="1161200061" href="javascript: void(0);"><i class="glyphicon glyphicon-heart-empty"></i> <span>喜欢</span></a> <a class="btn-buy J_buyGoods" data-gid="2161200067" href=""><span>加入购物车</span> <i class="glyphicon glyphicon-shopping-cart"></i></a> </div>
          <div class="flags">
            <div class="flag flag-saleoff">9折促销</div>
          </div>
          <div class="notice"></div>
        </div>
        <div class="goods-item">
          <div class="figure figure-img"><a href="//item.mi.com/1170600032.html?cfrom=list"><img src="" width="200" height="200" alt="" /></a></div>
          <p class="desc"></p>
          <h2 class="title"><a href="//item.mi.com/1170600032.html?cfrom=list">车载必备套装</a></h2>
          <p class="price">557.9元</p>
          <div class="thumbs">
            <ul class="thumb-list clearfix">
              <li><img src="" width="34" height="34" title="车载必备套装" alt="车载必备套装" /></li>
            </ul>
          </div>
          <div class="actions clearfix"> <a class="btn-like J_likeGoods" data-cid="1161200061" href="javascript: void(0);"><i class="glyphicon glyphicon-heart-empty"></i> <span>喜欢</span></a> <a class="btn-buy J_buyGoods" data-gid="2161200067" href=""><span>加入购物车</span> <i class="glyphicon glyphicon-shopping-cart"></i></a> </div>
          <div class="flags">
            <div class="flag flag-new">新品上架</div>
          </div>
          <div class="notice"></div>
        </div>
        <div class="goods-item">
          <div class="figure figure-img"><a href="//item.mi.com/1170700014.html?cfrom=list"><img src="" width="200" height="200" alt="" /></a></div>
          <p class="desc"></p>
          <h2 class="title"><a href="//item.mi.com/1170700014.html?cfrom=list">智能插座套装</a></h2>
          <p class="price">123元 <del>128元</del></p>
          <div class="thumbs">
            <ul class="thumb-list clearfix">
              <li ><img src="" width="34" height="34" title="智能插座套装" alt="智能插座套装" /></li>
            </ul>
          </div>
          <div class="actions clearfix"> <a class="btn-like J_likeGoods" data-cid="1161200061" href="javascript: void(0);"><i class="glyphicon glyphicon-heart-empty"></i> <span>喜欢</span></a> <a class="btn-buy J_buyGoods" data-gid="2161200067" href=""><span>加入购物车</span> <i class="glyphicon glyphicon-shopping-cart"></i></a> </div>
          <div class="flags">
            <div class="flag flag-saleoff">9.7折促销</div>
          </div>
          <div class="notice"></div>
        </div>
      </div>
      <div class="xm-pagenavi"></div>
    </div>
  </div>
  <div id="J_renovateWrap" class="xm-recommend-container container-fluid xm-carousel-container">
    <h2 class="xm-recommend-title"><span>为你推荐</span></h2>
    <div class="xm-recommend">
      <div class="xm-carousel-wrapper" style="height: 340px; overflow:hidden;">
        <ul class=" list3">
          <li class="rainbow-item-1"> <a class="thumb" href="#"><img src="img/mi4!160x160.jpg" srcset="//i3.mifile.cn/a4/T1fNK_BCLv1RXrhCrK.jpg 2x" alt="小米手机4"></a>
            <h3><a href="#">小米手机4</a></h3>
            <p class="desc">工艺和手感超乎想象</p>
            <p class="price">1299元起</p>
          </li>
          <li class="rainbow-item-2"> <a class="thumb" href=#><img src="img/T1vwVgBCVv1RXrhCrK.jpg" srcset="//i3.mifile.cn/a4/T1zMhgBmLv1RXrhCrK.jpg 2x" alt="小米电视主机"></a>
            <h3 class="title"><a href="#">小米电视主机</a></h3>
            <p class="desc">次世代智能电视主机，内置独立音响</p>
            <p class="price">999元</p>
          </li>
          <li class="rainbow-item-3"> <a class="thumb" href="#"><img src="img/T1ICCjBTxT1R4cSCrK.png" srcset="//i3.mifile.cn/a4/T1euDjBgET1R4cSCrK.png 2x" alt="小米盒子mini版(礼品装)"></a>
            <h3 class="title"><a href="#">小米盒子mini版(礼品装)</a></h3>
            <p class="desc">10亿美金影视库，内容新增83%</p>
            <p class="price">199元</p>
          </li>
          <li class="rainbow-item-4"> <a class="thumb" href="#"><img src="img/T1Tvh_BjWT1RXrhCrK.jpg" srcset="//i3.mifile.cn/a4/T1aiAvBX_v1RXrhCrK.jpg 2x" alt="小米Note 女神版"></a>
            <h3 class="title"><a href="#">小米Note 女神版</a></h3>
            <p class="desc">科技与时尚的理想结合</p>
            <p class="price">1799元起</p>
          </li>
          <li class="rainbow-item-5"> <a class="thumb" href="#"><img src="img/T1KDAjBCAT1RXrhCrK.jpg" srcset="//i3.mifile.cn/a4/T1F0WjBCCT1RXrhCrK.jpg 2x" alt="小米路由器 mini"></a>
            <h3 class="title"><a href="#">小米路由器 mini</a></h3>
            <p class="desc">主流双频AC智能路由器</p>
            <p class="price">129元</p>
          </li>
          <li class="rainbow-item-6"> <a class="thumb" href="#"><img src="img/T1B7d_BCCv1RXrhCrK.jpg" srcset="//i3.mifile.cn/a4/T1nNK_B5dv1RXrhCrK.jpg 2x" alt="小米空气净化器"></a>
            <h3 class="title"><a href="#">小米空气净化器</a></h3>
            <p class="desc">双风机 净化能力高达 406m³/h</p>
            <p class="price">899元</p>
          </li>
          <li class="rainbow-item-7"> <a class="thumb" href="#"><img src="img/T1JnWjBCCT1RXrhCrK.jpg" srcset="//i3.mifile.cn/a4/T1SPVjBmWT1RXrhCrK.jpg 2x" alt="小米蓝牙耳机"></a>
            <h3 class="title"><a href="#">小米蓝牙耳机</a></h3>
            <p class="desc">2015德国IF大奖，高清通话音质</p>
            <p class="price">79元</p>
          </li>
          <li class="rainbow-item-8"> <a class="thumb" href="#"><img src="img/T1fyLjBmET1RXrhCrK.jpg" srcset="//i3.mifile.cn/a4/T1wgAgB7ET1RXrhCrK.jpg 2x" alt="小米活塞耳机"></a>
            <h3 class="title"><a href="#">小米活塞耳机</a></h3>
            <p class="desc">2015红点奖，音质优化专利</p>
            <p class="price">69元</p>
          </li>
          <li class="rainbow-item-9"> <a class="thumb" href="#"><img src="img/T16eEjBKhT1RXrhCrK.jpg" srcset="//i3.mifile.cn/a4/T1NnbjBmYT1RXrhCrK.jpg 2x" alt="小米移动电源10000mAh"></a>
            <h3 class="title"><a href="#">小米移动电源10000mAh</a></h3>
            <p class="desc">高密度进口电芯，仅名片大小</p>
            <p class="price">69元起</p>
          </li>
          <li class="rainbow-item-10"> <a class="thumb" href="#"><img src="img/T1tsEgB7DT1RXrhCrK.jpg" srcset="//i3.mifile.cn/a4/T1XIEjBCxT1RXrhCrK.jpg 2x" alt="全新小米路由器"></a>
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

</body>
</html>