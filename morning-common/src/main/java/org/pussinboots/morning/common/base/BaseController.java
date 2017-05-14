package org.pussinboots.morning.common.base;

import java.beans.PropertyEditorSupport;

import org.apache.commons.lang3.StringEscapeUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

/**
 * 
* 项目名称：morning-common   
* 类名称：BaseController   
* 类描述：BaseController 控制器基类   
* 创建人：陈星星   
* 创建时间：2017年3月31日 下午3:02:16   
*
 */
public class BaseController {
	
	protected Logger logger = LoggerFactory.getLogger(getClass());
	
	/**
	 * 初始化数据绑定
	 * 1. 将所有传递进来的String进行HTML编码，防止XSS攻击
	 * @param binder
	 */
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		// String类型转换，将所有传递进来的String进行HTML编码，防止XSS攻击
		binder.registerCustomEditor(String.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				setValue(text == null ? null : StringEscapeUtils.escapeHtml4(text.trim()));
			}

			@Override
			public String getAsText() {
				Object value = getValue();
				return value != null ? value.toString() : "";
			}
		});
	}
	
	/**
	 * 重定向至地址 url
	 * @param url 请求地址
	 * @return
	 */
	protected String redirectTo(String url) {
		StringBuilder rto = new StringBuilder("redirect:");
		rto.append(url);
		return rto.toString();
	}
}
