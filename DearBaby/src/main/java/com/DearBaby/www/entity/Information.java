package com.DearBaby.www.entity;

/**
 * 前台用户AppUsers的个人详细信息实体类
 *
 * Created by wuxiaoyu on 2017/7/4.
 */
public class Information {

    //详细信息id 主键 自增
    private int infor_id;
    //用户性别
    private String infor_sex;
    //用户生日
    private String infor_birth;
    //用户地址
    private String infor_address;
    //用户个性签名
    private String infor_signature;
    //与appUser用户一对一关联
    private AppUsers appUsers;

    public int getInfor_id() {
        return infor_id;
    }

    public void setInfor_id(int infor_id) {
        this.infor_id = infor_id;
    }

    public String getInfor_sex() {
        return infor_sex;
    }

    public void setInfor_sex(String infor_sex) {
        this.infor_sex = infor_sex;
    }

    public String getInfor_birth() {
        return infor_birth;
    }

    public void setInfor_birth(String infor_birth) {
        this.infor_birth = infor_birth;
    }

    public String getInfor_address() {
        return infor_address;
    }

    public void setInfor_address(String infor_address) {
        this.infor_address = infor_address;
    }

    public String getInfor_signature() {
        return infor_signature;
    }

    public void setInfor_signature(String infor_signature) {
        this.infor_signature = infor_signature;
    }

    public AppUsers getAppUsers() {
        return appUsers;
    }

    public void setAppUsers(AppUsers appUsers) {
        this.appUsers = appUsers;
    }

    public Information() {
    }

    public Information(int infor_id, String infor_sex, String infor_birth, String infor_address, String infor_signature, AppUsers appUsers) {
        this.infor_id = infor_id;
        this.infor_sex = infor_sex;
        this.infor_birth = infor_birth;
        this.infor_address = infor_address;
        this.infor_signature = infor_signature;
        this.appUsers = appUsers;
    }
}
