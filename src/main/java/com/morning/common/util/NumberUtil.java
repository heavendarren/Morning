package com.morning.common.util;

import java.text.DecimalFormat;

/**
 * 
*    
* 项目名称：morning Maven Webapp   
* 类名称：NumberUtil   
* 类描述：数字通用处理工具   
* 创建人：陈星星   
* 创建时间：2016年10月2日 上午5:38:51   
* 修改人：陈星星   
* 修改时间：2016年10月2日 上午5:38:51   
* 修改备注：   
* @version    
*
 */
public class NumberUtil {

	/**
	 * 计算两数百分数
	 * @param divisor 除数
	 * @param dividend 被除数
	 * @return  51.2%
	 */
	public static String getPercent(int divisor, int dividend){
		DecimalFormat decimalFormat = new DecimalFormat();
		decimalFormat.setMaximumFractionDigits(1);
		decimalFormat.setMinimumFractionDigits(1);
		if(divisor!=0){
			String percent = decimalFormat.format(dividend * 100.00 / divisor) + "%";
			return percent;
		}else{
			String percent = decimalFormat.format(0.00) + "%";
			return percent;
		}
	} 
	
	/**
	 * 格式化数字为千分位显示；
	 * @param 要格式化的数字；
	 * @return
	 */
	public static String fmtMicrometer(String text) {
		DecimalFormat df = null;
		if (text.indexOf(".") > 0) {
			if (text.length() - text.indexOf(".") - 1 == 0) {
				df = new DecimalFormat("###,##0.");
			} else if (text.length() - text.indexOf(".") - 1 == 1) {
				df = new DecimalFormat("###,##0.0");
			} else {
				df = new DecimalFormat("###,##0.00");
			}
		} else {
			df = new DecimalFormat("###,##0");
		}
		double number = 0.0;
		try {
			number = Double.parseDouble(text);
		} catch (Exception e) {
			number = 0.0;
		}
		return df.format(number);
	}
}
