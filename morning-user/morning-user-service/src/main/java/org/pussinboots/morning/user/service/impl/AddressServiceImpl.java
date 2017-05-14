package org.pussinboots.morning.user.service.impl;

import java.util.Date;
import java.util.List;

import org.pussinboots.morning.common.base.BasePageDTO;
import org.pussinboots.morning.common.support.page.PageInfo;
import org.pussinboots.morning.user.entity.Address;
import org.pussinboots.morning.user.mapper.AddressMapper;
import org.pussinboots.morning.user.service.IAddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

/**
 * 
* 项目名称：morning-user-service   
* 类名称：AddressServiceImpl   
* 类描述：Address / 收获地址表 业务逻辑层接口实现   
* 创建人：陈星星   
* 创建时间：2017年5月9日 下午9:59:19   
*
 */
@Service
public class AddressServiceImpl extends ServiceImpl<AddressMapper, Address> implements IAddressService {
	
	@Autowired
	private AddressMapper addressMapper;
	
	@Override
	public Integer insertAddress(Long userId, Address address) {
		address.setCreateTime(new Date());
		address.setUserId(userId);
		return addressMapper.insert(address);
	}

	@Override
	public BasePageDTO<Address> listByUserId(Long userId, PageInfo pageInfo) {

		Page<Address> page = new Page<>(pageInfo.getCurrent(), pageInfo.getLimit());

		Address address = new Address();
		address.setUserId(userId);
		List<Address> addresses = addressMapper.selectPage(page,
				new EntityWrapper<Address>(address).orderBy("createTime", false));
		pageInfo.setTotal(page.getTotal());

		return new BasePageDTO<Address>(pageInfo, addresses);
	}
	
	@Override
	public List<Address> listAddress(Long userId) {
		Address address = new Address();
		address.setUserId(userId);
		return addressMapper.selectList(new EntityWrapper<Address>(address));
	}
	
	@Override
	public Address getAddress(Long addressId, Long userId) {
		Address address = new Address();
		address.setUserId(userId);
		address.setAddressId(addressId);
		return addressMapper.selectOne(address);
	}
	
	@Override
	public Integer updateAddress(Long userId, Address address) {
		Address queryAddress = new Address();
		queryAddress.setUserId(userId);
		queryAddress.setAddressId(address.getAddressId());
		Address resultAddress = addressMapper.selectOne(queryAddress);
		if (resultAddress != null) {
			address.setAddressId(resultAddress.getAddressId());
			address.setUserId(queryAddress.getUserId());
			address.setUpdateTime(new Date());
			return addressMapper.updateById(address);
		}
		// TODO 抛出一个收货地址不存在的异常
		return null;
	}

	@Override
	public Integer deleteByAddressId(Long userId, Long addressId) {
		Address address = new Address();
		address.setUserId(userId);
		address.setAddressId(addressId);
		return addressMapper.delete(new EntityWrapper<Address>(address));
	}

}
