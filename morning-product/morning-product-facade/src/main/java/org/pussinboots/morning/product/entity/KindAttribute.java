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
* 类名称：KindAttribute   
* 类描述：KindAttribute / 类型属性表 实体类
* 创建人：陈星星   
* 创建时间：2017年4月25日 上午12:23:22   
*
 */
@TableName("os_kind_attribute")
public class KindAttribute extends Model<KindAttribute> {

    private static final long serialVersionUID = 1L;

    /**
     * 规格属性ID
     */
	@TableId(value="kind_attr_id", type= IdType.AUTO)
	private Long kindAttrId;
    /**
     * 规格ID
     */
	@TableField("kind_id")
	private Long kindId;
    /**
     * 规格属性ID
     */
	@TableField("spec_attr_id")
	private Long specAttrId;
	private String name;
    /**
     * 状态 0=隐藏/1=显示
     */
	private Integer status;
    /**
     * 排序
     */
	private Integer sort;
    /**
     * 创建者
     */
	@TableField("create_by")
	private String createBy;
    /**
     * 创建时间
     */
	@TableField("create_time")
	private Date createTime;


	public Long getKindAttrId() {
		return kindAttrId;
	}

	public void setKindAttrId(Long kindAttrId) {
		this.kindAttrId = kindAttrId;
	}

	public Long getKindId() {
		return kindId;
	}

	public void setKindId(Long kindId) {
		this.kindId = kindId;
	}

	public Long getSpecAttrId() {
		return specAttrId;
	}

	public void setSpecAttrId(Long specAttrId) {
		this.specAttrId = specAttrId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public String getCreateBy() {
		return createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Override
	protected Serializable pkVal() {
		return this.kindAttrId;
	}

}
