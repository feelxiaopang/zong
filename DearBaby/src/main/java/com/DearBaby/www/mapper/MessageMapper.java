package com.DearBaby.www.mapper;

import com.DearBaby.www.entity.Message;

import java.util.List;

/**
 * 系统消息模块持久化操作接口
 * Created by chenfumei on 2017/7/3.
 */
public interface MessageMapper {
    /**
     * 查询所有系统消息
     * Created by chenfumei on 2017/7/3.
     * @param
     * @return 系统消息
     */
    public List<Message> selectAllMessage();
}
