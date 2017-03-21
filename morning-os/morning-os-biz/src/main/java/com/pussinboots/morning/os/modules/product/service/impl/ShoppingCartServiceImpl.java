package com.pussinboots.morning.os.modules.product.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.pussinboots.morning.os.modules.product.entity.ShoppingCart;
import com.pussinboots.morning.os.modules.product.mapper.ShoppingCartMapper;
import com.pussinboots.morning.os.modules.product.mapper.SpecificationAttributeMapper;
import com.pussinboots.morning.os.modules.product.service.IShoppingCartService;
import com.pussinboots.morning.os.modules.product.vo.CartVO;
import com.pussinboots.morning.os.modules.product.vo.ShoppingCartVO;

/**
 * 
* 项目名称：morning-os-biz   
* 类名称：ShoppingCartServiceImpl   
* 类描述：ShoppingCart表 / 购物车表 业务逻辑层接口实现   
* 创建人：陈星星   
* 创建时间：2017年3月19日 下午10:26:38   
*
 */
@Service
public class ShoppingCartServiceImpl extends ServiceImpl<ShoppingCartMapper, ShoppingCart> implements IShoppingCartService {
	
	@Autowired
	private ShoppingCartMapper shoppingCartMapper;
	@Autowired
	private SpecificationAttributeMapper specificationAttributeMapper;

	@Override
	public ShoppingCartVO selectCartVO(Long userId, Long productSpecNumber) {
		ShoppingCartVO shoppingCartVO = shoppingCartMapper.selectCartVO(userId, productSpecNumber);
		if (shoppingCartVO != null && StringUtils.isNotBlank(shoppingCartVO.getSpec())) {
			List<String> specificationName = specificationAttributeMapper.selectBySpec(shoppingCartVO.getSpec());
			shoppingCartVO.setSpecificationName(specificationName);
		}
		return shoppingCartVO;
	}
	
	@Override
	public CartVO selectCartVOs(Long userId) {
		// 根据用户ID查找购物车商品列表
		List<ShoppingCartVO> shoppingCartVOs = shoppingCartMapper.selectCartVOs(userId);

		if (!shoppingCartVOs.isEmpty()) {
			for (ShoppingCartVO shoppingCartVO : shoppingCartVOs) {
				// 根据用户ID查找购物车商品列表
				if (StringUtils.isNotBlank(shoppingCartVO.getSpec())) {
					List<String> specificationName = specificationAttributeMapper
							.selectBySpec(shoppingCartVO.getSpec());
					shoppingCartVO.setSpecificationName(specificationName);
				}
			}

			CartVO cartVO = new CartVO();
			cartVO.setShoppingCartVOs(shoppingCartVOs);
			return cartVO;
		}

		return null;
	}

	@Override
	public void insertByProductSpecNumber(Long productSpecNumber, Long userId) {

		// 查找用户购物车,该商品是否存在
		ShoppingCart queryShoppingCart = new ShoppingCart();
		queryShoppingCart.setProductSpecNumber(productSpecNumber);
		queryShoppingCart.setUserId(userId);
		ShoppingCart shoppingCart = shoppingCartMapper.selectOne(queryShoppingCart);

		if (shoppingCart != null) {
			// 若数据库中购物车存在该商品,则增加该商品购买数量(在原基础上+1)
			shoppingCart.setBuyNumber(shoppingCart.getBuyNumber() + 1);
			shoppingCart.setUpdateTime(new Date());
			shoppingCartMapper.updateById(shoppingCart);
		} else {
			// 若数据库中购物车不存在该商品,则添加该商品
			shoppingCart = new ShoppingCart();
			shoppingCart.setUserId(userId);
			shoppingCart.setCreateTime(new Date());
			shoppingCart.setProductSpecNumber(productSpecNumber);
			shoppingCartMapper.insert(shoppingCart);
		}
	}

	@Override
	public void deleteByProductSpecNumber(Long productSpecNumber, Long userId) {
		ShoppingCart shoppingCart = new ShoppingCart();
		shoppingCart.setProductSpecNumber(productSpecNumber);
		shoppingCart.setUserId(userId);
		shoppingCartMapper.delete(new EntityWrapper<ShoppingCart>(shoppingCart));
	}
}
