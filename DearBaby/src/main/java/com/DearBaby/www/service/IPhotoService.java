package com.DearBaby.www.service;

import com.DearBaby.www.entity.Photo;

import java.util.List;

/**
 * 相册模块业务逻辑处理层接口类
 * Created by chenfumei on 2017/7/18.
 */
public interface IPhotoService {

    /**
     * 根据要求查询最近照片
     * Created by chenfumei on 2017/7/18.
     * @param
     * @return 返回photo
     */
    public List<Photo> findNearPhoto(int baby_id);

    /**
     * 根据要求查询所有照片
     * Created by chenfumei on 2017/7/18.
     * @param
     * @return 返回photo
     */
    public List<Photo> findAllPhoto(int baby_id);

}
