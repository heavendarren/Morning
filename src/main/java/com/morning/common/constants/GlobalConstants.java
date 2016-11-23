package com.morning.common.constants;

/**
 * 
*    
* 项目名称：morning Maven Webapp   
* 类名称：GlobalConstants   
* 类描述：全局配置类  
* 创建人：陈星星   
* 创建时间：2016年10月24日 下午8:44:12   
* 修改人：陈星星   
* 修改时间：2016年10月24日 下午8:44:12   
* 修改备注：   
* @version    
*
 */
public class GlobalConstants {
	
	private GlobalConstants() {
	}
	
	/**
	 * 显示/隐藏
	 */
	public static final String SHOW = "1";
	public static final String HIDE = "0";
	
	/**
	 * 是/否
	 */
	public static final String YES = "1";
	public static final String NO = "0";
	
	
	/**
	 * 对/错
	 */
	public static final String TRUE = "true";
	public static final String FALSE = "false";
	
	/**
	 * 获取Key加载信息
	 */
	public static boolean printKeyLoadMessage(){
		StringBuilder stringBuilder = new StringBuilder();
		stringBuilder.append("\r\n            ================================================================================================\r\n");
		stringBuilder.append("\r\n                  ___           ___           ___           ___                       ___           ___     ");
		stringBuilder.append("\r\n                 /\\__\\         /\\  \\         /\\  \\         /\\__\\          ___        /\\__\\         /\\  \\    ");
		stringBuilder.append("\r\n                /::|  |       /::\\  \\       /::\\  \\       /::|  |        /\\  \\      /::|  |       /::\\  \\   ");
		stringBuilder.append("\r\n               /:|:|  |      /:/\\:\\  \\     /:/\\:\\  \\     /:|:|  |        \\:\\  \\    /:|:|  |      /:/\\:\\  \\  ");
		stringBuilder.append("\r\n              /:/|:|__|__   /:/  \\:\\  \\   /::\\~\\:\\  \\   /:/|:|  |__      /::\\__\\  /:/|:|  |__   /:/  \\:\\  \\ ");
		stringBuilder.append("\r\n             /:/ |::::\\__\\ /:/__/ \\:\\__\\ /:/\\:\\ \\:\\__\\ /:/ |:| /\\__\\  __/:/\\/__/ /:/ |:| /\\__\\ /:/__/_\\:\\__\\");
		stringBuilder.append("\r\n             \\/__/~~/:/  / \\:\\  \\ /:/  / \\/_|::\\/:/  / \\/__|:|/:/  / /\\/:/  /    \\/__|:|/:/  / \\:\\  /\\ \\/__/");
		stringBuilder.append("\r\n                   /:/  /   \\:\\  /:/  /     |:|::/  /      |:/:/  /  \\::/__/         |:/:/  /   \\:\\ \\:\\__\\  ");
		stringBuilder.append("\r\n                  /:/  /     \\:\\/:/  /      |:|\\/__/       |::/  /    \\:\\__\\         |::/  /     \\:\\/:/  /  ");
		stringBuilder.append("\r\n                 /:/  /       \\::/  /       |:|  |         /:/  /      \\/__/         /:/  /       \\::/  /   ");
		stringBuilder.append("\r\n                 \\/__/         \\/__/         \\|__|         \\/__/                     \\/__/         \\/__/    \r\n");
		stringBuilder.append("\r\n                                                                   欢迎使用 猫宁Morning电子商城  - Powered By 爬梯子的猫                     \r\n");
		stringBuilder.append("\r\n            ================================================================================================\r\n");
		System.out.println(stringBuilder.toString());
		return true;
	}
	

}
