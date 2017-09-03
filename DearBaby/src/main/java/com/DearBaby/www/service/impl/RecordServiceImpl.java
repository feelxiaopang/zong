package com.DearBaby.www.service.impl;

import com.DearBaby.www.entity.Record;
import com.DearBaby.www.mapper.RecordMapper;
import com.DearBaby.www.service.IRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 宝宝生长记录业务逻辑处理实现类
 * Created by Administrator on 2017/7/13.
 */
@Service("recordService")
@Transactional
public class RecordServiceImpl implements IRecordService {
    @Autowired
    RecordMapper recordMapper;

    /**
     *添加一个宝宝生长记录
     * Created by xiongzhongxin on 2017/7/13.
     * @return
     */
    public void addRecord(Record record){
        recordMapper.addRecord(record);
    }

    /**
     *通过宝宝ID 查询宝宝的生长记录
     * Created by xiongzhongxin on 2017/7/14.
     * @return 宝宝的生长记录
     */
    public List<Record> selectRecord(int baby_id) {
        return recordMapper.selectRecord(baby_id);
    }

    /**
     *通过宝宝生长记录ID 删除宝宝生长记录
     * Created by xiongzhongxin on 2017/7/19.
     * @return
     */
    public void deleteRecord(int record_id){
        recordMapper.deleteRecord(record_id);
    }


}
