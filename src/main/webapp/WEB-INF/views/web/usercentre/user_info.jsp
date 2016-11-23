<%@ page language="java" import="java.util.*"  contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE html>
<html>
  <head>
    <title>账户管理- 猫宁Morning</title>
	<link rel="stylesheet" href="${ctxsta}/common/cropper/css/cropper.min.css" />
	<link rel="stylesheet" href="${ctxsta}/common/icheck/square/blue.css" />
	<link rel="stylesheet" href="${ctxsta}/web/css/sitelogo.css" />
  </head>
<body>
        <!-- 右侧，开始 -->
        <article class="uArtucle">              
            <div class="u-r-cont">
                <section>
                    <div>
                        <section class="c-infor-tabTitle c-tab-title">
                            <a href="javascript: void(0)" title="账户管理" style="cursor: default;">账户管理</a>
                            <a href="javascript: void(0)" title="基本资料" class="clickAvailable current">基本资料</a>
                            <a href="javascript: void(0)" title="个人头像" class="clickAvailable ">个人头像</a>
                            <a href="javascript: void(0)" title="密码设置" class="clickAvailable ">密码设置</a>
                        </section>
                    </div>
                    <div class="mt40" id="p_tCont">
                        <div class="u-account-box">
                            <form method="post" id="updateForm">
                                <input type="hidden" name="accountId" value="${user.accountId}" />
                                <ol class="u-account-li"> 
                                    <li>
                                        <label class="u-a-title">
                                            <span class="fsize16 c-999">邮 箱</span>
                                        </label>
                                        <input type="text" class="u-a-inpt" name="email" value="${user.email}" placeholder="" readonly disabled="disabled">
                                    </li>
                                    <li>
                                        <label class="u-a-title">
                                            <span class="fsize16 c-999">手机号</span>
                                        </label>
                                        <input type="text" class="u-a-inpt" name="telephone" value="${user.telephone}" placeholder=" " readonly disabled="disabled">
                                    </li>
                                    <li>
                                        <label class="u-a-title">
                                            <span class="fsize16 c-999">昵 称</span>
                                        </label>
                                        <input type="text" class="u-a-inpt " name="loginName" value="${user.loginName }" placeholder="输入昵称">
                                    </li>
                                    <li>
                                        <label class="u-a-title">
                                            <span class="fsize16 c-999">性 别</span>
                                        </label>
                                        <input type="radio" name="sex" <c:if test="${user.sex==1}">checked="checked"</c:if> value="1"/><span class="vam fsize14 c-666">男</span>
                                        <input type="radio" name="sex" <c:if test="${user.sex==2}">checked="checked"</c:if> value="2"/><span class="vam fsize14 c-666">女</span>
                                    </li>
                                    <li>
                                        <label class="u-a-title">
                                            <span class="fsize16 c-999">年 龄</span>
                                        </label>
                                        <select name="age">
                                                <option value="0">0岁</option>
                                                <c:forEach var="age" begin="1" end="110">
                                                    <option <c:if test="${user.age==age}">selected</c:if> value="${age}">${age}岁</option>
                                                </c:forEach>
                                        </select>
                                    </li>
                                </ol>
                            </form>
                            
                            <div class="ml50 mt50 pl50">
                                <button type="button" class="btn btn-info subbtn" onclick="updateUserInfo()">提 交</button>
                            </div>
                        </div>
                        
                        <!--修改头像，开始-->
                        <div class="u-account-box undis">
                            <div id="tabCont">
                                <section>
                                    <section class="ukindeditor of">
                                        <section class="clearfix">
                                                <div class="portrait">
                                                    <p>做个有头有脸的人!</p>
                                                    <p>上传你喜欢的照片并保存！</p>
                                                    <p>建议上传近距离的照片，比如大头照、特写。</p>
                                                </div>
                                                <div class="uploadWrap mt40">
                                                    <p class="c-green">您上传的图片将会自动生成三种尺寸的清晰头像，请注意小尺寸的头像是否清晰。</p>
                                                </div>

                                                <div id="preview-pane" class="preview-pane">
                                                    <div class="row">
                                                        <div id="crop-avatar" class="col-md-6">
                                                            <div class="avatar-view" title="点击更改头像">
                                                            	<c:choose>
                                                                    <c:when test="${user.picImg!=null && user.picImg!=''}">
                                                                        <img src="${ctx}/${user.picImg}" alt="头像加载中...">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <img src="${ctx}/upload/icon/icon.jpg" alt="头像加载中...">
                                                                    </c:otherwise>
																</c:choose>	
                                                            </div>                                        
                   											<p class="c-999" style="width: 220px;">220x220</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            
                                                <div id="preview-pane" class="preview-pane">
                                                    <div class="row">
                                                         <div id="crop-avatar" class="col-md-6">
                                                            <div class="avatar-view preview-container" style="width: 120px; height: 120px; margin: 0 auto;" >
                                                            	<c:choose>
                                                                    <c:when test="${user.picImg!=null && user.picImg!=''}">
                                                                        <img src="${ctx}/${user.picImg}" alt="头像加载中...">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <img src="${ctx}/upload/icon/icon.jpg" alt="头像加载中...">
                                                                    </c:otherwise>
																</c:choose>	
                                                                <p class="c-999">120x120</p>
                                                           </div>
                                                         </div>
                                             		</div>   
                                                </div>   
                                                                                             
                                                <div id="preview-pane" class="preview-pane">
                                                    <div class="row">
                                                            <div class="avatar-view preview-container" style="width: 80px; height: 80px; margin: 0 auto;">
                                                            	<c:choose>
                                                                    <c:when test="${user.picImg!=null && user.picImg!=''}">
                                                                        <img src="${ctx}/${user.picImg}" alt="头像加载中...">
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <img src="${ctx}/upload/icon/icon.jpg" alt="头像加载中...">
                                                                    </c:otherwise>
																</c:choose>	
                                                                <p class="c-999">80x80</p>
                                                           </div>
                                                    </div>
                                                </div>
                                            	<section class="clear"></section>
                                        </section>
									</section>
                                </section>
                            </div>
                            <input type="button" class="commBtn bgGreen w80 ml50" id="deleImage" style="display: none">
                        </div>
                        <!--修改头像，结束-->
                        
                        <!--修改密码，开始-->
                        <div class="u-account-box undis">
                            <form method="post" name="pwdForm" id="pwdForm">
                                <input type="hidden" name="accountId" value="${user.accountId}" />
                                <ol class="u-account-li">
                                    <li>
                                        <label class="u-a-title">
                                            <span class="fsize16 c-999">原密码</span>
                                        </label>
                                        <input type="password" class="u-a-inpt" name="nowPassword" value="" placeholder="输入原密码" maxlength="16">
                                        <span class="u-a-error"></span>
                                    </li>
                                    <li>
                                        <label class="u-a-title">
                                            <span class="fsize16 c-999">新密码</span>
                                        </label>
                                        <input type="password" class="u-a-inpt" name="newPassword" placeholder="输入新密码" maxlength="16">
                                        <span class="u-a-error"></span>
                                    </li>
                                    <li>
                                        <label class="u-a-title">
                                            <span class="fsize16 c-999">新密码确认</span>
                                        </label>
                                        <input type="password" class="u-a-inpt" name="confirmPwd" value="" placeholder="重复新密码" maxlength="16">
                                        <span class="u-a-error"></span>
                                    </li>
                                </ol>
                            </form>
                            <div class="ml50 mt50 pl50">
                                <button type="button" class="btn btn-info subbtn-info"onclick="updatePwd();">修 改</button>
                               <button type="button" class="btn btn-info subbtn-info"onclick="javascript:$('#pwdForm').find('input').val('');">重 置</button>
            
                            </div>
                        </div>
                        <!--修改密码，结束-->
                    </div>
                </section>
            </div>
        </article>
        <!-- 右侧，结束 -->

        <!--个人头像裁切控件-->
        <div class="modal fade" id="avatar-modal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <form class="avatar-form" action="${ctx}/upload" enctype="multipart/form-data" method="post">
                        <input type="hidden" name="accountId" value="${user.accountId}" />
                        <div class="modal-header">
                            <button class="close" data-dismiss="modal" type="button">&times;</button>
                            <h4 class="modal-title" id="avatar-modal-label">选择并上传图片</h4>
                        </div>
                        <div class="modal-body">
                            <div class="avatar-body">
                                <div class="avatar-upload">
                                    <input class="avatar-src" name="avatar_src" type="hidden">
                                    <input class="avatar-data" name="avatar_data" type="hidden">
                                    <label for="avatarInput">图片上传</label>
                                    <a href="javascript:;" class="file">选择文件
                                        <input class="avatar-input" id="avatarInput" name="avatar_file" type="file">
                                    </a>
                                    </div>
                                <div class="row">
                                    <div class="col-md-9">
                                        <div class="avatar-wrapper"></div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="avatar-preview preview-lg"></div>
                                        <div class="avatar-preview preview-md"></div>
                                        <div class="avatar-preview preview-sm"></div>
                                    </div>
                                </div>
                                <div class="row avatar-btns">
                                    <div class="col-md-9">
                                        <div class="btn-group">
                                            <button class="btn" data-method="rotate" data-option="-90" type="button" title="Rotate -90 degrees"><i class="fa fa-undo"></i> 向左旋转</button>
                                        </div>
                                        <div class="btn-group">
                                            <button class="btn" data-method="rotate" data-option="90" type="button" title="Rotate 90 degrees"><i class="fa fa-repeat"></i> 向右旋转</button>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <button class="btn btn-success btn-block avatar-save" type="submit"><i class="fa fa-save"></i> 保存修改</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                </form>
            </div>
          </div>
        </div>
        <div class="loading" aria-label="Loading" role="img" tabindex="-1"></div>
        <!--个人头像裁切控件-->
        <myfooter>  
		<script src="${ctxsta}/common/cropper/js/cropper.min.js"></script>
		<script src="${ctxsta}/web/js/sitelogo.js"></script>
		<script src="${ctxsta}/common/icheck/icheck.min.js"></script>
		<script>$(function(){showTab('${index}');});</script>
		</myfooter>  
</body>
</html>
