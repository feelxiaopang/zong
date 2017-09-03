package com.DearBaby.www.entity;

/**
 * 后台权限资源对象 实体类
 * Created by wuxiaoyu on 2017/6/29.
 */
public class Power {

    //权限资源id 自增
    private int p_id;
    //权限名称
    private String p_name;
    //权限路径
    private String p_path;
    //父级权限id 关联权限id
    private String father_id;

    public Power() {
    }

    public Power(int p_id, String p_name, String p_path, String father_id) {
        this.p_id = p_id;
        this.p_name = p_name;
        this.p_path = p_path;
        this.father_id = father_id;
    }

    public int getP_id() {
        return p_id;
    }

    public void setP_id(int p_id) {
        this.p_id = p_id;
    }

    public String getP_name() {
        return p_name;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }

    public String getP_path() {
        return p_path;
    }

    public void setP_path(String p_path) {
        this.p_path = p_path;
    }

    public String getFather_id() {
        return father_id;
    }

    public void setFather_id(String father_id) {
        this.father_id = father_id;
    }
}
