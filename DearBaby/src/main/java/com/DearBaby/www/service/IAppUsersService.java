package com.DearBaby.www.service;


import com.DearBaby.www.common.PageModel;
import com.DearBaby.www.entity.AppUsers;
import com.DearBaby.www.entity.Information;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by wuxiaoyu on 2017/6/29.
 */
public interface IAppUsersService {

    /**
     * 获取所有AppUsers的分页模型
     *
     * @param pageNo
     * @param pageSize
     * @return 分页模型
     */
    public PageModel<AppUsers> queryAllAppUsers(int pageNo, int pageSize);

    /**
     * 获取条件查询AppUsers的分页模型
     * created by wuxiaoyu
     * @param pageNo
     * @param pageSize
     * @return 分页模型
     */
    public PageModel<AppUsers> queryConditionAppUsers(int pageNo, int pageSize,int u_status,String u_name,String u_pNumber,String beginDate,String endDate);

    /**
     * 修改AppUsers用户状态
     * created by wuxiaoyu
     * @param u_id,status
     * @return
     */
    public int modifyAppUsersStatus(int u_id,int status);

    /**
     * 查询某个用户详细信息
     * created by wuxiaoyu
     * @param u_id
     * @return 详细信息对象
     */
    public Information queryAppUsersInformation(int u_id);

    /**
     * 修改用户密码
     *
     * @param appUser
     * @return
     */
    public int modifyAppUsersPassword(AppUsers appUser);

    /**
     * 通过id查询某个用户对象
     * created by wuxiaoyu
     *
     * @param u_id
     * @return AppUsers
     */
    public AppUsers queryAppUsersById(int u_id);

    /** Created by wujie on 2017/7/4.
     * 进行用户注册
     * @param appUsers 用户对象
     * @return
     * @throws Exception
     */
    public int addAppUsers(AppUsers appUsers);
    /**
     * 验证页面传入的账号是否存在
     *Created by wujie on 2017/6/30.
     * @return
     * @throws是否存在
     */
    public AppUsers findVerifyAccount(String updatename);
    /**
     * 插入个人信息表ID
     *Created by wujie on 2017/6/30.
     * @return
     * @throws
     */
    public int addInformation(int u_id);
    /** Created by wujie on 2017/7/5.
     * 进行用户查询
     * @param appUsers 用户对象
     * @return返回前台用户对象
     * @throws Exception
     */
    public AppUsers findAppUsers(AppUsers appUsers);


    /**
     * 逻辑删除 通过 用户id
     * Created by wuxiaoyu
     * @param list
     * @return
     */
    public int modifyAppUserStatusByList(List<Integer> list);

    /**
     * 修改个人信息
     *Created by wujie on 2017/7/6.
     * @return
     * @throws
     */
    public void modifyInformation(Information information );
    /**
     * 修改用户姓名
     *Created by wujie on 2017/7/7.
     * @param appUser
     * @return
     */
    public int modifyAppUsersNaem(AppUsers appUser);
    /**
     * 修改用户头像
     *Created by wujie on 2017/7/6.
     * @return
     * @throws
     */
    public void modifyAppUserInformation(AppUsers appUsers );

}
