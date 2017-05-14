package org.pussinboots.morning.product.service.impl;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.pussinboots.morning.common.enums.StatusEnum;
import org.pussinboots.morning.common.util.ArrayUtils;
import org.pussinboots.morning.product.entity.ProductSpecification;
import org.pussinboots.morning.product.mapper.KindMapper;
import org.pussinboots.morning.product.mapper.ProductSpecificationMapper;
import org.pussinboots.morning.product.pojo.dto.ProductSpecificationDTO;
import org.pussinboots.morning.product.pojo.vo.KindVO;
import org.pussinboots.morning.product.service.IProductSpecificationService;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
* 项目名称：morning-product-service   
* 类名称：ProductSpecificationServiceImpl   
* 类描述：ProductSpecification / 商品规格表 业务逻辑层接口实现            
* 创建人：陈星星   
* 创建时间：2017年4月14日 上午2:07:54   
*
 */
@Service
public class ProductSpecificationServiceImpl extends ServiceImpl<ProductSpecificationMapper, ProductSpecification> implements IProductSpecificationService {

	@Autowired
	private KindMapper kindMapper;
	@Autowired
	private ProductSpecificationMapper productSpecificationMapper;
	
	@Override
	public ProductSpecificationDTO getByProductId(Long productId, Integer status) {
		// 根据产品ID和类型状态查找类型列表
		List<KindVO> kindVOs = kindMapper.listByProductId(productId, status);
		
		System.out.println("................................");
		if(kindVOs == null){
			System.out.println("kindVOs没有被实例化");
		}
		
		Map<String, Object> resultMap = new HashMap<>();
		if (kindVOs.isEmpty()) {
			// 根据商品ID获取默认商品规格表
			ProductSpecification productSpecification = productSpecificationMapper.getByStatus(productId, status,
					StatusEnum.DEFAULT.getStatus());
			resultMap.put("default", productSpecification);
		}else {
			// 对商品类型列表进行交叉遍历
			String[] targetSpecIds = getSpecIds(kindVOs);

			// 根据商品ID获取商品规格表列表
			ProductSpecification productSpecification = new ProductSpecification();
			productSpecification.setProductId(productId);
			productSpecification.setStatus(status);
			List<ProductSpecification> productSpecifications = productSpecificationMapper
					.selectList(new EntityWrapper<ProductSpecification>(productSpecification));

			// 遍历{{1,3},{1,4},{1,5}}格式的商品类型列表,与商品规格表进行判断
			for (String forSpecId : targetSpecIds) {
				for (ProductSpecification specification : productSpecifications) {
					String[] targetSpecId = forSpecId.split(",");
					String[] productSpecId = specification.getSpec().split(",");
					Arrays.sort(targetSpecId);
					Arrays.sort(productSpecId);

					// 如果二者拥有相同的规格组合,则将该组合的商品信息传给前端
					if (Arrays.equals(targetSpecId, productSpecId)) {
						resultMap.put(forSpecId, specification);
					}
				}
			}			
		}
		return new ProductSpecificationDTO(kindVOs, resultMap);
	}
	
	/**
	 * 对商品类型列表进行交叉遍历,将类型转化成{{1,3},{1,4},{1,5}}格式
	 * @param kindVOs 商品类型列表
	 * @return
	 */
	private static String[] getSpecIds(List<KindVO> kindVOs) {
		String[][] specIds = new String[kindVOs.size()][];
		for (int i = 0; i < kindVOs.size(); i++) {
			specIds[i] = new String[kindVOs.get(i).getKindAttributes().size()];
			for (int j = 0; j < kindVOs.get(i).getKindAttributes().size(); j++) {
				specIds[i][j] = kindVOs.get(i).getKindAttributes().get(j).getSpecAttrId().toString();
			}
		}
		return ArrayUtils.turns(specIds);
	}
	
}
