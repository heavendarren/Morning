package com.pussinboots.morning.cms.modules.system.dto;

import java.io.Serializable;
import java.util.List;

import com.pussinboots.morning.cms.modules.system.entity.VersionLog;
import com.pussinboots.morning.common.model.PageInfo;

public class VersionLogDTO implements Serializable{

	private static final long serialVersionUID = 1L;
	
	/** VersionLog集合 */
	private List<VersionLog> versionLogs;

	/** 分页实体类 */
	private PageInfo pageInfo;
	
	public VersionLogDTO() { }

	public VersionLogDTO(List<VersionLog> versionLogs, PageInfo pageInfo) {
		this.versionLogs = versionLogs;
		this.pageInfo = pageInfo;
	}

	public List<VersionLog> getVersionLogs() {
		return versionLogs;
	}

	public void setVersionLogs(List<VersionLog> versionLogs) {
		this.versionLogs = versionLogs;
	}

	public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}
	
}
