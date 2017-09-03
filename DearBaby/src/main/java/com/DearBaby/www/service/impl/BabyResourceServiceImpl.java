package com.DearBaby.www.service.impl;

import com.DearBaby.www.common.PageModel;
import com.DearBaby.www.entity.BabyResourceType;
import com.DearBaby.www.mapper.BabyResourceMapper;
import com.DearBaby.www.service.IBabyResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Administrator on 2017/7/11.
 */
@Service("babyResourceService")
@Transactional
public class BabyResourceServiceImpl implements IBabyResourceService{

    @Autowired
    BabyResourceMapper babyResourceMapper;

    /**
     * 查询所有育儿资源类型
     *
     * @return list
     */
    @Override
    public PageModel<BabyResourceType> queryBabyResourceTypes(int pageNo, int pageSize) {
        PageModel<BabyResourceType> pm = new PageModel<BabyResourceType>(pageNo,pageSize);
        pm.setRecordCounts(babyResourceMapper.selectBabyResourceTypesCounts());
        pm.setList(babyResourceMapper.selectBabyResourceTypes());
        return pm;
    }


    /**
     *  查询类型名是否存在
     *
     * @param brt_type
     * @return
     */
    @Override
    public BabyResourceType queryBabyResourceTypeByName(String brt_type) {
        return babyResourceMapper.selectBabyResourceTypeByName(brt_type);
    }

    /**
     * 新增资源类型
     *
     * @param babyResourceType
     * @return
     */
    @Override
    public int addResourceType(BabyResourceType babyResourceType) {
        return babyResourceMapper.insertBabyResourceType(babyResourceType);
    }

    /**
     *
     * 删除资源类型
     *
     * @param list
     * @return
     */
    @Override
    public int removeResourceType(List<Integer> list) {
        int count = babyResourceMapper.deleteBabyResourceType(list);
        System.out.println(count+"service!!!");
        return count;
    }
}
