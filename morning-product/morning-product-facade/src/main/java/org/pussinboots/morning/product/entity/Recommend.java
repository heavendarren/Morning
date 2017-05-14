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
* 类名称：Recommend   
* 类描述：Recommend / 推荐位表 实体类   
* 创建人：陈星星   
* 创建时间：2017年4月11日 下午3:11:40   
*
 */
@TableName("os_recommend")
public class Recommend extends Model<Recommend> {

    private static final long serialVersionUID = 1L;

    /**
     * 推荐位ID
     */
	@TableId(value="recommend_id", type= IdType.AUTO)
	private Long recommendId;
    /**
     * 推荐位名称
     */
	private String name;
    /**
     * 代码简称
     */
	private String code;
    /**
     * 产品数量
     */
	private Integer number;
    /**
     * 显示数量
     */
	@TableField("show_number")
	private Integer showNumber;
    /**
     * 状态 1=显示/0=隐藏
     */
	private Integer status;
    /**
     * 备注信息
     */
	private String remarks;
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


	public Long getRecommendId() {
		return recommendId;
	}

	public void setRecommendId(Long recommendId) {
		this.recommendId = recommendId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Integer getShowNumber() {
		return showNumber;
	}

	public void setShowNumber(Integer showNumber) {
		this.showNumber = showNumber;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
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
		return this.recommendId;
	}

}
