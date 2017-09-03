package com.DearBaby.www.service.impl;

import com.DearBaby.www.entity.Baby;
import com.DearBaby.www.entity.Relation;
import com.DearBaby.www.mapper.BabyMapper;
import com.DearBaby.www.service.IBabyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by chenfumei on 2017/7/12.
 */
@Service("babyService")
@Transactional
public class BabyServiceImpl implements IBabyService {
    @Autowired
    BabyMapper babyMapper;

    /**
     *  created by chenfumei
     *
     * @param u_id 用户id
     * return 相对应的宝宝数量
     */
    public int findBabyCount(int u_id) {
        return babyMapper.selectBabyCount(u_id);
    }



    /**
     *根据提供的 宝宝id 查询宝宝
     *  Created by xiongzhongxin on 2017/7/12.
     *
     * @return  一个宝宝
     */
    public Baby selectBaby(int baby_id) {
        return babyMapper.selectBaby(baby_id);
    }
    /**
     *根据提供的 用户id 查询宝宝
     *  Created by wujie on 2017/7/13.
     * @return  所有宝宝
     */
    public List<Baby> QueryUsersBaby(int u_id){
        return  babyMapper.selectUsersBaby(u_id);
    };

    /**
     *修改宝宝信息
     *  Created by xiongzhongxin on 2017/7/13.
     * @return
     */
    public void updateBabyInformatione(Baby baby){
        babyMapper.updateBabyInformatione(baby);
    }
    /**
     * 根据ID查询宝宝的亲人关系数量
     * Created by wujie on 2017/7/14.
     * @param
     * @return
     */
    public int findLevlCount(int baby_id){
        return babyMapper.selectLevlCount(baby_id);
    }

    /**
     * 查询随机生成的邀请码是否已存在
     * Created by chenfumei on 2017/7/17.
     * @param
     * @return
     */
    public int selectBabyCode(String babyCode){
        return babyMapper.selectBabyCode(babyCode);
    }

    /**
     * 根据用户填写的数据添加宝宝信息
     * Created by chenfumei on 2017/7/14.
     * @param
     * @return
     */
    public void addBaby(Baby baby){
        babyMapper.addBaby(baby);
    };

    /**
     * 查询新添加宝宝的id
     * Created by chenfumei on 2017/7/17.
     * @param
     * @return
     */
    public int selectNewBabyId(Baby baby){
        return babyMapper.selectNewBabyId(baby);
    };

    /**
     * 根据用户填写的数据添加宝宝信息
     * Created by chenfumei on 2017/7/14.
     * @param
     * @return
     */
    public void addBabyRelation(Relation relation){
        babyMapper.addBabyRelation(relation);
    };
    /**
     * 根据宝宝id 删除宝宝
     * Created by xiongzhongxin on 2017/7/18.
     * @param
     * @return
     */
    public void deleteBaby(int baby_id){

        babyMapper.deleteBaby(baby_id);
    }

    @Override
    public String selectBabyRelation(Relation relation) {
        return babyMapper.selectBabyRelation(relation);
    }
}
