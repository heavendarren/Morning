package org.pussinboots.morning.common.support.picImg;

import java.io.Serializable;

/**
 * 
* 项目名称：morning-common   
* 类名称：PicImgInfo   
* 类描述：PicImgInfo 图片展示实体类   
* 创建人：陈星星   
* 创建时间：2017年4月10日 下午11:01:05   
*
 */
public class PicImgInfo implements Serializable{

	private static final long serialVersionUID = 1L;
	
	/**
	 * 图片名
	 */
	private String alt;
	
	/**
	 * 图片id
	 */
	private String pid;
	
	/**
	 * 原图地址
	 */
	private String src;
	
	/**
	 * 缩略图地址
	 */
	private String thumb;

	public String getAlt() {
		return alt;
	}

	public void setAlt(String alt) {
		this.alt = alt;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	public String getThumb() {
		return thumb;
	}

	public void setThumb(String thumb) {
		this.thumb = thumb;
	}
}
