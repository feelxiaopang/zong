package com.DearBaby.www.service;

import com.DearBaby.www.entity.Power;

import java.util.List;

/**
 * 权限模块业务逻辑处理层接口类
 * Created by xiongzhongxin on 2017/6/29.
 */
public interface IPowerService {

    /**
     *查找出管理员的权限名称
     * Created by wujie on 2017/6/30.
     * @param
     * @return 返回管理员的权限名
     */
    public List<String> findPowerName(int r_id);

    /**
     *查询所有权限
     * Created by xiongzhongxin on 2017/7/3.
     * @return 返回所有权限集合
     */
    public List<Power> findAllPower();
    /**
     *查询所有权限
     * Created by wujie on 2017/7/7.
     * @return返回所有权限集合
     */
    public List<Power> findOnePower(int r_id);
    /**
     *查询所有权限
     * Created by wujie on 2017/7/10.
     * @return返回所有权限集合
     */
    public List<Power> findChildPower(int r_id,int fat_id);


    /**
     *查看管理员的角色子权限
     * Created by xiongzhongxin on 2017/7/10.
     * @return返回所有权限集合
     */
    public List<Power> selectAdminInRolePower(int r_id);
    /**
     *通过角色名 查询角色权限
     * Created by xiongzhongxin on 2017/7/12.
     * @return返回指定角色权限集合
     */
    public List<Power> selectRolePower(String r_name);



}
