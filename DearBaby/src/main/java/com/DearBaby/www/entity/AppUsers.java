package com.DearBaby.www.entity;

import org.springframework.stereotype.Component;

/**
 * 前台用户对象类
 *
 * Created by wuxiaoyu on 2017/6/29.
 */

public class AppUsers {
    //用户的id自增长
    private int u_id;
    //用户的账号
    private String u_pNumber;
    //用户的昵称
    private String u_name;
    //用户的头像路径
    private String u_photo;
    //用户的密码
    private String u_password;
    //随机码
    private String u_random;
    //用户操作状态
    private int u_status;
    //创建时间
    private String u_date;

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public String getU_pNumber() {
        return u_pNumber;
    }

    public void setU_pNumber(String u_pNumber) {
        this.u_pNumber = u_pNumber;
    }

    public String getU_password() {
        return u_password;
    }

    public void setU_password(String u_password) {
        this.u_password = u_password;
    }

    public String getU_random() {
        return u_random;
    }

    public void setU_random(String u_random) {
        this.u_random = u_random;
    }

    public int getU_status() {
        return u_status;
    }

    public void setU_status(int u_status) {
        this.u_status = u_status;
    }

    public String getU_date() {
        return u_date;
    }

    public void setU_date(String u_date) {
        this.u_date = u_date;
    }

    public String getU_name() {
        return u_name;
    }

    public void setU_name(String u_name) {
        this.u_name = u_name;
    }

    public String getU_photo() {
        return u_photo;
    }

    public void setU_photo(String u_photo) {
        this.u_photo = u_photo;
    }

    public AppUsers() {
    }

    public AppUsers(int u_id, String u_pNumber, String u_name, String u_photo, String u_password, String u_random, int u_status, String u_date) {
        this.u_id = u_id;
        this.u_pNumber = u_pNumber;
        this.u_name = u_name;
        this.u_photo = u_photo;
        this.u_password = u_password;
        this.u_random = u_random;
        this.u_status = u_status;
        this.u_date = u_date;
    }

}
