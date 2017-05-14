package org.pussinboots.morning.common.support.upload;

import java.io.File;
import java.io.InputStream;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.pussinboots.morning.common.util.DateUtils;
import org.pussinboots.morning.common.util.ImageUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;

/**
 * 
* 项目名称：morning-common   
* 类名称：UploadManager   
* 类描述：文件上传支持类     
* 创建人：陈星星   
* 创建时间：2017年4月10日 上午3:24:42   
*
 */
public class UploadManager {
	
	private static final Logger logger = LoggerFactory.getLogger(UploadManager.class);
	
	private UploadManager() { 
		throw new AssertionError();
	}
	
	/**
	 * 上传文件存放服务器
	 * @param request 服务器请求
	 * @param dir
	 * @return
	 */
	public static String getServerSaveDir(HttpServletRequest request, String dir, String belong) {
		StringBuilder uploadPath = new StringBuilder(request.getSession().getServletContext().getRealPath("uploads"));
		uploadPath.append(File.separator);
		uploadPath.append(dir);
		uploadPath.append(File.separator);
		uploadPath.append(belong);		
		uploadPath.append(File.separator);
		uploadPath.append(DateUtils.format(new Date(), "yyyyMMdd"));
		File file = new File(uploadPath.toString());
		if (!file.exists()) {
			file.mkdirs();
		}
		return file.getPath();
	}
	
	/**
	 * 文件重命名
	 * @param file
	 * @return
	 */
	public static String rename(MultipartFile file) {
		// 获取原始文件名
		String fileName = file.getOriginalFilename();
		// 新文件名称，不设置时默认为原文件名
		return new Date().getTime() + (new Random().nextInt(9999 - 1000 + 1) + 1000)
				+ fileName.substring(fileName.lastIndexOf('.'));
	}
	
	/**
	 * 文件保存路径
	 * @param dir 一级目录
	 * @param belong 二级目录
	 * @param newFileName 文件名
	 * @return
	 */
	public static String getSavaDir(String dir, String belong, String newFileName) {
		StringBuilder savePath = new StringBuilder();
		savePath.append(dir);
		savePath.append(File.separator);
		savePath.append(belong);
		savePath.append(File.separator);
		savePath.append(DateUtils.format(new Date(), "yyyyMMdd"));
		savePath.append(File.separator);
		savePath.append(newFileName);// 文件名称

		// 将绝对路径"\"替换成"/",文件保存路径
		return savePath.toString().replaceAll("\\\\", "/");
	}
	
	/**
	 * 
	 * @param request 网页请求
	 * @param avatar_file  avatar_file(源文件)
	 * @param avatar_data avatar_data(裁剪参数JSON
	 * @param dir 一级文件目录地址
	 * @param belong 二级文件目录地址名称
	 * @return 
	 */
	public static UploadResult upload(HttpServletRequest request, MultipartFile avatarFile, String dir, String belong) {

		// 获取服务器的实际路径
		String serverSaveDir = getServerSaveDir(request, dir, belong);

		// 生成文件名称
		String newFileName = rename(avatarFile);

		// 先把用户上传到原图保存到服务器上
		File targetFile = new File(serverSaveDir, newFileName);
		boolean flag = false;
		try {
			// 将文件剪辑并上传到服务器上和本地文件中
			if (!targetFile.exists()) {
				targetFile.mkdirs();
				// 获取文件流,可以进行处理
				InputStream is = avatarFile.getInputStream();
				ImageUtils.saveImage(is, targetFile);
				// 关闭该流并释放与该流关联的所有系统资源。
				is.close();
				flag = true;
			}
		} catch (Exception e) {
			logger.error("UploadFileUtils.Upload:{}", e);
		}
		return new UploadResult(flag, getSavaDir(dir, belong, newFileName));
	}
	
	/**
	 * 
	 * @param request 网页请求
	 * @param avatar_file  avatar_file(源文件)
	 * @param avatar_data avatar_data(裁剪参数JSON
	 * @param dir 一级文件目录地址
	 * @param belong 二级文件目录地址名称
	 * @return 
	 */
	public static UploadResult upload(HttpServletRequest request, MultipartFile avatarFile, String avatarData,
			String dir, String belong) {
		
		// 获取服务器的实际路径
		String serverSaveDir = getServerSaveDir(request, dir, belong);

		// 生成文件名称
		String newFileName = rename(avatarFile);

		// 先把用户上传到原图保存到服务器上
		File targetFile = new File(serverSaveDir, newFileName);
		boolean flag = false;
		try {
			// 创建JSONObject对象
			JSONObject joData = (JSONObject) JSONObject.parse(avatarData);
			// 用户经过剪辑后的图片的大小
			float x = joData.getFloatValue("x");
			float y = joData.getFloatValue("y");
			float w = joData.getFloatValue("width");
			float h = joData.getFloatValue("height");
			float r = joData.getFloatValue("rotate");

			// 将文件剪辑并上传到服务器上和本地文件中
			if (!targetFile.exists()) {
				targetFile.mkdirs();
				// 获取文件流，可以进行处理
				InputStream is = avatarFile.getInputStream();
				// 旋转后剪裁图片
				ImageUtils.cutAndRotateImage(is, targetFile, (int) x, (int) y, (int) w, (int) h, (int) r);
				// 关闭该流并释放与该流关联的所有系统资源。
				is.close();
				flag = true;
			}
		} catch (Exception e) {
			logger.error("UploadFileUtils.Upload:{}", e);
		}
		return new UploadResult(flag, getSavaDir(dir, belong, newFileName));
	}
}
