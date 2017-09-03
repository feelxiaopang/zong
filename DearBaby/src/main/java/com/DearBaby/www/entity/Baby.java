package com.DearBaby.www.entity;

/**
 * 宝宝对象实体类
 * Created by chenfumei on 2017/7/12.
 */
public class Baby {

    // 宝宝ID，自增
    private int baby_id;
    // 宝宝姓名
    private String baby_name;
    // 宝宝生日日期
    private String baby_birth;
    // 宝宝姓名
    private String baby_sex;
    // 宝宝血型
    private String baby_blood;
    // 宝宝出生时刻
    private String baby_time;
    // 宝宝身高
    private double baby_height;
    // 宝宝体重
    private double baby_weight;
    // 邀请码
    private String baby_code;
    // 状态
    private int db_status;
    //头像路径
    private String baby_photo;
    //关联关系
    private String r_level;

    public Baby() {

    }

    public Baby(int baby_id, String baby_name, String baby_birth, String baby_sex, String baby_blood, String baby_time, double baby_height, double baby_weight, String baby_code, int db_status, String baby_photo, String r_level) {
        this.baby_id = baby_id;
        this.baby_name = baby_name;
        this.baby_birth = baby_birth;
        this.baby_sex = baby_sex;
        this.baby_blood = baby_blood;
        this.baby_time = baby_time;
        this.baby_height = baby_height;
        this.baby_weight = baby_weight;
        this.baby_code = baby_code;
        this.db_status = db_status;
        this.baby_photo = baby_photo;
        this.r_level = r_level;
    }

    public int getBaby_id() {
        return baby_id;
    }

    public void setBaby_id(int baby_id) {
        this.baby_id = baby_id;
    }

    public String getBaby_name() {
        return baby_name;
    }

    public void setBaby_name(String baby_name) {
        this.baby_name = baby_name;
    }

    public String getBaby_birth() {
        return baby_birth;
    }

    public void setBaby_birth(String baby_birth) {
        this.baby_birth = baby_birth;
    }

    public String getBaby_sex() {
        return baby_sex;
    }

    public void setBaby_sex(String baby_sex) {
        this.baby_sex = baby_sex;
    }

    public String getBaby_blood() {
        return baby_blood;
    }

    public void setBaby_blood(String baby_blood) {
        this.baby_blood = baby_blood;
    }

    public String getBaby_time() {
        return baby_time;
    }

    public void setBaby_time(String baby_time) {
        this.baby_time = baby_time;
    }

    public double getBaby_height() {
        return baby_height;
    }

    public void setBaby_height(double baby_height) {
        this.baby_height = baby_height;
    }

    public void setBaby_weight(double baby_weight) {
        this.baby_weight = baby_weight;
    }

    public double getBaby_weight() {
        return baby_weight;
    }

    public String getBaby_code() {
        return baby_code;
    }

    public void setBaby_code(String baby_code) {
        this.baby_code = baby_code;
    }

    public int getDb_status() {
        return db_status;
    }

    public void setDb_status(int db_status) {
        this.db_status = db_status;
    }

    public String getBaby_photo() {
        return baby_photo;
    }

    public void setBaby_photo(String baby_photo) {
        this.baby_photo = baby_photo;
    }

    public String getR_level() {
        return r_level;
    }

    public void setR_level(String r_level) {
        this.r_level = r_level;
    }

}