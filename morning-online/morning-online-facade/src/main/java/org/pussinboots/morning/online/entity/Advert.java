package org.pussinboots.morning.online.entity;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * 
* 项目名称：morning-online-facade   
* 类名称：Advert   
* 类描述：Advert / 广告位表 实体类   
* 创建人：陈星星   
* 创建时间：2017年4月10日 上午12:30:44   
*
 */
@TableName("os_advert")
public class Advert extends Model<Advert> {

    private static final long serialVersionUID = 1L;

    /**
     * 广告位ID
     */
	@TableId(value="advert_id", type= IdType.AUTO)
	private Long advertId;
    /**
     * 广告位名称
     */
	private String name;
    /**
     * 宽度
     */
	private Integer width;
    /**
     * 高度
     */
	private Integer height;
    /**
     * 描述
     */
	private String description;
    /**
     * 代码简称
     */
	private String code;
    /**
     * 模版内容
     */
	private String template;
    /**
     * 默认显示个数
     */
	@TableField("defult_number")
	private Integer defultNumber;
    /**
     * 广告数量
     */
	private Integer number;
    /**
     * 状态 1=显示/0=隐藏
     */
	private Integer status;
    /**
     * 广告位类型 1=图片/0=文本
     */
	private Integer type;
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
     * 更新时间
     */
	@TableField("update_time")
	private Date updateTime;
    /**
     * 更新者
     */
	@TableField("update_by")
	private String updateBy;


	public Long getAdvertId() {
		return advertId;
	}

	public void setAdvertId(Long advertId) {
		this.advertId = advertId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getWidth() {
		return width;
	}

	public void setWidth(Integer width) {
		this.width = width;
	}

	public Integer getHeight() {
		return height;
	}

	public void setHeight(Integer height) {
		this.height = height;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getTemplate() {
		return template;
	}

	public void setTemplate(String template) {
		this.template = template;
	}

	public Integer getDefultNumber() {
		return defultNumber;
	}

	public void setDefultNumber(Integer defultNumber) {
		this.defultNumber = defultNumber;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
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

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}

	@Override
	protected Serializable pkVal() {
		return this.advertId;
	}

}
