package org.pussinboots.morning.os.controller.user;

import org.pussinboots.morning.common.base.BaseController;
import org.pussinboots.morning.common.base.BasePageDTO;
import org.pussinboots.morning.common.constant.CommonReturnCode;
import org.pussinboots.morning.common.support.page.PageInfo;
import org.pussinboots.morning.os.common.result.OsResult;
import org.pussinboots.morning.os.common.util.SingletonLoginUtils;
import org.pussinboots.morning.user.entity.Address;
import org.pussinboots.morning.user.entity.Favorite;
import org.pussinboots.morning.user.pojo.vo.UserVO;
import org.pussinboots.morning.user.service.IAddressService;
import org.pussinboots.morning.user.service.IFavoriteService;
import org.pussinboots.morning.user.service.IUserService;
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
* 类名称：UserInfoController   
* 类描述：后台中心-个人中心表示层控制器   
* 创建人：陈星星   
* 创建时间：2017年5月9日 下午5:27:30   
*
 */
@Controller
@RequestMapping(value = "/uc/user")
@Api(value = "个人中心", description = "个人中心")
public class UserInfoController extends BaseController {
	
	@Autowired
	private IUserService userService;
	@Autowired
	private IFavoriteService favoriteService;
	@Autowired
	private IAddressService addressService;
	
	/**
	 * GET 我的个人中心
	 * @return
	 */
	@ApiOperation(value = "我的个人中心", notes = "我的个人中心")  
	@GetMapping(value = "/portal")
	public String portal(Model model) {
		
		UserVO userVO = userService.getById(SingletonLoginUtils.getUserId());
		model.addAttribute("userVO", userVO);
		
		return "/modules/usercenter/user_portal";
	}
	
	/**
	 * GET 喜欢的商品
	 * @return
	 */
	@ApiOperation(value = "喜欢的商品", notes = "喜欢的商品")  
	@GetMapping(value = "/favorite")
	public String favorite(Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			@RequestParam(value = "limit", required = false, defaultValue = "12") Integer limit) {

		PageInfo pageInfo = new PageInfo(limit, page);
		
		BasePageDTO<Favorite> basePageDTO = favoriteService.listByUserId(SingletonLoginUtils.getUserId(), pageInfo);

		model.addAttribute("favorites", basePageDTO.getList());
		model.addAttribute("pageInfo", basePageDTO.getPageInfo());
		
		return "/modules/usercenter/user_favorite";
	}
	
	/**
	 * DELETE 喜欢的商品
	 * @return
	 */
	@ApiOperation(value = "删除喜欢的商品", notes = "根据url传过来的商品编号删除喜欢的商品")  
	@DeleteMapping(value = "/favorite/{productNumber}")
	@ResponseBody
	public Object favoriteDelete(@PathVariable("productNumber") Long productNumber) {
		Integer count = favoriteService.deleteByProductNumber(SingletonLoginUtils.getUserId(), productNumber);
		return new OsResult(CommonReturnCode.SUCCESS, count);
	}
	
	/**
	 * GET 收货地址
	 * @return
	 */
	@ApiOperation(value = "收货地址列表", notes = "收货地址列表") 
	@GetMapping(value = "/address")
	public String address(Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			@RequestParam(value = "limit", required = false, defaultValue = "11") Integer limit) {
		
		PageInfo pageInfo = new PageInfo(limit, page);
		BasePageDTO<Address> basePageDTO = addressService.listByUserId(SingletonLoginUtils.getUserId(), pageInfo);
		model.addAttribute("addresses", basePageDTO.getList());
		model.addAttribute("pageInfo", basePageDTO.getPageInfo());
		
		return "/modules/usercenter/user_address";
	}
	
	/**
	 * POST 创建收货地址
	 * @return
	 */
	@ApiOperation(value = "创建收货地址", notes = "根据url传过来的收货地址信息创建收货地址")
	@PostMapping(value = "/address")
	@ResponseBody
	public Object addressCreate(Address address) {
		Integer count = addressService.insertAddress(SingletonLoginUtils.getUserId(), address);
		return new OsResult(CommonReturnCode.SUCCESS, count);
	}
	
	/**
	 * PUT 更新收货地址
	 * @return
	 */
	@ApiOperation(value = "更新收货地址", notes = "根据url传过来的收获地址ID和收货地址信息更新收货地址")
	@PutMapping(value = "/address/{addressId}")
	@ResponseBody
	public Object addressUpdate(Address address, @PathVariable("addressId") Long addressId) {
		address.setAddressId(addressId);
		Integer count = addressService.updateAddress(SingletonLoginUtils.getUserId(), address);
		return new OsResult(CommonReturnCode.SUCCESS, count);
	}
	
	/**
	 * DELETE 收货地址
	 * @return
	 */
	@ApiOperation(value = "删除收货地址", notes = "根据url传过来的地址ID删除收货地址")  
	@DeleteMapping(value = "/address/{addressId}")
	@ResponseBody
	public Object addressDelete(@PathVariable("addressId") Long addressId) {
		Integer count = addressService.deleteByAddressId(SingletonLoginUtils.getUserId(), addressId);
		return new OsResult(CommonReturnCode.SUCCESS, count);
	}
}
