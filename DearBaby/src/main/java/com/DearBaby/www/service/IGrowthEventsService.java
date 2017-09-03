package com.DearBaby.www.service;

import com.DearBaby.www.entity.GrowthEvents;

import java.util.List;

/**
 *  宝宝成长事件服务层
 *
 * Created by wuxiaoyu on 2017/7/17.
 */
public interface IGrowthEventsService {

    /**
     * 查询宝宝大事件
     *
     * @param baby_id
     * @return
     */
    public List<GrowthEvents> queryAllGrowthEvents(int baby_id);

    /**
     * 新增宝宝成长事件
     *
     * @param growthEvent
     * @return
     */
    public int addEvents(GrowthEvents growthEvent);


    /**
     * 查询宝宝大事件
     *
     * @param baby_id
     * @return
     */
    public List<GrowthEvents> queryGrowthEvents(int baby_id);
}
