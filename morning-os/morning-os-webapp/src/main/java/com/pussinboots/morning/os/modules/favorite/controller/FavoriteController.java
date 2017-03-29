package com.pussinboots.morning.os.modules.favorite.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pussinboots.morning.common.controller.BaseController;
import com.pussinboots.morning.common.result.ResponseResult;
import com.pussinboots.morning.os.common.security.AuthorizingUser;
import com.pussinboots.morning.os.common.util.SingletonLoginUtils;
import com.pussinboots.morning.os.modules.user.entity.Favorite;
import com.pussinboots.morning.os.modules.user.service.IFavoriteService;

/**
 * 
* 项目名称：morning-os-webapp   
* 类名称：FavoriteController   
* 类描述：喜欢的商品表示层控制器       
* 创建人：陈星星   
* 创建时间：2017年3月29日 下午4:23:46   
*
 */
@Controller
@RequestMapping(value = "/favorite")
public class FavoriteController extends BaseController{
	
	@Autowired
	private IFavoriteService favoriteService;
	
	/**
	 * GET 收藏商品信息
	 * @param productNumber
	 * @return
	 */
	@GetMapping(value = "/{productNumber}")
	@ResponseBody
	public ResponseResult favorite(@PathVariable("productNumber") Long productNumber) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();

		if (authorizingUser != null) {
			Favorite favorite = favoriteService.selectByProductNumber(authorizingUser.getUserId(), productNumber);
			return success(true,"收藏夹商品",favorite);
		}

		return fail(false, "您未登录或者登录已超时,请先登录!");
	}	
	
	/**
	 * POST 添加收藏夹商品
	 * @param productNumber
	 * @return
	 */
	@PostMapping(value = "/{productNumber}")
	@ResponseBody
	public ResponseResult favoriteCreate(@PathVariable("productNumber") Long productNumber) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();

		if (authorizingUser != null) {
			favoriteService.insertByProductNumber(authorizingUser.getUserId(), productNumber);
			return success(true);
		}

		return fail(false, "您未登录或者登录已超时,请先登录!");
	}
	
	/**
	 * 删除收藏夹商品
	 * @param productNumber
	 * @return
	 */
	@DeleteMapping(value = "/{productNumber}")
	@ResponseBody
	public ResponseResult favoriteDetele(@PathVariable("productNumber") Long productNumber) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();

		if (authorizingUser != null) {
			favoriteService.deleteByProductNumber(authorizingUser.getUserId(), productNumber);
			return success(true);
		}

		return fail(false, "您未登录或者登录已超时,请先登录!");
	}
}
