package com.DearBaby.www.entity;

import java.util.List;

/**
 * 后台用户管理页面封装的类
 * Created by wujie on 2017/6/30.
 */
public class BackgroundUser {

//页面需要的a_id
    private int a_id;
    //封装的类中的角色名字
    private String r_name;
    //封装的类中的角色账号
    private String a_name;
    //页面需要的p_name
    //封装的类中的权限名称
    private List<String> p_name;

    public int getA_id() {
        return a_id;
    }

    public void setA_id(int a_id) {
        this.a_id = a_id;
    }

    public String getR_name() {
        return r_name;
    }

    public void setR_name(String r_name) {
        this.r_name = r_name;
    }

    public String getA_name() {
        return a_name;
    }

    public void setA_name(String a_name) {
        this.a_name = a_name;
    }

    public List<String> getP_name() {
        return p_name;
    }

    public void setP_name(List<String> p_name) {
        this.p_name = p_name;
    }

    public BackgroundUser(int a_id, String r_name, String a_name, List<String> p_name) {
        this.a_id = a_id;
        this.r_name = r_name;
        this.a_name = a_name;
        this.p_name = p_name;
    }

    public BackgroundUser() {

    }
}
