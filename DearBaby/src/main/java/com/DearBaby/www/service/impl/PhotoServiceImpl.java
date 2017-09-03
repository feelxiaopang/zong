package com.DearBaby.www.service.impl;

import com.DearBaby.www.entity.Photo;
import com.DearBaby.www.mapper.PhotoMapper;
import com.DearBaby.www.service.IPhotoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 相册模块业务逻辑处理实现类
 * Created by chenfumei on 2017/7/18.
 */
@Service("photoService")
public class PhotoServiceImpl implements IPhotoService {
    @Autowired
    PhotoMapper photoMapper;

    /**
     * 根据要求查询最近照片
     * Created by chenfumei on 2017/7/18.
     * @param
     * @return 返回photo
     */
    @Override
    public List<Photo> findNearPhoto(int baby_id) {
        return photoMapper.selectNearPhoto(baby_id);
    }

    /**
     * 根据要求查询所有照片
     * Created by chenfumei on 2017/7/18.
     * @param
     * @return 返回photo
     */
    @Override
    public List<Photo> findAllPhoto(int baby_id) {
        return photoMapper.selectAllPhoto(baby_id);
    }

}
