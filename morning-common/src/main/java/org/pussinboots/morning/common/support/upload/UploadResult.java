package org.pussinboots.morning.common.support.upload;

import java.io.Serializable;

public class UploadResult implements Serializable{

	private static final long serialVersionUID = 1L;
	
	/**
	 * 上传结果
	 */
	private Boolean result;
	
	/**
	 * 保存地址
	 */
	private String savaPath;
	

	public UploadResult(Boolean result, String savaPath) {
		super();
		this.result = result;
		this.savaPath = savaPath;
	}

	public Boolean getResult() {
		return result;
	}

	public void setResult(Boolean result) {
		this.result = result;
	}

	public String getSavaPath() {
		return savaPath;
	}

	public void setSavaPath(String savaPath) {
		this.savaPath = savaPath;
	}
}
