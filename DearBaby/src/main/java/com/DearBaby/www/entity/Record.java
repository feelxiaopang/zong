package com.DearBaby.www.entity;

/**
 * 宝宝生长记录
 * Created by xiongzhongxin on 2017/7/11.
 */
public class Record {
    //    编号
    private int record_id;
    //    身高
    private double record_height;
    //    体重
    private double record_weight;
    //    头围
    private double record_touwei;
    //   生长时间
    private String record_time;
    //    宝宝id
    private int baby_id;
    //    状态
    private int status;

    public Record() {
    }
    public Record(int record_id, double record_height, double record_weight, double record_touwei, String record_time, int baby_id, int status) {
        this.record_id = record_id;
        this.record_height = record_height;
        this.record_weight = record_weight;
        this.record_touwei = record_touwei;
        this.record_time = record_time;
        this.baby_id = baby_id;
        this.status = status;
    }

    public void setRecord_id(int record_id) {
        this.record_id = record_id;
    }

    public void setRecord_height(double record_height) {
        this.record_height = record_height;
    }

    public void setRecord_weight(double record_weight) {
        this.record_weight = record_weight;
    }

    public void setRecord_touwei(double record_touwei) {
        this.record_touwei = record_touwei;
    }

    public void setRecord_time(String record_time) {
        this.record_time = record_time;
    }

    public void setBaby_id(int baby_id) {
        this.baby_id = baby_id;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getRecord_id() {
        return record_id;
    }

    public double getRecord_height() {
        return record_height;
    }

    public double getRecord_weight() {
        return record_weight;
    }

    public double getRecord_touwei() {
        return record_touwei;
    }

    public String getRecord_time() {
        return record_time;
    }

    public int getBaby_id() {
        return baby_id;
    }

    public int getStatus() {
        return status;
    }
}
