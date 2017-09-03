package com.DearBaby.www.entity;

/**
 * 后台管理员对象实体类
 * Created by liaodan on 2017/4/24.
 */
public class Admins {
    //管理员ID，自增
    private int a_id;
    //管理员姓名
    private String a_name;
    //管理员密码
    private String a_password;
    //密码加密随机字符
    private String a_random;
    //管理员关联的权限ID，权限表外键字段
    private int r_id;

    public Admins(int a_id, String a_name, String a_password, String a_random, int r_id) {
        this.a_id = a_id;
        this.a_name = a_name;
        this.a_password = a_password;
        this.a_random = a_random;
        this.r_id = r_id;
    }

    public int getA_id() {
        return a_id;
    }

    public void setA_id(int a_id) {
        this.a_id = a_id;
    }

    public String getA_name() {
        return a_name;
    }

    public void setA_name(String a_name) {
        this.a_name = a_name;
    }

    public String getA_password() {
        return a_password;
    }

    public void setA_password(String a_password) {
        this.a_password = a_password;
    }

    public String getA_random() {
        return a_random;
    }

    public void setA_random(String a_random) {
        this.a_random = a_random;
    }

    public int getR_id() {
        return r_id;
    }

    public void setR_id(int r_id) {
        this.r_id = r_id;
    }

    public Admins() {
    }
}
