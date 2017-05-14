package org.pussinboots.morning.os.controller.common;

import java.awt.image.BufferedImage;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.pussinboots.morning.common.base.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 
* 项目名称：morning-os-web Maven Webapp   
* 类名称：CaptchaController   
* 类描述：验证码表示层控制器      
* 创建人：陈星星   
* 创建时间：2017年4月8日 下午3:22:57   
*
 */
@Controller
@RequestMapping(value = "/pass")
@Api(value = "验证码", description = "验证码")
public class CaptchaController extends BaseController {
	
	@Autowired
	private Producer captchaProducer;
	
	/**
	 * GET 电子商城登录验证码
	 */
	@ApiOperation(value = "电子商城登录验证码", notes = "电子商城登录验证码")  
	@GetMapping(value = "/captcha-image")
	public ModelAndView getKaptchaImage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 禁止服务器端缓存
		response.setDateHeader("Expires", 0);
		
		// 设置标准的 HTTP/1.1 no-cache headers.  
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
		
		// 设置IE扩展 HTTP/1.1 no-cache headers (use addHeader).  
		response.addHeader("Cache-Control", "post-check=0, pre-check=0");
		
		// 设置标准 HTTP/1.0 不缓存图片  
		response.setHeader("Pragma", "no-cache");
		
		// 返回一个 jpeg 图片，默认是text/html(输出文档的MIMI类型)  
		response.setContentType("image/jpeg");
		
		// 为图片创建文本  
		String capText = captchaProducer.createText();
		
		// 将文本保存在session中，这里就使用包中的静态变量吧  
		request.getSession().setAttribute(Constants.KAPTCHA_SESSION_KEY, capText);
		
		// 创建带有文本的图片  
		BufferedImage bi = captchaProducer.createImage(capText);
		ServletOutputStream out = response.getOutputStream();
		
		 // 图片数据输出  
		ImageIO.write(bi, "jpg", out);
		try {
			out.flush();
		} finally {
			out.close();
		}
		return null;
	}
}
