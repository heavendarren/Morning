package org.pussinboots.morning.user.service;

import org.pussinboots.morning.common.base.BasePageDTO;
import org.pussinboots.morning.common.support.page.PageInfo;
import org.pussinboots.morning.user.entity.Favorite;
import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-user-facade   
* 类名称：IFavoriteService   
* 类描述：Favorite / 收藏夹表 业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2017年5月9日 下午7:57:02   
*
 */
public interface IFavoriteService extends IService<Favorite> {
	
	/**
	 * 根据用户ID查找用户收藏商品列表
	 * @param userId 用户ID
	 * @param pageInfo 分页信息
	 * @return
	 */
	BasePageDTO<Favorite> listByUserId(Long userId, PageInfo pageInfo);
	
	/**
	 * 根据用户ID和商品编号删除收藏夹商品
	 * @param userId 用户ID
	 * @param productNumber 商品编号
	 * @return
	 */
	Integer deleteByProductNumber(Long userId, Long productNumber);
	
}
