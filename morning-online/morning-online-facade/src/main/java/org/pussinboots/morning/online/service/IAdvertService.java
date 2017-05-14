package org.pussinboots.morning.online.service;

import org.pussinboots.morning.common.base.BasePageDTO;
import org.pussinboots.morning.common.support.page.PageInfo;
import org.pussinboots.morning.online.entity.Advert;

import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-online-facade   
* 类名称：IAdvertService   
* 类描述：Advert / 广告位表 业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2017年4月10日 上午12:31:32   
*
 */
public interface IAdvertService extends IService<Advert> {
	
	/**
	 * 创建广告
	 * @param advert 广告信息
	 * @param userName 操作人
	 * @return
	 */
	Integer insertAdvert(Advert advert, String userName);
	
	/**
	 * 根据分页信息/搜索内容查找广告列表
	 * @param pageInfo 分页信息
	 * @param search 搜索内容
	 * @return
	 */
	BasePageDTO<Advert> listByPage(PageInfo pageInfo, String search);
	
	/**
	 * 更新广告状态
	 * @param advertId 广告ID
	 * @return
	 */
	Integer updateStatus(Long advertId);
	
	/**
	 * 更新广告
	 * @param advert 广告信息
	 * @param userName 操作人
	 * @return
	 */
	Integer updateAdvert(Advert advert, String userName);
	
	/**
	 * 根据广告ID删除广告,同时删除广告相信
	 * @param advertId 广告ID
	 * @return
	 */
	Integer deleteByAdvertId(Long advertId);
	
}
