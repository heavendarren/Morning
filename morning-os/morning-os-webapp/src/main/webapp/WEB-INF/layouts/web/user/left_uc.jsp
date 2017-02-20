<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
				<!-- 左侧，开始 -->
				<menu class="uMenu">
                    <dl>
                        <dt> 
                            <section class="of">
                                <div class="u-face-pic">
                                    <c:choose>
                                        <c:when test="${user.picImg!=null && user.picImg!=''}">
                                            <img src="${ctx}/${user.picImg}" alt="头像加载中..." class="userImgPhoto">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="${ctx}/upload/icon/icon.jpg" alt="头像加载中..." class="userImgPhoto">
                                        </c:otherwise>
                                    </c:choose>	
                                    <a href="${ctx}/user/initUpdateUser/1" title="" class="c-fff">修改头像</a>
                                </div>
                                <h4 class="mt10"><span class="userNameClass">${user.loginName}</span></h4>
                                <div class="hLh30 mt20">
                                    <a href="${ctx}/user/initUpdateUser/0" title="" class="c-blue">个人资料设置</a>
                                </div>
                                <div class="clear"></div>
                            </section>
                        </dt>
                        <dd class="u-m-dd">
                            <ul>
                                <li>
                                    <span>账户管理</span>
                                    <ol>
                                        <li><a href="${ctx}/user/initUpdateUser/0" title="">基本资料</a></li>
                                        <li><a href="${ctx}/user/initUpdateUser/1" title="">个人头像</a></li>
                                        <li><a href="${ctx}/user/initUpdateUser/2" title="">修改密码</a></li>
                                    </ol>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <span>订单中心</span>
                                    <ol>
                                        <li><a href="${ctx}/user/myorder/list" title="">我的订单</a></li>
                                        <li><a href="#" title="">评价晒单</a></li>
                                    </ol>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <span>个人中心</span>
                                    <ol>
                                        <li><a href="#" title="">我的个人中心</a></li>
                                        <li><a href="#" title="">喜欢的商品</a></li>
                                        <li><a href="${ctx}/user/myaddress/list" title="">收货地址</a></li>
                                        <li><a href="#" title="">我的提问</a></li>
                                    </ol>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <span>Wo的消息</span>
                                    <ol>
                                        <li><a href="" title="">系统消息</a></li>
                                    </ol>
                                </li>
                            </ul>
                        </dd>
                    </dl>
				</menu>
				<!-- 左侧，结束 -->