<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>猫宁商城</title>
<link rel="stylesheet" href="${ctxsta}/web/css/index.css">
</head>
<body>
<!--     轮播top菜单导航 begin       -->
<div class="site-header">
  <div class="container-fluid">
    <div class="header-logo"> <a class="logo ir" href="${ctx }/index" title="猫宁官网"><img src="${ctxsta}/web/img/logo.png"></a> </div>
    <div class="header-nav">
      <ul class="nav-list J_navMainList clearfix">
        <li class="nav-category"> <a class="link-category" href="${ctx }/list?categoryId=1"><span class="text">全部商品分类</span></a> 
        <!--     轮播top菜单导航begin       -->
        <div class="site-category">
          <ul class="site-category-list clearfix">
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
<!--     轮播top菜单导航 end       -->

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
      </div>
    </div>
  </div>
</div>
<!--     轮播end         --> 

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
<!--     专场end         --> 

<!--     明星产品begin   -->
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
            <li class="rainbow-item-1"> <a class="thumb" target="_blank" title="${product.name}" href="${ctx }/item/${product.productNumber}"><img src="${ctximg}/${product.picImg}" alt="${product.name }"  width="160" height="160" ></a>
              <h3><a target="_blank" title="${product.name}" href="${ctx }/item/${product.productNumber}">${product.name}</a></h3>
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
<!--     明星产品end     --> 

<!--     主产品  begin    -->
<div class="page-main home-main" data-category-number="${fn:length(indexProductCategoryVOs)}">
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-12">
        <div class="container-fluid"> 
        <!--     主产品区  begin       -->
        <c:forEach items="${categoryVOs }" var="categoryVO" >
          <div class="home-brick-box home-brick-row-2-box xm-plain-box">
            <div class="box-hd">
              <h2 class="title">${categoryVO.name}</h2>
              <div class="more J_brickNav"> <a class="more-link" target="_blank" href="${ctx }/list?categoryId=${categoryVO.categoryId}">查看全部</a><span class="glyphicon glyphicon-circle-arrow-rights"></span> </div>
            </div>
            <div class="box-bd J_brickBd">
              <div class="row">
                <div class="span4 span-first">
				  <ul class="brick-promo-list clearfix">
				  	<c:forEach items="${categoryVO.categoryAdvertDTOs }" var="categoryAdvert">
                    <li class="brick-item2 brick-item-m"> <a title="${categoryAdvert.title}" href="${categoryAdvert.href }" target="_blank"><img src="${ctximg}/${categoryAdvert.picImg}" alt="${categoryAdvert.title}"></a> </li>
                    </c:forEach>
                  </ul>
                </div>
                <div class="span16">
                  <ul class="brick-list clearfix">
                  <c:forEach items="${categoryVO.productVOs}" var="product">
                    <li class="brick-item brick-item-m brick-item-m-2 brick-item-active">
                      <div class="figure figure-img"> <a target="_blank" title="${product.name}" href="${ctx }/item/${product.productNumber}"> <img src="${ctximg}/${product.picImg}" width="160" height="160" alt="${product.name}"> </a> </div>
                      <h3 class="title"><a target="_blank" title="${product.name}" href="${ctx }/item/${product.productNumber}">${product.name}</a></h3>
                      <p class="desc"> ${product.introduce} </p>
                      <p class="price"> <span class="num">${product.showPrice }</span>元 </p>
                      <c:if test="${not empty product.labelName}"><div class="flag"> ${product.labelName } </div></c:if>
                    </li>                 
                  </c:forEach>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </c:forEach>  
        <!--     主产品区 end          --> 
        
        <!--     分栏产品区 begin      -->
        <c:forEach items="${indexProductCategoryVOs }" var="indexProductCategory" varStatus="productCategoryStat">
          <div id="category-${productCategoryStat.index }" class="home-brick-box home-brick-row-2-box xm-plain-box">
            <div class="box-hd">
              <h2 class="title">${indexProductCategory.name }</h2>
              <div class="more J_brickNav">
                <ul class="tab-list J_brickTabSwitch">
                <c:forEach items="${indexProductCategory.categoryVOs }" var="category">
                	<li>${category.name }</li>
                </c:forEach>
                </ul>
              </div>
            </div>
            <div class="box-bd J_brickBd">
              <div class="row">
                <div class="span4 span-first">
                  <ul class="brick-promo-list clearfix">
				  	<c:forEach items="${indexProductCategory.categoryAdvertDTOs }" var="categoryAdvert">
                    <li class="brick-item2 brick-item-m"> <a title="${categoryAdvert.title}" href="${categoryAdvert.href }" target="_blank"><img src="${ctximg}/${categoryAdvert.picImg}" alt="${categoryAdvert.title}"></a> </li>
                    </c:forEach>                  
                  </ul>
                </div>
                <div class="span16">
                  <div id="category-${productCategoryStat.index }-content" class="tab-container">
                  <c:forEach items="${indexProductCategory.categoryVOs }" var="category"  varStatus="categoryStat">
                  	<c:if test="${categoryStat.first}" >
                    <ul class="brick-list">
                    <c:forEach items="${category.productVOs }" var="product" varStatus="productStat">
                     <c:if test="${!productStat.last}" >
                       <li class="brick-item brick-item-m" data-gid="${product.productNumber }">
                        <div class="figure figure-img"> <a target="_blank" title="${product.name}" href="${ctx }/item/${product.productNumber}"> <img src="${ctximg}/${product.picImg}" width="160" height="160" alt="${product.name}"> </a>  </div>
                        <h3 class="title"><a target="_blank" title="${product.name}" href="${ctx }/item/${product.productNumber}">${product.name}</a></h3>
                        <p class="price"> <span class="num">${product.showPrice }</span>元 </p>
                        <p class="rank"> ${product.commentNumber }人评价 </p>
                        <c:if test="${not empty product.content}"><div class="review-wrapper"> <a title="${product.name}" href="${ctx }/item/${product.productNumber}"><span class="review">${product.content }</span><span class="author"> 来自于 ${product.userName } 的评价 <span class="date"></span></span></a> </div></c:if>
                        <c:if test="${not empty product.labelName}"><div class="flag"> ${product.labelName } </div></c:if>
                      </li> 
                      </c:if>
                      <c:if test="${productStat.last}" >
                      <li class="brick-item brick-item-s" data-gid="${product.productNumber }">
                        <div class="figure figure-img"> <a target="_blank" title="${product.name}" href="${ctx }/item/${product.productNumber}"> <img src="${ctximg}/${product.picImg}"  width="80" height="80" alt="${product.name}"> </a>  </div>
                        <h3 class="title"><a target="_blank" title="${product.name}" href="${ctx }/item/${product.productNumber}">${product.name}</a></h3>
                        <p class="price"> <span class="num">${product.showPrice }</span>元 </p>
                        <c:if test="${not empty product.labelName}"><div class="flag"> ${product.labelName } </div></c:if>
                      </li>  
                      <li class="brick-item brick-item-s">
                        <div class="figure figure-more"> <a target="_blank" href="${ctx }/list?categoryId=${category.categoryId}"><span class="glyphicon glyphicon-upload"></span></a> </div>
                        <a class="more" target="_blank" href="${ctx }/list?categoryId=${category.categoryId}">浏览更多<small>${category.name}</small></a> </li>                            
                      </c:if>              
                    </c:forEach>
                    </ul>
                    </c:if>
                  	<c:if test="${!categoryStat.first}" >
                    <ul class="brick-list">
                    <c:forEach items="${category.productVOs }" var="product" varStatus="productStat">
                     <c:if test="${!productStat.last}" >
	                    <li class="brick-item brick-item-m brick-item-m-2 brick-item-active" data-gid="2151100003">
	                      <div class="figure figure-img"> <a target="_blank" title="${product.name}" href="${ctx }/item/${product.productNumber}"> <img src="${ctximg}/${product.picImg}" width="160" height="160" alt="${product.name}"> </a> </div>
	                      <h3 class="title"><a target="_blank" title="${product.name}" href="${ctx }/item/${product.productNumber}">${product.name}</a></h3>
	                      <p class="desc"> ${product.introduce} </p>
	                      <p class="price"> <span class="num">${product.showPrice }</span>元 </p>
	                      <c:if test="${not empty product.labelName}"><div class="flag"> ${product.labelName } </div></c:if>
	                    </li>                        
                      </c:if>
                      <c:if test="${productStat.last}" >
                      <li class="brick-item brick-item-s" data-gid="${product.productNumber }">
                        <div class="figure figure-img"> <a target="_blank" title="${product.name}" href="${ctx }/item/${product.productNumber}"> <img src="${ctximg}/${product.picImg}"  width="80" height="80" alt="${product.name}"> </a>  </div>
                        <h3 class="title"><a target="_blank" title="${product.name}" href="${ctx }/item/${product.productNumber}">${product.name}</a></h3>
                        <p class="price"> <span class="num">${product.showPrice }</span>元 </p>
                        <c:if test="${not empty product.labelName}"><div class="flag"> ${product.labelName } </div></c:if>
                      </li>  
                      <li class="brick-item brick-item-s">
                        <div class="figure figure-more"> <a target="_blank" href="${ctx }/list?categoryId=${category.categoryId}"><span class="glyphicon glyphicon-upload"></span></a> </div>
                        <a class="more" target="_blank" href="${ctx }/list?categoryId=${category.categoryId}">浏览更多<small>${category.name}</small></a> </li>                            
                      </c:if>              
                    </c:forEach>
                    </ul>
                    </c:if>                    
                  </c:forEach>
                  </div>
                </div>
              </div>
            </div>
          </div>
       </c:forEach> 
        <!--     分栏产品区 end       --> 
    
          
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