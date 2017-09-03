package com.DearBaby.www.mapper;

import com.DearBaby.www.entity.AppUsers;
import com.DearBaby.www.entity.Information;

/**个人信息持久层
 * Created by wujie on 2017/7/4.
 */
public interface InformationMapper {

    /**
     * 插入个人信息表ID
     *Created by wujie on 2017/6/30.
     * @return
     * @throws
     */
    public int insertInformation(int u_id);

    /**
     * 修改个人信息
     *Created by wujie on 2017/7/6.
     * @return
     * @throws
     */
    public void updateInformation(Information information);

    /**
     * 修改用户姓名
     *Created by wujie on 2017/7/7.
     * @param appUser
     * @return
     */
    public int updateAppUsersNaem(AppUsers appUser);
}
