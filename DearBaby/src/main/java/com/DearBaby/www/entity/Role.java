package com.DearBaby.www.entity;

/**
 * 后台角色对象实体类
 * Created by wuxiaoyu on 2017/6/29.
 */
public class Role {

    //角色id 自增
    private int r_id;
    //角色等级 1,2,3 随数字的增长权限越低
    private int r_level;
    //角色名称
    private String r_name;

    public Role() {
    }

    public Role(int r_id, int r_level, String r_name) {
        this.r_id = r_id;
        this.r_level = r_level;
        this.r_name = r_name;
    }

    public int getR_id() {
        return r_id;
    }

    public void setR_id(int r_id) {
        this.r_id = r_id;
    }

    public int getR_level() {
        return r_level;
    }

    public void setR_level(int r_level) {
        this.r_level = r_level;
    }

    public String getR_name() {
        return r_name;
    }

    public void setR_name(String r_name) {
        this.r_name = r_name;
    }

}
