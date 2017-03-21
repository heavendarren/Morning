package com.pussinboots.morning.os.modules.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pussinboots.morning.common.controller.BaseController;
import com.pussinboots.morning.common.result.ResponseResult;
import com.pussinboots.morning.os.common.security.AuthorizingUser;
import com.pussinboots.morning.os.common.util.SingletonLoginUtils;
import com.pussinboots.morning.os.modules.product.service.IShoppingCartService;
import com.pussinboots.morning.os.modules.product.vo.CartVO;
import com.pussinboots.morning.os.modules.product.vo.ShoppingCartVO;

/**
 * 
* 项目名称：morning-os-webapp   
* 类名称：ProductCartController   
* 类描述：   
* 创建人：陈星星   
* 创建时间：2017年3月19日 下午10:31:56   
*
 */
@Controller
@RequestMapping(value = "/cart")
public class ProductCartController extends BaseController {
	
	/** 购物车商品显示页面  */
	private static final String PRODUCT_CART_INFO = getViewPath("modules/product/product_cart_info");
	/** 导航栏购物车  */
	private static final String AJAX_TOPBAR_CART = getViewPath("modules/common/ajax_topbar_cart");
	/** 购物车列表  */
	private static final String PRODUCT_CART_LIST = getViewPath("modules/product/product_cart_list");
	
	@Autowired
	private IShoppingCartService shoppingCartService;
	
	/**
	 * GET 购物车列表
	 * @param model
	 * @return
	 */
	@GetMapping(value = "/")
	public String list(Model model) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();

		if (authorizingUser != null) {
			CartVO cartVO = shoppingCartService.selectCartVOs(authorizingUser.getUserId());
			// 用户已登录,则从数据库查找购物车商品列表
			model.addAttribute("cartVO", cartVO);
			return PRODUCT_CART_LIST;
		} else {
			// TODO 用户未登录,则将从cookie中查找商品列表
			return PRODUCT_CART_LIST;
		}
	}
	
	/**
	 * GET 导航栏购物车
	 * @param model
	 * @return
	 */
	@GetMapping(value = "/ajax/topbar")
	public String topbarCart(Model model) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();

		if (authorizingUser != null) {
			CartVO cartVO = shoppingCartService.selectCartVOs(authorizingUser.getUserId());
			// 用户已登录,则从数据库查找购物车商品列表
			model.addAttribute("cartVO", cartVO);
			return AJAX_TOPBAR_CART;
		} else {
			// TODO 用户未登录,则将从cookie中查找商品列表
			return AJAX_TOPBAR_CART;
		}
		// TODO 购物列表
	}
	
	/**
	 * GET 购物车商品数量
	 * @return
	 */
	@GetMapping(value = "/ajax/cartNumber")
	@ResponseBody
	public ResponseResult cartNumber() {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();

		if (authorizingUser != null) {
			// 用户已登录,则从数据库查找购物车商品列表
			CartVO cartVO = shoppingCartService.selectCartVOs(authorizingUser.getUserId());
			if (cartVO != null) {
				return success(true, "购物车商品数量", cartVO.getTotalNumber());
			} else {
				return fail(false, "购物车没有任何商品!");
			}
		} else {
			// TODO 用户未登录,则将从cookie中查找商品列表
			return fail(false, "购物车没有任何商品!");
		}
	}
	
	/**
	 * POST 添加购物车商品
	 * @param model
	 * @param productSpecNumber
	 * @return
	 */
	@PostMapping(value = "/")
	@ResponseBody
	public ResponseResult create(Model model,
			@RequestParam(value = "productSpecNumber", required = true) Long productSpecNumber) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		
		if (authorizingUser != null) {
			shoppingCartService.insertByProductSpecNumber(productSpecNumber, authorizingUser.getUserId());
			// 用户已登录,则将该商品添加数据库中
			return success(true, "加入购物车成功!", productSpecNumber);
		} else {
			// TODO 用户未登录,则将该商品添加cookie中
			return success(true, "加入购物车成功!", productSpecNumber);
		}
	}
	
	/**
	 * DELETE 删除购物车商品
	 * @param model
	 * @param productSpecNumber
	 * @return
	 */
	@DeleteMapping(value = "/{productSpecNumber}")
	@ResponseBody
	public ResponseResult delete(Model model, @PathVariable("productSpecNumber") Long productSpecNumber) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		
		if (authorizingUser != null) {
			shoppingCartService.deleteByProductSpecNumber(productSpecNumber, authorizingUser.getUserId());
			// 用户已登录,则将该商品添加数据库中
			return success(true, "加入购物车成功!", productSpecNumber);
		} else {
			// TODO 用户未登录,则将该商品添加cookie中
			return success(true, "加入购物车成功!", productSpecNumber);
		}
	}
	
	/**
	 * GET 成功加入购物车
	 * @param model
	 * @param productSpecNumber
	 * @return
	 */
	@GetMapping(value = "/{productSpecNumber}")
	public String view(Model model, @PathVariable("productSpecNumber") Long productSpecNumber) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();

		if (authorizingUser != null) {
			// 用户已登录,查看数据库中购物车列表是否有该商品
			ShoppingCartVO shoppingCartVO = shoppingCartService.selectCartVO(authorizingUser.getUserId(),
					productSpecNumber);
			if (shoppingCartVO == null) {
				// 重定向到购物车列表
				return redirectTo("/cart/");
			}
			model.addAttribute("shoppingCartVO", shoppingCartVO);
		} else {
			// TODO 用户未登录,查看cookie中购物车列表是否有该商品

		}
		return PRODUCT_CART_INFO;
	}
}
