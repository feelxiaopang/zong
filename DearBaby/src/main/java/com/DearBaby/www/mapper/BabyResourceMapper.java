package com.DearBaby.www.mapper;

import com.DearBaby.www.entity.BabyResource;
import com.DearBaby.www.entity.BabyResourceType;

import java.util.List;

/**
 * 育儿宝库资源持久化操作接口
 *
 * Created by wuxiaoyu on 2017/7/11.
 */
public interface BabyResourceMapper {

    /**
     * 查询资源类型总数量
     *
     * @return int
     */
    public int selectBabyResourceTypesCounts();
    /**
     *  查询育儿资源类型表对象list
     *
     * @return
     */
    public List<BabyResourceType> selectBabyResourceTypes();

    /**
     *  验证资源类型是否存在
     *
     * @param brt_type
     * @return
     */
    public BabyResourceType selectBabyResourceTypeByName(String brt_type);

    /**
     * 新增资源类型
     *
     * @param babyResourceType
     * @return
     */
    public int insertBabyResourceType(BabyResourceType babyResourceType);

    /**
     * 删除呢资源类型
     *
     * @param list
     * @return
     */
    public int deleteBabyResourceType(List<Integer> list);
}
