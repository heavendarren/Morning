package org.pussinboots.morning.administrator.pojo.dto;

import java.io.Serializable;
import java.util.List;

import org.pussinboots.morning.administrator.pojo.vo.UserVO;
import org.pussinboots.morning.common.support.page.PageInfo;

public class UserPageDTO implements Serializable{

	private static final long serialVersionUID = 1L;
	
	/**
	 * 用户列表信息
	 */
	private List<UserVO> userVOs;
	
	/**
	 * 分页信息
	 */
	private PageInfo pageInfo;
	
	public UserPageDTO(List<UserVO> userVOs, PageInfo pageInfo) {
		super();
		this.userVOs = userVOs;
		this.pageInfo = pageInfo;
	}

	public List<UserVO> getUserVOs() {
		return userVOs;
	}

	public void setUserVOs(List<UserVO> userVOs) {
		this.userVOs = userVOs;
	}

	public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}
	
}
