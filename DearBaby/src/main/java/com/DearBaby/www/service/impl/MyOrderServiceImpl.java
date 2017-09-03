package com.DearBaby.www.service.impl;

import com.DearBaby.www.entity.MyOrder;
import com.DearBaby.www.mapper.MyOrderMapper;
import com.DearBaby.www.service.IMyOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 我的订单模块业务逻辑处理实现类
 * Created by chenfumei on 2017/7/3.
 */
@Service("myOrderService")
public class MyOrderServiceImpl implements IMyOrderService {
    @Autowired
    MyOrderMapper myOrderMapper;

    /**
     * Created by chenfumei on 2017/7/3.
     * @return 所有订单
     */
    @Override
    public List<MyOrder> findMyOrder() {
        return myOrderMapper.selectMyOrder();
    }

    /**
     * Created by chenfumei on 2017/7/3.
     * @return 最新订单
     */
    @Override
    public List<MyOrder> findNewOrder() {
        return myOrderMapper.selectNewOrder();
    }

    /**
     * Created by chenfumei on 2017/7/3.
     * @return 今日订单
     */
    @Override
    public List<MyOrder> findTodayOrder() {
        return myOrderMapper.selectTodayOrder();
    }

    /**
     * Created by chenfumei on 2017/7/3.
     * @return 未处理订单
     */
    @Override
    public List<MyOrder> findUntreatedOrder() {
        return myOrderMapper.selectUntreatedOrder();
    }


    /**
     * Created by chenfumei on 2017/7/4.
     * @return 返回所有订单
     */
    @Override
    public List<MyOrder> findAllOrder() {
        return null;
    }

}
