<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>

<div class="site-header">
  <div class="container-fluid">
    <div class="header-logo"> <a class="logo ir" href="${ctx}/index" title="猫宁官网"><img src="${ctxsta}/os/images/logo.png"></a> </div>
    <div class="header-nav">
      <ul class="nav-list J_navMainList clearfix">
        <li id="J_navCategory" class="nav-category"> <a class="link-category" href="${ctx}/list?categoryId=1"><span class="text">全部商品分类</span></a> 
          <!--     轮播top菜单导航begin       -->
          <div class="site-category">
            <ul class="site-category-list clearfix">
              <c:forEach items="${categorys}" var="category">
                <li class="category-item"> <a class="title" href="${ctx}/list?categoryId=${category.categoryId}">${category.name}<i class="glyphicon glyphicon-chevron-right"></i></a>
                  <c:choose>
                    <c:when test="${fn:length(category.products)<=6}">
                      <div class="children clearfix children-col-1">
                        <ul class="children-list clearfix">
                          <c:forEach items="${category.products}" var="product" begin="0" end="5">
                            <li> <a class="link" title="${product.name}" href="${ctx}/detail/${product.productNumber}"><img class="thumb" src="${ctximg}/${product.picImg}" width="40" height="40" alt="${product.name}"><span class="text">${product.name}</span></a> </li>
                          </c:forEach>
                        </ul>
                      </div>
                    </c:when>
                    <c:when test="${fn:length(category.products)<=12}">
                      <div class="children clearfix children-col-2">
                        <ul class="children-list children-list-col children-list-col-1">
                          <c:forEach items="${category.products}" var="product" begin="0" end="5">
                            <li> <a class="link" title="${product.name}" href="${ctx}/detail/${product.productNumber}"><img class="thumb" src="${ctximg}/${product.picImg}" width="40" height="40" alt="${product.name}"><span class="text">${product.name}</span></a> </li>
                          </c:forEach>
                        </ul>
                        <ul class="children-list children-list-col children-list-col-2">
                          <c:forEach items="${category.products}" var="product" begin="6" end="11">
                            <li> <a class="link" title="${product.name}" href="${ctx}/detail/${product.productNumber}"><img class="thumb" src="${ctximg}/${product.picImg}" width="40" height="40" alt="${product.name}"><span class="text">${product.name}</span></a> </li>
                          </c:forEach>
                        </ul>
                      </div>
                    </c:when>
                    <c:when test="${fn:length(category.products)<=18}">
                      <div class="children clearfix children-col-3">
                        <ul class="children-list children-list-col children-list-col-1">
                          <c:forEach items="${category.products}" var="product" begin="0" end="5">
                            <li> <a class="link" title="${product.name}" href="${ctx}/detail/${product.productNumber}"><img class="thumb" src="${ctximg}/${product.picImg}" width="40" height="40" alt="${product.name}"><span class="text">${product.name}</span></a> </li>
                          </c:forEach>
                        </ul>
                        <ul class="children-list children-list-col children-list-col-2">
                          <c:forEach items="${category.products}" var="product" begin="6" end="11">
                            <li> <a class="link" title="${product.name}" href="${ctx}/detail/${product.productNumber}"><img class="thumb" src="${ctximg}/${product.picImg}" width="40" height="40" alt="${product.name}"><span class="text">${product.name}</span></a> </li>
                          </c:forEach>
                        </ul>
                        <ul class="children-list children-list-col children-list-col-3">
                          <c:forEach items="${category.products}" var="product" begin="12" end="17">
                            <li> <a class="link" title="${product.name}" href="${ctx}/detail/${product.productNumber}"><img class="thumb" src="${ctximg}/${product.picImg}" width="40" height="40" alt="${product.name}"><span class="text">${product.name}</span></a> </li>
                          </c:forEach>
                        </ul>
                      </div>
                    </c:when>
                    <c:otherwise>
                      <div class="children clearfix children-col-4">
                        <ul class="children-list children-list-col children-list-col-1">
                          <c:forEach items="${category.products}" var="product" begin="0" end="5">
                            <li> <a class="link" title="${product.name}" href="${ctx}/detail/${product.productNumber}"><img class="thumb" src="${ctximg}/${product.picImg}" width="40" height="40" alt="${product.name}"><span class="text">${product.name}</span></a> </li>
                          </c:forEach>
                        </ul>
                        <ul class="children-list children-list-col children-list-col-2">
                          <c:forEach items="${category.products}" var="product" begin="6" end="11">
                            <li> <a class="link" title="${product.name}" href="${ctx}/detail/${product.productNumber}"><img class="thumb" src="${ctximg}/${product.picImg}" width="40" height="40" alt="${product.name}"><span class="text">${product.name}</span></a> </li>
                          </c:forEach>
                        </ul>
                        <ul class="children-list children-list-col children-list-col-3">
                          <c:forEach items="${category.products}" var="product" begin="12" end="17">
                            <li> <a class="link" title="${product.name}" href="${ctx}/detail/${product.productNumber}"><img class="thumb" src="${ctximg}/${product.picImg}" width="40" height="40" alt="${product.name}"><span class="text">${product.name}</span></a> </li>
                          </c:forEach>
                        </ul>
                        <ul class="children-list children-list-col children-list-col-4">
                          <c:forEach items="${category.products}" var="product" begin="17" end="23">
                            <li> <a class="link" title="${product.name}" href="${ctx}/detail/${product.productNumber}"><img class="thumb" src="${ctximg}/${product.picImg}" width="40" height="40" alt="${product.name}"><span class="text">${product.name}</span></a> </li>
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
        <c:forEach items="${indexClassify}" var="indexClassify">
          <li class="nav-item"> <a class="link" href="${indexClassify.href}" target="${indexClassify.target}"><span class="text">${indexClassify.name}</span><span class="arrow"></span></a> </li>
        </c:forEach>
      </ul>
    </div>
    <div class="header-search"> <span class="zySearch" id="zySearch"></span> </div>
  </div>
</div>