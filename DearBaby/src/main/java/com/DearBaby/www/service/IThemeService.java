package com.DearBaby.www.service;

import com.DearBaby.www.common.PageModel;
import com.DearBaby.www.entity.Theme;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wujie on 2017/7/10.
 */
public interface IThemeService {
    /**返回所有的 社区信息
     *Created by wujie on 2017/7/10.
     * @param
     * @return   社区信息
     */
    public PageModel<Theme> fildTheme(int offset, int pageSize);
    /**修改社区信息
     *Created by wujie on 2017/7/10.
     *
     * @param
     * @return
     */
    public void updateTheme(Theme theme);
    /**根据传入的参数查询名字是否重复
     *Created by wujie on 2017/7/11.
     * @param
     * @return   返回社区
     */
    public Theme findOneTheme(Theme theme);
    /**根据传入的参数删除社区
     *Created by wujie on 2017/7/11.
     * @param
     * @return
     */
    public void removeTheme(List<String> str);
    /**根据传入的参数增加社区
     *Created by wujie on 2017/7/11.
     * @param
     * @return
     */
    public void findAddTheme(Theme theme);
}
