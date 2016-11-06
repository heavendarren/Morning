package com.morning.service.impl.system;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.morning.dao.system.SystemMenuMapper;
import com.morning.entity.system.SystemMenu;
import com.morning.service.system.SystemMenuService;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：SystemMenuServiceImpl   
* 类描述：系统权限业务逻辑层实现   
* 创建人：陈星星   
* 创建时间：2016年10月23日 下午9:56:26   
* 修改人：陈星星   
* 修改时间：2016年10月23日 下午9:56:26   
* 修改备注：   
* @version    
*
 */
@Service("systemMenuService")
public class SystemMenuServiceImpl implements SystemMenuService{
	
	@Autowired
	private SystemMenuMapper systemMenuMapper;

	@Override
	public List<SystemMenu> querySysMenu(Integer status, String menuType) {
		Map<String,Object> parameter = new HashMap<String, Object>();
		parameter.put("status", status);
		parameter.put("menuType", menuType);
		return systemMenuMapper.querySysMenu(parameter);
	}
	
	@Override
	public List<SystemMenu> querySysMenuByRoleId(Integer roleId) {
		return systemMenuMapper.querySysMenuByRoleId(roleId);
	}
	
	/**
	 * 处理后台目录
	 * @param systemMenuList 网站目录列表
	 * @return
	 */
	public List<SystemMenu> handleMenu(List<SystemMenu> systemMenuList){
		List<SystemMenu> systemMenus = new ArrayList<SystemMenu>();
		if(systemMenuList != null && systemMenuList.size() > 0){
			//获取根级权限
			List<SystemMenu> parentMenuList = new ArrayList<SystemMenu>();
			for(SystemMenu sm : systemMenuList){
				if(sm.getMenuType() == 1){   //权限类型：1.菜单；2.功能；0.操作
					parentMenuList.add(sm);
				}
			}
			//获取根级权限的子级权限
			for(SystemMenu psm : parentMenuList){
				recursionMenu(systemMenus, systemMenuList, psm);
			}
		}
		return systemMenus;
	}
	
	/**
	 * 递归得到每个权限的子级权限
	 * @param systemMenus 处理后的目录列表
	 * @param systemMenuList  网站目录列表
	 * @param psm 当前目录
	 */
	private void recursionMenu(List<SystemMenu> systemMenus, List<SystemMenu> systemMenuList, SystemMenu psm){
		List<SystemMenu> childMenuList = new ArrayList<SystemMenu>();
		for(SystemMenu sm : systemMenuList){
			if(psm.getMenuId() == sm.getParentId() && sm.getMenuType() == 2 ){
				childMenuList.add(sm);
			}
		}
		psm.setChildMenuList(childMenuList);
		systemMenus.add(psm);
	}

}
