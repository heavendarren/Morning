package com.morning.controller.email;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.morning.common.util.DateUtil;
import com.morning.controller.BaseController;
import com.morning.entity.email.UserEmailMsg;
import com.morning.service.email.MailService;

/**
 * 
 * @description：邮箱发送控制器
 * @author CXX
 * @version 创建时间：2016年9月4日  上午1:10:56
 */
@Controller
public class EmailController extends BaseController{
	
	private static Logger logger = LoggerFactory.getLogger(EmailController.class);
	
	@Autowired
	private MailService mailService;
	
	/**
	 * 发送验证邮箱验证码
	 * @param request
	 * @return
	 */
    @RequestMapping(value="sendEmail")
    @ResponseBody
    public Map<String, Object> sendEmailForCreatUser(HttpServletRequest request){
    	Map<String, Object> json = new HashMap<String, Object>();
    	try{
    		String email = request.getParameter("email")==null?"":request.getParameter("email");
    		String type = request.getParameter("type")==null?"":request.getParameter("type");
    		String registerTime = DateUtil.now();
    		String emailCaptcha = this.getRandomNum(6);
	    	UserEmailMsg userEmailMsg=new UserEmailMsg();
	    	// 验证邮箱
			Map<String, Object> returnMap = mailService.checkEmail(email);
	    	userEmailMsg.setToEmails(returnMap.get("returnList").toString());

	        //内容
	        Map<String, Object> model = new HashMap<String, Object>();
    		if(type.equals("0")){ //验证邮箱
        		//将验证码和验证时间存放在Session
        		request.getSession().setAttribute("registerTime", registerTime);
        		request.getSession().setAttribute("emailCaptcha", emailCaptcha);

        		//模版
        		userEmailMsg.setVelocityTemplate("EmailCaptcha.vm");
    	        //主题
    	    	userEmailMsg.setSubject("【但行好事·莫问前程】很高兴遇见您！");
    	        model.put("emailCaptcha", emailCaptcha);
    	        model.put("registerTime", registerTime);
    		}
	    	
    		if(type.equals("1")){ //找回密码
        		//将验证码和验证时间存放在Session
        		request.getSession().setAttribute("registerTimePsw", registerTime);
        		request.getSession().setAttribute("emailCaptchaPsw", emailCaptcha);
        		//模版
        		userEmailMsg.setVelocityTemplate("PswCaptcha.vm");
    	        //主题
    	    	userEmailMsg.setSubject("【但行好事·莫问前程】猫宁重置密码信息");
    	    	
    	        model.put("registerTimePsw", registerTime);
    	        model.put("emailCaptchaPsw", emailCaptcha);
        		model.put("email", email);
        		
        		request.getSession().setAttribute("email", email);
    		}
	        
	        userEmailMsg.setModel(model);
	        mailService.sendMail(userEmailMsg);
    		json =this.setJson(true, "邮箱发送成功!", null);
    	}catch(Exception e){
    		logger.error("EmailController.sendEmail", e);
    	}
    	return json;
    }
    
    /**
     * 验证邮箱发送的验证码
     * @param request
     * @return
     */
    @RequestMapping(value="verifyCaptcha", method=RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> verifyCaptcha(HttpServletRequest request){
    	Map<String, Object> json = new HashMap<String,Object>();
    	try{
    		String type = request.getParameter("type")==null?"":request.getParameter("type");
    		Object sessionCaptcha = null;
    		Date registerTimeDate = null;
    		if(type.equals("0")){ 
        		sessionCaptcha = request.getSession().getAttribute("emailCaptcha");
        		registerTimeDate = DateUtil.parseDateTime((String)request.getSession().getAttribute("registerTime"));//验证时间
    		}
    		if(type.equals("1")){
        		sessionCaptcha = request.getSession().getAttribute("emailCaptchaPsw");
        		registerTimeDate = DateUtil.parseDateTime((String)request.getSession().getAttribute("registerTimePsw"));//验证时间
    		}
    		//验证验证码
    		String emailCaptcha = request.getParameter("emailCaptcha")==null?"":request.getParameter("emailCaptcha");
    		if(sessionCaptcha==null || !emailCaptcha.equalsIgnoreCase(sessionCaptcha.toString())){
				json = this.setJson(false, "请输入正确的验证码", null);
				return json;
			}
    		//验证验证码时间
    		Date currentTime = new Date();//获取当前时间    
    		Date lastActivateTime = DateUtil.getOffsiteDate(registerTimeDate, Calendar.MINUTE, 3);//验证时间向后偏移3分钟
    		if(currentTime.after(lastActivateTime)) {  //验证验证时间是否过期
				json = this.setJson(false, "验证码已过期,请重新输入验证码", null);
				return json;
    		}
    		json = this.setJson(true, "通过验证!", null);
    	}catch(Exception e){
    		logger.error("EmailController.verifyCaptcha", e);
    	}
    	return json;
    }
  
}
