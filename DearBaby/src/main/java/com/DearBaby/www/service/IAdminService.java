package com.DearBaby.www.service;


import com.DearBaby.www.entity.Admins;
import com.DearBaby.www.entity.BackgroundUser;

import java.util.List;
import java.util.Map;

/**
 * 管理员模块业务逻辑处理层接口类
 *
 * Created by wujie on 2017/7/11.
 */
public interface IAdminService {

    /**
     *根据提供的管理员属性查找管理员对象
     * @param admin 管理员对象，封装了查询需要的属性值
     * @return  返回管理员对象
     */
    public Object findAdmins(Admins admin);

    /**
     *  根据提供的管理员属性更新该管理员对象密码
     * @param admin 管理员对象
     */
    public void modifyPassword(Admins admin);

    /**
     * 验证页面传入的账号是否存在
     *Created by wujie on 2017/6/30.
     * @return
     * @throws是否存在
     */
    public Admins findVerifyAccount(String updatename);
    /**
     * 新增新的管理员
     *Created by wujie on 2017/7/3.
     * @return
     * @throws
     */
    public void findAddAmin(Admins admin);
    /**
     * 修改管理员部分信息
     *Created by wujie on 2017/7/3.
     * @return
     * @throws
     */
    public void modifyAdmin(Admins admins);
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
    public List<Admins> QueryAdmin(Map<String,String> map);

    /**
     *查找出所有的管理员的信息
     * Created by wujie on 2017/6/30.
     * @param传入从第几个开始
     * @return返回所有管理员的对象
     */
    public List<BackgroundUser> QueryBackgroundUser();
    /**
     *查找出所有的管理员的信息个数
     * Created by wujie on 2017/7/6.
     * @param
     * @return返回所有管理员的对象总数
     */
    public String QueryBackgroundUserAccount();

}
