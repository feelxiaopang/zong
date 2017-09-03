package com.DearBaby.www.mapper;


import com.DearBaby.www.entity.Power;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 权限持久化操作接口
 * Created by wujie on 2017/6/30.
 */
public interface PowerMapper {

    /**
     *查找出管理员的权限名称
     * Created by wujie on 2017/6/30.
     * @param
     * @return 返回管理员的权限名
     */
    public List<String> selectPowerName(int r_id);

    /**
     *查询所有权限
     * Created by xiongzhongxin on 2017/7/3.
     * @return 返回所有权限集合
     */
    public List<Power> selectAllPower();


    /**
     *查询所有权限
     * Created by wujie on 2017/7/10.
     * @return返回所有权限集合
     */
    public List<Power> selectOnePower(int r_id);
    /**
     *查看管理员的子权限
     * Created by wujie on 2017/7/10.
     * @return返回所有权限集合
     */
    public List<Power> selectChildPower(@Param(value="r_id")int r_id,@Param(value="father_id")int father_id);


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
