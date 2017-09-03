package com.DearBaby.www.service;

import com.DearBaby.www.common.PageModel;
import com.DearBaby.www.entity.BabyResource;
import com.DearBaby.www.entity.BabyResourceType;

import java.util.List;

/**
 * 育儿资源信息处理服务层接口
 *
 * Created by wuxiaoyu on 2017/7/11.
 */
public interface IBabyResourceService {

    /**
     * 查询所有育儿资源类型
     *
     * @return 分页模型
     */
    public PageModel<BabyResourceType> queryBabyResourceTypes(int pageNo, int pageSize);

    /**
     *  查询类型名是否存在
     *
     * @param brt_type
     * @return
     */
    public BabyResourceType queryBabyResourceTypeByName(String brt_type);

    /**
     * 新增资源类型
     *
     * @param babyResourceType
     * @return
     */
    public int addResourceType(BabyResourceType babyResourceType);

    /**
     * 删除资源类型
     *
     * @param list
     * @return
     */
    public int removeResourceType(List<Integer> list);
}
