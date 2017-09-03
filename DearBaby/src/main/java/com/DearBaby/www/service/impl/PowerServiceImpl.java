package com.DearBaby.www.service.impl;

        import com.DearBaby.www.entity.Power;
        import com.DearBaby.www.mapper.PowerMapper;
        import com.DearBaby.www.service.IPowerService;
        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.stereotype.Service;
        import org.springframework.transaction.annotation.Transactional;

        import java.util.List;

/**
 * 角色模块业务逻辑处理实现类
 *
 * Created by chenfumei on 2017/6/29.
 */
@Service("powerService")
@Transactional
public class PowerServiceImpl implements IPowerService {

    @Autowired
    PowerMapper powerMapper;
    /**
     *查找出管理员的权限名称
     * Created by wujie on 2017/6/30.
     * @param
     * @return返回管理员的权限名
     */
    public List<String> findPowerName(int r_id){

        return powerMapper.selectPowerName(r_id);
    }

    /**
     *查询所有权限
     * Created by xiongzhongxin on 2017/7/3.
     * @return返回所有权限集合
     */
    public List<Power> findAllPower(){

        return powerMapper.selectAllPower();
    }
    /**
     *查询所有权限
     * Created by wujie on 2017/7/7.
     * @return返回所有权限集合
     */
    public List<Power> findOnePower(int r_id){

        return powerMapper.selectOnePower(r_id);
    }
    /**
     *查询所有权限
     * Created by wujie on 2017/7/10.
     * @return返回所有权限集合
     */
    public List<Power> findChildPower(int r_id,int fat_id){

        return powerMapper.selectChildPower(r_id, fat_id);
    }
    /**
     *查看管理员的角色子权限
     * Created by xiongzhongxin on 2017/7/10.
     * @return返回所有权限集合
     */
    public List<Power> selectAdminInRolePower(int r_id){
        return powerMapper.selectAdminInRolePower(r_id);
    }


    /**
     *通过角色名 查询角色权限
     * Created by xiongzhongxin on 2017/7/12.
     * @return返回指定角色权限集合
     */
    public List<Power> selectRolePower(String r_name){
        return powerMapper.selectRolePower(r_name);
    }
}

