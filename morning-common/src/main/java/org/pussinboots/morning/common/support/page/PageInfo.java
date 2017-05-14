package org.pussinboots.morning.common.support.page;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.io.Serializable;

/**
 * 
* 项目名称：morning-common   
* 类名称：PageInfo   
* 类描述：PageInfo 分页实体类      
* 创建人：陈星星   
* 创建时间：2017年4月2日 下午5:31:18   
*
 */
public class PageInfo implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	/** 总记录 */
	@JsonIgnore
	private int total;
	
	/** 总页数 */
	@JsonIgnore
	private int totalPage;
	
	/** 数据库中limit的参数，从第几条开始取 */
	@JsonIgnore
	private int offset;
	
	/** 每页显示的记录数 */
	@JsonIgnore
	private int limit;
	
	/** 当前页 */
	@JsonIgnore
	private int current;
	
	/** 排序字段 */
	@JsonIgnore
	private String sort;
	
	/** ASC,DESC mybatis Order 关键字 */
	@JsonIgnore
	private String order;
	
    public PageInfo() {
		super();
	}
    
	public PageInfo(int limit, int current) {
		// 计算当前页
		if (current < 0) {
			this.current = 1;
		} else {
			// 当前页
			this.current = current;
		}
		// 记录每页显示的记录数
		if (limit < 0) {
			this.limit = limit;
		} else {
			this.limit = limit;
		}
		// 计算开始的记录和结束的记录
		this.offset = (this.current - 1) * this.limit;
	}

	// 构造方法
	public PageInfo(int current, int limit, String sort, String order) {
		// 计算当前页
		if (current < 0) {
			this.current = 1;
		} else {
			// 当前页
			this.current = current;
		}
		// 记录每页显示的记录数
		if (limit < 0) {
			this.limit = limit;
		} else {
			this.limit = limit;
		}
		// 计算开始的记录和结束的记录
		this.offset = (this.current - 1) * this.limit;
		// 排序字段，正序还是反序
		this.sort = sort;
		this.order = order;
	}

	public void count() {
		if (limit <= 0) {
			this.limit = 1;
		}
		// 计算总页数
		int totalPageTemp = this.total / this.limit;
		int plus = (this.total % this.limit) == 0 ? 0 : 1;
		totalPageTemp = totalPageTemp + plus;
		if (totalPageTemp <= 0) {
			totalPageTemp = 1;
		}
		this.totalPage = totalPageTemp;
	}
	
	public void current() {
		if (limit <= 0) {
			this.limit = 1;
		}
		// 计算当前页数
		this.current = this.offset / this.limit + 1;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
		count();
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
		current();
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getCurrent() {
		return current;
	}

	public void setCurrent(int current) {
		this.current = current;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}
}
