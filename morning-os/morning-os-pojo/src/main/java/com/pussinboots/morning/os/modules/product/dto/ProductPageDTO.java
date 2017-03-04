package com.pussinboots.morning.os.modules.product.dto;

import java.io.Serializable;
import java.util.List;

import com.pussinboots.morning.common.model.PageInfo;
import com.pussinboots.morning.os.modules.product.vo.ProductVO;

/**
 * 
* 项目名称：morning-os-pojo   
* 类名称：ProductPageDTO   
* 类描述：ProductPageDTO 产品分类DTO类   
* 创建人：陈星星   
* 创建时间：2017年3月2日 下午4:50:37   
*
 */
public class ProductPageDTO implements Serializable{
	
	
	private static final long serialVersionUID = 1L;
	
	/**
	 * 分页信息
	 */
	private PageInfo pageInfo;
	
	/**
	 * 产品列表
	 */
	private List<ProductVO> productVOs;

	public ProductPageDTO(PageInfo pageInfo, List<ProductVO> productVOs) {
		super();
		this.pageInfo = pageInfo;
		this.productVOs = productVOs;
	}

	public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}

	public List<ProductVO> getProductVOs() {
		return productVOs;
	}

	public void setProductVOs(List<ProductVO> productVOs) {
		this.productVOs = productVOs;
	}
	
}
