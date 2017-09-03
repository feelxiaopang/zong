package com.DearBaby.www.mapper;


import com.DearBaby.www.entity.Admins;
import com.DearBaby.www.entity.Role;
import com.DearBaby.www.entity.RolePower;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 管理员模块持久化操作接口
 * Created by chenfumei on 2017/6/30.
 */
public interface RoleMapper {

    /**
     * 根据 管理员账号 查询 角色
     * Created by chenfumei on 2017/6/30.
     * @param adminName 账号
     * @return 角色等级  角色名称
     */
    List<Role> selectAdminPersonalInformation(String adminName);

    /**
     *查找出的管理员的角色名称
     * Created by wujie on 2017/6/30.
     * @param
     * @return返回管理员的名称
     */
    public String selectRoleRName(int r_id);


    /**
     * 查询所有角色
     * Created by xiongzhongxin on 2017/6/30.
     * @return 角色名称
     */
    public List<Role> selectAllRole();

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
    public int selectRoleName(String r_name);

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
    public List<Role> searchRole(String r_name);

}
