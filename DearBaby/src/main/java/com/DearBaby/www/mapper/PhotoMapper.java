package com.DearBaby.www.mapper;

import com.DearBaby.www.entity.Photo;

import java.util.List;

/**
 * 相册模块持久化操作接口
 * Created by chenfumei on 2017/7/18.
 */
public interface PhotoMapper {
    /**
     * 查询所有照片
     * Created by chenfumei on 2017/7/3.
     * @return
     * @throws
     */
    public List<Photo> selectAllPhoto(int baby_id);

    /**
     * 查询最近相册
     * Created by chenfumei on 2017/7/3.
     * @return
     * @throws
     */
    public List<Photo> selectNearPhoto(int baby_id);


}
