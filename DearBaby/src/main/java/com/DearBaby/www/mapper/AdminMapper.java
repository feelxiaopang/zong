package com.DearBaby.www.mapper;


import com.DearBaby.www.entity.Admins;
import com.DearBaby.www.entity.BackgroundUser;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 管理员模块持久化操作接口
 * Created by liaodan on 2017/4/24.
 */
public interface AdminMapper {

    /**
     * 根据提供的管理员对象属性查询管理员对象
     * @param admin  封装了查询条件的管理员对象
     * @return   管理员对象
     */
     public Admins selectAdmins(Admins admin);

    /**
     * 根据管理员账号查询账号对应的存储在数据库的随机字符
     * @param str 账号
     * @return  随机码
     */
    public String selectAdminsRnumByName(String str);

    /**
     *  进入后台管理用户页面返回的所有管理员对象
     * @param传入从第几个开始
     * @return   所有管理员对象s数组
     */
    public String selectAllAdmins();


    /**
     * 根据新的管理员对象更改管理密码
     * @param admin 管理员对象
     */
    public void updatePassword(Admins admin);

    /**
     * 验证页面传入的账号是否存在
     *Created by wujie on 2017/6/30.
     * @return
     * @throws是否存在
     */
    public Admins selectOneAdmins(String updatename);
    /**
     * 新增新的管理员
     *Created by wujie on 2017/7/3.
     * @return
     * @throws
     */
    public void addAmin(Admins admin);

    /**
     * 修改管理员部分信息
     *Created by wujie on 2017/7/3.
     * @return
     * @throws
     */
    public void updateAdmin(Admins admins);

    /**
     * 删除多个或者一个管理员部分信息
     *Created by wujie on 2017/7/3.
     * @return
     * @throws
     */
    public void removeAdmin(List<String> Str);
    /**
     * 多条件查询管理员部分信息
     *Created by wujie on 2017/7/3.
     * @return
     * @throws
     */
    public List<Admins> selectAdmin(Map<String,String> map);
    /**
     * 多条件查询管理员部分信息
     *Created by wujie on 2017/7/3.
     * @return
     * @throws
     */
    public List<BackgroundUser> selectBackgroundUser();
}
