package com.morning.common.intercepter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.morning.common.util.SingletonLoginUtils;
import com.morning.entity.goods.GoodsClassify;
import com.morning.service.goods.GoodsClassifyService;

/**
 * 
 * @description：网站配置管理拦截器
 * @author CXX
 * @version 创建时间：2016年7月23日  下午3:00:21
 */
public class LimitIntercepterForWebsite extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(LimitIntercepterForWebsite.class);
	 
	@Autowired
	private GoodsClassifyService goodsClassifyService;
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		try{
			// 获得banner图
			
			//获得网站配置
			
			//创建存储购物车信息模型
			SingletonLoginUtils.creatShoppingCart(request);
			
			//获得网站商品导航
        	List<GoodsClassify> classifyList = goodsClassifyService.queryAllGoods();
        	request.setAttribute("classifyList", classifyList);
		}catch(Exception e){
			logger.error("LimitIntercepterForWebsite.preHandle - 网站资源配置出错",e);
		}
		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		super.afterCompletion(request, response, handler, ex);
	}

	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		super.afterConcurrentHandlingStarted(request, response, handler);
	}
}
