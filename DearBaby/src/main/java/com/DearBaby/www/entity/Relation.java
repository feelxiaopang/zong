package com.DearBaby.www.entity;

/**
 * 宝宝关系对象实体类
 * Created by chenfumei on 2017/7/14.
 */
public class Relation {
    // 关系id  自增
    private int r_id;
    // 宝宝id
    private int baby_id;
    // 用户id
    private int u_id;
    // 关系等级
    private int r_level;
    // 关系名
    private String r_name;
    // 状态
    private int db_status;

    public Relation(int r_id, int baby_id, int u_id, int r_level, String r_name, int db_status) {
        this.r_id = r_id;
        this.baby_id = baby_id;
        this.u_id = u_id;
        this.r_level = r_level;
        this.r_name = r_name;
        this.db_status = db_status;
    }

    public Relation() {

    }

    public int getR_id() {
        return r_id;
    }

    public void setR_id(int r_id) {
        this.r_id = r_id;
    }

    public int getBaby_id() {
        return baby_id;
    }

    public void setBaby_id(int baby_id) {
        this.baby_id = baby_id;
    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
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

    public int getDb_status() {
        return db_status;
    }

    public void setDb_status(int db_status) {
        this.db_status = db_status;
    }
}
