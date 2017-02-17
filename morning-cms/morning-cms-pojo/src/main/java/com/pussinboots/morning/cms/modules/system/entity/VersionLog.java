package com.pussinboots.morning.cms.modules.system.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * 
* 项目名称：morning-cms-pojo   
* 类名称：VersionLog   
* 类描述：VersionLog 表实体类   
* 创建人：陈星星   
* 创建时间：2017年2月8日 下午6:06:38
 */
@TableName("cms_version_log")
public class VersionLog extends Model<VersionLog> {

    private static final long serialVersionUID = 1L;

    /**
     * 构建日志ID
     */
	@TableId("log_id")
	private Integer logId;
    /**
     * 创建时间
     */
	@TableField("create_time")
	private Date createTime;
    /**
     * 创建者
     */
	@TableField("create_by")
	private String createBy;
	/**
	 * 日志标题
	 */
	@TableField("log_title")
	private String logTitle;
	/**
	 * 日志内容
	 */
	@TableField("log_content")
	private String logContent;

	
	public Integer getLogId() {
		return logId;
	}

	public void setLogId(Integer logId) {
		this.logId = logId;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getCreateBy() {
		return createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	public String getLogTitle() {
		return logTitle;
	}

	public void setLogTitle(String logTitle) {
		this.logTitle = logTitle;
	}

	public String getLogContent() {
		return logContent;
	}

	public void setLogContent(String logContent) {
		this.logContent = logContent;
	}

	@Override
	protected Serializable pkVal() {
		return this.logId;
	}

}
