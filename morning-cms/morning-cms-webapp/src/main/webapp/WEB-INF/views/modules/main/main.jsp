<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
  <head>
  	<title>后台管理系统 - 猫宁Morning</title>
	<link rel="stylesheet" href="${ctxsta}/admin/main/css/style.css" />
  </head>
  <body>
  	    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            <span>
                            	<img src="${ctximg}/${user.picImg}" alt="头像加载中..." class="img-circle circle-size">	
							</span>
                            <a data-toggle="dropdown" class="dropdown-toggle" href="">
                                <span class="clear">
                                <span class="block m-t-xs"><strong class="font-bold">${user.userName}</strong></span>
                                <span class="text-muted text-xs block">${user.organizationName }<b class="caret"></b></span>
                                </span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <li><a class="J_menuItem" href="form_avatar.html">修改头像</a>
                                </li>
                                <li><a class="J_menuItem" href="${ctx}/administrator/info">个人资料</a>
                                </li>
                                <li><a class="J_menuItem" href="contacts.html">联系我们</a>
                                </li>
                                <li><a class="J_menuItem" href="mailbox.html">信箱</a>
                                </li>
                                <li class="divider"></li>
                                <li><a href="${ctx}/logout">安全退出</a>
                                </li>
                            </ul>
                        </div>
                    </li>
					<c:forEach items="${menus}" var="menu">
						<c:choose>
							<c:when test="${menu.childMenus != null && menu.childMenus.size()>0}">
								<li>
			                        <a href="${ctx}${menu.href}">
			                            <i class="fa fa-${menu.icon}"></i>
			                            <span class="nav-label">${menu.menuName}</span>
										<c:choose>
											<c:when test="${menu.menuCode == 'order'}"><span class="label label-warning pull-right">16</span></c:when>
				                            <c:when test="${menu.menuCode == 'message'}"><span class="label label-danger pull-right">16</span></c:when>
				                            <c:otherwise><span class="fa arrow"></span></c:otherwise>
										</c:choose>
			                        </a>
			                        <ul class="nav nav-second-level">
			                        <c:forEach items="${menu.childMenus}" var="childMenu">
			                            <li>
			                                <a class="J_menuItem" href="${ctx}${childMenu.href}"><i class="fa fa-${childMenu.icon}"></i>${childMenu.menuName}</a>
			                            </li>
			                        </c:forEach>
			                        </ul>
			                    </li>
							</c:when>
							<c:otherwise>
								<li>
			                        <a class="J_menuItem" href="${ctx}${menu.href}">
			                            <i class="fa fa-${menu.icon}"></i>
			                            <span class="nav-label">${menu.menuName}</span>
			                        </a>
			                    </li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header">
                    	<a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
                        <div role="search" class="navbar-form-custom">
                            <div class="form-group">
                                <a class="form-control" id="time"></a>
                            </div>
                        </div>
                    </div>
                    <ul class="nav navbar-top-links navbar-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                                <i class="fa fa-bell"></i> <span class="label label-primary">8</span>
                            </a>
                            <ul class="dropdown-menu dropdown-alerts">
                                <li>
                                    <a href="">
	                                    <i class="fa fa-envelope fa-fw"></i> 您有16条未读消息
	                                    <span class="pull-right text-muted small">4分钟前</span>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <c:if test="${mainCountMap.undisposedOrder>0}">
                                 <li>
                                    <a href="">
	                                    <i class="fa fa-money fa-fw"></i> 您有${mainCountMap.undisposedOrder }条未处理订单
	                                    <span class="pull-right text-muted small">${mainCountMap.undisposedOrderTime }</span>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                </c:if>
                                <li>
                                    <a href="">
	                                    <i class="fa fa-volume-down fa-fw"></i> 3条新回复
	                                    <span class="pull-right text-muted small">12分钟前</span>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="text-center link-block">
                                        <a class="J_menuItem" href="notifications.html">
                                            <strong>查看所有 </strong>
                                            <i class="fa fa-angle-right"></i>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown hidden-xs">
                            <a class="right-sidebar-toggle" aria-expanded="false">
                                <i class="fa fa-tasks"></i> 主题
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <a href="javascript:;" class="active J_menuTab" data-id="index_v1.html">首页</a>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
                </button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>

                    </button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li class="J_tabShowActive"><a>定位当前选项卡</a>
                        </li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                        </li>
                        <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                        </li>
                    </ul>
                </div>
                <a href="${ctx}/logout" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${ctx}/main"></iframe>
            </div>
            <div class="footer">
                <div class="pull-right">© 2016<a href="http://wpa.qq.com/msgrd?v=3&uin=810170512&site=qq&menu=yes" target="_Blank"> 穿鞋子的猫 </a>
                </div>
            </div>
        </div>
        <!--右侧部分结束-->
        <!--右侧边栏开始-->
        <div id="right-sidebar">
            <div class="sidebar-container">

                <ul class="nav nav-tabs navs-3">

                    <li class="active">
                        <a data-toggle="tab" href="#tab-1">
                            <i class="fa fa-gear"></i> 主题
                        </a>
                    </li>
                    <li class="">
                    	<a data-toggle="tab" href="#tab-2">
                        	<i class="fa fa-comments-o"></i>评论
                    	</a>
                    </li>

                </ul>

                <div class="tab-content">
                    <div id="tab-1" class="tab-pane active">
                        <div class="sidebar-title">
                            <h3> <i class="fa fa-gear"></i> 主题设置</h3>
                            <small><i class="fa fa-tim"></i> 你可以从这里选择和预览主题的布局和样式，这些设置会被保存在本地，下次打开的时候会直接应用这些设置。</small>
                        </div>
                        <div class="skin-setttings">
                            <div class="title">主题设置</div>
                            <div class="setings-item">
                                <span>收起左侧菜单</span>
                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="collapsemenu">
                                        <label class="onoffswitch-label" for="collapsemenu">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="setings-item">
                                <span>固定顶部</span>

                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="fixednavbar" class="onoffswitch-checkbox" id="fixednavbar">
                                        <label class="onoffswitch-label" for="fixednavbar">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="setings-item">
                                <span>固定宽度</span>

                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="boxedlayout" class="onoffswitch-checkbox" id="boxedlayout">
                                        <label class="onoffswitch-label" for="boxedlayout">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="title">皮肤选择</div>
                            <div class="setings-item default-skin nb">
                                <span class="skin-name ">
                         			<a href="#" class="s-skin-0">默认皮肤</a>
                    			</span>
                            </div>
                            <div class="setings-item blue-skin nb">
                                <span class="skin-name ">
                        		<a href="#" class="s-skin-1">蓝色主题</a>
                    			</span>
                            </div>
                            <div class="setings-item yellow-skin nb">
                                <span class="skin-name ">
                        		<a href="#" class="s-skin-3">黄色/紫色主题</a>
                    			</span>
                            </div>
                        </div>
                    </div>
                    <div id="tab-2" class="tab-pane">

                        <div class="sidebar-title">
                            <h3> <i class="fa fa-comments-o"></i> 最新评论</h3>
                            <small><i class="fa fa-tim"></i> 您当前有10条未读信息</small>
                        </div>

                        <div>

                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="">
                                        <div class="m-t-xs">
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                        </div>
                                    </div>
                                    <div class="media-body">
                                        	据天津日报报道：瑞海公司董事长于学伟，副董事长董社轩等10人在13日上午已被控制。
                                        <br>
                                        <small class="text-muted">今天 4:21</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="">
                                    </div>
                                    <div class="media-body">
                                        HCY48之音乐大魔王会员专属皮肤已上线，快来一键换装拥有他，宣告你对华晨宇的爱吧！
                                        <br>
                                        <small class="text-muted">昨天 2:45</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="">
                                    </div>

                                    <div class="media-body">
                                        国外极限小子的炼成！这还是亲生的吗！！
                                        <br>
                                        <small class="text-muted">昨天 8:37</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="">
                                    </div>
                                    <div class="media-body">

                                        一只流浪狗被收留后，为了减轻主人的负担，坚持自己觅食，甚至......有些东西，可能她比我们更懂。
                                        <br>
                                        <small class="text-muted">今天 4:21</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="">
                                    </div>
                                    <div class="media-body">
                                        这哥们的新视频又来了，创意杠杠滴，帅炸了！
                                        <br>
                                        <small class="text-muted">昨天 2:45</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="">

                                        <div class="m-t-xs">
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                            <i class="fa fa-star text-warning"></i>
                                        </div>
                                    </div>
                                    <div class="media-body">
                                        最近在补追此剧，特别喜欢这段表白。
                                        <br>
                                        <small class="text-muted">昨天 1:10</small>
                                    </div>
                                </a>
                            </div>
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="">
                                    </div>
                                    <div class="media-body">
                                        我发起了一个投票 【你认为下午大盘会翻红吗？】
                                        <br>
                                        <small class="text-muted">星期一 8:37</small>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!--右侧边栏结束-->
        <myfooter>
        <!-- 第三方插件 -->
		<script src="${ctxsta}/admin/main/js/pace/pace.min.js"></script>
        </myfooter>
    </div>
  </body>
</html>
