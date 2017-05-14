package org.pussinboots.morning.os.common.intercepter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.pussinboots.morning.online.common.enums.NavigationBarTypeEnum;
import org.pussinboots.morning.online.entity.NavigationBar;
import org.pussinboots.morning.online.service.INavigationBarService;
import org.pussinboots.morning.product.common.constant.CategoryConstantEnum;
import org.pussinboots.morning.product.pojo.vo.CategoryVO;
import org.pussinboots.morning.product.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * 
* 项目名称：morning-os-web Maven Webapp   
* 类名称：IntercepterForWebsite   
* 类描述：IntercepterForWebsite 网站配置管理拦截器     
* 创建人：陈星星   
* 创建时间：2017年4月9日 下午11:31:45   
*
 */
public class IntercepterForWebsite extends HandlerInterceptorAdapter {
	
	@Autowired
	private INavigationBarService navigationBarService;
	@Autowired
	private ICategoryService categoryService;
	
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

		// 首页顶部导航栏
		List<NavigationBar> indexTop = navigationBarService
				.listByNavigationId(NavigationBarTypeEnum.INDEX_TOP.getType());
		request.setAttribute(NavigationBarTypeEnum.INDEX_TOP.getCode(), indexTop);

		// 首页底部导航栏
		List<NavigationBar> indexBottom = navigationBarService
				.listByNavigationId(NavigationBarTypeEnum.INDEX_BOTTOM.getType());
		request.setAttribute(NavigationBarTypeEnum.INDEX_BOTTOM.getCode(), indexBottom);

		// 首页分类导航栏
		List<NavigationBar> indexClassify = navigationBarService
				.listByNavigationId(NavigationBarTypeEnum.INDEX_CLASSIFY.getType());
		request.setAttribute(NavigationBarTypeEnum.INDEX_CLASSIFY.getCode(), indexClassify);
		
		// 导航栏商品列表
		List<CategoryVO> categorys = categoryService.listNav(CategoryConstantEnum.CATEGORY_NAV_PRODUCT.getValue(),
				CategoryConstantEnum.CATEGORY_NAV_NUMBER.getValue());
		request.setAttribute("categorys", categorys);

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
