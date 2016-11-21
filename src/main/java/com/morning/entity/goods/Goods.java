package com.morning.entity.goods;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotations.IdType;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

/**
 * 
* 项目名称：morning Maven Webapp   
* 类名称：Goods   
* 类描述：Goods 表实体类   
* 创建人：陈星星   
* 创建时间：2016年8月26日  下午1:56:55  
* 修改人：陈星星   
* 修改时间：2016年11月21日 上午2:09:51   
* @version
 */
@TableName("tb_goods")
public class Goods implements Serializable {

	@TableField(exist = false)
	private static final long serialVersionUID = 1L;

	/** 商品ID */
	@TableId(value = "GOODS_ID", type = IdType.AUTO)
	private Integer goodsId;

	/** 商品编号 */
	@TableField(value = "GOODS_NUMBER")
	private String goodsNumber;

	/** 商品名称 */
	@TableField(value = "GOODS_NAME")
	private String goodsName;

	/** 商品价格 */
	@TableField(value = "GOODS_PRICE")
	private Double goodsPrice;

	/** 商品描述 */
	@TableField(value = "GOODS_DESCRIPT")
	private String goodsDescript;

	/** 商品详情 */
	@TableField(value = "GOODS_CONTEXT")
	private String goodsContext;

	/** 图片路径 */
	@TableField(value = "GOODS_IMAGENAME")
	private String goodsImagename;

	/** 销售数量 */
	@TableField(value = "GOODS_BUY_NUM")
	private Integer goodsBuyNum;

	/** 游览数量 */
	@TableField(value = "GOODS_VIEW_NUM")
	private Integer goodsViewNum;

	/** 库存信息 */
	@TableField(value = "GOODS_SAVE_INFO")
	private Integer goodsSaveInfo;

	/** 提问数量 */
	@TableField(value = "GOODS_QUERY")
	private Integer goodsQuery;

	/** 评论数量 */
	@TableField(value = "GOODS_REVIEWS")
	private Integer goodsReviews;

	/** 收藏数量 */
	@TableField(value = "GOODS_FAVORITES")
	private Integer goodsFavorites;

	/** 商品类别 */
	@TableField(value = "CLASSIFY_ID")
	private Integer classifyId;

	/** 状态：1.上架；0.下架 */
	private Integer status;

	/** 创建时间 */
	@TableField(value = "CREATE_TIME")
	private Date createTime;

	/** 创建者 */
	@TableField(value = "CREATE_BY")
	private String createBy;

	/** 更新时间 */
	@TableField(value = "UPDATE_TIME")
	private Date updateTime;

	/** 更新者 */
	@TableField(value = "UPDATE_BY")
	private String updateBy;
	
	/** 类目名称 */
	private String classifyName;

	public Integer getGoodsId() {
		return this.goodsId;
	}

	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}

	public String getGoodsNumber() {
		return this.goodsNumber;
	}

	public void setGoodsNumber(String goodsNumber) {
		this.goodsNumber = goodsNumber;
	}

	public String getGoodsName() {
		return this.goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public Double getGoodsPrice() {
		return this.goodsPrice;
	}

	public void setGoodsPrice(Double goodsPrice) {
		this.goodsPrice = goodsPrice;
	}

	public String getGoodsDescript() {
		return this.goodsDescript;
	}

	public void setGoodsDescript(String goodsDescript) {
		this.goodsDescript = goodsDescript;
	}

	public String getGoodsContext() {
		return this.goodsContext;
	}

	public void setGoodsContext(String goodsContext) {
		this.goodsContext = goodsContext;
	}

	public String getGoodsImagename() {
		return this.goodsImagename;
	}

	public void setGoodsImagename(String goodsImagename) {
		this.goodsImagename = goodsImagename;
	}

	public Integer getGoodsBuyNum() {
		return this.goodsBuyNum;
	}

	public void setGoodsBuyNum(Integer goodsBuyNum) {
		this.goodsBuyNum = goodsBuyNum;
	}

	public Integer getGoodsViewNum() {
		return this.goodsViewNum;
	}

	public void setGoodsViewNum(Integer goodsViewNum) {
		this.goodsViewNum = goodsViewNum;
	}

	public Integer getGoodsSaveInfo() {
		return this.goodsSaveInfo;
	}

	public void setGoodsSaveInfo(Integer goodsSaveInfo) {
		this.goodsSaveInfo = goodsSaveInfo;
	}

	public Integer getGoodsQuery() {
		return this.goodsQuery;
	}

	public void setGoodsQuery(Integer goodsQuery) {
		this.goodsQuery = goodsQuery;
	}

	public Integer getGoodsReviews() {
		return this.goodsReviews;
	}

	public void setGoodsReviews(Integer goodsReviews) {
		this.goodsReviews = goodsReviews;
	}

	public Integer getGoodsFavorites() {
		return this.goodsFavorites;
	}

	public void setGoodsFavorites(Integer goodsFavorites) {
		this.goodsFavorites = goodsFavorites;
	}

	public Integer getClassifyId() {
		return this.classifyId;
	}

	public void setClassifyId(Integer classifyId) {
		this.classifyId = classifyId;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getCreateBy() {
		return this.createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	public Date getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getUpdateBy() {
		return this.updateBy;
	}

	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}

	public String getClassifyName() {
		return classifyName;
	}

	public void setClassifyName(String classifyName) {
		this.classifyName = classifyName;
	}

}
