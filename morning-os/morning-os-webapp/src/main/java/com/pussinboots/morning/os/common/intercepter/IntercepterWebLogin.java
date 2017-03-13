package com.pussinboots.morning.os.common.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.pussinboots.morning.os.common.security.AuthorizingUser;
import com.pussinboots.morning.os.common.util.SingletonLoginUtils;

/**
 * 
* 项目名称：morning-os-webapp   
* 类名称：IntercepterWebLogin   
* 类描述：IntercepterWebLogin 前台用户登录拦截器     
* 创建人：陈星星   
* 创建时间：2017年3月13日 下午4:14:56   
*
 */
public class IntercepterWebLogin extends HandlerInterceptorAdapter{

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 将session中的用户添加到request中
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		request.setAttribute("user", authorizingUser);
		return super.preHandle(request, response, handler);
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		super.afterCompletion(request, response, handler, ex);
	}

}
