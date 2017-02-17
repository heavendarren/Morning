package com.pussinboots.morning.cms.modules.system.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pussinboots.morning.cms.modules.system.dto.VersionLogDTO;
import com.pussinboots.morning.cms.modules.system.service.IVersionLogService;
import com.pussinboots.morning.common.controller.BaseController;
import com.pussinboots.morning.common.model.PageInfo;

/**
 * 
* 项目名称：morning-cms-webapp   
* 类名称：SystemVersionLogControlller   
* 类描述：版本日至表示层控制器    
* 创建人：陈星星   
* 创建时间：2017年2月17日 上午12:32:07
 */
@Controller
@RequestMapping(value = "/system/version")
public class SystemVersionLogControlller extends BaseController {
	
	/** 版本日志 */
	private static final String SYSTEM_VERSION_LIST = getViewPath("modules/version/system_version_list");
	/** 分页日志 */
	private static final String SYSTEM_VERSION_PAGE = getViewPath("modules/version/system_version_page");
	
	@Autowired
	private IVersionLogService versionLogService;
	
	/**
	 * GET 版本日志
	 * @param model
	 * @return
	 */
	@GetMapping(value = { "", "/view" })
	public String list(Model model) {
		return SYSTEM_VERSION_LIST;
	}
	
	/**
	 * POST 版本日志
	 * @param model 
	 * @param pageInfo 分页条件
	 * @return
	 */
	@PostMapping(value = {"/view" })
	public String list(Model model, PageInfo pageInfo) {
		VersionLogDTO versionLogDTO = versionLogService.selectByPullPage(pageInfo);
		model.addAttribute("versionLogs",versionLogDTO.getVersionLogs());
		model.addAttribute("pageInfo", versionLogDTO.getPageInfo());
		return SYSTEM_VERSION_PAGE;
	}

}
