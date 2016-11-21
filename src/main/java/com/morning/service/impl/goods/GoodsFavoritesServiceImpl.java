package com.morning.service.impl.goods;

import org.springframework.stereotype.Service;

import com.morning.dao.goods.GoodsFavoritesMapper;
import com.morning.entity.goods.GoodsFavorites;
import com.morning.service.goods.IGoodsFavoritesService;
import com.baomidou.framework.service.impl.SuperServiceImpl;

/**
 *
 * GoodsFavorites 表数据服务层接口实现类
 *
 */
@Service
public class GoodsFavoritesServiceImpl extends SuperServiceImpl<GoodsFavoritesMapper, GoodsFavorites> implements IGoodsFavoritesService {


}