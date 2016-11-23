package com.morning.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.morning.common.util.UploadFileUtils;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：ImageUploadController   
* 类描述：头像上传表示层   
* 创建人：陈星星   
* 创建时间：2016年8月22日  上午9:39:45
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午10:25:13   
* @version    
*
 */
@Controller
public class ImageUploadController extends BaseController {
	
	private static Logger logger = LoggerFactory.getLogger(ImageUploadController.class);
	
    @RequestMapping(value = "/upload",method = RequestMethod.POST, produces="application/json;charset=utf-8")  
	@ResponseBody
	public Map<String, Object> uploadHeadPortrait(MultipartFile avatar_file,String avatar_src,String avatar_data, HttpServletRequest request){
		Map<String, Object> json = new HashMap<String, Object>();
		if (!avatar_file.isEmpty()) {
			try{
		        //判断文件的MIMEtype
		        String type = avatar_file.getContentType();
		        if(type == null || !type.toLowerCase().startsWith("image/")){
		        	json = this.setJson(false, "不支持的文件类型，仅支持图片!", null);
		        	return  json;
		        }
				//头像存放文件
				String dir = "icon";
				Map<String, Object> returnMap = UploadFileUtils.Upload(request,avatar_file,avatar_data,dir);
				//返回的布尔型参数的值为true，如果字符串参数不为null，是相等的，忽略大小写字符串“true”。
				if (Boolean.parseBoolean(returnMap.get("flag").toString()) == true) {
					json = this.setJson(true, "上传成功!", returnMap.get("savaPath").toString());
					return json;
				} 
			}catch(Exception e){
				logger.error("ImageUploadController.uploadHeadPortrait", e);
				json = this.setJson(false, "上传失败，出现异常："+e.getMessage(), null);
				return json;
			}
		}
    	json = this.setJson(false, "不支持的文件类型，仅支持图片!", null);
    	return  json;
	}
}
