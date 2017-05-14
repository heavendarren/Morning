package org.pussinboots.morning.os.common.util;

import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import eu.bitwalker.useragentutils.Browser;
import eu.bitwalker.useragentutils.OperatingSystem;
import eu.bitwalker.useragentutils.UserAgent;

/**
 * 
* 项目名称：morning-os-web Maven Webapp   
* 类名称：ServletUtils   
* 类描述：ServletUtils工具类：提供一些Http与Servlet工具的方法      
* 创建人：陈星星   
* 创建时间：2017年4月8日 下午2:21:02   
*
 */
public class ServletUtils {
	
	private static Logger logger = LoggerFactory.getLogger(ServletUtils.class);
	
	// -- Content Type 定义 --//
	public static final String EXCEL_TYPE = "application/vnd.ms-excel";
	public static final String HTML_TYPE = "text/html";
	public static final String JS_TYPE = "text/javascript";
	public static final String JSON_TYPE = "application/json";
	public static final String XML_TYPE = "text/xml";
	public static final String TEXT_TYPE = "text/plain";
 
	// -- Header 定义 --//
	public static final String AUTHENTICATION_HEADER = "Authorization";
 
	private ServletUtils() {
		throw new AssertionError();
	}
 
    /**
     * 设置客户端缓存过期时间 的Header.
     */
	public static void setExpiresHeader(HttpServletResponse response, long expiresSeconds) {
		// Http 1.0 header
		response.setDateHeader("Expires", System.currentTimeMillis() + expiresSeconds * 1000);
		// Http 1.1 header
		response.setHeader("Cache-Control", "private, max-age=" + expiresSeconds);
	}
 
    /**
     * 设置禁止客户端缓存的Header.
     */
	public static void setDisableCacheHeader(HttpServletResponse response) {
		// Http 1.0 header
		response.setDateHeader("Expires", 1L);
		response.addHeader("Pragma", "no-cache");
		// Http 1.1 header
		response.setHeader("Cache-Control", "no-cache, no-store, max-age=0");
	}
 
    /**
     * 设置LastModified Header.
     */
	public static void setLastModifiedHeader(HttpServletResponse response, long lastModifiedDate) {
		response.setDateHeader("Last-Modified", lastModifiedDate);
	}
 
    /**
     * 设置Etag Header.
     */
	public static void setEtag(HttpServletResponse response, String etag) {
		response.setHeader("ETag", etag);
	}
 
    /**
     * 根据浏览器If-Modified-Since Header, 计算文件是否已被修改.
     * 如果无修改, checkIfModify返回false ,设置304 not modify status.
     * @param lastModified 内容的最后修改时间.
     */
	public static boolean checkIfModifiedSince(HttpServletRequest request, HttpServletResponse response,
			long lastModified) {
		long ifModifiedSince = request.getDateHeader("If-Modified-Since");
		if ((ifModifiedSince != -1) && (lastModified < ifModifiedSince + 1000)) {
			response.setStatus(HttpServletResponse.SC_NOT_MODIFIED);
			return false;
		}
		return true;
	}
 
    /**
     * 根据浏览器 If-None-Match Header, 计算Etag是否已无效.
     * 如果Etag有效, checkIfNoneMatch返回false, 设置304 not modify status.
     * @param etag 内容的ETag.
     */
	public static boolean checkIfNoneMatchEtag(HttpServletRequest request, HttpServletResponse response, String etag) {
		String headerValue = request.getHeader("If-None-Match");
		if (headerValue != null) {
			boolean conditionSatisfied = false;
			if (!"*".equals(headerValue)) {
				StringTokenizer commaTokenizer = new StringTokenizer(headerValue, ",");

				while (!conditionSatisfied && commaTokenizer.hasMoreTokens()) {
					String currentToken = commaTokenizer.nextToken();
					if (currentToken.trim().equals(etag)) {
						conditionSatisfied = true;
					}
				}
			} else {
				conditionSatisfied = true;
			}

			if (conditionSatisfied) {
				response.setStatus(HttpServletResponse.SC_NOT_MODIFIED);
				response.setHeader("ETag", etag);
				return false;
			}
		}
		return true;
	}
 
    /**
     * 设置让浏览器弹出下载对话框的Header.
     * @param fileName 下载后的文件名.
     */
	public static void setFileDownloadHeader(HttpServletResponse response, String fileName) {
		try {
			// 中文文件名支持
			String encodedfileName = new String(fileName.getBytes(), "ISO8859-1");
			response.setHeader("Content-Disposition", "attachment; filename=\"" + encodedfileName + "\"");
		} catch (UnsupportedEncodingException e) {
			logger.error("ServletUtils.setFileDownloadHeader", e);
		}
	}
    
	/**
	 * 获取当前请求对象
	 */
	public static HttpServletRequest getRequest() {
		return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
	}
    
    /**
     * 获取项目名称路径
     */
	public static String getContentpath() {
		return getRequest().getContextPath();
	}
     
	/**
	 * 获取项目绝对路径
	 */
	public static String getRealPath() {
		return getRequest().getSession().getServletContext().getRealPath("/");
	}
    
	/**
	 * getAttribute这个方法是提取放置在某个共享区间的对象
	 * @param name
	 * @return
	 */
	public static Object getAttribute(String name) {
		return getRequest().getSession().getAttribute(name);
	}
	
	/**
	 * getParameter系列的方法主要用于处理“请求数据”，是服务器端程序获取浏览器所传递参数的主要接口。
	 * @param name 表单name属性
	 * @return
	 */
	public static String getParameter(String name) {
		return getRequest().getParameter(name);
	}
	
	/**
	 * getParameterValues这个方法是获得传过来的参数名相同的一个数组;
	 * @param name
	 * @return
	 */
	public static String[] getParameterValues(String name) {
		return getRequest().getParameterValues(name);
	}
	
	/**
	 * 获取当前网络ip
	 * @return
	 */
	public static String getIpAddr() {
		String ipAddress = getRequest().getHeader("x-forwarded-for");
		if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = getRequest().getHeader("Proxy-Client-IP");
		}
		if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = getRequest().getHeader("WL-Proxy-Client-IP");
		}
		if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
			ipAddress = getRequest().getRemoteAddr();
			if ("127.0.0.1".equals(ipAddress) || "0:0:0:0:0:0:0:1".equals(ipAddress)) {
				// 根据网卡取本机配置的IP
				InetAddress inet = null;
				try {
					inet = InetAddress.getLocalHost();
				} catch (UnknownHostException e) {
					logger.error("ServletUtils.getIpAddr", e);
				}
				ipAddress = inet.getHostAddress();
			}
		}
		// 对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割
		if (ipAddress != null && ipAddress.length() > 15 && ipAddress.indexOf(',') > 0) { // "***.***.***.***".length() // = 15
			ipAddress = ipAddress.substring(0, ipAddress.indexOf(','));
		}
		return ipAddress;
	}
	
	/**
	 * 获取当前用户游览器型号
	 */
	public static String getUserBrowser() {
		UserAgent userAgent = UserAgent.parseUserAgentString(getRequest().getHeader("User-Agent"));
		Browser browser = userAgent.getBrowser();
		return browser.toString();
	}
	
	/**
	 * 获取当前用户系统型号
	 */
	public static String getUserOperatingSystem() {
		UserAgent userAgent = UserAgent.parseUserAgentString(getRequest().getHeader("User-Agent"));
		OperatingSystem operatingSystem = userAgent.getOperatingSystem();
		return operatingSystem.toString();
	}
}