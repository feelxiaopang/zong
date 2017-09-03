package com.DearBaby.www.service;

import com.DearBaby.www.entity.Record;

import java.util.List;

/**
 * 宝宝生长记录逻辑处理层接口类
 * Created by xiongzhongxin on 2017/7/13.
 */
public interface IRecordService {

    /**
     *添加一个宝宝生长记录
     * Created by xiongzhongxin on 2017/7/13.
     * @return
     */
    public void addRecord(Record record);

    /**
     *通过宝宝ID 查询宝宝的生长记录
     * Created by xiongzhongxin on 2017/7/14.
     * @return 宝宝的生长记录
     */
    public List<Record> selectRecord(int baby_id);
    /**
     *通过宝宝生长记录ID 删除宝宝生长记录
     * Created by xiongzhongxin on 2017/7/19.
     * @return
     */
    public void deleteRecord(int record_id);

}
