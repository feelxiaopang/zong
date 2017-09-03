package com.DearBaby.www.service;

import com.DearBaby.www.entity.Baby;
import com.DearBaby.www.entity.Relation;

import java.util.List;

/**
 * 宝宝模块业务逻辑处理层接口类
 * Created by chenfumei on 2017/7/12.
 */
public interface IBabyService {
    /**
     * 根据提供的用户id属性查找相对应的宝宝对象
     *
     * @param u_id APP用户对象
     * @return 返回宝宝数量
     */
    public int findBabyCount(int u_id);


    /**
     * 根据提供的 宝宝id 查询宝宝
     * Created by xiongzhongxin on 2017/7/12.
     *
     * @return 一个宝宝
     */
    public Baby selectBaby(int baby_id);


    /**
     * 修改宝宝信息
     * Created by xiongzhongxin on 2017/7/13.
     *
     * @return
     */
    public void updateBabyInformatione(Baby baby);

    /**
     * 根据提供的 用户id 查询宝宝
     * Created by wujie on 2017/7/13.
     *
     * @return 所有宝宝
     */
    public List<Baby> QueryUsersBaby(int u_id);

    /**
     * 根据ID查询宝宝的亲人关系数量
     * Created by wujie on 2017/7/14.
     *
     * @param
     * @return
     */
    public int findLevlCount(int baby_id);

    public int selectBabyCode(String babyCode);

    /**
     * 根据用户填写的数据添加宝宝信息
     * Created by chenfumei on 2017/7/14.
     *
     * @param
     * @return
     */
    public void addBaby(Baby baby);


    /**
     * 查询新添加宝宝的id
     * Created by chenfumei on 2017/7/17.
     *
     * @param
     * @return
     */
    public int selectNewBabyId(Baby baby);

    /**
     * 根据用户填写的数据添加宝宝信息
     * Created by chenfumei on 2017/7/14.
     *
     * @param
     * @return
     */
    public void addBabyRelation(Relation relation);

    /**
     * 根据宝宝id 删除宝宝
     * Created by xiongzhongxin on 2017/7/18.
     *
     * @param
     * @return
     */
    public void deleteBaby(int baby_id);

    /**
     * 查询宝宝与app用户的关系
     * Created by chenfumei on 2017/7/19.
     *
     * @param
     * @return
     */
    public String selectBabyRelation(Relation relation);
}
