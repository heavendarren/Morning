package org.pussinboots.morning.order.entity;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * 
* 项目名称：morning-order-facade   
* 类名称：OrderStatus   
* 类描述：OrderStatus / 订单状态表 实体类   
* 创建人：陈星星   
* 创建时间：2017年5月10日 上午10:30:19   
*
 */
@TableName("os_order_status")
public class OrderStatus extends Model<OrderStatus> {

    private static final long serialVersionUID = 1L;

    /**
     * 订单状态ID
     */
	@TableId(value="order_status_id", type= IdType.AUTO)
	private Long orderStatusId;
    /**
     * 订单ID
     */
	@TableField("order_id")
	private Long orderId;
    /**
     * 订单状态
     */
	@TableField("order_status")
	private Integer orderStatus;
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
     * 操作类型 0=会员，1=后台管理人员，2=异常通知
     */
	@TableField("create_status")
	private Integer createStatus;
    /**
     * 备注信息
     */
	private String remarks;


	public Long getOrderStatusId() {
		return orderStatusId;
	}

	public void setOrderStatusId(Long orderStatusId) {
		this.orderStatusId = orderStatusId;
	}

	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	public Integer getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
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

	public Integer getCreateStatus() {
		return createStatus;
	}

	public void setCreateStatus(Integer createStatus) {
		this.createStatus = createStatus;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	@Override
	protected Serializable pkVal() {
		return this.orderStatusId;
	}

}
