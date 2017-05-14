package org.pussinboots.morning.product.mapper;

import java.util.List;

import org.pussinboots.morning.product.entity.SpecificationAttribute;
import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * 
* 项目名称：morning-product-service   
* 类名称：SpecificationAttributeMapper   
* 类描述：SpecificationAttribute / 规格属性表 数据访问层接口           
* 创建人：陈星星   
* 创建时间：2017年4月14日 上午2:05:38   
*
 */
public interface SpecificationAttributeMapper extends BaseMapper<SpecificationAttribute> {
	
	/**
	 * 根据规格属性ID列表查找规格属性名称列表
	 * @param spec 规格属性ID列表
	 * @return
	 */
	List<String> listBySpec(String spec);

}