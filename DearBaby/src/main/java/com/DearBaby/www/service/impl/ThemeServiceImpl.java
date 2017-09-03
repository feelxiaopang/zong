package com.DearBaby.www.service.impl;

import com.DearBaby.www.common.PageModel;
import com.DearBaby.www.entity.Theme;
import com.DearBaby.www.mapper.ThemeMapper;
import com.DearBaby.www.service.IThemeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/10.
 */
@Service("themeService")
@Transactional
public class ThemeServiceImpl implements IThemeService {
    @Autowired
    ThemeMapper themeMapper;
    /**查询所有的社区信息
     *Created by wujie on 2017/7/10.
     * @param
     * @return   社区信息
     */
    public PageModel<Theme> fildTheme(int pageNo, int pageSize){
        PageModel<Theme> pm = new PageModel<Theme>(pageNo, pageSize);
        pm.setRecordCounts(themeMapper.selectThemeCounts());
        int offset = (pageNo - 1) * pageSize;
        pm.setList(themeMapper.selectTheme(offset,pageSize));
      return pm;
    }
    /**修改社区信息
     *Created by wujie on 2017/7/10.
     * @param
     * @return   社区信息
     */
    public void updateTheme(Theme theme){
        themeMapper.updateTheme(theme);
    };
    /**根据传入的参数查询名字是否重复
     *Created by wujie on 2017/7/11.
     * @param
     * @return   返回社区
     */
    public Theme findOneTheme(Theme theme){
        return themeMapper.selectOneTheme(theme);
    };
    /**根据传入的参数删除社区
     *Created by wujie on 2017/7/11.
     * @param
     * @return
     */
    public void removeTheme(List<String> str){
        themeMapper.deleteTheme(str);
    };  /**根据传入的参数删除社区
     *Created by wujie on 2017/7/11.
     * @param
     * @return
     */
    public void findAddTheme(Theme theme){
        themeMapper.addTheme(theme);
    };
}
