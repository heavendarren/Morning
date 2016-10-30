package com.morning.dao.user;

import java.util.List;

import com.morning.entity.user.UserAddress;

public interface UserAddressMapper {
	
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