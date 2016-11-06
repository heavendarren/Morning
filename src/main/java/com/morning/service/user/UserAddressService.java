package com.morning.service.user;

import java.util.List;

import com.morning.entity.user.UserAddress;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：UserAddressService   
* 类描述：前台用户收货地址业务逻辑层接口   
* 创建人：陈星星   
* 创建时间：2016年8月22日  上午11:23:03
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午11:05:57   
* @version
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
