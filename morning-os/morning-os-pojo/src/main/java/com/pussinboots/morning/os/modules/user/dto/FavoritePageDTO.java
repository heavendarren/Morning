package com.pussinboots.morning.os.modules.user.dto;

import java.io.Serializable;
import java.util.List;

import com.pussinboots.morning.common.model.PageInfo;
import com.pussinboots.morning.os.modules.user.entity.Favorite;

public class FavoritePageDTO implements Serializable {

	private static final long serialVersionUID = 1L;
	
	/**
	 * 分页信息
	 */
	private PageInfo pageInfo;
	
	/**
	 * 收藏夹商品
	 */
	private List<Favorite> favorites;

	
	public FavoritePageDTO() {
		super();
	}

	public FavoritePageDTO(PageInfo pageInfo, List<Favorite> favorites) {
		super();
		this.pageInfo = pageInfo;
		this.favorites = favorites;
	}

	public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}

	public List<Favorite> getFavorites() {
		return favorites;
	}

	public void setFavorites(List<Favorite> favorites) {
		this.favorites = favorites;
	}
	
}
