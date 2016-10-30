package com.morning.service.user;

import java.util.List;

import com.morning.entity.user.UserAddress;

/**
 * 
 * @description：前台用户收货地址业务层接口
 * @author CXX
 * @version 创建时间：2016年8月22日  上午11:23:03
 */
public interface UserAddressService {
	
	/**
	 * 通过地址编号查询地址
	 * @param addressId
	 * @return UserAddress 
	 */
	public UserAddress queryAddressById(Integer addressId);
	
	/**
	 * 通过用户ID查询地址
	 * @param accountId
	 * @return <List>UserAddress
	 */
	public List<UserAddress> queryAddressByUser(Integer accountId);
	
	/**
	 * 添加用户收货地址
	 * @param userAddress
	 * @return addressId
	 */
	public int creatAddress(UserAddress userAddress);
	
	/**
	 * 删除地址，通过地址编号
	 * @param addressId
	 */
	public void deleteAddress(Integer addressId);
	
	/**
	 * 更新用户收货地址
	 * @param userAddress
	 */
	public void updateAddress(UserAddress userAddress);
}
