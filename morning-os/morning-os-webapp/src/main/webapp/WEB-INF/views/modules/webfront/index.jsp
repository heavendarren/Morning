<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>猫宁商城</title>
</head>
<body>
<!--     轮播begin       -->
<div class="container-fluid">
  <div class="row">
    <div class="col-md-12 col-sm-12">
      <div class="box">
        <ul class="ull">
          <c:forEach items="${indexCarouselImgs }" var="indexCarouselImg">
            <li><a href="${indexCarouselImg.href}" title="${indexCarouselImg.title}" target="_blank"><img src="${ctximg }/${indexCarouselImg.picImg}" alt="${indexCarouselImg.title }"></a></li>
          </c:forEach>
        </ul>
        <ol class="oll">
        </ol>
        <span class="left btnL glyphicon glyphicon-menu-right"></span> <span class="right btnL glyphicon glyphicon-menu-left"></span> 
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
      </div>
    </div>
  </div>
</div>
<!--     轮播end       --> 

<!--     专场begin       -->
<div class="about">
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-12 col-sm-12">
        <div class="list1">
          <ul class="home-channel-list clearfix">
            <c:forEach items="#{indexAdvertLeft }" var="indexAdvertLeft">
              <li><a href="${indexAdvertLeft.href }" target="${indexAdvertLeft.target }" title="${indexAdvertLeft.name }">${indexAdvertLeft.name }</a></li>
            </c:forEach>
          </ul>
        </div>
        <ul class="list2">
          <c:forEach items="${indexHotAdvertImgs }" var="indexHotAdvertImg">
            <li><a href="${indexHotAdvertImg.href }" title="${indexHotAdvertImg.title }"><img src="${ctximg }/${indexHotAdvertImg.picImg}" alt="${indexHotAdvertImg.title }"></a></li>
          </c:forEach>
        </ul>
      </div>
    </div>
  </div>
</div>
<!--     专场end       --> 

<!--     明星产品begin       -->
<div class="home">
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-12 col-sm-12">
        <h2>猫宁明星产品</h2>
        <ul class="pagination">
          <li><span class="glyphicon glyphicon-menu-left"></span></li>
          <li><span class="glyphicon glyphicon-menu-right"></span></li>
        </ul>
        <div class="xm-carousel-wrapper head_hot_goods_content" style="height: 340px; overflow:hidden;">
          <ul class="list3">
          <c:forEach items="${products }" var="product">
            <li class="rainbow-item-1"> <a class="thumb" title="${product.name}" href="${ctx }/item/${product.productNumber}"><img src="${ctximg}/${product.picImg}" alt="${product.name }"  width="160" height="160" ></a>
              <h3><a title="${product.name}" href="${ctx }/item/${product.productNumber}">${product.name}</a></h3>
              <p class="desc"> ${product.introduce} </p>
              <p class="price"> ${product.showPrice } </p>
            </li>          
          </c:forEach>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
<!--     明星产品end       --> 

<!--     主产品begin       -->
<div class="page-main home-main">
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-12">
        <div class="container-fluid"> 
          <!--     智能硬件begin       -->
          <div id="smart" class="home-brick-box home-brick-row-2-box xm-plain-box">
            <div class="box-hd">
              <h2 class="title">智能硬件</h2>
              <div class="more J_brickNav"> <a class="more-link" href="#">查看全部</a><span class="glyphicon glyphicon-circle-arrow-rights"></span> </div>
            </div>
            <div class="box-bd J_brickBd">
              <div class="row">
                <div class="span4 span-first">
                  <ul class="brick-promo-list clearfix">
                    <li class="brick-item brick-item-l"> <a href="#"><img src="${ctxsta}/web/img/T1xsW_B7Ev1RXrhCrK.jpg" width="160" height="160" alt=""></a> </li>
                  </ul>
                </div>
                <div class="span16">
                  <ul class="brick-list clearfix">
                    <li class="brick-item brick-item-m brick-item-m-2 brick-item-active" data-gid="2151100003">
                      <div class="figure figure-img"> <a href="#"> <img src="${ctxsta}/web/img/T1YoZQByYT1RXrhCrK.jpg" width="160" height="160" alt="小米体重秤"> </a> </div>
                      <h3 class="title"><a href="#">小米体重秤</a></h3>
                      <p class="desc"> 高精度压力传感器 ｜ 手机管理全家健康 </p>
                      <p class="price"> <span class="num">99</span>元 </p>
                    </li>
                    <li class="brick-item brick-item-m brick-item-m-2" data-gid="2154300015">
                      <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1yaAjBsLT1RXrhCrK.jpg" width="160" height="160" alt="Yeelight LED智能灯泡"></a> </div>
                      <h3 class="title"><a href="#">Yeelight LED智能灯泡</a></h3>
                      <p class="desc"> 亮度自由调节 WIFI远程操作 </p>
                      <p class="price"> <span class="num">59</span>元 </p>
                    </li>
                    <li class="brick-item brick-item-m brick-item-m-2" data-gid="2150500001">
                      <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1t3d_BsJT1RXrhCrK!220x220.jpg" width="160" height="160" alt="小米智能家庭套装"></a> </div>
                      <h3 class="title"><a href="#">小米智能家庭套装</a></h3>
                      <p class="desc"> 30种智能玩法，3分钟快速安装 </p>
                      <p class="price"> <span class="num">199</span>元 </p>
                    </li>
                    <li class="brick-item brick-item-m brick-item-m-2" data-gid="0">
                      <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1y5A_BXLv1RXrhCrK.jpg" width="160" height="160" alt="小米路由器 青春版"></a> </div>
                      <h3 class="title"><a href="#">小米路由器 青春版</a></h3>
                      <p class="desc"> 将高性能路由器 凝聚于掌心大小 </p>
                      <p class="price"> <span class="num">79</span>元 </p>
                    </li>
                    <li class="brick-item brick-item-m brick-item-m-2" data-gid="0">
                      <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T16nVjBCKT1RXrhCrK.jpg" width="160" height="160" alt="小蚁运动相机"></a> </div>
                      <h3 class="title"><a href="#">小蚁运动相机</a></h3>
                      <p class="desc"> 边玩边录边拍，手机随时分享 </p>
                      <p class="price"> <span class="num">399</span>元 </p>
                    </li>
                    <li class="brick-item brick-item-m brick-item-m-2" data-gid="2152300005">
                      <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T18yZQBCET1RXrhCrK.jpg" width="160" height="160" alt="小蚁智能摄像机"></a> </div>
                      <h3 class="title"><a href="#">小蚁智能摄像机</a></h3>
                      <p class="desc"> 能看能听能说，手机远程观看 </p>
                      <p class="price"> <span class="num">149</span>元 </p>
                    </li>
                    <li class="brick-item brick-item-m brick-item-m-2" data-gid="2153900026">
                      <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1aUCjB7VT1RXrhCrK!220x220.jpg" width="160" height="160" alt="iHealth智能血压计（蓝牙版）"></a> </div>
                      <h3 class="title"><a href="#">iHealth智能血压计（蓝牙版）</a></h3>
                      <p class="desc"> 送给爸妈的好礼物 </p>
                      <p class="price"> <span class="num">199</span>元 </p>
                    </li>
                    <li class="brick-item brick-item-m brick-item-m-2" data-gid="2152300006">
                      <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T16uxjB5YT1RXrhCrK.jpg" width="160" height="160" alt="Yeelight床头灯"></a> </div>
                      <h3 class="title"><a href="#">Yeelight床头灯</a></h3>
                      <p class="desc"> 触摸式操作，给卧室1600万种颜色 </p>
                      <p class="price"> <span class="num">249</span>元 </p>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <!--     智能硬件end       --> 
          <!--     搭配begin       -->
          <div id="match" class="home-brick-box home-brick-row-2-box xm-plain-box">
            <div class="box-hd">
              <h2 class="title">搭配</h2>
              <div class="more J_brickNav">
                <ul class="tab-list J_brickTabSwitch">
                  <li>热门</li>
                  <li>耳机音箱</li>
                  <li>电源</li>
                  <li>电池存储卡</li>
                </ul>
              </div>
            </div>
            <div class="box-bd J_brickBd">
              <div class="row">
                <div class="span4 span-first">
                  <ul class="brick-promo-list clearfix">
                    <li class="brick-item2 brick-item-m brick-item-active"> <a href="#"><img src="${ctxsta}/web/img/T1r1JgBgAT1RXrhCrK.jpg" alt=""></a> </li>
                    <li class="brick-item2 brick-item-m"> <a href="#"><img src="${ctxsta}/web/img/T1ECV_BjYv1RXrhCrK.jpg" alt=""></a> </li>
                  </ul>
                </div>
                <div class="span16">
                  <div id="match-content" class="tab-container">
                    <ul class="brick-list">
                      <li class="brick-item brick-item-m" data-gid="2151900016">
                        <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T12HJvByEv1RXrhCrK.jpg" width="150" height="150" alt="小米移动电源10000mAh"></a> </div>
                        <h3 class="title"><a href="#"> 小米移动电源10000mAh</a></h3>
                        <p class="price"> <span class="num">79</span>元 </p>
                        <p class="rank"> 13.4万人评价 </p>
                        <div class="review-wrapper"> <a href="#"> <span class="review">小米移动电源10400我也买了.比这款大.重,还是喜...</span><span class="author"> 来自于 笑致天下 的评价 <span class="date"></span></span> </a> </div>
                      </li>
                      <li class="brick-item brick-item-m" data-gid="2151400001">
                        <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1jcEgB4AT1RXrhCrK.jpg" width="150" height="150" alt="小米插线板"></a> </div>
                        <h3 class="title"><a href="#"> 小米插线板 </a></h3>
                        <p class="price"> <span class="num">49</span>元 </p>
                        <p class="rank"> 17.1万人评价 </p>
                        <div class="review-wrapper"> <a href="#"><span class="review">做工沒的說，摸起來手感非常細膩，而且比起傳統的插線板...</span><span class="author"> 来自于 林岐城 的评价 <span class="date"></span></span></a> </div>
                      </li>
                      <li class="brick-item brick-item-m" data-gid="2152400008">
                        <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T190DvB4dv1RXrhCrK.jpg" width="150" height="150" alt="小米蓝牙耳机"></a> </div>
                        <h3 class="title"><a href="#"> 小米蓝牙耳机 </a></h3>
                        <p class="price"> <span class="num">79</span>元 </p>
                        <p class="rank"> 5.2万人评价 </p>
                        <div class="review-wrapper"> <a href="#"><span class="review">1.非常好用，戴起来很舒适2.音质不错，比某些大品牌...</span><span class="author"> 来自于 什排地帅哥 的评价 <span class="date"></span></span></a> </div>
                      </li>
                      <li class="brick-item brick-item-m" data-gid="2144200016">
                        <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1gCJgB_dT1RXrhCrK.jpg" width="150" height="150" alt="小钢炮蓝牙音箱 经典款"></a> </div>
                        <h3 class="title"><a href="#"> 小钢炮蓝牙音箱 经典款 </a></h3>
                        <p class="price"> <span class="num">99</span>元 <del><span class="num">129</span>元</del> </p>
                        <p class="rank"> 9.9万人评价 </p>
                        <div class="flag flag-saleoff"> 享8折 </div>
                        <div class="review-wrapper"> <a href="#"><span class="review">这小钢炮给我的感觉太震撼了，完全超出了我的意料之外，...</span><span class="author"> 来自于 dp588 的评价 <span class="date"></span></span></a> </div>
                      </li>
                      <li class="brick-item brick-item-m" data-gid="2154500016">
                        <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1HWEjBvDT1RXrhCrK.jpg" width="150" height="150" alt="小米圈铁耳机"></a> </div>
                        <h3 class="title"><a href="#"> 小米圈铁耳机 </a></h3>
                        <p class="price"> <span class="num">99</span>元 </p>
                        <p class="rank"> 1.3万人评价 </p>
                        <div class="review-wrapper"> <a href="#"><span class="review">音质太棒了。每天跑步时候带着它，带着音乐，真舒服。身...</span><span class="author"> 来自于 248415831 的评价 <span class="date"></span></span></a> </div>
                      </li>
                      <li class="brick-item brick-item-m" data-gid="2144400039">
                        <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1pOWvBKET1RXrhCrK.jpg" width="150" height="150" alt="小米移动电源16000mAh"></a> </div>
                        <h3 class="title"><a href="#"> 小米移动电源16000mAh </a></h3>
                        <p class="price"> <span class="num">109</span>元 <del><span class="num">129</span>元</del> </p>
                        <p class="rank"> 10.6万人评价 </p>
                        <div class="flag flag-saleoff"> 享9折 </div>
                        <div class="review-wrapper"> <a href="#"><span class="review">自从有了小米移动电源再也不担心出差啦，非常好的一款产...</span><span class="author"> 来自于 气吞山河1 的评价 <span class="date"></span></span></a> </div>
                      </li>
                      <li class="brick-item brick-item-m" data-gid="1152400014">
                        <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1_lKvBKZT1RXrhCrK.jpg" width="150" height="150" alt="红米2/红米2A能量套装"></a> </div>
                        <h3 class="title"><a href="#"> 红米2/红米2A能量套装 </a></h3>
                        <p class="price"> <span class="num">69</span>元 <del><span class="num">98</span>元</del> </p>
                        <div class="flag flag-saleoff"> 享8折 </div>
                      </li>
                      <li class="brick-item brick-item-s" data-gid="2153800019">
                        <div class="figure figure-img "> <a href="#"><img src="${ctxsta}/web/img/T1MDK_B_YT1RXrhCrK.jpg" width="80" height="80" alt="小米蓝牙音箱 蓝色"></a> </div>
                        <h3 class="title"><a href="#">小米蓝牙</a></h3>
                        <p class="price"> <span class="num">199</span>元 </p>
                      </li>
                      <li class="brick-item brick-item-s">
                        <div class="figure figure-more"> <a href="#"><span class="glyphicon glyphicon-upload"></span></a> </div>
                        <a class="more" href="#">浏览更多<small>热门</small></a> </li>
                    </ul>
                    <ul class="brick-list">
                      <li class="brick-item brick-item-m" data-gid="2143600013">
                        <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1yNWvBXWv1RXrhCrK!220x220.jpg" width="150" height="150" alt="先锋CL31系列入耳式耳机"></a> </div>
                        <h3 class="title"><a href="">先锋CL31系列入耳式耳机</a></h3>
                        <p class="price"> <span class="num">99</span>元 </p>
                        <p class="rank"> 4027人评价 </p>
                        <div class="review-wrapper"> <a href="#"><span class="review">好好好，只有这个感觉，美，太美妙的感觉了，像飘在云絮...</span><span class="author"> 来自于 209665471 的评价 <span class="date" data-date="1426571940"></span></span></a> </div>
                      </li>
                      <li class="brick-item brick-item-m" data-gid="2153900027">
                        <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1o0h_B5VT1RXrhCrK!220x220.jpg" width="150" height="150" alt="小米活塞耳机标准版"></a> </div>
                        <h3 class="title"><a href="#">小米活塞耳机标准版</a></h3>
                        <p class="price"> <span class="num">69</span>元 <del><span class="num">99</span>元</del> </p>
                        <p class="rank"> 1.5万人评价 </p>
                        <div class="flag flag-saleoff"> 享7折 </div>
                        <div class="review-wrapper"> <a href="#"><span class="review">送给朋友的，我们都是工业设计专业的，所以对红点奖要有...</span><span class="author"> 来自于 232020299 的评价 <span class="date" data-date="1434443160"></span></span></a> </div>
                      </li>
                      <li class="brick-item brick-item-m" data-gid="2150300027">
                        <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1GQATBQbT1RXrhCrK!220x220.jpg" width="150" height="150" alt="小米头戴式耳机"></a> </div>
                        <h3 class="title"><a href="#">小米头戴式耳机</a></h3>
                        <p class="price"> <span class="num">499</span>元 </p>
                        <p class="rank"> 4548人评价 </p>
                        <div class="review-wrapper"> <a href="#"><span class="review">造型非常棒。盒子设计也很好。非常好的配件和耳机的布局...</span><span class="author"> 来自于 lolilolipop 的评价 <span class="date" data-date="1428800040"></span></span></a> </div>
                      </li>
                      <li class="brick-item brick-item-m" data-gid="2153300060">
                        <div class="figure figure-img"> <a href="" "#"><img src="${ctxsta}/web/img/T1RpC_BjZT1RXrhCrK!220x220.jpg" width="150" height="150" alt="小米活塞耳机 炫彩版"></a> </div>
                        <h3 class="title"><a href="#">小米活塞耳机 炫彩版</a></h3>
                        <p class="price"> <span class="num">29</span>元 </p>
                        <p class="rank"> 7.2万人评价 </p>
                        <div class="review-wrapper"> <a href="#"><span class="review">超好用，比我用过的耳机都好，声音简直是从脑子里发出的...</span><span class="author"> 来自于 冯庆焱 的评价 <span class="date" data-date="1441968840"></span></span></a> </div>
                      </li>
                      <li class="brick-item brick-item-m" data-gid="2141700010">
                        <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1JIxTB4_T1RXrhCrK!220x220.jpg" width="150" height="150" alt="QCY 杰克J02蓝牙耳机"></a> </div>
                        <h3 class="title"><a href="#">QCY 杰克J02蓝牙耳机</a></h3>
                        <p class="price"> <span class="num">69.9</span>元 </p>
                        <p class="rank"> 2.3万人评价 </p>
                        <div class="review-wrapper"> <a href="#"><span class="review">一次买了2个，一个杰克一个Q8，杰克比Q8要好，音质...</span><span class="author"> 来自于 Go饭桶 的评价 <span class="date" data-date="1390920840"></span></span></a> </div>
                      </li>
                      <li class="brick-item brick-item-m" data-gid="2144200016">
                        <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1gCJgB_dT1RXrhCrK!220x220.jpg" width="150" height="150" alt="小钢炮蓝牙音箱"></a> </div>
                        <h3 class="title"><a href="#">小钢炮蓝牙音箱</a></h3>
                        <p class="price"> <span class="num">99</span>元 <del><span class="num">129</span>元</del> </p>
                        <p class="rank"> 9.9万人评价 </p>
                        <div class="flag flag-saleoff"> 享8折 </div>
                        <div class="review-wrapper"> <a href="#"><span class="review">这小钢炮给我的感觉太震撼了，完全超出了我的意料之外，...</span><span class="author"> 来自于 dp588 的评价 <span class="date" data-date="1426003560"></span></span></a> </div>
                      </li>
                      <li class="brick-item brick-item-m" data-gid="2153800022">
                        <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1ajbvB7Kv1RXrhCrK!220x220.jpg" width="150" height="150" alt="睿米车载蓝牙播放器"></a> </div>
                        <h3 class="title"><a href="#">睿米车载蓝牙播放器</a></h3>
                        <p class="price"> <span class="num">69</span>元 </p>
                        <p class="rank"> 7535人评价 </p>
                        <div class="review-wrapper"> <a href="#"><span class="review">做工、质量、性能都很好</span><span class="author"> 来自于 chx 的评价 <span class="date" data-date="1449977700"></span></span></a> </div>
                      </li>
                      <li class="brick-item brick-item-s" data-gid="2134900502">
                        <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T15RxTBbWT1RXrhCrK!220x220.jpg" width="80" height="80" alt="铁三角耳机"></a> </div>
                        <h3 class="title"><a href="#">铁三角耳机</a></h3>
                        <p class="price"> <span class="num">118</span>元 </p>
                      </li>
                      <li class="brick-item brick-item-s">
                        <div class="figure figure-more"> <a href="#"><span class="glyphicon glyphicon-upload"></span></a> </div>
                        <a class="more" href="#">浏览更多<small>耳机音箱</small></a> </li>
                    </ul>
                    <ul class="brick-list">
                      <li class="brick-item brick-item-m" data-gid="2151900018">
                        <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1ggWQBybT1RXrhCrK!220x220.jpg" width="150" height="150" alt="小米移动电源10000mAh"></a> </div>
                        <h3 class="title"><a href=""#>小米移动电源10000mAh</a></h3>
                        <p class="price"> <span class="num">69</span>元 </p>
                        <p class="rank"> 13.3万人评价 </p>
                        <div class="review-wrapper"> <a href="#"><span class="review">小米移动电源10400我也买了.比这款大.重,还是喜...</span><span class="author"> 来自于 笑致天下 的评价 <span class="date" data-date="1437446280"></span></span></a> </div>
                      </li>
                      <li class="brick-item brick-item-m" data-gid="2144400039">
                        <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1pOWvBKET1RXrhCrK!220x220.jpg" width="150" height="150" alt="小米移动电源16000mAh"></a> </div>
                        <h3 class="title"><a href="#">小米移动电源16000mAh</a></h3>
                        <p class="price"> <span class="num">109</span>元 <del><span class="num">129</span>元</del> </p>
                        <p class="rank"> 10.5万人评价 </p>
                        <div class="flag flag-saleoff"> 享9折 </div>
                        <div class="review-wrapper"> <a href="#"><span class="review">自从有了小米移动电源再也不担心出差啦，非常好的一款产...</span><span class="author"> 来自于 气吞山河1 的评价 <span class="date" data-date="1435269240"></span></span></a> </div>
                      </li>
                      <li class="brick-item brick-item-m" data-gid="2154400015">
                        <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1zLbvB4xv1RXrhCrK!220x220.jpg" width="150" height="150" alt="移动电源20000mAh"></a> </div>
                        <h3 class="title"><a href="#">移动电源20000mAh</a></h3>
                        <p class="price"> <span class="num">149</span>元 </p>
                        <p class="rank"> 1万人评价 </p>
                      </li>
                      <li class="brick-item brick-item-m" data-gid="2145200002">
                        <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1v7__BCCT1RXrhCrK!220x220.jpg" width="150" height="150" alt="ZMI移动电源10000mAh"></a> </div>
                        <h3 class="title"><a href="#">ZMI移动电源10000mAh</a></h3>
                        <p class="price"> <span class="num">99</span>元 </p>
                        <p class="rank"> 2752人评价 </p>
                        <div class="review-wrapper"> <a href="#"><span class="review">用了好几款移动电源，唯一这款让我爱不释手的，溥，轻，...</span><span class="author"> 来自于 adyan 的评价 <span class="date" data-date="1420025700"></span></span></a> </div>
                      </li>
                      <li class="brick-item brick-item-m" data-gid="2145000001">
                        <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1fVYvBbxT1RXrhCrK!220x220.jpg" width="150" height="150" alt="ZMI随身路由器"></a> </div>
                        <h3 class="title"><a href="#">ZMI随身路由器</a></h3>
                        <p class="price"> <span class="num">299</span>元 </p>
                        <p class="rank"> 426人评价 </p>
                        <div class="review-wrapper"> <a href="#"> <span class="review">我觉得这个神器太给力了，因为我不看好移动，所以手机都...</span><span class="author"> 来自于 jiaxiaozai 的评价 <span class="date" data-date="1435978080"></span></span></a> </div>
                      </li>
                      <li class="brick-item brick-item-m" data-gid="2151400001">
                        <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1jcEgB4AT1RXrhCrK!220x220.jpg" width="150" height="150" alt="小米插线板"></a> </div>
                        <h3 class="title"><a href="#">小米插线板</a></h3>
                        <p class="price"> <span class="num">49</span>元 </p>
                        <p class="rank"> 17万人评价 </p>
                        <div class="review-wrapper"> <a href="#"><span class="review">做工沒的說，摸起來手感非常細膩，而且比起傳統的插線板...</span><span class="author"> 来自于 林岐城 的评价 <span class="date" data-date="1431164880"></span></span></a> </div>
                      </li>
                      <li class="brick-item brick-item-m" data-gid="2154500009">
                        <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1RlLgBThT1RXrhCrK!220x220.jpg" width="150" height="150" alt="小米插线板 5孔位"></a> </div>
                        <h3 class="title"><a href="#">小米插线板 5孔位</a></h3>
                        <p class="price"> <span class="num">39</span>元 </p>
                        <p class="rank"> 4720人评价 </p>
                        <div class="review-wrapper"> <a href="#"><span class="review">小米注重设计取胜，安全性高，性价比也高。</span><span class="author"> 来自于 818159719 的评价 <span class="date" data-date="1448384880"></span></span></a> </div>
                      </li>
                      <li class="brick-item brick-item-s" data-gid="2134900111">
                        <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1wbZTBKWT1RXrhCrK!220x220.jpg" width="80" height="80" alt="电源适配器"></a> </div>
                        <h3 class="title"><a href="#">电源适配器</a></h3>
                        <p class="price"> <span class="num">19.9</span>元 </p>
                      </li>
                      <li class="brick-item brick-item-s">
                        <div class="figure figure-more"> <a href="#"><span class="glyphicon glyphicon-upload"></span></a> </div>
                        <a class="more" href="#">浏览更多<small>电源</small></a> </li>
                    </ul>
                    <ul class="brick-list">
                      <li class="brick-item brick-item-m" data-gid="2151400210">
                        <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T16XAgB5dT1RXrhCrK!220x220.jpg" width="150" height="150" alt="CR2032纽扣电池"></a> </div>
                        <h3 class="title"><a href="#">CR2032纽扣电池</a></h3>
                        <p class="price"> <span class="num">9</span>元 </p>
                        <p class="rank"> 7574人评价 </p>
                        <div class="review-wrapper"> <a href="#"><span class="review">小米把关，质量还是有得保证的，暂时还没用，先备着！</span><span class="author"> 来自于 陶都 的评价 <span class="date" data-date="1430124840"></span></span></a> </div>
                      </li>
                      <li class="brick-item brick-item-m" data-gid="2154500009">
                        <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1RlLgBThT1RXrhCrK!220x220.jpg" width="150" height="150" alt="小米插线板 5孔位"></a> </div>
                        <h3 class="title"><a href="#">小米插线板 5孔位</a></h3>
                        <p class="price"> <span class="num">39</span>元 </p>
                        <p class="rank"> 4720人评价 </p>
                        <div class="review-wrapper"> <a href="#"><span class="review">小米注重设计取胜，安全性高，性价比也高。</span><span class="author"> 来自于 818159719 的评价 <span class="date" data-date="1448384880"></span></span></a> </div>
                      </li>
                      <li class="brick-item brick-item-m" data-gid="2154300020">
                        <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1xxVTBghv1RXrhCrK!220x220.jpg" width="150" height="150" alt="彩虹5号电池（10粒装）"></a> </div>
                        <h3 class="title"><a href="#">彩虹5号电池（10粒装）</a></h3>
                        <p class="price"> <span class="num">9.9</span>元 </p>
                        <p class="rank"> 2万人评价 </p>
                        <div class="review-wrapper"> <a href="#"><span class="review">价格实惠，外观好看，还有盒子便于保管，不错。</span><span class="author"> 来自于 monkeyshine 的评价 <span class="date" data-date="1448980620"></span></span></a> </div>
                      </li>
                      <li class="brick-item brick-item-m" data-gid="2151400003">
                        <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1ehLgBmET1RXrhCrK!220x220.jpg" width="150" height="150"></a> </div>
                        <h3 class="title"><a href="#">米兔手机U盘升级版</a></h3>
                        <p class="price"> <span class="num">49.9</span>元 </p>
                        <p class="rank"> 2.1万人评价 </p>
                        <div class="review-wrapper"> <a href="#"><span class="review">米兔君的升级版，第二次买（第一次买的用了还不到一周就...</span><span class="author"> 来自于 167953031 的评价 <span class="date" data-date="1429099200"></span></span></a> </div>
                      </li>
                      <li class="brick-item brick-item-m" data-gid="2143800013">
                        <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1RsL_BXdT1RXrhCrK!220x220.jpg" width="150" height="150" alt="小米随身WIFI U盘版"></a> </div>
                        <h3 class="title"><a href="#">小米随身WIFI U盘版</a></h3>
                        <p class="price"> <span class="num">49.9</span>元 </p>
                        <p class="rank"> 3.1万人评价 </p>
                        <div class="review-wrapper"> <a href="#"><span class="review">太强了，隔了几面墙，还可以带一台电视看高清视频（我是...</span><span class="author"> 来自于 277076563 的评价 <span class="date" data-date="1437311820"></span></span></a> </div>
                      </li>
                      <li class="brick-item brick-item-m" data-gid="2134900578">
                        <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1tRJTBjAv1RXrhCrK!220x220.jpg" width="150" height="150" alt="SanDisk 8GB存储卡"></a> </div>
                        <h3 class="title"><a href="#">SanDisk 8GB存储卡</a></h3>
                        <p class="price"> <span class="num">17.9</span>元 <del><span class="num">24.9</span>元</del> </p>
                        <p class="rank"> 30.1万人评价 </p>
                        <div class="flag flag-saleoff"> 享8折 </div>
                        <div class="review-wrapper"> <a href="#"><span class="review">不错的东东。下次还用它！</span><span class="author"> 来自于 记得抬头看路 的评价 <span class="date" data-date="1430788440"></span></span></a> </div>
                      </li>
                      <li class="brick-item brick-item-m" data-gid="2155000004">
                        <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T178EjBjVT1RXrhCrK!220x220.jpg" width="150" height="150" alt="彩虹7号电池（10粒装）"></a> </div>
                        <h3 class="title"> <a href="#">彩虹7号电池（10粒装）</a></h3>
                        <p class="price"> <span class="num">9.9</span>元 </p>
                        <p class="rank"> 6204人评价 </p>
                        <div class="review-wrapper"> <a href="#"><span class="review">很便宜，很实惠，很实用。性价比高。</span><span class="author"> 来自于 云天^0^ 的评价 <span class="date" data-date="1450624440"></span></span></a> </div>
                      </li>
                      <li class="brick-item brick-item-s" data-gid="2153000001">
                        <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1b.K_Bj_T1RXrhCrK!220x220.jpg" width="80" height="80" alt="120cm扁线"></a> </div>
                        <h3 class="title"><a href="#">120cm扁线</a></h3>
                        <p class="price"> <span class="num">19</span>元 </p>
                      </li>
                      <li class="brick-item brick-item-s">
                        <div class="figure figure-more"> <a href="#"><span class="glyphicon glyphicon-upload"></span></a> </div>
                        <a class="more" href="#">浏览更多<small>电池存储卡</small></a> </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!--     搭配end       --> 
          <!--     配件begin       -->
          <div class="container-fluid">
            <div id="accessories" class="home-brick-box home-brick-row-2-box xm-plain-box">
              <div class="box-hd">
                <h2 class="title">配件</h2>
                <div class="more J_brickNav">
                  <ul class="sat">
                    <li>热门</li>
                    <li>保护套</li>
                    <li>后盖</li>
                    <li>贴膜</li>
                    <li>其他配件</li>
                  </ul>
                </div>
              </div>
              <div class="box-bd J_brickBd" id="db">
                <div class="row">
                  <div class="span4 span-first">
                    <ul class="brick-promo-list clearfix">
                      <li class="brick-item2 brick-item-m brick-item-active"> <a href="#"><img src="${ctxsta}/web/img/T16CLgB4Vv1RXrhCrK.jpg" alt=""></a> </li>
                      <li class="brick-item2 brick-item-m"> <a href="#"><img src="${ctxsta}/web/img/T1KF_QBQYT1RXrhCrK.jpg" alt=""></a> </li>
                    </ul>
                  </div>
                  <div class="span16">
                    <div id="accessories-content " class="tab-container">
                      <ul class="brick-list sat-list">
                        <li class="brick-item brick-item-m" data-gid="2151900016">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1_8YvBKJT1RXrhCrK.jpg" width="150" height="150" alt="小米移动电源10000mAh"></a> </div>
                          <h3 class="title"><a href="#"> 小米移动电源10000mAh</a></h3>
                          <p class="price"> <span class="num">79</span>元 </p>
                          <p class="rank"> 13.4万人评价 </p>
                          <div class="flag flag-saleoff"> 享8折 </div>
                          <div class="review-wrapper"> <a href="#"> <span class="review">小米移动电源10400我也买了.比这款大.重,还是喜...</span><span class="author"> 来自于 笑致天下 的评价 <span class="date"></span></span> </a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2151400001">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1b.K_Bj_T1RXrhCrK.jpg" width="150" height="150" alt="小米插线板"></a> </div>
                          <h3 class="title"><a href="#"> 小米插线板 </a></h3>
                          <p class="price"> <span class="num">49</span>元 </p>
                          <p class="rank"> 17.1万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">做工沒的說，摸起來手感非常細膩，而且比起傳統的插線板...</span><span class="author"> 来自于 林岐城 的评价 <span class="date"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2152400008">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1zL_vByCT1RXrhCrK.jpg" width="150" height="150" alt="小米蓝牙耳机"></a> </div>
                          <h3 class="title"><a href="#"> 小米蓝牙耳机 </a></h3>
                          <p class="price"> <span class="num">79</span>元 </p>
                          <p class="rank"> 5.2万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">1.非常好用，戴起来很舒适2.音质不错，比某些大品牌...</span><span class="author"> 来自于 什排地帅哥 的评价 <span class="date"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2144200016">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1_SDgB4KT1RXrhCrK.jpg" width="150" height="150" alt="小钢炮蓝牙音箱 经典款"></a> </div>
                          <h3 class="title"><a href="#"> 小钢炮蓝牙音箱 经典款 </a></h3>
                          <p class="price"> <span class="num">99</span>元 <del><span class="num">129</span>元</del> </p>
                          <p class="rank"> 9.9万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">这小钢炮给我的感觉太震撼了，完全超出了我的意料之外，...</span><span class="author"> 来自于 dp588 的评价 <span class="date"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2154500016">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1l9WjBTbT1RXrhCrK.jpg" width="150" height="150" alt="小米圈铁耳机"></a> </div>
                          <h3 class="title"><a href="#"> 小米圈铁耳机 </a></h3>
                          <p class="price"> <span class="num">99</span>元 </p>
                          <p class="rank"> 1.3万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">音质太棒了。每天跑步时候带着它，带着音乐，真舒服。身...</span><span class="author"> 来自于 248415831 的评价 <span class="date"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2144400039">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1AmJgBsKT1RXrhCrK.jpg" width="150" height="150" alt="小米移动电源16000mAh"></a> </div>
                          <h3 class="title"><a href="#"> 小米移动电源16000mAh </a></h3>
                          <p class="price"> <span class="num">109</span>元 <del><span class="num">129</span>元</del> </p>
                          <p class="rank"> 10.6万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">自从有了小米移动电源再也不担心出差啦，非常好的一款产...</span><span class="author"> 来自于 气吞山河1 的评价 <span class="date"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="1152400014">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1Zp__B5Ev1RXrhCrK.jpg" width="150" height="150" alt="红米2/红米2A能量套装"></a> </div>
                          <h3 class="title"><a href="#"> 红米2/红米2A能量套装 </a></h3>
                          <p class="price"> <span class="num">69</span>元 <del><span class="num">98</span>元</del> </p>
                        </li>
                        <li class="brick-item brick-item-s" data-gid="2153800019">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1COAjB7WT1RXrhCrK.jpg" width="80" height="80" alt="小米蓝牙音箱 蓝色"></a> </div>
                          <h3 class="title"><a href="#">小米蓝牙</a></h3>
                          <p class="price"> <span class="num">199</span>元 </p>
                        </li>
                        <li class="brick-item brick-item-s">
                          <div class="figure figure-more"> <a href="#"><span class="glyphicon glyphicon-upload"></span></a> </div>
                          <a class="more" href="#">浏览更多<small>热门</small></a> </li>
                      </ul>
                      <ul class="brick-list sat-list">
                        <li class="brick-item brick-item-m" data-gid="2143600013">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1CGLTBsVT1RXrhCrK!220x220.jpg" width="150" height="150" alt="先锋CL31系列入耳式耳机"></a> </div>
                          <h3 class="title"><a href="">先锋CL31系列入耳式耳机</a></h3>
                          <p class="price"> <span class="num">99</span>元 </p>
                          <p class="rank"> 4027人评价 </p>
                          <div class="flag flag-saleoff2"> 有赠品 </div>
                          <div class="review-wrapper"> <a href="#"><span class="review">好好好，只有这个感觉，美，太美妙的感觉了，像飘在云絮...</span><span class="author"> 来自于 209665471 的评价 <span class="date" data-date="1426571940"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2153900027">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T17wd_BsYT1RXrhCrK!220x220.jpg" width="150" height="150" alt="小米活塞耳机标准版"></a> </div>
                          <h3 class="title"><a href="#">小米活塞耳机标准版</a></h3>
                          <p class="price"> <span class="num">69</span>元 <del><span class="num">99</span>元</del> </p>
                          <p class="rank"> 1.5万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">送给朋友的，我们都是工业设计专业的，所以对红点奖要有...</span><span class="author"> 来自于 232020299 的评价 <span class="date" data-date="1434443160"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2150300027">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T11eEvBmYT1RXrhCrK!220x220.jpg" width="150" height="150" alt="小米头戴式耳机"></a> </div>
                          <h3 class="title"><a href="#">小米头戴式耳机</a></h3>
                          <p class="price"> <span class="num">499</span>元 </p>
                          <p class="rank"> 4548人评价 </p>
                          <div class="flag flag-saleoff2"> 有赠品 </div>
                          <div class="review-wrapper"> <a href="#"><span class="review">造型非常棒。盒子设计也很好。非常好的配件和耳机的布局...</span><span class="author"> 来自于 lolilolipop 的评价 <span class="date" data-date="1428800040"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2153300060">
                          <div class="figure figure-img"> <a href="" "#"><img src="${ctxsta}/web/img/T1kDx_BbCT1RXrhCrK!220x220.jpg" width="150" height="150" alt="小米活塞耳机 炫彩版"></a> </div>
                          <h3 class="title"><a href="#">小米活塞耳机 炫彩版</a></h3>
                          <p class="price"> <span class="num">29</span>元 </p>
                          <p class="rank"> 7.2万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">超好用，比我用过的耳机都好，声音简直是从脑子里发出的...</span><span class="author"> 来自于 冯庆焱 的评价 <span class="date" data-date="1441968840"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2141700010">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1Bt_vB5KT1RXrhCrK!220x220.jpg" width="150" height="150" alt="QCY 杰克J02蓝牙耳机"></a> </div>
                          <h3 class="title"><a href="#">QCY 杰克J02蓝牙耳机</a></h3>
                          <p class="price"> <span class="num">69.9</span>元 </p>
                          <p class="rank"> 2.3万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">一次买了2个，一个杰克一个Q8，杰克比Q8要好，音质...</span><span class="author"> 来自于 Go饭桶 的评价 <span class="date" data-date="1390920840"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2144200016">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1kXK_BgDT1RXrhCrK!220x220.jpg" width="150" height="150" alt="小钢炮蓝牙音箱"></a> </div>
                          <h3 class="title"><a href="#">小钢炮蓝牙音箱</a></h3>
                          <p class="price"> <span class="num">99</span>元 <del><span class="num">129</span>元</del> </p>
                          <p class="rank"> 9.9万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">这小钢炮给我的感觉太震撼了，完全超出了我的意料之外，...</span><span class="author"> 来自于 dp588 的评价 <span class="date" data-date="1426003560"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2153800022">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1bkY_B_CT1RXrhCrK!220x220.jpg" width="150" height="150" alt="睿米车载蓝牙播放器"></a> </div>
                          <h3 class="title"><a href="#">睿米车载蓝牙播放器</a></h3>
                          <p class="price"> <span class="num">69</span>元 </p>
                          <p class="rank"> 7535人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">做工、质量、性能都很好</span><span class="author"> 来自于 chx 的评价 <span class="date" data-date="1449977700"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-s" data-gid="2134900502">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1GK_TBTYT1RXrhCrK!220x220.jpg" width="80" height="80" alt="铁三角耳机"></a> </div>
                          <h3 class="title"><a href="#">铁三角耳机</a></h3>
                          <p class="price"> <span class="num">118</span>元 </p>
                        </li>
                        <li class="brick-item brick-item-s">
                          <div class="figure figure-more"> <a href="#"><span class="glyphicon glyphicon-upload"></span></a> </div>
                          <a class="more" href="#">浏览更多<small>保护套</small></a> </li>
                      </ul>
                      <ul class="brick-list sat-list">
                        <li class="brick-item brick-item-m" data-gid="2151900018">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1F_Y_BgYT1RXrhCrK!220x220.jpg" width="150" height="150" alt="小米移动电源10000mAh"></a> </div>
                          <h3 class="title"><a href=""#>小米移动电源10000mAh</a></h3>
                          <p class="price"> <span class="num">69</span>元 </p>
                          <p class="rank"> 13.3万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">小米移动电源10400我也买了.比这款大.重,还是喜...</span><span class="author"> 来自于 笑致天下 的评价 <span class="date" data-date="1437446280"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2144400039">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1uzDgBXDv1RXrhCrK!220x220.jpg" width="150" height="150" alt="小米移动电源16000mAh"></a> </div>
                          <h3 class="title"><a href="#">小米移动电源16000mAh</a></h3>
                          <p class="price"> <span class="num">109</span>元 <del><span class="num">129</span>元</del> </p>
                          <p class="rank"> 10.5万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">自从有了小米移动电源再也不担心出差啦，非常好的一款产...</span><span class="author"> 来自于 气吞山河1 的评价 <span class="date" data-date="1435269240"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2154400015">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T15rWTBCVv1RXrhCrK!220x220.jpg" width="150" height="150" alt="移动电源20000mAh"></a> </div>
                          <h3 class="title"><a href="#">移动电源20000mAh</a></h3>
                          <p class="price"> <span class="num">149</span>元 </p>
                          <p class="rank"> 1万人评价 </p>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2145200002">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1Q5b_BCEv1RXrhCrK!220x220.jpg" width="150" height="150" alt="ZMI移动电源10000mAh"></a> </div>
                          <h3 class="title"><a href="#">ZMI移动电源10000mAh</a></h3>
                          <p class="price"> <span class="num">99</span>元 </p>
                          <p class="rank"> 2752人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">用了好几款移动电源，唯一这款让我爱不释手的，溥，轻，...</span><span class="author"> 来自于 adyan 的评价 <span class="date" data-date="1420025700"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2145000001">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1dahTBgxv1RXrhCrK!220x220.jpg" width="150" height="150" alt="ZMI随身路由器"></a> </div>
                          <h3 class="title"><a href="#">ZMI随身路由器</a></h3>
                          <p class="price"> <span class="num">299</span>元 </p>
                          <p class="rank"> 426人评价 </p>
                          <div class="review-wrapper"> <a href="#"> <span class="review">我觉得这个神器太给力了，因为我不看好移动，所以手机都...</span><span class="author"> 来自于 jiaxiaozai 的评价 <span class="date" data-date="1435978080"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2151400001">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1ifbTBjCT1RXrhCrK!220x220.jpg" width="150" height="150" alt="小米插线板"></a> </div>
                          <h3 class="title"><a href="#">小米插线板</a></h3>
                          <p class="price"> <span class="num">49</span>元 </p>
                          <p class="rank"> 17万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">做工沒的說，摸起來手感非常細膩，而且比起傳統的插線板...</span><span class="author"> 来自于 林岐城 的评价 <span class="date" data-date="1431164880"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2154500009">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1apd_BmJv1RXrhCrK!220x220.jpg" width="150" height="150" alt="小米插线板 5孔位"></a> </div>
                          <h3 class="title"><a href="#">小米插线板 5孔位</a></h3>
                          <p class="price"> <span class="num">39</span>元 </p>
                          <p class="rank"> 4720人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">小米注重设计取胜，安全性高，性价比也高。</span><span class="author"> 来自于 818159719 的评价 <span class="date" data-date="1448384880"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-s" data-gid="2134900111">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T17HCvBTWT1RXrhCrK!220x220.jpg" width="80" height="80" alt="电源适配器"></a> </div>
                          <h3 class="title"><a href="#">电源适配器</a></h3>
                          <p class="price"> <span class="num">19.9</span>元 </p>
                        </li>
                        <li class="brick-item brick-item-s">
                          <div class="figure figure-more"> <a href="#"><span class="glyphicon glyphicon-upload"></span></a> </div>
                          <a class="more" href="#">浏览更多<small>后盖</small></a> </li>
                      </ul>
                      <ul class="brick-list sat-list">
                        <li class="brick-item brick-item-m" data-gid="2151400210">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1ETWTBQhT1RXrhCrK!220x220.jpg" width="150" height="150" alt="CR2032纽扣电池"></a> </div>
                          <h3 class="title"><a href="#">CR2032纽扣电池</a></h3>
                          <p class="price"> <span class="num">9</span>元 </p>
                          <p class="rank"> 7574人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">小米把关，质量还是有得保证的，暂时还没用，先备着！</span><span class="author"> 来自于 陶都 的评价 <span class="date" data-date="1430124840"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2154500009">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1wex_BQxT1RXrhCrK!220x220.jpg" width="150" height="150" alt="小米插线板 5孔位"></a> </div>
                          <h3 class="title"><a href="#">小米插线板 5孔位</a></h3>
                          <p class="price"> <span class="num">39</span>元 </p>
                          <p class="rank"> 4720人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">小米注重设计取胜，安全性高，性价比也高。</span><span class="author"> 来自于 818159719 的评价 <span class="date" data-date="1448384880"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2154300020">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1f4dvBQYT1RXrhCrK!220x220.jpg" width="150" height="150" alt="彩虹5号电池（10粒装）"></a> </div>
                          <h3 class="title"><a href="#">彩虹5号电池（10粒装）</a></h3>
                          <p class="price"> <span class="num">9.9</span>元 </p>
                          <p class="rank"> 2万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">价格实惠，外观好看，还有盒子便于保管，不错。</span><span class="author"> 来自于 monkeyshine 的评价 <span class="date" data-date="1448980620"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2151400003">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1QzJ_BTdv1RXrhCrK!220x220.jpg" width="150" height="150"></a> </div>
                          <h3 class="title"><a href="#">米兔手机U盘升级版</a></h3>
                          <p class="price"> <span class="num">49.9</span>元 </p>
                          <p class="rank"> 2.1万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">米兔君的升级版，第二次买（第一次买的用了还不到一周就...</span><span class="author"> 来自于 167953031 的评价 <span class="date" data-date="1429099200"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2143800013">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1zXxvBKdT1RXrhCrK!220x220.jpg" width="150" height="150" alt="小米随身WIFI U盘版"></a> </div>
                          <h3 class="title"><a href="#">小米随身WIFI U盘版</a></h3>
                          <p class="price"> <span class="num">49.9</span>元 </p>
                          <p class="rank"> 3.1万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">太强了，隔了几面墙，还可以带一台电视看高清视频（我是...</span><span class="author"> 来自于 277076563 的评价 <span class="date" data-date="1437311820"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2134900578">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T13TxvB7VT1RXrhCrK!220x220.jpg" width="150" height="150" alt="SanDisk 8GB存储卡"></a> </div>
                          <h3 class="title"><a href="#">SanDisk 8GB存储卡</a></h3>
                          <p class="price"> <span class="num">17.9</span>元 <del><span class="num">24.9</span>元</del> </p>
                          <p class="rank"> 30.1万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">不错的东东。下次还用它！</span><span class="author"> 来自于 记得抬头看路 的评价 <span class="date" data-date="1430788440"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2155000004">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1KcKTBTWT1RXrhCrK!220x220.jpg" width="150" height="150" alt="彩虹7号电池（10粒装）"></a> </div>
                          <h3 class="title"> <a href="#">彩虹7号电池（10粒装）</a></h3>
                          <p class="price"> <span class="num">9.9</span>元 </p>
                          <p class="rank"> 6204人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">很便宜，很实惠，很实用。性价比高。</span><span class="author"> 来自于 云天^0^ 的评价 <span class="date" data-date="1450624440"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-s" data-gid="2153000001">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1f_DvBy_T1RXrhCrK!220x220.jpg" width="80" height="80" alt="120cm扁线"></a> </div>
                          <h3 class="title"><a href="#">120cm扁线</a></h3>
                          <p class="price"> <span class="num">19</span>元 </p>
                        </li>
                        <li class="brick-item brick-item-s">
                          <div class="figure figure-more"> <a href="#"><span class="glyphicon glyphicon-upload"></span></a> </div>
                          <a class="more" href="#">浏览更多<small>贴膜</small></a> </li>
                      </ul>
                      <ul class="brick-list sat-list">
                        <li class="brick-item brick-item-m" data-gid="2151400210">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1xXxQBCVT1RXrhCrK!220x220.jpg" width="150" height="150" alt="CR2032纽扣电池"></a> </div>
                          <h3 class="title"><a href="#">CR2032纽扣电池</a></h3>
                          <p class="price"> <span class="num">9</span>元 </p>
                          <p class="rank"> 7574人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">小米把关，质量还是有得保证的，暂时还没用，先备着！</span><span class="author"> 来自于 陶都 的评价 <span class="date" data-date="1430124840"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2154500009">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1wbZTBKWT1RXrhCrK!220x220 (1).jpg" width="150" height="150" alt="小米插线板 5孔位"></a> </div>
                          <h3 class="title"><a href="#">小米插线板 5孔位</a></h3>
                          <p class="price"> <span class="num">39</span>元 </p>
                          <p class="rank"> 4720人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">小米注重设计取胜，安全性高，性价比也高。</span><span class="author"> 来自于 818159719 的评价 <span class="date" data-date="1448384880"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2154300020">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1WTEvBmKT1RXrhCrK!220x220.jpg" width="150" height="150" alt="彩虹5号电池（10粒装）"></a> </div>
                          <h3 class="title"><a href="#">彩虹5号电池（10粒装）</a></h3>
                          <p class="price"> <span class="num">9.9</span>元 </p>
                          <p class="rank"> 2万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">价格实惠，外观好看，还有盒子便于保管，不错。</span><span class="author"> 来自于 monkeyshine 的评价 <span class="date" data-date="1448980620"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2151400003">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T11oW_B4dv1RXrhCrK!220x220.jpg" width="150" height="150"></a> </div>
                          <h3 class="title"><a href="#">米兔手机U盘升级版</a></h3>
                          <p class="price"> <span class="num">49.9</span>元 </p>
                          <p class="rank"> 2.1万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">米兔君的升级版，第二次买（第一次买的用了还不到一周就...</span><span class="author"> 来自于 167953031 的评价 <span class="date" data-date="1429099200"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2143800013">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1ipAvB_ZT1RXrhCrK!220x220.jpg" width="150" height="150" alt="小米随身WIFI U盘版"></a> </div>
                          <h3 class="title"><a href="#">小米随身WIFI U盘版</a></h3>
                          <p class="price"> <span class="num">49.9</span>元 </p>
                          <p class="rank"> 3.1万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">太强了，隔了几面墙，还可以带一台电视看高清视频（我是...</span><span class="author"> 来自于 277076563 的评价 <span class="date" data-date="1437311820"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2134900578">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T13y_vBgJT1RXrhCrK!220x220.jpg" width="150" height="150" alt="SanDisk 8GB存储卡"></a> </div>
                          <h3 class="title"><a href="#">SanDisk 8GB存储卡</a></h3>
                          <p class="price"> <span class="num">17.9</span>元 <del><span class="num">24.9</span>元</del> </p>
                          <p class="rank"> 30.1万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">不错的东东。下次还用它！</span><span class="author"> 来自于 记得抬头看路 的评价 <span class="date" data-date="1430788440"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2155000004">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1Zp__B5Ev1RXrhCrK!220x220.jpg" width="150" height="150" alt="彩虹7号电池（10粒装）"></a> </div>
                          <h3 class="title"> <a href="#">彩虹7号电池（10粒装）</a></h3>
                          <p class="price"> <span class="num">9.9</span>元 </p>
                          <p class="rank"> 6204人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">很便宜，很实惠，很实用。性价比高。</span><span class="author"> 来自于 云天^0^ 的评价 <span class="date" data-date="1450624440"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-s" data-gid="2153000001">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1b.K_Bj_T1RXrhCrK!220x220.jpg" width="80" height="80" alt="120cm扁线"></a> </div>
                          <h3 class="title"><a href="#">120cm扁线</a></h3>
                          <p class="price"> <span class="num">19</span>元 </p>
                        </li>
                        <li class="brick-item brick-item-s">
                          <div class="figure figure-more"> <a href="#"><span class="glyphicon glyphicon-upload"></span></a> </div>
                          <a class="more" href="#">浏览更多<small>其他配件</small></a> </li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!--     配件end       --> 
          <!--     周边begin       -->
          <div class="container-fluid">
            <div id="around" class="home-brick-box home-brick-row-2-box xm-plain-box">
              <div class="box-hd">
                <h2 class="title">周边</h2>
                <div class="more J_brickNav">
                  <ul class="sat2">
                    <li>热门</li>
                    <li>服装</li>
                    <li>米兔</li>
                    <li>生活周边</li>
                    <li>箱包</li>
                  </ul>
                </div>
              </div>
              <div class="box-bd J_brickBd" id="db2">
                <div class="row">
                  <div class="span4 span-first">
                    <ul class="brick-promo-list clearfix">
                      <li class="brick-item2 brick-item-m brick-item-active"> <a href="#"><img src="${ctxsta}/web/img/T1mzD_B7Cv1RXrhCrK.jpg" alt=""></a> </li>
                      <li class="brick-item2 brick-item-m"> <a href="#"><img src="${ctxsta}/web/img/T1wqdgBTLT1RXrhCrK.jpg" alt=""></a> </li>
                    </ul>
                  </div>
                  <div class="span16">
                    <div id="accessories-content " class="tab-container">
                      <ul class="brick-list sat-list">
                        <li class="brick-item brick-item-m" data-gid="2151900016">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1a3DvB7hv1RXrhCrK!220x220.jpg" width="150" height="150" alt="小米移动电源10000mAh"></a> </div>
                          <h3 class="title"><a href="#"> 小米移动电源10000mAh</a></h3>
                          <p class="price"> <span class="num">79</span>元 </p>
                          <p class="rank"> 13.4万人评价 </p>
                          <div class="flag flag-saleoff"> 享8折 </div>
                          <div class="review-wrapper"> <a href="#"> <span class="review">小米移动电源10400我也买了.比这款大.重,还是喜...</span><span class="author"> 来自于 笑致天下 的评价 <span class="date"></span></span> </a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2151400001">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1tzL_BjYT1RXrhCrK!220x220.jpg" width="150" height="150" alt="小米插线板"></a> </div>
                          <h3 class="title"><a href="#"> 小米插线板 </a></h3>
                          <p class="price"> <span class="num">49</span>元 </p>
                          <p class="rank"> 17.1万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">做工沒的說，摸起來手感非常細膩，而且比起傳統的插線板...</span><span class="author"> 来自于 林岐城 的评价 <span class="date"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2152400008">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1jZD_BmAv1RXrhCrK!220x220.jpg" width="150" height="150" alt="小米蓝牙耳机"></a> </div>
                          <h3 class="title"><a href="#"> 小米蓝牙耳机 </a></h3>
                          <p class="price"> <span class="num">79</span>元 </p>
                          <p class="rank"> 5.2万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">1.非常好用，戴起来很舒适2.音质不错，比某些大品牌...</span><span class="author"> 来自于 什排地帅哥 的评价 <span class="date"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2144200016">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1wWC_ByDv1RXrhCrK!220x220.jpg" width="150" height="150" alt="小钢炮蓝牙音箱 经典款"></a> </div>
                          <h3 class="title"><a href="#"> 小钢炮蓝牙音箱 经典款 </a></h3>
                          <p class="price"> <span class="num">99</span>元 <del><span class="num">129</span>元</del> </p>
                          <p class="rank"> 9.9万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">这小钢炮给我的感觉太震撼了，完全超出了我的意料之外，...</span><span class="author"> 来自于 dp588 的评价 <span class="date"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2154500016">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1r4A_BgWv1RXrhCrK.jpg" width="150" height="150" alt="小米圈铁耳机"></a> </div>
                          <h3 class="title"><a href="#"> 小米圈铁耳机 </a></h3>
                          <p class="price"> <span class="num">99</span>元 </p>
                          <p class="rank"> 1.3万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">音质太棒了。每天跑步时候带着它，带着音乐，真舒服。身...</span><span class="author"> 来自于 248415831 的评价 <span class="date"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2144400039">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1Ktx_BTdv1RXrhCrK.jpg" width="150" height="150" alt="小米移动电源16000mAh"></a> </div>
                          <h3 class="title"><a href="#"> 小米移动电源16000mAh </a></h3>
                          <p class="price"> <span class="num">109</span>元 <del><span class="num">129</span>元</del> </p>
                          <p class="rank"> 10.6万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">自从有了小米移动电源再也不担心出差啦，非常好的一款产...</span><span class="author"> 来自于 气吞山河1 的评价 <span class="date"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="1152400014">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1XbJTB_xT1RXrhCrK!220x220.jpg" width="150" height="150" alt="红米2/红米2A能量套装"></a> </div>
                          <h3 class="title"><a href="#"> 红米2/红米2A能量套装 </a></h3>
                          <p class="price"> <span class="num">69</span>元 <del><span class="num">98</span>元</del> </p>
                        </li>
                        <li class="brick-item brick-item-s" data-gid="2153800019">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1fODjBsbT1RXrhCrK!220x220.jpg" width="80" height="80" alt="小米蓝牙音箱 蓝色"></a> </div>
                          <h3 class="title"><a href="#">小米蓝牙音箱 蓝色</a></h3>
                          <p class="price"> <span class="num">199</span>元 </p>
                        </li>
                        <li class="brick-item brick-item-s">
                          <div class="figure figure-more"> <a href="#"><span class="glyphicon glyphicon-upload"></span></a> </div>
                          <a class="more" href="#">浏览更多<small>热门</small></a> </li>
                      </ul>
                      <ul class="brick-list sat-list">
                        <li class="brick-item brick-item-m" data-gid="2143600013">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1l.D_BvLv1RXrhCrK.jpg" width="150" height="150" alt="先锋CL31系列入耳式耳机"></a> </div>
                          <h3 class="title"><a href="">先锋CL31系列入耳式耳机</a></h3>
                          <p class="price"> <span class="num">99</span>元 </p>
                          <p class="rank"> 4027人评价 </p>
                          <div class="flag flag-saleoff2"> 有赠品 </div>
                          <div class="review-wrapper"> <a href="#"><span class="review">好好好，只有这个感觉，美，太美妙的感觉了，像飘在云絮...</span><span class="author"> 来自于 209665471 的评价 <span class="date" data-date="1426571940"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2153900027">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T13Mb_ByJv1RXrhCrK.jpg" width="150" height="150" alt="小米活塞耳机标准版"></a> </div>
                          <h3 class="title"><a href="#">小米活塞耳机标准版</a></h3>
                          <p class="price"> <span class="num">69</span>元 <del><span class="num">99</span>元</del> </p>
                          <p class="rank"> 1.5万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">送给朋友的，我们都是工业设计专业的，所以对红点奖要有...</span><span class="author"> 来自于 232020299 的评价 <span class="date" data-date="1434443160"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2150300027">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1LEZgBshT1RXrhCrK.jpg" width="150" height="150" alt="小米头戴式耳机"></a> </div>
                          <h3 class="title"><a href="#">小米头戴式耳机</a></h3>
                          <p class="price"> <span class="num">499</span>元 </p>
                          <p class="rank"> 4548人评价 </p>
                          <div class="flag flag-saleoff2"> 有赠品 </div>
                          <div class="review-wrapper"> <a href="#"><span class="review">造型非常棒。盒子设计也很好。非常好的配件和耳机的布局...</span><span class="author"> 来自于 lolilolipop 的评价 <span class="date" data-date="1428800040"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2153300060">
                          <div class="figure figure-img"> <a href="" "#"><img src="${ctxsta}/web/img/T1rLC_ByEv1RXrhCrK.jpg" width="150" height="150" alt="小米活塞耳机 炫彩版"></a> </div>
                          <h3 class="title"><a href="#">小米活塞耳机 炫彩版</a></h3>
                          <p class="price"> <span class="num">29</span>元 </p>
                          <p class="rank"> 7.2万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">超好用，比我用过的耳机都好，声音简直是从脑子里发出的...</span><span class="author"> 来自于 冯庆焱 的评价 <span class="date" data-date="1441968840"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2141700010">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T11LYvBCV_1RXrhCrK.jpg" width="150" height="150" alt="QCY 杰克J02蓝牙耳机"></a> </div>
                          <h3 class="title"><a href="#">QCY 杰克J02蓝牙耳机</a></h3>
                          <p class="price"> <span class="num">69.9</span>元 </p>
                          <p class="rank"> 2.3万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">一次买了2个，一个杰克一个Q8，杰克比Q8要好，音质...</span><span class="author"> 来自于 Go饭桶 的评价 <span class="date" data-date="1390920840"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2144200016">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1DuAvB4bT1RXrhCrK!220x220.jpg" width="150" height="150" alt="小钢炮蓝牙音箱"></a> </div>
                          <h3 class="title"><a href="#">小钢炮蓝牙音箱</a></h3>
                          <p class="price"> <span class="num">99</span>元 <del><span class="num">129</span>元</del> </p>
                          <p class="rank"> 9.9万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">这小钢炮给我的感觉太震撼了，完全超出了我的意料之外，...</span><span class="author"> 来自于 dp588 的评价 <span class="date" data-date="1426003560"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2153800022">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1RuJTByJv1RXrhCrK!220x220.jpg" width="150" height="150" alt="睿米车载蓝牙播放器"></a> </div>
                          <h3 class="title"><a href="#">睿米车载蓝牙播放器</a></h3>
                          <p class="price"> <span class="num">69</span>元 </p>
                          <p class="rank"> 7535人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">做工、质量、性能都很好</span><span class="author"> 来自于 chx 的评价 <span class="date" data-date="1449977700"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-s" data-gid="2134900502">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T16OhvBX_v1RXrhCrK!220x220.jpg" width="80" height="80" alt="铁三角耳机"></a> </div>
                          <h3 class="title"><a href="#">铁三角耳机</a></h3>
                          <p class="price"> <span class="num">118</span>元 </p>
                        </li>
                        <li class="brick-item brick-item-s">
                          <div class="figure figure-more"> <a href="#"><span class="glyphicon glyphicon-upload"></span></a> </div>
                          <a class="more" href="#">浏览更多<small>保护套</small></a> </li>
                      </ul>
                      <ul class="brick-list sat-list">
                        <li class="brick-item brick-item-m" data-gid="2151900018">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1LCWvBmbT1RXrhCrK!220x220.jpg" width="150" height="150" alt="小米移动电源10000mAh"></a> </div>
                          <h3 class="title"><a href=""#>小米移动电源10000mAh</a></h3>
                          <p class="price"> <span class="num">69</span>元 </p>
                          <p class="rank"> 13.3万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">小米移动电源10400我也买了.比这款大.重,还是喜...</span><span class="author"> 来自于 笑致天下 的评价 <span class="date" data-date="1437446280"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2144400039">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1l3V_B7Vv1RXrhCrK!220x220.jpg" width="150" height="150" alt="小米移动电源16000mAh"></a> </div>
                          <h3 class="title"><a href="#">小米移动电源16000mAh</a></h3>
                          <p class="price"> <span class="num">109</span>元 <del><span class="num">129</span>元</del> </p>
                          <p class="rank"> 10.5万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">自从有了小米移动电源再也不担心出差啦，非常好的一款产...</span><span class="author"> 来自于 气吞山河1 的评价 <span class="date" data-date="1435269240"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2154400015">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1dRZTB_xT1RXrhCrK!220x220.jpg" width="150" height="150" alt="移动电源20000mAh"></a> </div>
                          <h3 class="title"><a href="#">移动电源20000mAh</a></h3>
                          <p class="price"> <span class="num">149</span>元 </p>
                          <p class="rank"> 1万人评价 </p>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2145200002">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1zHD_B4xv1RXrhCrK!220x220.jpg" width="150" height="150" alt="ZMI移动电源10000mAh"></a> </div>
                          <h3 class="title"><a href="#">ZMI移动电源10000mAh</a></h3>
                          <p class="price"> <span class="num">99</span>元 </p>
                          <p class="rank"> 2752人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">用了好几款移动电源，唯一这款让我爱不释手的，溥，轻，...</span><span class="author"> 来自于 adyan 的评价 <span class="date" data-date="1420025700"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2145000001">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1jkVvBKAT1RXrhCrK!220x220.jpg" width="150" height="150" alt="ZMI随身路由器"></a> </div>
                          <h3 class="title"><a href="#">ZMI随身路由器</a></h3>
                          <p class="price"> <span class="num">299</span>元 </p>
                          <p class="rank"> 426人评价 </p>
                          <div class="review-wrapper"> <a href="#"> <span class="review">我觉得这个神器太给力了，因为我不看好移动，所以手机都...</span><span class="author"> 来自于 jiaxiaozai 的评价 <span class="date" data-date="1435978080"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2151400001">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T17uYgBXDv1RXrhCrK!220x220.jpg" width="150" height="150" alt="小米插线板"></a> </div>
                          <h3 class="title"><a href="#">小米插线板</a></h3>
                          <p class="price"> <span class="num">49</span>元 </p>
                          <p class="rank"> 17万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">做工沒的說，摸起來手感非常細膩，而且比起傳統的插線板...</span><span class="author"> 来自于 林岐城 的评价 <span class="date" data-date="1431164880"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2154500009">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1nuLvBjET1RXrhCrK!220x220.jpg" width="150" height="150" alt="小米插线板 5孔位"></a> </div>
                          <h3 class="title"><a href="#">小米插线板 5孔位</a></h3>
                          <p class="price"> <span class="num">39</span>元 </p>
                          <p class="rank"> 4720人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">小米注重设计取胜，安全性高，性价比也高。</span><span class="author"> 来自于 818159719 的评价 <span class="date" data-date="1448384880"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-s" data-gid="2134900111">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T154VvByKT1RXrhCrK!220x220.jpg" width="80" height="80" alt="电源适配器"></a> </div>
                          <h3 class="title"><a href="#">电源适配器</a></h3>
                          <p class="price"> <span class="num">19.9</span>元 </p>
                        </li>
                        <li class="brick-item brick-item-s">
                          <div class="figure figure-more"> <a href="#"><span class="glyphicon glyphicon-upload"></span></a> </div>
                          <a class="more" href="#">浏览更多<small>后盖</small></a> </li>
                      </ul>
                      <ul class="brick-list sat-list">
                        <li class="brick-item brick-item-m" data-gid="2151400210">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1XbJTB_xT1RXrhCrK!220x220.jpg" width="150" height="150" alt="CR2032纽扣电池"></a> </div>
                          <h3 class="title"><a href="#">CR2032纽扣电池</a></h3>
                          <p class="price"> <span class="num">9</span>元 </p>
                          <p class="rank"> 7574人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">小米把关，质量还是有得保证的，暂时还没用，先备着！</span><span class="author"> 来自于 陶都 的评价 <span class="date" data-date="1430124840"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2154500009">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1fADvByVv1RXrhCrK!220x220.jpg" width="150" height="150" alt="小米插线板 5孔位"></a> </div>
                          <h3 class="title"><a href="#">小米插线板 5孔位</a></h3>
                          <p class="price"> <span class="num">39</span>元 </p>
                          <p class="rank"> 4720人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">小米注重设计取胜，安全性高，性价比也高。</span><span class="author"> 来自于 818159719 的评价 <span class="date" data-date="1448384880"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2154300020">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1X1JgB4bT1RXrhCrK!220x220.jpg" width="150" height="150" alt="彩虹5号电池（10粒装）"></a> </div>
                          <h3 class="title"><a href="#">彩虹5号电池（10粒装）</a></h3>
                          <p class="price"> <span class="num">9.9</span>元 </p>
                          <p class="rank"> 2万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">价格实惠，外观好看，还有盒子便于保管，不错。</span><span class="author"> 来自于 monkeyshine 的评价 <span class="date" data-date="1448980620"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2151400003">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1UmxTBQhv1RXrhCrK!220x220.jpg" width="150" height="150"></a> </div>
                          <h3 class="title"><a href="#">米兔手机U盘升级</a></h3>
                          版
                          <p class="price"> <span class="num">49.9</span>元 </p>
                          <p class="rank"> 2.1万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">米兔君的升级版，第二次买（第一次买的用了还不到一周就...</span><span class="author"> 来自于 167953031 的评价 <span class="date" data-date="1429099200"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2143800013">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T19UxTBQEv1RXrhCrK!220x220.jpg" width="150" height="150" alt="小米随身WIFI U盘版"></a> </div>
                          <h3 class="title"><a href="#">小米随身WIFI U盘版</a></h3>
                          <p class="price"> <span class="num">49.9</span>元 </p>
                          <p class="rank"> 3.1万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">太强了，隔了几面墙，还可以带一台电视看高清视频（我是...</span><span class="author"> 来自于 277076563 的评价 <span class="date" data-date="1437311820"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2134900578">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T10fdgB__T1RXrhCrK!220x220.jpg" width="150" height="150" alt="SanDisk 8GB存储卡"></a> </div>
                          <h3 class="title"><a href="#">SanDisk 8GB存储卡</a></h3>
                          <p class="price"> <span class="num">17.9</span>元 <del><span class="num">24.9</span>元</del> </p>
                          <p class="rank"> 30.1万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">不错的东东。下次还用它！</span><span class="author"> 来自于 记得抬头看路 的评价 <span class="date" data-date="1430788440"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2155000004">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1vydTBgDT1RXrhCrK!220x220.jpg" width="150" height="150" alt="彩虹7号电池（10粒装）"></a> </div>
                          <h3 class="title"> <a href="#">彩虹7号电池（10粒装）</a></h3>
                          <p class="price"> <span class="num">9.9</span>元 </p>
                          <p class="rank"> 6204人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">很便宜，很实惠，很实用。性价比高。</span><span class="author"> 来自于 云天^0^ 的评价 <span class="date" data-date="1450624440"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-s" data-gid="2153000001">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1caxTBbdT1RXrhCrK!220x220.jpg" width="80" height="80" alt="120cm扁线"></a> </div>
                          <h3 class="title"><a href="#">120cm扁线</a></h3>
                          <p class="price"> <span class="num">19</span>元 </p>
                        </li>
                        <li class="brick-item brick-item-s">
                          <div class="figure figure-more"> <a href="#"><span class="glyphicon glyphicon-upload"></span></a> </div>
                          <a class="more" href="#">浏览更多<small>贴膜</small></a> </li>
                      </ul>
                      <ul class="brick-list sat-list">
                        <li class="brick-item brick-item-m" data-gid="2151400210">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1DEC_ByVv1RXrhCrK!220x220.jpg" width="150" height="150" alt="CR2032纽扣电池"></a> </div>
                          <h3 class="title"><a href="#">CR2032纽扣电池</a></h3>
                          <p class="price"> <span class="num">9</span>元 </p>
                          <p class="rank"> 7574人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">小米把关，质量还是有得保证的，暂时还没用，先备着！</span><span class="author"> 来自于 陶都 的评价 <span class="date" data-date="1430124840"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2154500009">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1UWL_BQJT1RXrhCrK!220x220.jpg" width="150" height="150" alt="小米插线板 5孔位"></a> </div>
                          <h3 class="title"><a href="#">小米插线板 5孔位</a></h3>
                          <p class="price"> <span class="num">39</span>元 </p>
                          <p class="rank"> 4720人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">小米注重设计取胜，安全性高，性价比也高。</span><span class="author"> 来自于 818159719 的评价 <span class="date" data-date="1448384880"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2154300020">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1gyWgB_DT1RXrhCrK!220x220.jpg" width="150" height="150" alt="彩虹5号电池（10粒装）"></a> </div>
                          <h3 class="title"><a href="#">彩虹5号电池（10粒装）</a></h3>
                          <p class="price"> <span class="num">9.9</span>元 </p>
                          <p class="rank"> 2万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">价格实惠，外观好看，还有盒子便于保管，不错。</span><span class="author"> 来自于 monkeyshine 的评价 <span class="date" data-date="1448980620"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2151400003">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1nmhTBTKT1RXrhCrK!220x220.jpg" width="150" height="150"></a> </div>
                          <h3 class="title"><a href="#">米兔手机U盘升级版</a></h3>
                          <p class="price"> <span class="num">49.9</span>元 </p>
                          <p class="rank"> 2.1万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">米兔君的升级版，第二次买（第一次买的用了还不到一周就...</span><span class="author"> 来自于 167953031 的评价 <span class="date" data-date="1429099200"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2143800013">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1CZAjBCbT1RXrhCrK!220x220.jpg" width="150" height="150" alt="小米随身WIFI U盘版"></a> </div>
                          <h3 class="title"><a href="#">小米随身WIFI U盘版</a></h3>
                          <p class="price"> <span class="num">49.9</span>元 </p>
                          <p class="rank"> 3.1万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">太强了，隔了几面墙，还可以带一台电视看高清视频（我是...</span><span class="author"> 来自于 277076563 的评价 <span class="date" data-date="1437311820"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2134900578">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1a3DvB7hv1RXrhCrK!220x220 (1).jpg" width="150" height="150" alt="SanDisk 8GB存储卡"></a> </div>
                          <h3 class="title"><a href="#">SanDisk 8GB存储卡</a></h3>
                          <p class="price"> <span class="num">17.9</span>元 <del><span class="num">24.9</span>元</del> </p>
                          <p class="rank"> 30.1万人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">不错的东东。下次还用它！</span><span class="author"> 来自于 记得抬头看路 的评价 <span class="date" data-date="1430788440"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-m" data-gid="2155000004">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1jZD_BmAv1RXrhCrK!220x220.jpg" width="150" height="150" alt="彩虹7号电池（10粒装）"></a> </div>
                          <h3 class="title"> <a href="#">彩虹7号电池（10粒装）</a></h3>
                          <p class="price"> <span class="num">9.9</span>元 </p>
                          <p class="rank"> 6204人评价 </p>
                          <div class="review-wrapper"> <a href="#"><span class="review">很便宜，很实惠，很实用。性价比高。</span><span class="author"> 来自于 云天^0^ 的评价 <span class="date" data-date="1450624440"></span></span></a> </div>
                        </li>
                        <li class="brick-item brick-item-s" data-gid="2153000001">
                          <div class="figure figure-img"> <a href="#"><img src="${ctxsta}/web/img/T14cLgBXKT1RXrhCrK!220x220.jpg" width="80" height="80" alt="120cm扁线"></a> </div>
                          <h3 class="title"><a href="#">120cm扁线</a></h3>
                          <p class="price"> <span class="num">19</span>元 </p>
                        </li>
                        <li class="brick-item brick-item-s">
                          <div class="figure figure-more"> <a href="#"><span class="glyphicon glyphicon-upload"></span></a> </div>
                          <a class="more" href="#">浏览更多<small>其他配件</small></a> </li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!--     周边end       --> 
          <!--     热评产品begin       -->
          <div id="comment" class="home-review-box xm-plain-box ">
            <div class="box-hd">
              <h2 class="title">热评产品</h2>
            </div>
            <div class="box-bd J_brickBd">
              <ul class="review-list clearfix">
                <li class="review-item review-item-first" data-gid="2144200016">
                  <div class="figure1 figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1ExYjBmxT1RXrhCrK.jpg" width="296" height="220" alt="小钢炮蓝牙音箱"></a> </div>
                  <p class="review"> <a href="#">不错啊，买回来刚听了一天就被朋友抢走了，害得我还要重新下单再买。音质还可以的，还可以蓝牙免提通话。</a> </p>
                  <p class="author"> 来自于 s海峰 的评价 <span class="date" data-date="1422850560"></span> </p>
                  <div class="info">
                    <h3 class="title"><a href="#">小钢炮蓝牙音箱</a></h3>
                    <span class="sep">|</span>
                    <p class="price"> <span class="num">99</span>元 </p>
                  </div>
                </li>
                <li class="review-item" data-gid="2151400003">
                  <div class="figure1 figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1VI_vB7Dv1RXrhCrK.jpg" width="296" height="220" alt="米兔手机U盘"></a> </div>
                  <p class="review"> <a href="#">非常喜欢，萌萌哒，16g大容量！手机电脑两用非常实用！唯一的担心是帽子会不会松动，如果把链子连接在下...</a> </p>
                  <p class="author"> 来自于 宋孟奇 的评价 <span class="date" data-date="1429072560"></span> </p>
                  <div class="info">
                    <h3 class="title"><a href="#">米兔手机U盘</a></h3>
                    <span class="sep">|</span>
                    <p class="price"> <span class="num">49.9</span>元 </p>
                  </div>
                </li>
                <li class="review-item" data-gid="2135200033">
                  <div class="figure1 figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1UfJjB5bT1RXrhCrK.jpg" width="296" height="220" alt="小米随身WIFI"></a> </div>
                  <p class="review"> <a href="#">插在我的台式电脑上当网卡使用，网络很稳定，玩CF延迟才15而且极度稳定，就像有线宽带一样，真的很让人...</a> </p>
                  <p class="author"> 来自于 谁抢了我的小侨 的评价 <span class="date" data-date="1417123800"></span> </p>
                  <div class="info">
                    <h3 class="title"><a href="#">小米随身WIFI</a></h3>
                    <span class="sep">|</span>
                    <p class="price"> <span class="num">19.9</span>元 </p>
                  </div>
                </li>
                <li class="review-item" data-gid="2145000006">
                  <div class="figure1 figure-img"> <a href="#"><img src="${ctxsta}/web/img/T1VgW_BbCT1RXrhCrK.jpg" width="296" height="220" alt="小米空气净化器"></a> </div>
                  <p class="review"> <a href="#">先五星好评。再来说说小米空气净化器，北方的天气雾霾越来越常态，这就迫切需要一台性价比高的空气净化器，...</a> </p>
                  <p class="author"> 来自于 sddyboy 的评价 <span class="date" data-date="1421731260"></span> </p>
                  <div class="info">
                    <h3 class="title"><a href="#">小米空气净化器</a></h3>
                    <span class="sep">|</span>
                    <p class="price"> <span class="num">899</span>元 </p>
                  </div>
                </li>
              </ul>
            </div>
          </div>
          <!--     热评产品end       --> 
        </div>
      </div>
    </div>
  </div>
</div>
<!--     主产品end       -->
</body>
</html>