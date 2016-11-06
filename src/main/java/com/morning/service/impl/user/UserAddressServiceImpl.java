package com.morning.service.impl.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.morning.dao.user.UserAddressMapper;
import com.morning.entity.user.UserAddress;
import com.morning.service.user.UserAddressService;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：UserAddressServiceImpl   
* 类描述：前台用户收货地址业务逻辑层实现   
* 创建人：陈星星   
* 创建时间：2016年8月28日  下午11:57:51
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午11:02:00   
* @version
 */
@Service("userAddressService")
public class UserAddressServiceImpl implements UserAddressService {
	
	@Autowired
	private UserAddressMapper userAddressMapper;

	@Override
	public UserAddress queryAddressById(Integer addressId) {
		return userAddressMapper.queryAddressById(addressId);
	}

	@Override
	public List<UserAddress> queryAddressByUser(Integer accountId) {
		return userAddressMapper.queryAddressByUser(accountId);
	}

	@Override
	public int creatAddress(UserAddress userAddress) {
		return userAddressMapper.creatAddress(userAddress);
	}
	
	@Override
	public void deleteAddress(Integer addressId) {
		userAddressMapper.deleteAddress(addressId);
	}

	@Override
	public void updateAddress(UserAddress userAddress) {
		userAddressMapper.updateAddress(userAddress);
	}
}
