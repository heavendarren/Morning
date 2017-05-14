<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>修改头像 - 猫宁Morning</title>
<link rel="stylesheet" href="${ctxsta}/common/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ctxsta}/cms/css/animate.css" />
<link rel="stylesheet" href="${ctxsta}/cms/css/style.css" />
<link rel="stylesheet" href="${ctxsta}/common/cropper/css/cropper.min.css" />
<link rel="stylesheet" href="${ctxsta}/common/sitelogo/sitelogo.css" />
<script> baselocation='${ctx}';</script>
</head>
<body class="gray-bg">
<div class="middle-box text-center lockscreen animated fadeInDown">
  <div>
    <div class="m-b-md">
      <div class="avatar">
        <div class="row">
          <div id="crop-avatar" class="col-md-12">
            <div class="avatar-view" title="点击修改头像"> <img src="${ctximg}/${user.picImg}" alt="头像加载中..."> </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="avatar-modal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <form class="avatar-form" action="${ctx}/uploads/avatar" method="post">
      
        <div class="modal-header">
          <button class="close" data-dismiss="modal" type="button">&times;</button>
          <h4 class="modal-title" id="avatar-modal-label">点击修改头像</h4>
        </div>
        <div class="modal-body">
          <div class="avatar-body">
            <div class="avatar-upload">
              <input class="avatar-src" name="avatar_src" type="hidden">
              <input class="avatar-data" name="avatar_data" type="hidden">
              <label for="avatarInput">图片上传</label>
              <a href="javascript:;" class="file">选择文件
              <input class="avatar-input" id="avatarInput" name="avatar_file" type="file">
              </a> </div>
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
 <script src="${ctxsta}/common/jquery/jquery-2.1.4.min.js"></script> 
 <script src="${ctxsta}/common/bootstrap/js/bootstrap.min.js"></script>
 <!-- 头像 --> 
 <script src="${ctxsta}/common/cropper/js/cropper.min.js"></script> 
 <script src="${ctxsta}/common/sitelogo/sitelogo.js"></script> 
</body>
</html>