package com.pussinboots.morning.os.modules.user.controller;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pussinboots.morning.common.controller.BaseController;
import com.pussinboots.morning.common.model.PageInfo;
import com.pussinboots.morning.common.result.ResponseResult;
import com.pussinboots.morning.os.common.enums.CommonConstantEnum;
import com.pussinboots.morning.os.common.security.AuthorizingUser;
import com.pussinboots.morning.os.common.util.SingletonLoginUtils;
import com.pussinboots.morning.os.modules.user.dto.FavoritePageDTO;
import com.pussinboots.morning.os.modules.user.service.IFavoriteService;

/**
 * 
* 项目名称：morning-os-webapp   
* 类名称：UserInfoController   
* 类描述：后台中心-个人中心表示层控制器
* 创建人：陈星星   
* 创建时间：2017年3月14日 下午11:13:47   
*
 */
@Controller
@RequestMapping(value = "/uc/user")
public class UserInfoController extends BaseController {
	
	/** 我的个人中心 */
	private static final String USER_PORTAL = getViewPath("modules/usercenter/user_portal");
	/** 喜欢的商品 */
	private static final String USER_FAVORITE = getViewPath("modules/usercenter/user_favorite");
	
	@Autowired
	private IFavoriteService favoriteService;
	
	/**
	 * GET 我的个人中心
	 * @param model
	 * @return
	 */
	@GetMapping(value = "/portal")
	public String portal(Model model) {
		return USER_PORTAL;
	}
	
	/**
	 * GET 喜欢的商品
	 * @param model
	 * @return
	 */
	@GetMapping(value = "/favorite")
	public String favorite(Model model) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {

			// 获取商品状态,如果商品状态或者不为Integer类型,则默认null;
			Integer status = StringUtils.isNumeric(getParameter("status")) ? Integer.valueOf(getParameter("status"))
					: null;

			// 获取当前页数,如果当前页数不存在或者不为Integer类型,则默认1/默认页数
			Integer page = StringUtils.isNumeric(getParameter("page")) ? Integer.valueOf(getParameter("page")) : 1;

			PageInfo pageInfo = new PageInfo(page, CommonConstantEnum.FAVORITE_NUMBER.getValue());
			FavoritePageDTO favoritePageDTO = favoriteService.selectFavorites(authorizingUser.getUserId(), pageInfo,
					status);

			model.addAttribute("favorites", favoritePageDTO.getFavorites());
			model.addAttribute("pageInfo", favoritePageDTO.getPageInfo());
		}
		return USER_FAVORITE;
	}
	
	/**
	 * DELETE 喜欢的商品
	 * @param productNumber
	 * @return
	 */
	@DeleteMapping(value = "/favorite/{productNumber}")
	@ResponseBody
	public ResponseResult favoriteDelete(@PathVariable("productNumber") Long productNumber) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			favoriteService.deleteByProductNumber(authorizingUser.getUserId(), productNumber);
			return success(true);
		}
		return fail(false, "您未登录或者登录已超时,请先登录!");
	}
	
	/**
	 * GET 收货地址
	 * @param model
	 * @return
	 */
	@GetMapping(value = "/address")
	public String address(Model model) {
		return null;
	}
}
