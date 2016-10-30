<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!-- 目录导航栏开始 -->
<div id="header">
    <div id="header-content">  
        <div id="header-content-logo">
            <img src="${ctxsta}/web/images/logo4.png" class="img-thumbnail"  />
        </div>
        <div id="header-content-nav">
            <ul>
               <c:forEach items="${classifyList}" var="classifyList" begin="0" end="4">
                   <li class="menu_li"><span>|</span><a href="javascript: void(0)" onclick="submitForm(1,${classifyList.classifyId})">${classifyList.classifyName}</a></li>
               </c:forEach>
            </ul>
        </div>
        <div id="header-content-search">
            <span class="zySearch" id="zySearch"></span>
        </div>
        <div id="header-content-subpage">
            <a>全部商品分类</a>
            <!-- 导航栏栏开始 -->
            <div id="content">
            <div class="position">
	            <ul id="content_menu_wrap">
	            <c:forEach items="${classifyList}" var="classifyList">
	                <li class="active">
	                     <div class="item" onclick="submitForm(1,${classifyList.classifyId})" ><a >${classifyList.classifyName}</a><a class="sign">&gt;</a></div>
	                     <c:choose>
	                     <c:when test="${fn:length(classifyList.goodsList)>6}">
	                     <div class="content_menu_content" style="width:600px;">
	                        <ul class="content_menu_content_ul">
	                        <c:forEach items="${classifyList.goodsList}" var="goodsList" begin="0" end="5">
	                            <li><a href="${ctx}/front/detail/${goodsList.goodsId}"><img src="${ctx}/commodity/${goodsList.goodsImagename}.jpg"/>${goodsList.goodsName}</a></li>
	                        </c:forEach>
	                        </ul>
	                        <ul class="content_menu_content_ul">
	                        <c:forEach items="${classifyList.goodsList}" var="goodsList" begin="6" end="11">
	                        	<li><a href="${ctx}/front/detail/${goodsList.goodsId}"><img src="${ctx}/commodity/${goodsList.goodsImagename}.jpg"/>${goodsList.goodsName}</a></li>
	                        </c:forEach>
	                        </ul>
	                     </div>
	                     </c:when>
	                     <c:otherwise>
	                     <div class="content_menu_content" style="width:300px;">
	                        <ul class="content_menu_content_ul">
	                        <c:forEach items="${classifyList.goodsList}" var="goodsList">
	                            <li><a href="${ctx}/front/detail/${goodsList.goodsId}"><img src="${ctx}/commodity/${goodsList.goodsImagename}.jpg"/>${goodsList.goodsName}</a></li>
	                         </c:forEach>
	                         </ul>
	                     </div>
	                     </c:otherwise>
	                     </c:choose>
	                </li>
	            </c:forEach>
	            </ul>
            </div>
            </div>
            <!-- 导航栏栏结束 --> 
        </div>
   </div>
</div>
<!-- 目录导航栏结束 -->