package com.pussinboots.morning.os.modules.product.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * 
* 项目名称：morning-os-pojo   
* 类名称：SpecificationAttribute   
* 类描述：SpecificationAttribute表 / 规格属性表 实体类
* 创建人：陈星星   
* 创建时间：2017年3月5日 下午5:32:40   
*
 */
@TableName("os_specification_attribute")
public class SpecificationAttribute extends Model<SpecificationAttribute> {

    private static final long serialVersionUID = 1L;

    /**
     * 规格属性ID
     */
	@TableId("spec_attr_id")
	private Long specAttrId;
    /**
     * 规格ID
     */
	@TableField("specification_id")
	private Long specificationId;
	/**
	 * 规格属性名称
	 */
	private String name;
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


	public Long getSpecAttrId() {
		return specAttrId;
	}

	public void setSpecAttrId(Long specAttrId) {
		this.specAttrId = specAttrId;
	}

	public Long getSpecificationId() {
		return specificationId;
	}

	public void setSpecificationId(Long specificationId) {
		this.specificationId = specificationId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	@Override
	protected Serializable pkVal() {
		return this.specAttrId;
	}

}
