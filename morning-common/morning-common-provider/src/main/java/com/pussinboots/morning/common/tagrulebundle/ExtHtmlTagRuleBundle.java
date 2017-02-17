package com.pussinboots.morning.common.tagrulebundle;

import org.sitemesh.SiteMeshContext;
import org.sitemesh.content.ContentProperty;
import org.sitemesh.content.tagrules.TagRuleBundle;
import org.sitemesh.content.tagrules.html.ExportTagToContentRule;
import org.sitemesh.tagprocessor.State;

/**
 * 
* 项目名称：morning-common-provider   
* 类名称：ExtHtmlTagRuleBundle   
* 类描述：Sitemesh3中增加自定义tag（网页标签）   
* 创建人：陈星星   
* 创建时间：2017年2月2日 下午11:49:38
 */
public class ExtHtmlTagRuleBundle implements TagRuleBundle{

    @Override  
    public void install(State defaultState, ContentProperty contentProperty, SiteMeshContext siteMeshContext) {  
        defaultState.addRule("myfooter", new ExportTagToContentRule(siteMeshContext, contentProperty.getChild("myfooter"), false));  
    }

	@Override
	public void cleanUp(State defaultState, ContentProperty contentProperty,
			SiteMeshContext siteMeshContext) {
	}  

}
