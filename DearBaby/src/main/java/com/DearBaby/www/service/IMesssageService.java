package com.DearBaby.www.service;

import com.DearBaby.www.entity.Message;

import java.util.List;

/**
 * 系统消息业务逻辑处理层接口类
 * Created by chenfumei on 2017/7/3.
 */
public interface IMesssageService {
    /**
     * 查询所有系统消息
     * Created by chenfumei on 2017/7/3.
     * @return 返回所有系统消息数据
     */
    public List<Message> findAllMessage();
}
