<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/layouts/base.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<title>创建广告详情 - 猫宁Morning</title>
<link rel="stylesheet" href="${ctxsta}/common/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" />
<link rel="stylesheet" href="${ctxsta}/common/icheck/flat/green.css" />
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
  <div class="row">
    <div class="col-sm-12">
      <div class="ibox float-e-margins">
        <div class="ibox-title">
          <h5>创建广告详情<small> 广告详情信息时应当遵循合法、正当、必要的原则，明示目的、方式和范围。</small></h5>
          <div class="ibox-tools"> <a class="collapse-link"><i class="fa fa-chevron-up"></i></a> <a class="close-link"><i class="fa fa-times"></i></a> </div>
        </div>
        <div class="ibox-content">
          <form id="form" class="form-horizontal" action="${ctx}/online/advert/${advert.advertId}/detail/${advertDetail.advertDetailId}" data-method="put">
            <div class="form-group m-t">
              <label class="col-sm-2 col-xs-offset-1 control-label">广告位名称：</label>
              <div class="col-sm-7">
                <input type="text" disabled="" placeholder="${advert.name}" class="form-control">
              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <label class="col-sm-2 col-xs-offset-1 control-label">广告标题：</label>
              <div class="col-sm-7">
                <input type="text" class="form-control" name="title" value="${advertDetail.title}">
              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <label class="col-sm-2 col-xs-offset-1 control-label">排序：</label>
              <div class="col-sm-7">
                <input type="text" class="form-control" name="sort" value="${advertDetail.sort}">
              </div>
            </div>
            <div class="hr-line-dashed"></div>
              <div class="form-group">
                <label class="col-sm-2 col-xs-offset-1 control-label">链接地址：</label>
                <div class="col-sm-7">
                  <input type="text" class="form-control" name="href" value="${advertDetail.href}">
                </div>
              </div>
              <div class="hr-line-dashed"></div>            
            <c:if test="${advert.type eq 1}">
              <div class="form-group">
                <label class="col-sm-2 col-xs-offset-1 control-label">展示图片：</label>
                <div class="col-sm-7">
                  <input type="text" class="form-control" name="picImg" value="${advertDetail.picImg}">
                </div>
                <a class="btn btn-info view-button"> <i class="fa fa-image"> </i> 查看 </a>
              </div>
              <div class="form-group">
                <div class="col-sm-7 col-xs-offset-3">
                  <input type="file" class="form-control">
                </div>
                <button class="btn btn-success upload-button" type="button"><i class="fa fa-upload"></i>&nbsp;&nbsp;<span class="bold">上传</span> </button>
              </div>
              <div class="hr-line-dashed"></div>
            </c:if>
            <c:if test="${advert.type eq 0}">
              <div class="form-group">
                <label class="col-sm-2 col-xs-offset-1 control-label">广告内容：</label>
                <div class="col-sm-7">
                  <textarea class="form-control" rows="2" name="content" placeholder="请输入广告内容...">${advertDetail.content}</textarea>
                </div>
              </div>
              <div class="hr-line-dashed"></div>
            </c:if>
            <div class="form-group">
              <label class="col-sm-2 col-xs-offset-1 control-label">是否显示：</label>
              <div class="col-sm-9">
                <label class="radio-inline">
                  <input type="radio" name="status" value="1" ${advertDetail.status eq '1'?'checked="checked"':''}>
                  显示</label>
                <label class="radio-inline">
                  <input type="radio" name="status" value="0" ${advertDetail.status eq '0'?'checked="checked"':''}>
                  隐藏</label>
                <label class="radio-inline status-tip"><strong>提示：</strong> 状态</label>
              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <label class="col-sm-2 col-xs-offset-1 control-label">起始时间：</label>
              <div class="col-sm-7">
                <div class="input-group date form_datetime">
                  <input class="form-control" size="16" type="text" name="beginTime" value="<fmt:formatDate value="${advertDetail.beginTime}" pattern="yyyy-MM-dd HH:mm:ss" />" readonly>
                  <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span> <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span> </div>
              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <label class="col-sm-2 col-xs-offset-1 control-label">结束时间：</label>
              <div class="col-sm-7">
                <div class="input-group date form_datetime">
                  <input class="form-control" size="16" type="text" name="endTime" value="<fmt:formatDate value="${advertDetail.endTime}" pattern="yyyy-MM-dd HH:mm:ss" />" readonly>
                  <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span> <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span> </div>
              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <label class="col-sm-2  col-xs-offset-1 control-label">详情备注：</label>
              <div class="col-sm-7">
                <textarea class="form-control" rows="2" name="remarks" placeholder="请输入消息...">${advertDetail.remarks}</textarea>
              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <div class="col-sm-12 text-center">
                <button class="btn btn-primary" type="submit">提交</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
<myfooter> 
  <!-- Data picker --> 
  <script src="${ctxsta}/common/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script> 
  <script src="${ctxsta}/common/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script> 
  <script src="${ctxsta}/common/bootstrap-prettyfile/bootstrap-prettyfile.js"></script> 
  <!-- 自定义js --> 
  <script src="${ctxsta}/cms/js/onlineAdvertDetail.js"></script> 
  <script type="text/javascript">
    $(".form_datetime").datetimepicker({
    	language:  'zh-CN',
        format: "yyyy-mm-dd hh:ii:ss",
        autoclose: true,
        todayBtn: true,
        minuteStep: 10,
        pickerPosition: 'bottom-left',
    });
    $('input[type="file"]').prettyFile();
  </script> 
</myfooter>
</body>
</html>
