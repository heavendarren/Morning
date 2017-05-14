package org.pussinboots.morning.administrator.common.util;

import java.io.File;
import java.util.Date;

import org.pussinboots.morning.common.enums.WebSiteFileBelongEnum;
import org.pussinboots.morning.common.util.RandomUtils;

/**
 * 
* 项目名称：morning-administrator-facade   
* 类名称：UserUtils   
* 类描述：UserUtils工具类：提供一些用户操作的方法      
* 创建人：陈星星   
* 创建时间：2017年4月2日 下午2:46:39   
*
 */
public class UserUtils {

	/** 用户编号后缀位数 */
	private static final int SUFFIX_NUMBER = 2;

	/** 系统默认头像 */
	private static String[] defaultAvatar = { "avatar_1.jpg", "avatar_2.jpg", "avatar_3.jpg", "avatar_4.jpg",
			"avatar_5.jpg", "avatar_6.jpg", "avatar_7.jpg", "avatar_8.jpg"};

	private UserUtils() {
		throw new AssertionError();
	}

	/** 获得用户编号 */
	public static Long getUserNumber() {
		String prefixNumber = Long.toString(new Date().getTime());
		String suffixNumber = RandomUtils.number(SUFFIX_NUMBER);
		String userNumber = prefixNumber + suffixNumber;
		return Long.valueOf(userNumber);
	}

	/** 获得系统默认的头像 */
	public static String getPicImg() {
		// 系统默认头像名
		String picImg = RandomUtils.randomItem(defaultAvatar);
		// 系统 默认头像路径
		StringBuilder picImgUrl = new StringBuilder();
		picImgUrl.append(WebSiteFileBelongEnum.DEFAULT.getBelong());
		picImgUrl.append(File.separator);
		picImgUrl.append(WebSiteFileBelongEnum.AVATAR.getBelong());
		picImgUrl.append(File.separator);
		picImgUrl.append(picImg);

		// 将绝对路径"\"替换成"/"
		return picImgUrl.toString().replaceAll("\\\\", "/");
	}
}
