package com.DearBaby.www.service.impl;

import com.DearBaby.www.common.PageModel;
import com.DearBaby.www.entity.Admins;
import com.DearBaby.www.entity.AppUsers;
import com.DearBaby.www.entity.Information;
import com.DearBaby.www.mapper.AppUsersMapper;
import com.DearBaby.www.mapper.InformationMapper;
import com.DearBaby.www.service.IAppUsersService;
import com.DearBaby.www.tools.Encryption;
import com.DearBaby.www.tools.RandomCode;
import com.DearBaby.www.tools.Encryption;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * 前台用户service
 * Created by wuxiaoyu on 2017/6/29.
 */
@Service("appUsersServiceImpl")
@Transactional
public class AppUsersServiceImpl implements IAppUsersService {
    @Autowired
    AppUsersMapper appUserMapper;
    @Autowired
    InformationMapper informationMapper;

    /**
     * 获取AppUsers的分页模型
     *
     * @param pageNo
     * @param pageSize
     * @return 分页模型
     */
    public PageModel<AppUsers> queryAllAppUsers(int pageNo, int pageSize) {
        PageModel<AppUsers> pm = new PageModel<AppUsers>(pageNo, pageSize);
        pm.setRecordCounts(appUserMapper.selectAppUsersCounts());
        int offset = (pageNo - 1) * pageSize;
        pm.setList(appUserMapper.selectAllAppUsers(offset, pageSize));
        return pm;
    }

    @Override
    public PageModel<AppUsers> queryConditionAppUsers(int pageNo, int pageSize,int u_status,String u_name,String u_pNumber,String beginDate,String endDate) {
        PageModel<AppUsers> pm = new PageModel<AppUsers>(pageNo, pageSize);
        int offset = (pageNo - 1) * pageSize;
        HashMap<String, Object> hashMap = new HashMap<String, Object>();
        hashMap.put("u_status",u_status);
        hashMap.put("u_pNumber",u_pNumber);
        hashMap.put("u_name",u_name);
        hashMap.put("beginDate",beginDate);
        hashMap.put("endDate",endDate);
        pm.setRecordCounts(appUserMapper.selectConditionAppUsersCounts(hashMap));
        System.out.println("service！！！！"+appUserMapper.selectConditionAppUsersCounts(hashMap));
        hashMap.put("offset",offset);
        hashMap.put("pageSize",pageSize);
        pm.setList(appUserMapper.selectConditionAppUsers(hashMap));
        return pm;
    }

    /**
     * 更改用户状态 设置禁用
     *
     * @param u_id,status
     * @param status
     * @return
     */
    @Override
    public int modifyAppUsersStatus(int u_id, int status) {
        return appUserMapper.updateAppUsersStatus(u_id, status);
    }

    /**
     * 联合查询AppUsers和Information 通过u_id
     *
     *
     * @param u_id
     * @return
     */
    @Override
    public Information queryAppUsersInformation(int u_id) {

        return appUserMapper.selectAppUserInformation(u_id);
    }

    /**
     * 修改用户密码
     *
     * @param appUser
     * @return
     */
    @Override
    public int modifyAppUsersPassword(AppUsers appUser) {
        String code = RandomCode.getCodes();
        appUser.setU_password(Encryption.EncryString(appUser.getU_password()+code));
        return appUserMapper.updateAppUsersPassword(appUser);
    }

    /**
     * 通过u_id 查找 AppUsers对象
     *
     * @param u_id
     * @return
     */
    @Override
    public AppUsers queryAppUsersById(int u_id) {
        return appUserMapper.selectAppUsersById(u_id);
    }

    /**
     * Created by wujie on 2017/7/4.
     * 进行用户注册
     *
     * @param appUsers 用户对象
     * @return
     * @throws Exception
     */
    public int addAppUsers(AppUsers appUsers) {
        return appUserMapper.insertAppUsers(appUsers);
    }

    /**
     * 验证页面传入的账号是否存在
     * Created by wujie on 2017/6/30.
     *
     * @return
     * @throws是否存在
     */
    public AppUsers findVerifyAccount(String updatename) {
        return appUserMapper.selectOneAppUser(updatename);
    }

    /**
     * 插入个人信息表ID
     * Created by wujie on 2017/6/30.
     *
     * @return
     * @throws
     */
    public int addInformation(int u_id) {
        return informationMapper.insertInformation(u_id);
    }
    /** Created by wujie on 2017/7/5.
     * 进行用户查询
     * @param appUsers 用户对象
     * @return返回前台用户对象
     * @throws Exception
     */
    public AppUsers findAppUsers(AppUsers appUsers) {
        // 获取随机码
        String rnum = appUserMapper.selectAppUserRandom(appUsers.getU_pNumber());
        if (null != rnum && !("".equals(rnum))) {
            String pwd = Encryption.EncryString(appUsers.getU_password() + rnum);
            System.out.println("随机码 == "+rnum);
            System.out.println(pwd);
            appUsers.setU_password(pwd);
            return appUserMapper.selectAppUsers(appUsers);
        }
        return null;
    }
    /**
     * 逻辑删除 通过 用户id
     * Created by wuxiaoyu
     * @param list
     * @return
     */
    @Override
    public int modifyAppUserStatusByList(List<Integer> list) {
        return appUserMapper.updateAppUsersStatusByList(list);
    }
    /**
     * 修改个人信息
     *Created by wujie on 2017/7/6.
     * @return
     * @throws
     */
    public void modifyInformation(Information information){
        informationMapper.updateInformation(information);
    };
    /**
     * 修改用户姓名
     *Created by wujie on 2017/7/7.
     * @param appUser
     * @return
     */
    public int modifyAppUsersNaem(AppUsers appUser){
 return  informationMapper.updateAppUsersNaem(appUser);
    };
    /**
     * 修改用户头像
     *Created by wujie on 2017/7/6.
     * @return
     * @throws
     */
    public void modifyAppUserInformation(AppUsers appUsers ){
        appUserMapper.updateAppUserInformation(appUsers);
    };
}

