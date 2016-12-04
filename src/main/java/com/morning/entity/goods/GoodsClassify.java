package com.morning.entity.goods;

import java.io.Serializable;
import java.util.List;

import com.baomidou.mybatisplus.annotations.IdType;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：GoodsClassify   
* 类描述：GoodsClassify 表实体类   
* 创建人：陈星星   
* 创建时间：2016年8月26日  下午1:56:55  
* 修改人：陈星星   
* 修改时间：2016年11月20日 下午8:32:35   
* @version
 */
@TableName("tb_goods_classify")
public class GoodsClassify implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 类目ID */
	@TableId(value = "CLASSIFY_ID", type = IdType.AUTO)
	private Integer classifyId;

	/** 类目名称 */
	@TableField(value = "CLASSIFY_NAME")
	private String classifyName;

	/** 类目排序 */
	@TableField(value = "CLASSIFY_SORT")
	private Integer classifySort;

	/** 导航栏类目排序 */
	@TableField(value = "CLASSIFY_NAV_SORT")
	private Integer classifyNavSort;

	/** 状态：1.显示；0.隐藏 */
	@TableField(value = "CLASSIFY_STATUS")
	private Integer classifyStatus;

	/** 导航状态：1.显示；0.隐藏 */
	@TableField(value = "CLASSIFY_NAV_STATUS")
	private Integer classifyNavStatus;
	
	/**  类目商品  */
	private List<Goods> goodsList;
	
	/** 类目商品数量 */
	private Integer number;

	public Integer getClassifyId() {
		return this.classifyId;
	}

	public void setClassifyId(Integer classifyId) {
		this.classifyId = classifyId;
	}

	public String getClassifyName() {
		return this.classifyName;
	}

	public void setClassifyName(String classifyName) {
		this.classifyName = classifyName;
	}

	public Integer getClassifySort() {
		return this.classifySort;
	}

	public void setClassifySort(Integer classifySort) {
		this.classifySort = classifySort;
	}

	public Integer getClassifyNavSort() {
		return this.classifyNavSort;
	}

	public void setClassifyNavSort(Integer classifyNavSort) {
		this.classifyNavSort = classifyNavSort;
	}

	public Integer getClassifyStatus() {
		return this.classifyStatus;
	}

	public void setClassifyStatus(Integer classifyStatus) {
		this.classifyStatus = classifyStatus;
	}

	public Integer getClassifyNavStatus() {
		return this.classifyNavStatus;
	}

	public void setClassifyNavStatus(Integer classifyNavStatus) {
		this.classifyNavStatus = classifyNavStatus;
	}

	public List<Goods> getGoodsList() {
		return goodsList;
	}

	public void setGoodsList(List<Goods> goodsList) {
		this.goodsList = goodsList;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}
	
}
