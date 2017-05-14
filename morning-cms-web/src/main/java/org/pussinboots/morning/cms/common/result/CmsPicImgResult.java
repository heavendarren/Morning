package org.pussinboots.morning.cms.common.result;

import java.io.Serializable;
import java.util.List;

import org.pussinboots.morning.common.support.picImg.PicImgInfo;

/**
 * 
* 项目名称：morning-cms-web Maven Webapp   
* 类名称：CmsPicImgResult   
* 类描述：CmsPicImgResult 后台管理系统图片返回结果类       
* 创建人：陈星星   
* 创建时间：2017年4月10日 下午10:57:07   
*
 */
public class CmsPicImgResult implements Serializable{

	private static final long serialVersionUID = 1L;
	
	/**
	 * 相册标题
	 */
	private String title;
	
	/**
	 * 相册id
	 */
	private Long id;
	
	/**
	 * 图片列表
	 */
	private List<PicImgInfo> data;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public List<PicImgInfo> getData() {
		return data;
	}

	public void setData(List<PicImgInfo> data) {
		this.data = data;
	}
}
