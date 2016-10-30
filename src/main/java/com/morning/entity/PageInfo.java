package com.morning.entity;


/**
 * 
 * @description：分页对应实体类
 * @author CXX
 * @version 创建时间：2016年6月4日  上午1:11:45
 */
public class PageInfo {
	
	private int totalNumber; // 总记录 
	
	private int currentPage; //当前显示页
	
	private int pageNumber = 12; //默认显示的记录数
	
	private int totalPage; //总页数
	
	private int dbIndex; //数据库中limit的参数，从第几条开始取
	
	private int dbNumber; //数据库中的limit的参数，一共取多少条

	public int getTotalNumber() {
		return totalNumber;
	}

	public void setTotalNumber(int totalNumber) {
		this.totalNumber = totalNumber;
		this.count();
	}
	
	public int getpageNumber() {
		return pageNumber;
	}

	public void setpageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
		this.count();
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
	public int getDbIndex() {
		return dbIndex;
	}

	public void setDbIndex(int dbIndex) {
		this.dbIndex = dbIndex;
	}

	public int getDbNumber() {
		return dbNumber;
	}

	public void setDbNumber(int dbNumber) {
		this.dbNumber = dbNumber;
	}

	public void count(){
		//计算总页数
		int totalPageTemp=this.totalNumber/this.pageNumber;
		int plus=(this.totalNumber%this.pageNumber)==0?0:1;
		totalPageTemp=totalPageTemp+plus;
		if(totalPageTemp<=0){
			totalPageTemp=1;
		}
		this.totalPage=totalPageTemp;
		//设置当前页数（总页数小于当前页数，应将当前页数设置为总页数）
		if(this.totalPage<this.currentPage){
			this.totalPage=this.currentPage;
		}
		//当前页数小于1设置为1
		if(this.currentPage<1){
			this.currentPage=1;
		}
		//设置limit的参数
		this.dbIndex=(this.currentPage-1)*this.pageNumber;
		this.dbNumber=this.pageNumber;
	}
}
