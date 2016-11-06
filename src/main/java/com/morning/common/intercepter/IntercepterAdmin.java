package com.morning.common.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.morning.common.util.SingletonLoginUtils;
import com.morning.entity.system.SystemUser;

/**
 * 
*    
* 项目名称：morning Maven Webapp   
* 类名称：IntercepterAdmin   
* 类描述：  后台拦截器 
* 创建人：陈星星   
* 创建时间：2016年11月2日 下午1:00:51   
* 修改人：陈星星   
* 修改时间：2016年11月2日 下午1:00:51   
* 修改备注： 已被shiro代替  
* @version    
*
 */
public class IntercepterAdmin extends HandlerInterceptorAdapter{

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}

	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
		super.afterConcurrentHandlingStarted(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
	
	/**
	 *preHandle：在执行action里面的处理逻辑之前执行，它返回的是boolean，这里如果我们返回true在接着执行postHandle和afterCompletion，如果我们返回false则中断执行。
	 */
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		//获取登录的用户
		SystemUser systemUser = SingletonLoginUtils.getSystemUser(request);
		if(systemUser == null){
			response.sendRedirect(request.getContextPath()+"/system");//跳转登录页面
			return false;
		}
		return true;
	}

}
