package com.DearBaby.www.entity;



/**
 * 后台角色管理页面封装的类
 * Created by xiongzhongxin on 2017/7/6.
 */
public class RolePower {

    //角色的r_id
    private int r_id;
    //角色对应的权限名字
    private String p_name;
    //角色对应的权限id
    private int p_id;
    //角色对应的权限id 的父级权限
    private  int father_id;

    public int getP_id() {
        return p_id;
    }

    public void setP_id(int p_id) {
        this.p_id = p_id;
    }

    public void setR_id(int r_id) {
        this.r_id = r_id;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }

    public int getR_id() {
        return r_id;
    }

    public String getP_name() {
        return p_name;
    }


    public void setFather_id(int father_id) {
        this.father_id = father_id;
    }

    public int getFather_id() {
        return father_id;
    }

    public RolePower() {}

    public RolePower(int r_id, String p_name, int p_id, int father_id) {
        this.r_id = r_id;
        this.p_name = p_name;
        this.p_id = p_id;
        this.father_id = father_id;
    }
}
