package com.morning.entity.goods;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：QueryGoods   
* 类描述：商品查询条件实体类   
* 创建人：陈星星   
* 创建时间：2016年8月22日  下午10:46:06  
* 修改人：陈星星   
* 修改时间：2016年11月20日 下午11:57:23   
* @version
 */
public class QueryGoods implements Serializable {

	private static final long serialVersionUID = 3256155739091789961L;

	/** 商品类别 */
	private Integer classifyId;
	
	/** 搜索内容 */
	private String search;
	
	/** 查询数量 */
	private Integer count;
	
	/**
	 * 查询条件：价格goodsPrice、时间goodsDate、游览数goodsViewNum、
	 * 销售数goodsBuyNum、评论数goodsReviews、提问数goodsQuery、
	 * 收藏数goodsFavorites、类别classifyId
	 */
	private String condition;
	
	/** 状态：1.上架；0.下架 */
	private Integer status;
	
	/** 查询 开始注册时间 */
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date beginCreateTime;
	
	/** 查询 结束注册时间 */
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date endCreateTime;

	public Integer getClassifyId() {
		return classifyId;
	}

	public void setClassifyId(Integer classifyId) {
		this.classifyId = classifyId;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getBeginCreateTime() {
		return beginCreateTime;
	}

	public void setBeginCreateTime(Date beginCreateTime) {
		this.beginCreateTime = beginCreateTime;
	}

	public Date getEndCreateTime() {
		return endCreateTime;
	}

	public void setEndCreateTime(Date endCreateTime) {
		this.endCreateTime = endCreateTime;
	}
}
