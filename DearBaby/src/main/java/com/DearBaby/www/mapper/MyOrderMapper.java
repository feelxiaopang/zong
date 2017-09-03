package com.DearBaby.www.mapper;

import com.DearBaby.www.entity.MyOrder;

import java.util.List;

/**
 * 我的订单模块持久化操作接口
 * Created by chenfumei on 2017/7/3.
 */
public interface MyOrderMapper {

    /**
     * 查询所有订单信息
     * Created by chenfumei on 2017/6/30.
     * @param
     * @return 订单信息
     */
    public List<MyOrder> selectMyOrder();

    /**
     * 查询最新订单信息
     * Created by chenfumei on 2017/6/30.
     * @param
     * @return 订单信息
     */
    public List<MyOrder> selectNewOrder();

    /**
     * 查询今日订单信息
     * Created by chenfumei on 2017/6/30.
     * @param
     * @return 订单信息
     */
    public List<MyOrder> selectTodayOrder();

    /**
     * 查询未处理订单信息
     * Created by chenfumei on 2017/6/30.
     * @param
     * @return 订单信息
     */
    public List<MyOrder> selectUntreatedOrder();

    /**
     * 查询所有订单信息
     * Created by chenfumei on 2017/7/04.
     * @param
     * @return 所有订单信息
     */
    public List<MyOrder> selectAllOrder();
}
