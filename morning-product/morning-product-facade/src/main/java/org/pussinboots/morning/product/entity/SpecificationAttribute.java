package org.pussinboots.morning.product.entity;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * 
* 项目名称：morning-product-facade   
* 类名称：SpecificationAttribute   
* 类描述：SpecificationAttribute / 规格属性表 实体类   
* 创建人：陈星星   
* 创建时间：2017年4月14日 上午2:00:36   
*
 */
@TableName("os_specification_attribute")
public class SpecificationAttribute extends Model<SpecificationAttribute> {

    private static final long serialVersionUID = 1L;

    /**
     * 规格属性ID
     */
	@TableId(value="spec_attr_id", type= IdType.AUTO)
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
