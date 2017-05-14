package org.pussinboots.morning.os.controller.product;

import org.pussinboots.morning.common.base.BaseController;
import org.pussinboots.morning.common.constant.CommonReturnCode;
import org.pussinboots.morning.common.enums.StatusEnum;
import org.pussinboots.morning.os.common.result.OsResult;
import org.pussinboots.morning.os.common.security.AuthorizingUser;
import org.pussinboots.morning.os.common.util.SingletonLoginUtils;
import org.pussinboots.morning.product.pojo.vo.CartVO;
import org.pussinboots.morning.product.pojo.vo.ShoppingCartVO;
import org.pussinboots.morning.product.service.IShoppingCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 
* 项目名称：morning-os-web Maven Webapp   
* 类名称：ProductCartController   
* 类描述：商品购物车表示层控制器      
* 创建人：陈星星   
* 创建时间：2017年5月10日 下午3:47:16   
*
 */
@Controller
@RequestMapping(value = "/cart")
@Api(value = "商品购物车", description = "商品购物车")
public class ProductCartController extends BaseController {
	
	@Autowired
	private IShoppingCartService shoppingCartService;
	
	/**
	 * POST 添加购物车商品
	 * @return
	 */
	@ApiOperation(value = "添加购物车商品", notes = "添加购物车商品")
	@PostMapping(value = "")
	@ResponseBody
	public Object create(Model model,
			@RequestParam(value = "productSpecNumber", required = true) Long productSpecNumber) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			shoppingCartService.insertShoppingCart(productSpecNumber, SingletonLoginUtils.getUserId());
			return new OsResult(CommonReturnCode.SUCCESS, productSpecNumber.toString());
		} else {
			return new OsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
	
	/**
	 * GET 成功加入购物车
	 * @return
	 */
	@ApiOperation(value = "成功加入购物车", notes = "成功加入购物车")
	@GetMapping(value = "/{productSpecNumber}")
	public Object view(Model model, @PathVariable("productSpecNumber") Long productSpecNumber) {

		// 用户已登录,查看数据库中购物车列表是否有该商品
		ShoppingCartVO shoppingCartVO = shoppingCartService.getCart(SingletonLoginUtils.getUserId(), productSpecNumber);
		if (shoppingCartVO == null) {
			// 重定向到购物车列表
			return redirectTo("/cart");
		}
		model.addAttribute("shoppingCartVO", shoppingCartVO);
		return "/modules/product/product_cart_info";
	}
	
	/**
	 * GET 购物车列表
	 * @return
	 */
	@ApiOperation(value = "购物车列表", notes = "购物车列表")
	@GetMapping(value = "/list")
	public Object list(Model model) {
		CartVO cartVO = shoppingCartService.list(SingletonLoginUtils.getUserId(), StatusEnum.ALL.getStatus());
		model.addAttribute("cartVO", cartVO);
		return "/modules/product/product_cart_list";
	}
	
	/**
	 * GET 导航栏购物车
	 * @param model
	 * @return
	 */
	@ApiOperation(value = "导航栏购物车", notes = "导航栏购物车")
	@GetMapping(value = "/topbar")
	public String topbarCart(Model model) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			CartVO cartVO = shoppingCartService.list(SingletonLoginUtils.getUserId(), StatusEnum.ALL.getStatus());
			model.addAttribute("cartVO", cartVO);
		} 
		return "/modules/product/product_cart_topbar";
	}
	
	/**
	 * GET 购物车商品数量
	 * @return
	 */
	@ApiOperation(value = "购物车商品数量", notes = "购物车商品数量")
	@GetMapping(value = "/cartNumber")
	@ResponseBody
	public Object cartNumber() {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			CartVO cartVO = shoppingCartService.list(SingletonLoginUtils.getUserId(), StatusEnum.ALL.getStatus());
			if (cartVO != null) {
				return new OsResult(CommonReturnCode.SUCCESS, cartVO.getTotalNumber());
			} else {
				return new OsResult(CommonReturnCode.FAILED);
			}
		} else {
			return new OsResult(CommonReturnCode.FAILED);
		}
	}
	
	/**
	 * DELETE 删除购物车商品
	 * @return
	 */
	@ApiOperation(value = "删除购物车商品", notes = "根据URL传过来的商品规格ID删除购物车商品")
	@DeleteMapping(value = "/{productSpecNumber}")
	@ResponseBody
	public Object delete(Model model, @PathVariable("productSpecNumber") Long productSpecNumber) {
		Integer count = shoppingCartService.delete(productSpecNumber, SingletonLoginUtils.getUserId());
		return new OsResult(CommonReturnCode.SUCCESS, count);
	}
	
	/**
	 * PUT 修改购物车商品数量
	 * @return
	 */
	@ApiOperation(value = "修改购物车商品数量", notes = "根据URL传过来的商品规格ID修改购物车商品数量")
	@PutMapping(value = "/{productSpecNumber}")
	@ResponseBody
	public Object updateNumber(Model model, @PathVariable("productSpecNumber") Long productSpecNumber,
			@RequestParam(value = "buyNumber", required = true) Integer buyNumber) {
		Integer count = shoppingCartService.updateBuyNumber(productSpecNumber, SingletonLoginUtils.getUserId(),
				buyNumber);
		return new OsResult(CommonReturnCode.SUCCESS, count);
	}
	
	/**
	 * PUT 修改购物车商品选中状态
	 * @return
	 */
	@ApiOperation(value = "修改购物车商品选中状态", notes = "根据URL传过来的商品规格ID修改购物车商品选中状态")
	@PutMapping(value = "/{productSpecNumber}/status")
	@ResponseBody
	public Object updateStatus(Model model, @PathVariable("productSpecNumber") Long productSpecNumber,
			@RequestParam(value = "checkStatus", required = true) Integer checkStatus) {
		if (StatusEnum.CHECKED.getStatus().equals(checkStatus)) {
			Integer count = shoppingCartService.updateStatus(productSpecNumber, SingletonLoginUtils.getUserId(),
					StatusEnum.UNCHECKED.getStatus());
			return new OsResult(CommonReturnCode.SUCCESS, count);
		} else if (StatusEnum.UNCHECKED.getStatus().equals(checkStatus)) {
			Integer count = shoppingCartService.updateStatus(productSpecNumber, SingletonLoginUtils.getUserId(),
					StatusEnum.CHECKED.getStatus());
			return new OsResult(CommonReturnCode.SUCCESS, count);
		}
		return new OsResult(CommonReturnCode.BAD_REQUEST.getCode(), CommonReturnCode.BAD_REQUEST.getMessage());
	}
}
