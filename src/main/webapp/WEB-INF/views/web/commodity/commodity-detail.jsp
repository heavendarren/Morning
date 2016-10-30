<%@ page language="java" import="java.util.*"  contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <title>${goods.goodsName} | Morning 猫宁</title>
    <link rel="stylesheet" href="${ctxsta}/web/css/commodity-detail.css" />
  </head>
<body>
	<!-- 目录导航栏引入 -->
	<jsp:include page="/WEB-INF/views/web/common/topnav.jsp" />
	<!-- 目录导航栏引入 -->
    <!-- 商品详情页开始 -->
    <div id="content">
    	<div id="content-nav">
        	<div id="content-nav-content">
            	<a href="${ctx}">首页</a>   /   <a href="javascript: void(0)" onclick="submitForm(1,${classify.classifyId})">${classify.classifyName}</a>   / ${goods.goodsName}
            </div>
        </div>
        <div id="content-info">
        	<div id="content-info-left">
                <div id="content-info-left-play">
                    <div class="img_ul">
                        <a class="img_a"><img id="largeImg" src="" /></a>
                    </div>
                </div>
                <div class="img_hd">
                    <ul class="clearfix" id="clearfix">
                    	<c:forEach items="${goodsPictureList}" var="goodsPictureList">
                    		<c:if test="${goodsPictureList.goodspicType==0}">
                    			<li ><a class="img_a"><img src="${ctx}/${goodsPictureList.goodspicImage}"></a></li>
                    		</c:if>
                    	</c:forEach>
                  	</ul>
              </div>
          	</div>
       		<div id="content-info-right">
           		<form id="form" action="${ctx}/detail/shopping" method="post">
            	<h1>${goods.goodsName }</h1>
                <p class="describe">${goods.goodsDescript}</p>
                <p class="comment"><img src="" /><span>${goods.goodsReviews}人评价<ins>|</ins>${goods.goodsQuery}个提问<ins>|</ins>${goods.goodsBuyNum}人购买</span></p>
                <p class="money">¥<span>${goods.goodsPrice}</span></p>
				<div class="styles">
                	<h2>颜色：</h2>
                    <ul class="style-simg" id="style-simg-color">
                   		<label for="color1">
                    		<li><img src="#"><i></i></li>
                    	</label>
                    	<input type="radio" name="goodsColor"  class="label-radio" id="color1" value="1" />
                    	
                    	<label for="color2">
                    		<li ><img src="#"><i></i></li>
                    	</label>
                    	<input type="radio" name="goodsColor"  class="label-radio" id="color2" value="2" />
                    	
                    	<label for="color3">
                    		<li ><img src="#"><i></i></li>
                    	</label>
                    	<input type="radio" name="goodsColor"  class="label-radio" id="color3" value="3" />
                    	
                    	<label for="color4">
                    		<li ><img src="#"><i></i></li>
                    	</label>
                    	<input type="radio" name="goodsColor"  class="label-radio" id="color4" value="4" />
                    	
                    	<label for="color5">
                    		<li ><img src="#"><i></i></li>
                    	</label>
                    	<input type="radio" name="goodsColor"  class="label-radio" id="color5" value="5" />
                    </ul>
                    <h2>尺寸：</h2>
                    <ul class="style-simg" id="style-simg-size">
                        <label for="size1">
                            <li ><div class="style-title">套餐一</div><i></i></li>
                        </label>
                        <input type="radio" name="goodsStandard"  class="label-radio" id="size1" value="1" />
                        <label for="size2">
                            <li ><div class="style-title">套餐二</div><i></i></li>
                        </label>
                        <input type="radio" name="goodsStandard"  class="label-radio" id="size2" value="2" />
                        <label for="size3">
                            <li ><div class="style-title">套餐三</div><i></i></li>
                        </label>
                        <input type="radio" name="goodsStandard"  class="label-radio" id="size3" value="3" />
                        <label for="size4">
                            <li ><div class="style-title">套餐四</div><i></i></li>
                        </label>
                        <input type="radio" name="goodsStandard"  class="label-radio" id="size4" value="4" />
                        <label for="size5">
                            <li ><div class="style-title">套餐五</div><i></i></li>
                        </label>
                        <input type="radio" name="goodsStandard"  class="label-radio" id="size5" value="5" />
                    </ul>
                    
                    <h2>数量：</h2>
                    <div class="tb-amount-widget">
                    	<input type="text"  name="orderNumber" value="1" class="input-count"/>
                        <div class="tb-amount-btn">
                            <a href="javascript:;" class="add_btn"></a>
                            <a href="javascript:;" class="min_btn"></a>
                        </div>
                        <span>件 库存${goods.goodsSaveInfo}件</span>
                    </div>
                </div>
                <div class="pro-detai-cart">
                	<label for="submit">
                    	<a class="cart"><p>加入购物车</p></a>
                    </label>
                    <input type="hidden"  name="goodsId" value="${goods.goodsId}" />
                    <input type="submit" id="submit" class="label-radio" />
                    	<a href="#" class="collection"></a>
                </div>
                </form>
                
                <div class="service">
                	<div id="service-content-left">
                        <p>享受服务</p>
                        <p1 class="fqfk"><a href="#">分期付款</a></p1>
                    </div>
                    <div id="service-content-right">
                        <p>享受保障</p>
 						<p1 class="th"><a href="#">15天退货</a></p1><br/>
                        <p1 class="bx"><a href="#">一年保修</a></p1>
                    </div>
                </div>
            </div>
      </div>
    </div>
   	<!-- 商品详情页结束 -->
	
    <!-- 商品描述页开始 -->
    <div id="pro-detailed">
    	<div id="pro-detailed-content">
        	<div class="pro-detailed-content-left">
                <ul class="pro-detailed-left-title">
                    <li class="active"><a href="${ctx}/front/detail/${goods.goodsId}#goodsDesc">详细信息</a></li>
                    <li><a href="${ctx}/front/detail/${goods.goodsId}#goodsParam">规格参数</a></li>
                    <li><a href="${ctx}/front/detail/${goods.goodsId}#goodsComment">评价晒单</a></li>
                    <li><a href="${ctx}/front/detail/${goods.goodsId}#goodsFaq">商品提问</a></li>
                    <li><a href="${ctx}/front/detail/${goods.goodsId}#serQue">售后服务</a></li>
                </ul>
                <div class="pro-detailed-left-content">
                         <!-- 详细信息 -->
                         <div id="goodsDesc">
						 <c:forEach items="${goodsPictureList}" var="goodsPictureList">
                    		<c:if test="${goodsPictureList.goodspicType==1}">
                    			<img src="${ctx}/${goodsPictureList.goodspicImage}" />
                    		</c:if>
                    	 </c:forEach>                         
                         </div>
                         <!-- 规格参数 -->
                         <div id="goodsParam">
                            <div class="title">规格参数</div>
                            <ul>
                                <li><p><span>品牌 ： </span></p></li>
                                <li><p><span>尺寸 ： </span>20厘米-29厘米</p></li>
                                <li><p><span>编号：</span>${goods.goodsId}</p></li>
                                <li><p><span>颜色分类 ： </span>红色</p></li>
                                <li><p style="white-space:normal;"><span>适用对象 ： </span>仅适配偏震式屏幕</p></li>
                            </ul>
                         </div>
                         <!-- 评价晒单 -->
                         <div id="goodsComment">
                             <div class="title"><strong>用户评价</strong><p><a href="#" class="active">很有用</a>|<a href="#">最新</a></p></div>
                             <div class="goodsComment-zj">
                                <div class="left"><p>96.1<span>%</span></p><pre>五星评价率</pre></div>
                                    <div class="right">
                                    <ul class="star">
                                        <li><i class="star5"></i><bdo>1696人</bdo></li>
                                        <li><i class="star4"></i><bdo>90人</bdo></li>
                                        <li><i class="star3"></i><bdo>5人</bdo></li>
                                        <li><i class="star2"></i><bdo>1人</bdo></li>
                                        <li><i class="star1"></i><bdo>0人</bdo></li>
                                    </ul>
                                </div>
                                </div>
                             <div class="goodsComment-c">
                                <ul>
                                    <li>
                                        <div class="tou-x"><img src="" width="78" height="78" /><p>猫宁Morning.</p></div>
                                        <div class="pl-c">
                                            <div class="pl-c-1"><i class="star5"></i><span>2014-12-1</span></div>
                                            <div class="pl-c-2"><p>评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价</p></div>
                                            <div class="pl-c-3">
                                                <p><span>此评价是否有用？</span> <a href="javascript:;">有用(169)</a> <a href="javascript:;">没用(67)</a></p>
                                                <strong>来自于猫宁网 | <a href="#">回复 (2)</a></strong>
                                            </div>
                                        </div>
                                    </li>
                                    
                                    <li>
                                        <div class="tou-x"><img src="" width="78" height="78" /><p>猫宁Morning.</p></div>
                                        <div class="pl-c">
                                            <div class="pl-c-1"><i class="star5"></i><span>2014-12-1</span></div>
                                            <div class="pl-c-2"><p>评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价</p></div>
                                            <div class="pl-c-3">
                                                <p><span>此评价是否有用？</span> <a href="javascript:;">有用(169)</a> <a href="javascript:;">没用(67)</a></p>
                                                <strong>来自于猫宁网 | <a href="#">回复 (2)</a></strong>
                                            </div>
                                        </div>
                                    </li>
                                    
                                    <li>
                                        <div class="tou-x"><img src="" width="78" height="78" /><p>猫宁Morning.</p></div>
                                        <div class="pl-c">
                                            <div class="pl-c-1"><i class="star5"></i><span>2014-12-1</span></div>
                                            <div class="pl-c-2"><p>评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价</p></div>
                                            <div class="pl-c-3">
                                                <p><span>此评价是否有用？</span> <a href="javascript:;">有用(169)</a> <a href="javascript:;">没用(67)</a></p>
                                                <strong>来自于猫宁网 | <a href="#">回复 (2)</a></strong>
                                            </div>
                                            <div class="pl-c-4">
                                                <p><span>官方回复：</span>回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复回复</p>
                                            </div>
                                        </div>
                                    </li>
                                    
                                    <li>
                                        <div class="tou-x"><img src="" width="78" height="78" /><p>猫宁Morning.</p></div>
                                        <div class="pl-c">
                                            <div class="pl-c-1"><i class="star5"></i><span>2014-12-1</span></div>
                                            <div class="pl-c-2"><p>评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价评价</p></div>
                                            <div class="pl-c-3">
                                                <p><span>此评价是否有用？</span> <a href="javascript:;">有用(169)</a> <a href="javascript:;">没用(67)</a></p>
                                                <strong>来自于猫宁网 | <a href="#">回复 (2)</a></strong>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                             <div class="goodsComment-more"><a href="goodsComment-more.html">查看全部评价 ></a></div>
                         </div>
                         <!-- 商品提问 -->
                         <div id="goodsFaq">
                            <div class="title">
                                <strong>产品提问</strong><p><a href="#">查看全部 ></a></p>
                            </div>
                            <div class="goodsFaq-c">
                            <ul>
                                <li>
                                    <div class="question"><i>Q</i><h3>提问</h3></div>
                                    <div class="answer"><i>A</i><p>回答回答回答回答回答回答回答回答回答回答回答回答</p></div>
                                    <div class="use-time"><p>134494448</p><span>2016年05月16日</span></div>
                                </li>
                                <li>
                                    <div class="question"><i>Q</i><h3>提问二</h3></div>
                                    <div class="answer"><i>A</i><p>回答回答回答回答回答回答回答回答回答回答回答回答</p></div>
                                    <div class="use-time"><p>134494448</p><span>2014年09月16日</span></div>
                                </li>
                                <li>
                                    <div class="question"><i>Q</i><h3>提问</h3></div>
                                    <div class="answer"><i>A</i><p>回答回答回答回答回答回答回答回答回答回答回答回答</p></div>
                                    <div class="use-time"><p>134494448</p><span>2016年05月16日</span></div>
                                </li>
                                <li>
                                    <div class="question"><i>Q</i><h3>提问二</h3></div>
                                    <div class="answer"><i>A</i><p>回答回答回答回答回答回答回答回答回答回答回答回答</p></div>
                                    <div class="use-time"><p>134494448</p><span>2014年09月16日</span></div>
                                </li>
                            </ul>
                        </div>
                            <div class="faq-input">
                            <span>我要提问</span>
                            <input type="text" value="输入你的提问" onFocus="this.value=''" onBlur="if(!value){value=defaultValue;}">
                            <button type="button">提交</button>
                        </div>
                         </div>
                         <!-- 售后服务 -->
                         <div id="serQue">
                           <div class="title">
                                <strong>售后服务</strong><p><a href="#">查看全部 ></a></p>
                            </div>
                            <div class="nTab3">
                            <!-- 标题开始 -->
                            <div class="TabTitle">
                              <ul id="myTab0">                     
                                <li class="active" onclick="nTabs(this,0);">常见问题</li>
                                <li class="normal" onclick="nTabs(this,1);">售后服务</li>
                              </ul>
                            </div>
                            <!-- 内容开始 -->
                            <div class="TabContent">
                                    <!--常见问题-->
                                  <div id="myTab0_Content0" class="intro">
                                        <h2>如何挑选商品？</h2>
                                        <p>点击页面上方“加入购物车”按钮或页面下拉时顶部导航上的“加入购物车”按钮将商品加入购物车，再点击页面右上角的“购物车”前往购物车页面进行结算。</p>
                                        
                                        <h2>收藏商品功能</h2>
                                        <p>点击“收藏按钮”后，按钮中的白心亮起,背景由黑色变为黄色代表收藏成功，再次点击取消收藏。您可在“个人中心”中的我的收藏查看所有收藏商品。</p>
                                        
                                        <h2>维修网点销售配件吗？</h2>
                                        <p>所有授权维修网点具备维修手机标配里配件的功能，部分指定授权维修网点可销售标配及部分官网配件，具体销售的产品及价格请以修网点信息为准。</p>
                                        
                                        <h2>退换货办理流程</h2>
                                        <p>您可拨打猫宁客服中心400-100-5678与客服人员沟通，或登录猫宁网“我的订单” ->“订单详情”下方点击“申请售后服务”并填写相应信息，猫宁看到您的申请，会安排工作人员与您进行退换货质量确认并办理相关事宜.</p>
                                  </div>
                                  <!--售后服务-->
                                  <div id="myTab0_Content1" class="intro" style="display:none;">
                                        <p>1.自签收之日起，如商品及包装保持猫宁出售时原状且配件齐全，七天退货，十五天换货。</p>
                                        <p> 2.退换凭证：用户提供相关订单号。</p>
                                        <p>3.非质量问题的退换，需要产品包装完好、不影响二次销售，且需用户承担退换运费；非质量问题退换次数仅限一次。</p>
                                        <p>4.因质量问题办理退换服务，在邮寄商品时，用户须将快递发票一并寄回，此过程中产生的相关运费凭快递发票最高可报销15元/单。质量问题的退换，用户在线咨询，上传凭证，经确认后寄回检测，然后进入相关流程。</p>
                                        <p>1.自签收之日起，如商品及包装保持猫宁出售时原状且配件齐全，七天退货，十五天换货。</p>
                                        <p> 2.退换凭证：用户提供相关订单号。</p>
                                        <p>3.非质量问题的退换，需要产品包装完好、不影响二次销售，且需用户承担退换运费；非质量问题退换次数仅限一次。</p>
                                        <p>4.因质量问题办理退换服务，在邮寄商品时，用户须将快递发票一并寄回，此过程中产生的相关运费凭快递发票最高可报销15元/单。质量问题的退换，用户在线咨询，上传凭证，经确认后寄回检测，然后进入相关流程。</p>
                                  </div>
                            </div>
                       </div>
                    </div>
                 </div>
            </div>
        </div>
    </div>
    <!-- 商品描述页结束 -->
    <myfooter>
    <script src="${ctxsta}/web/js/commodity.detail.js"></script>    
    </myfooter>
</body>
</html>
  