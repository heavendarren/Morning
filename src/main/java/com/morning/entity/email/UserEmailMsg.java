package com.morning.entity.email;

import java.io.Serializable;
import java.util.Date;
import java.util.Map;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：UserEmailMsg   
* 类描述：用户邮件信息实体类   
* 创建人：陈星星   
* 创建时间：2016年8月4日  上午11:04:06 
* 修改人：陈星星   
* 修改时间：2016年11月6日 下午10:41:32   
* @version
 */
@Data
@EqualsAndHashCode(callSuper=false)
/*
 * Lombok提供的@EqualsAndHashCode完美的解决了手写equals和hashCode方法时遇到的全部问题，不需要刻意关注底层的实现细节。
 * 使用callSuper属性来控制是否要调用父类的equals和hashCode方法；
 */
public class UserEmailMsg implements Serializable {
	
	/**
	 * serialization 允许你将实现了Serializable接口的对象转换为字节序列，这些字节序列可以被完全存储以备以后重新生成原来的对象。
	 */
	private static final long serialVersionUID = -808318905357852929L;
	
    private int id;//主键
    private Long userId;//用户id
    private String toEmails;//收件人邮箱，多个邮箱以“,”分隔
    private String ccEmails;//抄送人人邮箱，多个邮箱以“,”分隔
    private String subject;//邮箱标题
    private String content;//正文内容
    private String velocityTemplate;//velocity模版
    private Map<String, Object> model;//声明Map对象，并填入用来填充模板文件的键值对 
    private Map<String, String> pictures;//邮件中的图片，为空时无图片。map中的key为图片ID，value为图片地址
    private Map<String, String> attachments;//邮件中的附件，为空时无附件。map中的key为附件ID，value为附件地址
    private Date createTime;//创建时间
    private String loginName;//操作人
    private String startDate;//开始时间
    private String endDate;//结束时间
    private Date sendTime;//发送时间
    private int status;//1 已发送 2 未发送
    private int type;//1 正常 2 定时
    private String fromName;//发件人昵称

}
