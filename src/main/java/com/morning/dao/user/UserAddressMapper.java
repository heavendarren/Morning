package com.morning.dao.user;

import java.util.List;

import com.morning.entity.user.UserAddress;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：UserAddressMapper   
* 类描述：用户收获地址数据访问层接口   
* 创建人：陈星星   
* 创建时间：2016年11月6日 下午10:38:52   
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午10:38:52   
* @version
 */
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