package com.pussinboots.morning.common.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.io.Serializable;
import java.util.Map;

/**
 * 
* 项目名称：morning-common-core   
* 类名称：PageInfo   
* 类描述：PageInfo 分页实体类   
* 创建人：陈星星   
* 创建时间：2017年2月8日 下午5:22:06
 */
public class PageInfo implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	/** 默认显示的记录数 */
	private static final int PAGESIZE = 10;
	/** 总记录 */
	private int total;
	/** 数据库中limit的参数，从第几条开始取 */
	@JsonIgnore
	private int from;
	/** 数据库中的limit的参数，一共取多少条 */
	@JsonIgnore
	private int size;
	/** 当前页 */
	@JsonIgnore
	private int nowpage;
	/** 每页显示的记录数 */
	@JsonIgnore
	private int pagesize;
	/** 查询条件 */
	@JsonIgnore
	private Map<String, Object> condition;
	/** 排序字段 */
	@JsonIgnore
	private String sort = "seq";
	/** asc，desc mybatis Order 关键字 */
    @JsonIgnore
    private String order = "asc";

    public PageInfo() {
		super();
	}

	//构造方法
    public PageInfo(int nowpage, int pagesize) {
        //计算当前页  
        if (nowpage < 0) {
            this.nowpage = 1;
        } else {
            //当前页
            this.nowpage = nowpage;
        }
        //记录每页显示的记录数  
        if (pagesize < 0) {
            this.pagesize = PAGESIZE;
        } else {
            this.pagesize = pagesize;
        }
        //计算开始的记录和结束的记录  
        this.from = (this.nowpage - 1) * this.pagesize;
        this.size = this.pagesize;
    }

    // 构造方法
    public PageInfo(int nowpage, int pagesize, String sort, String order) {
        // 计算当前页  
        if (nowpage < 0) {
            this.nowpage = 1;
        } else {
            // 当前页
            this.nowpage = nowpage;
        }
        // 记录每页显示的记录数  
        if (pagesize < 0) {
            this.pagesize = PAGESIZE;
        } else {
            this.pagesize = pagesize;
        }
        // 计算开始的记录和结束的记录  
        this.from = (this.nowpage - 1) * this.pagesize;
        this.size = this.pagesize;
        // 排序字段，正序还是反序
        this.sort = sort;
        this.order = order;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getFrom() {
        return from;
    }

    public void setFrom(int from) {
        this.from = from;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getNowpage() {
        return nowpage;
    }

    public void setNowpage(int nowpage) {
        this.nowpage = nowpage;
    }

    public int getPagesize() {
        return pagesize;
    }

    public void setPagesize(int pagesize) {
        this.pagesize = pagesize;
    }

    public Map<String, Object> getCondition() {
        return condition;
    }

    public void setCondition(Map<String, Object> condition) {
        this.condition = condition;
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
