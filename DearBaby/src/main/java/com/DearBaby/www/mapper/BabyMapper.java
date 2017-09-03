package com.DearBaby.www.mapper;


import com.DearBaby.www.entity.Baby;
import com.DearBaby.www.entity.Relation;

import java.util.List;

/**
 * 宝宝模块持久化操作接口
 * Created by chenfumei on 2017/7/12.
 */
public interface BabyMapper {
    /**
     * 根据提供的uid查询相对应的宝宝
     *
     * @return baby
     */
    public int selectBabyCount(int u_id);

    /**
     *根据提供的 宝宝id 查询宝宝
     *  Created by xiongzhongxin on 2017/7/12.
     *
     * @return  一个宝宝
     */
    public Baby selectBaby(int baby_id);



    /**
     *修改宝宝信息
     *  Created by xiongzhongxin on 2017/7/13.
     * @return
     */
    public void updateBabyInformatione(Baby baby);

    /**
     *根据提供的 用户id 查询宝宝
     *  Created by wujie on 2017/7/13.
     * @return  所有宝宝
     */
    public List<Baby> selectUsersBaby(int u_id);

    /**
     * 根据ID查询宝宝的亲人关系数量
     * Created by wujie on 2017/7/14.
     * @param
     * @return
     */
    public int selectLevlCount(int baby_id);


    /**
     * 查看随机邀请码是否已存在
     * Created by chenfumei on 2017/7/17.
     * @param
     * @return
     */
    public int selectBabyCode(String babyCode);

    /**
     * 根据用户填写的数据添加宝宝信息
     * Created by chenfumei on 2017/7/14.
     * @param
     * @return
     */
    public void addBaby(Baby baby);

    /**
     * 根据用户填写的数据添加宝宝信息
     * Created by chenfumei on 2017/7/14.
     * @param
     * @return
     */
    public int selectNewBabyId(Baby baby);

    /**
     * 根据用户填写的数据添加宝宝信息
     * Created by chenfumei on 2017/7/14.
     * @param
     * @return
     */
    public void addBabyRelation(Relation relation);


    /**
     * 根据宝宝id 删除宝宝
     * Created by xiongzhongxin on 2017/7/18.
     * @param
     * @return
     */
    public void deleteBaby(int baby_id);

    /**
     * 查询宝宝与当前用户关系
     * Created by chenfumei on 2017/7/19.
     * @param
     * @return
     */
    public String selectBabyRelation(Relation relation);
}
