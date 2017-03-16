package com.pussinboots.morning.os.modules.user.service.impl;

import com.pussinboots.morning.os.modules.user.entity.Address;
import com.pussinboots.morning.os.modules.user.mapper.AddressMapper;
import com.pussinboots.morning.os.modules.user.service.IAddressService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：AddressServiceImpl   
* 类描述：Address表 / 收获地址表 业务逻辑层接口实现   
* 创建人：陈星星   
* 创建时间：2017年3月16日 下午6:57:32   
*
 */
@Service
public class AddressServiceImpl extends ServiceImpl<AddressMapper, Address> implements IAddressService {
	
	@Autowired
	private AddressMapper addressMapper;
	
	@Override
	public void insertAddress(Address address, Long userId) {
		address.setUserId(userId);
		address.setCreateTime(new Date());
		addressMapper.insert(address);
	}

	@Override
	public List<Address> selectAddress(Long userId) {
		Address address = new Address();
		address.setUserId(userId);
		return addressMapper.selectList(new EntityWrapper<Address>(address).orderBy("createTime", false));
	}

	@Override
	public void deleteByAddressId(Long userId, Long addressId) {
		Address address = new Address();
		address.setUserId(userId);
		address.setAddressId(addressId);
		addressMapper.delete(new EntityWrapper<Address>(address));
	}

}
