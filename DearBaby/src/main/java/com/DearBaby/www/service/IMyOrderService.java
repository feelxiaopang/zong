package com.DearBaby.www.service;

import com.DearBaby.www.entity.MyOrder;

import java.util.List;

/**
 * 我的订单业务逻辑处理层接口类
 * Created by chenfumei on 2017/7/3.
 */
public interface IMyOrderService {
    /**
     * Created by chenfumei on 2017/6/30.
     * @return  返回订单消息
     */
    public List<MyOrder> findMyOrder();

    /**
     * Created by chenfumei on 2017/6/30.
     * @return  返回订单消息
     */
    public List<MyOrder> findNewOrder();

    /**
     * Created by chenfumei on 2017/6/30.
     * @return  返回订单消息
     */
    public List<MyOrder> findTodayOrder();

    /**
     * Created by chenfumei on 2017/6/30.
     * @return  返回订单消息
     */
    public List<MyOrder> findUntreatedOrder();

    /**
     * Created by chenfumei on 2017/7/4.
     * @return  返回所有
     */
    public List<MyOrder> findAllOrder();
}
