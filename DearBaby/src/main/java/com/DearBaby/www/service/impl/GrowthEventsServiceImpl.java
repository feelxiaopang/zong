package com.DearBaby.www.service.impl;

import com.DearBaby.www.entity.GrowthEvents;
import com.DearBaby.www.mapper.GrowthEventsMapper;
import com.DearBaby.www.service.IGrowthEventsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 宝宝成长事件服务层
 *
 * Created by wuxiaoyu on 2017/7/17.
 */
@Service("growthEventsService")
@Transactional
public class GrowthEventsServiceImpl implements IGrowthEventsService {
    @Autowired
    GrowthEventsMapper growthEventsMapper;

    @Override
    public List<GrowthEvents> queryAllGrowthEvents(int baby_id) {
        return growthEventsMapper.selectAllEvents(baby_id);
    }

    @Override
    public int addEvents(GrowthEvents growthEvent) {
        return growthEventsMapper.insertEvent(growthEvent);
    }



    @Override
    public List<GrowthEvents> queryGrowthEvents(int baby_id) {
        return growthEventsMapper.selectEvents(baby_id);
    }
}
