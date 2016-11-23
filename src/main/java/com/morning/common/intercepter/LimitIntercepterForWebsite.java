package com.morning.common.intercepter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.morning.common.util.SingletonLoginUtils;
import com.morning.entity.goods.GoodsClassify;
import com.morning.service.goods.IGoodsClassifyService;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：LimitIntercepterForWebsite   
* 类描述：网站配置管理拦截器   
* 创建人：陈星星   
* 创建时间：2016年7月23日  下午3:00:21  
* 修改人：陈星星   
* 修改时间：2016年11月20日 下午11:52:57   
* @version
 */
public class LimitIntercepterForWebsite extends HandlerInterceptorAdapter {
	 
	@Autowired
	private IGoodsClassifyService goodsClassifyService;
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// 获得banner图

		// 获得网站配置

		// 创建存储购物车信息模型
		SingletonLoginUtils.creatShoppingCart(request);

		// 获得网站商品导航
		List<GoodsClassify> goodsClassifies = goodsClassifyService.selectNavClassify(5);
		request.setAttribute("goodsClassifies", goodsClassifies);
		List<GoodsClassify> classifyList = goodsClassifyService.selectGoodsClassify();
		request.setAttribute("classifyList", classifyList);
		return super.preHandle(request, response, handler);
	}

}
