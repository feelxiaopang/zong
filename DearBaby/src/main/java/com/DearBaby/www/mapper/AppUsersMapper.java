package com.DearBaby.www.mapper;

import com.DearBaby.www.entity.AppUsers;
import com.DearBaby.www.entity.Information;

import java.util.HashMap;
import java.util.List;
import java.util.Objects;

/**
 *
 * 前台用户模块持久化层
 * Created by wuxiaoyu on 2017/7/3.
 */
public interface AppUsersMapper {

    /**
     *获取App用户总数
     *
     * @return 返回int 有多少条记录
     */
    public int selectAppUsersCounts();

    /**
     * 获取所有的AppUsers对象
     *
     * @param offset
     * @param pageSize
     * @return List集合
     */
    public List<AppUsers> selectAllAppUsers(int offset, int pageSize);

    /**
     *获取条件查询App用户总数
     *
     * @return 返回int 有多少条记录
     */
    public int selectConditionAppUsersCounts(HashMap<String,Object> hashMap);

    /**
     * 获取符合条件的 AppUsers 所有对象
     *
     * @param  hashMap 检索用的条件
     * @return List 集合
     */
   public List<AppUsers> selectConditionAppUsers(HashMap<String,Object> hashMap);
    /** Created by wujie on 2017/7/4.
     * 进行用户注册
     * @param appUsers 用户对象
     * @return
     * @throws Exception
     */
    public int insertAppUsers(AppUsers appUsers);
    /**
     * 验证页面传入的账号是否存在
     *Created by wujie on 2017/7/4.
     * @return
     * @throws是否存在
     */
    public AppUsers selectOneAppUser(String updatename);

    /**
     *更改AppUsers对象状态 设置 u_status 可以为禁用 和 删除
     *
     *created by wuxiaoyu
     */
   public int updateAppUsersStatus(int u_id,int status);

    /**
     * 查询用户信息及其详细信息
     *
     * created by wuxiaoyu
     * @param u_id 用户id
     * @return Information对象
     */
   public Information selectAppUserInformation(int u_id);

    /**
     * 通过u_id查询用户对象
     * created by wuxiaoyu
     *
     * @param u_id 用户id
     * @return AppUsers对象
     */
   public AppUsers selectAppUsersById(int u_id);


    /** Created by wujie on 2017/7/5.
     * 进行用户查询
     * @param appUsers 用户对象
     * @return返回前台用户对象
     * @throws Exception
     */
    public AppUsers selectAppUsers(AppUsers appUsers);
    /**
     * 验证页面传入的账号是否存在
     *Created by wujie on 2017/7/5.
     * @return
     * @throws是否存在
     */
    public String selectAppUserRandom(String updatename);

    /**
     * 修改用户密码
     * created by wuxiaoyu
     *
     * @param appUser
     * @return
     */
   public int updateAppUsersPassword(AppUsers appUser);

    /**
     * 修改用户状态 逻辑删除
     *
     * created by wuxiaoyu
     *
     * @param list
     * @return
     */
   public int updateAppUsersStatusByList(List<Integer> list);
    /**
     * 修改用户头像
     *Created by wujie on 2017/7/6.
     * @return
     * @throws
     */
    public void updateAppUserInformation(AppUsers appUsers );

}
