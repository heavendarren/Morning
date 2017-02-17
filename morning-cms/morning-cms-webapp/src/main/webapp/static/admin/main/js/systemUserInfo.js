/*多选按钮插件*/
$(document).ready(function(){
  $('input').iCheck({
    checkboxClass: 'icheckbox_flat-green',
    radioClass: 'iradio_flat-green'
  });
});

//表单验证
$(function(){
	$('#form-info').bootstrapValidator({
        container: 'tooltip',
	    message: 'This value is not valid',
	    feedbackIcons: {
	        valid: 'glyphicon glyphicon-ok',
	        invalid: 'glyphicon glyphicon-remove',
	        validating: 'glyphicon glyphicon-refresh'
	    },
	    fields: {
	    	'userName': {
	            message: '用户名验证失败',
	            validators: {
	                notEmpty: {
	                    message: '用户名不能为空'
	                }
	            }
	        },
	    	'realName': {
	            message: '真实姓名验证失败',
	            validators: {
	                notEmpty: {
	                    message: '真实姓名不能为空'
	                }
	            }
	        },
	        'telephone': {
	            validators: {
	                notEmpty: {
	                    message: '移动电话不能为空'
	                },
	                regexp: {
	                    regexp: /^1[3|4|5|7|8]\d{9}$/,
	                    message: '手机号码格式不正确'
	                }
	            }
	        },
	        'email': {
	            validators: {
	                notEmpty: {
	                    message: '电子邮箱不能为空'
	                },
	                regexp: {
	                    regexp: /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/,
	                    message: '电子邮箱格式不正确'
	                }
	            }
	        },
	        'sex': {
	            validators: {
	                notEmpty: {
	                    message: '年龄不能为空'
	                },
	                regexp: {
	                    regexp: /^(?:[1-9][0-9]?|1[01][0-9]|120)$/,
	                    message: '年龄格式不正确'
	                }
	            }
	        }
	    }
	})
})

//按钮点击事件
/*修改信息*/
function modify(){
	 $('.form-disabled').attr("disabled", false);
	 $('#sex').hide();
	 $('.add-radio').show();
	 $('.form-group').find('.btn-success').css({'display':'block'});
};
/*保存信息*/
function save_info(){
	 var params='';
	 $("#system-info input").each(function(){
		params+=$(this).serialize()+"&";
     }); 
	 $.ajax({
		 data:params,
		 dataType:"json",
		 type:"post",
		 url:baselocation+'/administrator/info/edit',
		 success:function(result){
			 if(result.success == true){
				 $('.form-disabled').attr("disabled", true);
				 $('#sex').show();
				 $('.add-radio').hide();
				 $('.form-group').find('.btn-success').css({'display':'none'});
			 }else{
				  layer.alert(result.message,{
		              title: '提示框',				
					  icon:0,
				  });
				  return false;
			 }
		 }
	})
};

/*修改密码*/
function change_Password(){
  layer.open({
  type: 1,
  title:'修改密码',
  skin: 'layui-layer-rim', //加上边框
  area: ['420px', '295px'], //宽高
  content: $('#change_Pass'),
  btn:['确认修改'],
  yes:function(index, layero){		
		   if ($("input[name='nowPassword']").val()==""){
			  layer.alert('原密码不能为空!',{
              title: '提示框',				
			  icon:0,
			 });
			return false;
          } 
		  if ($("input[name='newPassword']").val()==""){
			  layer.alert('新密码不能为空!',{
              title: '提示框',				
			  icon:0,
			 });
			return false;
          } 
		  if ($("input[name='confirmPwd']").val()==""){
			  layer.alert('确认新密码不能为空!',{
              title: '提示框',				
			  icon:0,
			 });
			return false;
          }
		  if($("input[name='confirmPwd']").val() != $("input[name='newPassword']").val()){
            layer.alert('密码不一致!',{
              title: '提示框',				
			  icon:0,
			 });
			 return false;
         }
		 var params='';
		 $("#change_Pass input").each(function(){
			params+=$(this).serialize()+"&";
	     }); 
		 $.ajax({
			 data:params,
			 dataType:"json",
			 type:"post",
			 url:baselocation+'/administrator/info/edit/psw',
			 success:function(result){
				 if(result.success == true){
					  layer.alert(result.message,{
			               title: '提示框',				
						   icon:1,		
					  }); 
					  layer.close(index);
					  $("input[name='confirmPwd']").val("");
					  $("input[name='newPassword']").val("");
					  $("input[name='nowPassword']").val("");
				 }else{
					  layer.alert(result.message,{
			              title: '提示框',				
						  icon:0,
					  });
					  return false;
				 }
			 }
		})
	}
  });
}