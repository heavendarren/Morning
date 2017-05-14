package org.pussinboots.morning.system.entity;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * 
* 项目名称：morning-system-facade   
* 类名称：VersionLog   
* 类描述：VersionLog / 系统日志表 实体类   
* 创建人：陈星星   
* 创建时间：2017年4月7日 下午2:12:52   
*
 */
@TableName("cms_version_log")
public class VersionLog extends Model<VersionLog> {

    private static final long serialVersionUID = 1L;

    /**
     * 版本日志ID
     */
	@TableId(value="log_id", type= IdType.AUTO)
	private Long logId;
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


	public Long getLogId() {
		return logId;
	}

	public void setLogId(Long logId) {
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
