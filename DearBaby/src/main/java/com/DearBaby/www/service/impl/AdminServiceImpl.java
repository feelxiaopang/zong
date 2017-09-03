package com.DearBaby.www.service.impl;


import com.DearBaby.www.entity.Admins;
import com.DearBaby.www.entity.BackgroundUser;
import com.DearBaby.www.entity.Information;
import com.DearBaby.www.mapper.AdminMapper;
import com.DearBaby.www.mapper.InformationMapper;
import com.DearBaby.www.service.IAdminService;
import com.DearBaby.www.tools.Encryption;
import com.DearBaby.www.tools.RandomCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.awt.*;
import java.util.Map;

/**
 * 管理员模块业务逻辑处理实现类
 * Created by liaodan on 2017/4/24.
 */
@Service("adminService")
@Transactional
public class AdminServiceImpl implements IAdminService {
    @Autowired
    AdminMapper adminMapper;


    public Object findAdmins(Admins admin) {
        // 获取随机码

        String rnum = adminMapper.selectAdminsRnumByName(admin.getA_name());
        if (null != rnum && !("".equals(rnum))) {
            String pwd = Encryption.EncryString(admin.getA_password() + rnum);

//            System.out.println("随机码 == "+rnum);
//            System.out.println(pwd);
             admin.setA_password(pwd);

            return adminMapper.selectAdmins(admin);
        }
        return 0;
    }



     //修改管理员密码

    /**
     *  created by wuxiaoyu
     *
     * @param admin 修改管理员密码
     */
    @Override
    public void modifyPassword(Admins admin) {
        String a_random = RandomCode.getCodes();
        String pwd = Encryption.EncryString(admin.getA_password() + a_random);
        admin.setA_password(pwd);
        admin.setA_random(a_random);
        adminMapper.updatePassword(admin);
    }


    /**
     * 验证页面传入的账号是否存在
     * Created by wujie on 2017/6/30.
     *
     * @return
     * @throws是否存在
     */
    public Admins findVerifyAccount(String updatename) {
        try {
            return adminMapper.selectOneAdmins(updatename);
        } catch (Exception e) {
            return null;
        }


    }

    /**
     * 新增新的管理员
     * Created by wujie on 2017/7/3.
     *
     * @return
     * @throws
     */
    public void findAddAmin(Admins admin) {
        adminMapper.addAmin(admin);
    }

    /**
     * 修改管理员部分信息
     * Created by wujie on 2017/7/3.
     *
     * @return
     * @throws
     */
    public void modifyAdmin(Admins admins) {
        adminMapper.updateAdmin(admins);
    }

    ;

    /**
     * 删除多个或者一个管理员部分信息
     * Created by wujie on 2017/7/3.
     *
     * @return
     * @throws
     */
    public void removeAdmin(List<String> str) {
        adminMapper.removeAdmin(str);
    }

    ;

    /**
     * 多条件查询管理员部分信息
     * Created by wujie on 2017/7/3.
     *
     * @return
     * @throws
     */
    public List<Admins> QueryAdmin(Map<String,String> map) {
         return  adminMapper.selectAdmin(map);
    };
    /**
     *查找出所有的管理员的信息
     * Created by wujie on 2017/6/30.
     * @param传入从第几个开始
     * @return返回所有管理员的对象
     */
    public List<BackgroundUser> QueryBackgroundUser(){
        try {
            return adminMapper.selectBackgroundUser();
        } catch (Exception e) {
            return null;
        }
    };
    /**
     *查找出所有的管理员的信息个数
     * Created by wujie on 2017/6/30.
     * @param传入从第几个开始
     * @return返回所有管理员的对象
     */
    public String QueryBackgroundUserAccount(){
        try {
            return adminMapper.selectAllAdmins();
        } catch (Exception e) {
            return "";
        }
    };


}
