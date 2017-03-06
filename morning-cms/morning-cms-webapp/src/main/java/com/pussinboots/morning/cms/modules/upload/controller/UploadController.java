package com.pussinboots.morning.cms.modules.upload.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.HtmlUtils;

import com.pussinboots.morning.common.controller.BaseController;
import com.pussinboots.morning.common.enums.WebSiteFileBelongEnum;
import com.pussinboots.morning.common.result.ResponseResult;
import com.pussinboots.morning.common.upload.UploadManager;

@Controller
@RequestMapping(value="/uploads")
public class UploadController extends BaseController{
	
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	
	/**
	 * POST 用户头像上传
	 * @param avatar_file
	 * @param avatar_src
	 * @param avatar_data
	 * @return
	 */
	@PostMapping(value = "/avatar", produces = "application/json;charset=utf-8")
	@ResponseBody
	public ResponseResult uploadAvatar(MultipartFile avatar_file, String avatar_src, String avatar_data) {
		if (!avatar_file.isEmpty()) {
			try {
				// 判断文件的MIMEtype
				String type = avatar_file.getContentType();
				if (type == null || !type.toLowerCase().startsWith("image/")) {
					return fail(false, "不支持的文件类型，仅支持图片!");
				}
				Map<String, Object> returnMap = UploadManager.upload(getRequest(), avatar_file,
						HtmlUtils.htmlUnescape(avatar_data), WebSiteFileBelongEnum.IMAGES.getBelong(),
						WebSiteFileBelongEnum.AVATAR.getBelong());
				// 返回的布尔型参数的值为true，如果字符串参数不为null，是相等的，忽略大小写字符串“true”。
				if (Boolean.parseBoolean(returnMap.get("flag").toString())) {
					return success(true, "上传成功!", returnMap.get("savaPath").toString());
				}
			} catch (Exception e) {
				logger.error("ImageUploadController.uploadHeadPortrait={}", e);
				return fail(false, "上传失败，出现异常：" + e.getMessage());
			}
		}
		return fail(false, "图片不存在,请确认图片地址重新上传!");
	}
}
