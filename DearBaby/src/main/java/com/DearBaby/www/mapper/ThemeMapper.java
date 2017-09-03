package com.DearBaby.www.mapper;

import com.DearBaby.www.entity.Theme;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wujie on 2017/7/10.
 */
public interface ThemeMapper {
    /**查询所有的社区信息
     *Created by wujie on 2017/7/10.
     * @param
     * @return   社区信息
     */
    public List<Theme> selectTheme(int offset, int pageSize);
    /**修改社区信息
     *Created by wujie on 2017/7/10.
     * @param
     * @return   社区信息
     */
    public void updateTheme(Theme theme);
    /**根据传入的参数查询名字是否重复
     *Created by wujie on 2017/7/10.
     * @param
     * @return   社区信息
     */
    public Theme selectOneTheme(Theme theme);
    /**根据传入的参数删除社区
     *Created by wujie on 2017/7/11.
     * @param
     * @return
     */
    public void deleteTheme(List<String> list);
    /**根据传入的参数增加社区
     *Created by wujie on 2017/7/11.
     * @param
     * @return
     */
    public void addTheme(Theme theme);
    /**查询所有参数的总数
     *Created by wujie on 2017/7/11.
     * @param
     * @return
     */
    public int selectThemeCounts();
}
