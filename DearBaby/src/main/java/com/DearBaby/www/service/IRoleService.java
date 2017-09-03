package com.DearBaby.www.service;

import com.DearBaby.www.entity.Role;
import com.DearBaby.www.entity.RolePower;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 角色模块业务逻辑处理层接口类
 * Created by chenfumei on 2017/6/29.
 */
public interface IRoleService {

    /**
     *根据提供的 管理员的账号 查询 角色
     * Created by chenfumei on 2017/6/30.
     *
     * @return  返回管理员角色信息
     */
    List<Role> findAdminPersonalInformation(String admin);

    /**
     *查找出管理员的角色名称
     * Created by wujie on 2017/6/30.
     * @param
     * @return返回管理员的角色名
     */
    public String findRoleRName(int r_id);


    /**
     * 获取所有角色
     * Created by xiongzhongxin on 2017/6/30.
     * @return 所有角色
     */
    public List<Role> findAllRole();

    /**
     * 新增角色
     * Created by xiongzhongxin on 2017/7/3.
     * @return
     */
    public void addRole(Role role);
    /**
     * 通过参数查询角色名称是否存在
     * Created by xiongzhongxin on 2017/7/4.
     * @return 个数
     */
    public int findRoleName(String r_name);

    /**
     * 通过角色名称查询角色id
     * Created by xiongzhongxin on 2017/7/5.
     * @return id
     */
    public int selectRoleID(String r_name);


    /**
     * 通过角色id 和权限id 添加rolepower表
     * Created by xiongzhongxin on 2017/7/5.
     * @return
     */
    public void addRolePower(int p_id,int r_id);

    /**
     * 通过角色id 删除角色表
     * Created by xiongzhongxin on 2017/7/5.
     * @return
     */
    public void removeRole(int r_id);
    /**
     * 通过角色id 删除 rolepower 表
     * Created by xiongzhongxin on 2017/7/5.
     * @return
     */
    public void removeRolePower(int r_id);

    /**
     * 查询所有角色对应的权限
     * Created by xiongzhongxin on 2017/7/6.
     * @return 角色对应的权限表
     *
     */
    public List<RolePower> queryRolePower();


    /**
     * 通过角色id查询角色名字
     * Created by xiongzhongxin on 2017/7/6.
     * @return 角色名字
     *
     */
    public String queryRoleName(int r_id);

    /**
     * 通过角色id 修改角色
     * Created by xiongzhongxin on 2017/7/7.
     * @return
     *
     */
    public void modifyRole(Role role);

    /**
     * 通过搜索 查询角色
     * Created by xiongzhongxin on 2017/7/7.
     */
    public List<Role> queryRole(String r_name);
}
