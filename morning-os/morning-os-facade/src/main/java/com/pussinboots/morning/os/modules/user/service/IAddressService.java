package com.pussinboots.morning.os.modules.user.service;

import com.pussinboots.morning.os.modules.user.entity.Address;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;

/**
 * 
* 项目名称：morning-os-facade   
* 类名称：IAddressService   
* 类描述：Address表 / 收获地址表 业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2017年3月16日 下午6:57:00   
*
 */
public interface IAddressService extends IService<Address> {
	
	/**
	 * 创建收货地址
	 * @param address 收货地址信息
	 * @param userId 用户ID
	 */
	void insertAddress(Address address, Long userId);
	
	/**
	 * 根据用户ID查找收货地址列表
	 * @param userId
	 * @return
	 */
	List<Address> selectAddress(Long userId);
	
	/**
	 * 根据用户ID、收货地址ID删除收获地址
	 * @param userId
	 * @param addressId
	 */
	void deleteByAddressId(Long userId, Long addressId);
	
}
