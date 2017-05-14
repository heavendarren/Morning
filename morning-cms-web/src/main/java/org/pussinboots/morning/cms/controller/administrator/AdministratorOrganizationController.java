package org.pussinboots.morning.cms.controller.administrator;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.pussinboots.morning.administrator.entity.Organization;
import org.pussinboots.morning.administrator.pojo.dto.UserPageDTO;
import org.pussinboots.morning.administrator.pojo.vo.OrganizationVO;
import org.pussinboots.morning.administrator.pojo.vo.UserVO;
import org.pussinboots.morning.administrator.service.IOrganizationService;
import org.pussinboots.morning.administrator.service.IUserService;
import org.pussinboots.morning.cms.common.result.CmsPageResult;
import org.pussinboots.morning.cms.common.result.CmsResult;
import org.pussinboots.morning.cms.common.security.AuthorizingUser;
import org.pussinboots.morning.cms.common.util.SingletonLoginUtils;
import org.pussinboots.morning.common.base.BaseController;
import org.pussinboots.morning.common.base.BasePageDTO;
import org.pussinboots.morning.common.constant.CommonReturnCode;
import org.pussinboots.morning.common.support.page.PageInfo;
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
* 项目名称：morning-cms-web Maven Webapp   
* 类名称：AdministratorOrganizationController   
* 类描述：组织管理表示层控制器        
* 创建人：陈星星   
* 创建时间：2017年4月7日 上午11:17:12   
*
 */
@Controller
@RequestMapping(value = "/administrator/organization")
@Api(value = "组织管理", description = "组织管理")
public class AdministratorOrganizationController extends BaseController {
	
	@Autowired
	private IOrganizationService organizationService;
	@Autowired
	private IUserService userService;
	
	/**
	 * GET 组织列表页面
	 * @return
	 */
	@ApiOperation(value = "组织列表页面", notes = "组织列表页面")
	@RequiresPermissions("administrator:organization:view")
	@GetMapping(value = "/view")
	public String getListPage() {
		return "/modules/organization/admin_organization_list";
	}
	
	/**
	 * GET 组织列表
	 * @param pageInfo
	 * @param search
	 * @return
	 */
	@ApiOperation(value = "获取组织列表", notes = "根据分页信息/搜索内容获取组织列表")  
	@RequiresPermissions("administrator:organization:view")
	@GetMapping(value = "/")
	@ResponseBody
	public Object listOrganization(PageInfo pageInfo, @RequestParam(required = false, value = "search") String search) {
		BasePageDTO<Organization> basePageDTO = organizationService.listByPage(pageInfo, search);
		return new CmsPageResult(basePageDTO.getList(), basePageDTO.getPageInfo().getTotal());
	}
	
	/**
	 * GET 组织列表详情页面
	 * @param model
	 * @return
	 */
	@ApiOperation(value = "组织列表详情页面", notes = "组织列表详情页面")
	@RequiresPermissions("administrator:organization:view")
	@GetMapping(value = "/detail")
	public String listDetail(Model model) {
		List<OrganizationVO> organizationVOs = organizationService.listOrganizationsDetail();
		model.addAttribute("organizationVOs", organizationVOs);
		return "/modules/organization/admin_organization_detail";
	}
	
	/**
	 * GET 组织详情页面
	 * @param model
	 * @return
	 */
	@ApiOperation(value = "组织详情页面", notes = "组织详情页面")
	@RequiresPermissions("administrator:organization:view")
	@GetMapping(value = "/{organizationId}/detail")
	public String listDetail(Model model, @PathVariable("organizationId") Long organizationId) {
		List<UserVO> userVOs = userService.listByOrganizationId(organizationId);
		model.addAttribute("userVOs", userVOs);
		return "/modules/organization/admin_organization_user";
	}
	
	/**
	 * GET 组织分类下管理员列表页面
	 * @param roleId
	 * @return
	 */
	@ApiOperation(value = "组织分类下管理员列表页面", notes = "组织分类下管理员列表页面")
	@RequiresPermissions("administrator:organization:view")
	@GetMapping(value = "/{organizationId}/list")
	public String list(Model model, @PathVariable("organizationId") Long organizationId) {
		model.addAttribute("organizationId", organizationId);
		return "/modules/organization/admin_user_organization";
	}
	
	/**
	 * GET 组织分类下管理员列表
	 * @return
	 */
	@ApiOperation(value = "组织分类下管理员列表", notes = "根据分页信息/搜索内容查询组织分类下管理员列表")
	@RequiresPermissions("administrator:organization:view")
	@GetMapping(value = "/{organizationId}/lists")
	@ResponseBody
	public Object listLogs(@PathVariable("organizationId") Long organizationId, PageInfo pageInfo,
			@RequestParam(required = false, value = "search") String search) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();

		if (authorizingUser != null) {
			// 用户日志
			UserPageDTO userPageDTO = userService.listByOrganizationId(organizationId, pageInfo, search);
			return new CmsPageResult(userPageDTO.getUserVOs(), userPageDTO.getPageInfo().getTotal());
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
	
	/**
	 * PUT 启用/冻结组织
	 * @param userId 管理员ID
	 * @return
	 */
	@ApiOperation(value = "启用/冻结组织", notes = "根据url组织ID启动/冻结组织")
	@RequiresPermissions("administrator:organization:audit")
	@PutMapping(value = "/{organizationId}/audit")
	@ResponseBody
	public Object audit(@PathVariable("organizationId") Long organizationId) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			Integer count = organizationService.updateStatus(organizationId);
			return new CmsResult(CommonReturnCode.SUCCESS, count);
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
	
	/**
	 * DELETE 删除组织
	 * @param roleId 组织ID
	 * @return
	 */
	@ApiOperation(value = "删除组织", notes = "根据url组织ID删除组织")
	@RequiresPermissions("administrator:organization:delete")
	@DeleteMapping(value = "/{organizationId}")
	@ResponseBody
	public Object delete(@PathVariable("organizationId") Long organizationId) {
		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			Integer count = organizationService.deleteByOrganizationId(organizationId);
			return new CmsResult(CommonReturnCode.SUCCESS, count);
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
	
	/**
	 * GET 创建组织页面
	 * @return
	 */
	@ApiOperation(value = "创建组织页面", notes = "创建组织页面")
	@RequiresPermissions("administrator:organization:create")
	@GetMapping(value = "/create")
	public String getInsertPage(Model model) {
		return "/modules/organization/admin_organization_create";
	}
	
	/**
	 * POST 创建组织
	 * @return
	 */
	@ApiOperation(value = "创建组织", notes = "创建组织")
	@RequiresPermissions("administrator:organization:create")
	@PostMapping(value = "")
	@ResponseBody
	public Object insert(Organization organization) {

		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			// 创建组织及插入组织目录记录
			Integer count = organizationService.insertOrganization(organization, authorizingUser.getUserName());
			return new CmsResult(CommonReturnCode.SUCCESS, count);
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
	
	/**
	 * GET 更新组织页面
	 * @return
	 */
	@ApiOperation(value = "更新组织页面", notes = "更新组织页面")
	@RequiresPermissions("administrator:organization:edit")
	@GetMapping(value = "/{organizationId}/edit")
	public String getUpdatePage(Model model, @PathVariable("organizationId") Long organizationId) {
		
		// 组织信息
		Organization organization = organizationService.selectById(organizationId);
		model.addAttribute("organization", organization);
		
		return "/modules/organization/admin_organization_update";
	}
	
	/**
	 * PUT 更新组织信息
	 * @return
	 */
	@ApiOperation(value = "更新管理员信息", notes = "根据url组织ID来指定更新对象,并根据传过来的组织信息来更新组织信息")
	@RequiresPermissions("administrator:organization:edit")
	@PutMapping(value = "/{organizationId}")
	@ResponseBody
	public Object update(Organization organization, @PathVariable("organizationId") Long organizationId) {

		AuthorizingUser authorizingUser = SingletonLoginUtils.getUser();
		if (authorizingUser != null) {
			// 更新组织信息
			Integer count = organizationService.updateOrganization(organization, authorizingUser.getUserName());
			return new CmsResult(CommonReturnCode.SUCCESS, count);
		} else {
			return new CmsResult(CommonReturnCode.UNAUTHORIZED);
		}
	}
}
