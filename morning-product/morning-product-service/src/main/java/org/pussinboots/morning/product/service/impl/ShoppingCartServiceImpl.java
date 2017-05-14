package org.pussinboots.morning.product.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.pussinboots.morning.common.enums.StatusEnum;
import org.pussinboots.morning.product.entity.ShoppingCart;
import org.pussinboots.morning.product.mapper.ShoppingCartMapper;
import org.pussinboots.morning.product.mapper.SpecificationAttributeMapper;
import org.pussinboots.morning.product.pojo.vo.CartVO;
import org.pussinboots.morning.product.pojo.vo.ShoppingCartVO;
import org.pussinboots.morning.product.service.IShoppingCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

/**
 * 
* 项目名称：morning-product-service   
* 类名称：ShoppingCartServiceImpl   
* 类描述：ShoppingCart / 购物车表 业务逻辑层接口实现
* 创建人：陈星星   
* 创建时间：2017年5月10日 下午3:56:07   
*
 */
@Service
public class ShoppingCartServiceImpl extends ServiceImpl<ShoppingCartMapper, ShoppingCart> implements IShoppingCartService {
	
	@Autowired
	private ShoppingCartMapper shoppingCartMapper;
	@Autowired
	private SpecificationAttributeMapper specificationAttributeMapper;

	@Override
	public Integer insertShoppingCart(Long productSpecNumber, Long userId) {
		// 查找用户购物车,该商品是否存在
		ShoppingCart queryShoppingCart = new ShoppingCart();
		queryShoppingCart.setProductSpecNumber(productSpecNumber);
		queryShoppingCart.setUserId(userId);
		ShoppingCart shoppingCart = shoppingCartMapper.selectOne(queryShoppingCart);

		if (shoppingCart != null) {
			// 若数据库中购物车存在该商品,则增加该商品购买数量(在原基础上+1)
			shoppingCart.setBuyNumber(shoppingCart.getBuyNumber() + 1);
			shoppingCart.setUpdateTime(new Date());
			return shoppingCartMapper.updateById(shoppingCart);
		} else {
			// 若数据库中购物车不存在该商品,则添加该商品
			shoppingCart = new ShoppingCart();
			shoppingCart.setUserId(userId);
			shoppingCart.setCreateTime(new Date());
			shoppingCart.setProductSpecNumber(productSpecNumber);
			return shoppingCartMapper.insert(shoppingCart);
		}
	}

	@Override
	public ShoppingCartVO getCart(Long userId, Long productSpecNumber) {
		ShoppingCartVO shoppingCartVO = shoppingCartMapper.getCart(userId, productSpecNumber);
		if (shoppingCartVO != null && StringUtils.isNotBlank(shoppingCartVO.getSpec())) {
			List<String> specificationName = specificationAttributeMapper.listBySpec(shoppingCartVO.getSpec());
			shoppingCartVO.setSpecificationName(specificationName);
		}
		return shoppingCartVO;
	}

	@Override
	public CartVO list(Long userId, Integer status) {
		// 根据用户ID查找购物车商品列表
		List<ShoppingCartVO> shoppingCartVOs = shoppingCartMapper.list(userId, status);

		if (!shoppingCartVOs.isEmpty()) {
			for (ShoppingCartVO shoppingCartVO : shoppingCartVOs) {
				// 根据用户ID查找购物车商品列表
				if (StringUtils.isNotBlank(shoppingCartVO.getSpec())) {
					List<String> specificationName = specificationAttributeMapper.listBySpec(shoppingCartVO.getSpec());
					shoppingCartVO.setSpecificationName(specificationName);
				}else{
					List<String> specificationName = new ArrayList<String>();
					specificationName.add(StringUtils.EMPTY);
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
	public Integer updateBuyNumber(Long productSpecNumber, Long userId, Integer buyNumber) {
		// 查找用户购物车,该商品是否存在
		ShoppingCart queryShoppingCart = new ShoppingCart();
		queryShoppingCart.setProductSpecNumber(productSpecNumber);
		queryShoppingCart.setUserId(userId);
		ShoppingCart shoppingCart = shoppingCartMapper.selectOne(queryShoppingCart);

		if (shoppingCart != null) {
			shoppingCart.setBuyNumber(buyNumber);
			shoppingCart.setUpdateTime(new Date());
			return shoppingCartMapper.updateById(shoppingCart);
		} else {
			// TODO 抛出一个异常,声明商品不存在
			return null;
		}
	}
	
	@Override
	public Integer updateStatus(Long productSpecNumber, Long userId, Integer status) {
		// 查找用户购物车,该商品是否存在
		ShoppingCart queryShoppingCart = new ShoppingCart();
		queryShoppingCart.setProductSpecNumber(productSpecNumber);
		queryShoppingCart.setUserId(userId);
		ShoppingCart shoppingCart = shoppingCartMapper.selectOne(queryShoppingCart);

		if (shoppingCart != null) {
			// 若数据库中购物车存在该商品,则增加该商品购买数量(在原基础上+1)
			shoppingCart.setCheckStatus(status);
			shoppingCart.setUpdateTime(new Date());
			return shoppingCartMapper.updateById(shoppingCart);
		} else {
			// TODO 抛出一个异常,声明商品不存在
			return null;
		}
	}

	@Override
	public Integer delete(Long productSpecNumber, Long userId) {
		ShoppingCart shoppingCart = new ShoppingCart();
		shoppingCart.setProductSpecNumber(productSpecNumber);
		shoppingCart.setUserId(userId);
		return shoppingCartMapper.delete(new EntityWrapper<ShoppingCart>(shoppingCart));
	}

	@Override
	public Integer deleteCheckStatus(Long userId) {
		ShoppingCart shoppingCart = new ShoppingCart();
		shoppingCart.setUserId(userId);
		shoppingCart.setCheckStatus(StatusEnum.CHECKED.getStatus());
		return shoppingCartMapper.delete(new EntityWrapper<ShoppingCart>(shoppingCart));
	}
}
