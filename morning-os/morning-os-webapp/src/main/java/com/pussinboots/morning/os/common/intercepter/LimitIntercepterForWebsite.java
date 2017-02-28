package com.pussinboots.morning.os.common.intercepter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.pussinboots.morning.common.enums.StatusEnum;
import com.pussinboots.morning.os.modules.content.entity.NavigationBar;
import com.pussinboots.morning.os.modules.content.enums.NavigationBarTypeEnum;
import com.pussinboots.morning.os.modules.content.service.INavigationBarService;

/**
 * 
* 项目名称：morning-os-webapp   
* 类名称：LimitIntercepterForWebsite   
* 类描述：LimitIntercepterForWebsite 网站配置管理拦截器  
* 创建人：陈星星   
* 创建时间：2017年2月23日 下午9:57:12   
*
 */
public class LimitIntercepterForWebsite extends HandlerInterceptorAdapter {
	
	@Autowired
	private INavigationBarService navigationBarService;
	
	/**
	 * 在业务处理器处理请求之前被调用 
	 * 如果返回false : 从当前的拦截器往回执行所有拦截器的afterCompletion(),再退出拦截器链 
	 * 如果返回true  : 执行下一个拦截器,直到所有的拦截器都执行完毕 ,再执行被拦截的Controller ,从最后一个拦截器往回执行所有的postHandle() ,接着再从最后一个拦截器往回执行所有的afterCompletion() 
	 * 
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String url = request.getRequestURI();
		System.out.println(url);
		// 网站导航配置
		List<NavigationBar> indexTop = navigationBarService.selectNavigationBarByType(
				NavigationBarTypeEnum.INDEX_TOP.getType(), StatusEnum.SHOW.getStatus());
		request.setAttribute(NavigationBarTypeEnum.INDEX_TOP.getCode(), indexTop);// 首页顶部导航栏
		List<NavigationBar> indexBottom = navigationBarService.selectNavigationBarByType(
				NavigationBarTypeEnum.INDEX_BOTTOM.getType(), StatusEnum.SHOW.getStatus());
		request.setAttribute(NavigationBarTypeEnum.INDEX_BOTTOM.getCode(), indexBottom);// 首页底部导航栏	
		List<NavigationBar> indexClassify = navigationBarService.selectNavigationBarByType(
				NavigationBarTypeEnum.INDEX_CLASSIFY.getType(), StatusEnum.SHOW.getStatus());
		request.setAttribute(NavigationBarTypeEnum.INDEX_CLASSIFY.getCode(), indexClassify);// 首页顶部导航栏
		return super.preHandle(request, response, handler);
	}
	
	/**
	 * 在业务处理器处理请求执行完成后,生成视图之前执行的动作  
	 * 可在modelAndView中加入数据，比如当前时间 
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}
	
	/**
	 * 整个请求处理完毕回调方法,即在视图渲染完毕时回调
	 * 如性能监控中我们可以在此记录结束时间并输出消耗时间,还可以进行一些资源清理,类似于try-catch-finally中的finally,
	 * 但仅调用处理器执行链中preHandle返回true的拦截器的afterCompletion。
	 */
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		super.afterCompletion(request, response, handler, ex);
	}


}
