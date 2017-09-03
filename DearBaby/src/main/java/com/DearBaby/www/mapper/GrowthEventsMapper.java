package com.DearBaby.www.mapper;

import com.DearBaby.www.entity.GrowthEvents;

import java.util.List;

/**
 * 宝宝成长事件持久化层
 *
 * Created by wuxiaoyu on 2017/7/17.
 */
public interface GrowthEventsMapper {
    /**
     * 查询所有的宝宝成长事件
     *
     * @return list
     */
    public List<GrowthEvents> selectAllEvents(int baby_id);

    /**
     * 添加宝宝成长事件
     *
     * @param growthEvent
     * @return
     */
    public int insertEvent(GrowthEvents growthEvent);

    /**
     * 查询所有的宝宝成长事件
     *
     * @return list
     */
    public List<GrowthEvents> selectEvents(int baby_id);

}
