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

import com.morning.common.util.toolbox.DateUtil;
import com.morning.controller.BaseController;
import com.morning.entity.email.UserEmailMsg;
import com.morning.service.email.UserEmailMsgService;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：EmailController   
* 类描述：邮件发送表示层   
* 创建人：陈星星   
* 创建时间：2016年11月6日 下午10:25:47   
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午10:25:47   
* @version    
 */
@Controller
public class EmailController extends BaseController{
	
	private static Logger logger = LoggerFactory.getLogger(EmailController.class);
	
	@Autowired
	private UserEmailMsgService userEmailMsgService;
	
	/**
	 * 发送验证邮箱验证码
	 * @param request
	 * @return
	 */
    @RequestMapping(value="sendEmail")
    @ResponseBody
    public Map<String, Object> sendEmailForCreatUser(HttpServletRequest request){
    	Map<String, Object> json = new HashMap<>();
    	try{
    		String email = request.getParameter("email")==null?"":request.getParameter("email");
    		String type = request.getParameter("type")==null?"":request.getParameter("type");
    		String registerTime = DateUtil.now();
    		String emailCaptcha = this.getRandomNum(6);
	    	UserEmailMsg userEmailMsg=new UserEmailMsg();
	    	// 验证邮箱
			Map<String, Object> returnMap = userEmailMsgService.checkEmail(email);
			if (!Boolean.parseBoolean(returnMap.get("flag").toString())) {
				json = this.setJson(false, returnMap.get("errorMessage").toString());
				return json;
			} 
	    	userEmailMsg.setToEmails(returnMap.get("returnList").toString());
	    	//内容
	        Map<String, Object> model = new HashMap<>();
    		if("0".equals(type)){ //验证邮箱
        		//将验证码和验证时间存放在Session
        		request.getSession().setAttribute("registerTime", registerTime);
        		request.getSession().setAttribute("emailCaptcha", emailCaptcha);

        		//模版
        		userEmailMsg.setVelocityTemplate("EmailCaptcha.vm");
    	        //主题
    	    	userEmailMsg.setSubject("【但行好事·莫问前程】很高兴遇见您！");
    	    	userEmailMsg.setFromName("猫宁客服团队 ");
    	        model.put("emailCaptcha", emailCaptcha);
    	        model.put("registerTime", registerTime);
    		}
	    	
    		if("1".equals(type)){ //找回密码
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
	        userEmailMsgService.batchSendEmail(userEmailMsg, 3);
    		json =this.setJson(true);
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
    	Map<String, Object> json = new HashMap<>();
    	try{
    		String type = request.getParameter("type")==null?"":request.getParameter("type");
    		Object sessionCaptcha = null;
    		Date registerTimeDate = null;
    		if("0".equals(type)){ 
        		sessionCaptcha = request.getSession().getAttribute("emailCaptcha");
        		registerTimeDate = DateUtil.parseDateTime((String)request.getSession().getAttribute("registerTime"));//验证时间
    		}
    		if("1".equals(type)){
        		sessionCaptcha = request.getSession().getAttribute("emailCaptchaPsw");
        		registerTimeDate = DateUtil.parseDateTime((String)request.getSession().getAttribute("registerTimePsw"));//验证时间
    		}
    		//验证验证码
    		String emailCaptcha = request.getParameter("emailCaptcha")==null?"":request.getParameter("emailCaptcha");
    		if(sessionCaptcha==null || !emailCaptcha.equalsIgnoreCase(sessionCaptcha.toString())){
				json = this.setJson(false, "请输入正确的验证码");
				return json;
			}
    		//验证验证码时间
    		Date currentTime = new Date();//获取当前时间    
    		Date lastActivateTime = DateUtil.getOffsiteDate(registerTimeDate, Calendar.MINUTE, 3);//验证时间向后偏移3分钟
    		if(currentTime.after(lastActivateTime)) {  //验证验证时间是否过期
				json = this.setJson(false, "验证码已过期,请重新输入验证码");
				return json;
    		}
    		json = this.setJson(true);
    	}catch(Exception e){
    		logger.error("EmailController.verifyCaptcha", e);
    	}
    	return json;
    }
  
}
