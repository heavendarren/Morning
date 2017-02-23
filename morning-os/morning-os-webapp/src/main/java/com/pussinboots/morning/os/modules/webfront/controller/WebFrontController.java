package com.pussinboots.morning.os.modules.webfront.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.pussinboots.morning.common.controller.BaseController;

/**
 * 
* 项目名称：morning-os-webapp   
* 类名称：WebFrontController   
* 类描述：商城首页表示层控制器     
* 创建人：陈星星   
* 创建时间：2017年2月23日 下午3:53:21   
*
 */
@Controller
public class WebFrontController extends BaseController {
	
	/** 电子商城首页 */
	private static final String INDEX = getViewPath("modules/webfront/index");
	
	
	@GetMapping(value = "/index")
	public String index(Model model) {
		return INDEX;
	}

}
