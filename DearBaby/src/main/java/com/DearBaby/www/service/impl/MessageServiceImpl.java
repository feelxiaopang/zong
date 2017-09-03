package com.DearBaby.www.service.impl;

import com.DearBaby.www.entity.Message;
import com.DearBaby.www.mapper.MessageMapper;
import com.DearBaby.www.service.IMesssageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 系统消息模块业务逻辑处理实现类
 * Created by chenfumei on 2017/7/3.
 */
@Service("messageService")
@Transactional
public class MessageServiceImpl implements IMesssageService {
    @Autowired
    MessageMapper messageMapper;

    /**
     * 获取所有角色
     * Created by chenfumei on 2017/7/3.
     * @return 所有角色
     */
    @Override
    public List<Message> findAllMessage() {
        return messageMapper.selectAllMessage();
    }
}
