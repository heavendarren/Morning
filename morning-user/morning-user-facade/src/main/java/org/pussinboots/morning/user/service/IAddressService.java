package org.pussinboots.morning.user.service;

import java.util.List;

import org.pussinboots.morning.common.base.BasePageDTO;
import org.pussinboots.morning.common.support.page.PageInfo;
import org.pussinboots.morning.user.entity.Address;
import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-user-facade   
* 类名称：IAddressService   
* 类描述：Address / 收获地址表 业务逻辑层接口
* 创建人：陈星星   
* 创建时间：2017年5月9日 下午9:58:08   
*
 */
public interface IAddressService extends IService<Address> {
	
	/**
	 * 创建收货地址
	 * @param userId 用户ID
	 * @param address 收获地址信息
	 * @return
	 */
	Integer insertAddress(Long userId, Address address);
	
	/**
	 * 根据用户ID查找收货地址列表
	 * @param userId 用户ID
	 * @param pageInfo 分页信息
	 * @return
	 */
	BasePageDTO<Address> listByUserId(Long userId, PageInfo pageInfo);
	
	/**
	 * 根据用户ID查找收货地址列表
	 * @param userId
	 * @return
	 */
	List<Address> listAddress(Long userId);

	/**
	 * 根据用户ID和收货地址ID查找收货地址信息
	 * @param addressId 收货地址ID
	 * @param userId 用户ID
	 * @return
	 */
	Address getAddress(Long addressId, Long userId);
	
	/**
	 * 根据用户ID和收货地址ID更新收货地址
	 * @param userId 用户ID
	 * @param address 收获地址信息
	 * @return
	 */
	Integer updateAddress(Long userId, Address address);
	
	/**
	 * 根据用户ID和收货地址ID删除收货地址
	 * @param userId 用户ID
	 * @param addressId 地址ID
	 * @return
	 */
	Integer deleteByAddressId(Long userId, Long addressId);
	
}
