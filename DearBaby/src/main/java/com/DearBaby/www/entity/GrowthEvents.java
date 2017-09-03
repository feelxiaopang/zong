package com.DearBaby.www.entity;

/**
 * 宝宝成长事件实体类
 *
 * Created by wuxiaoyu on 2017/7/17.
 */
public class GrowthEvents {
    //主键 自增
    private int event_id;
    //事件描述
    private String event_content;
    //事件时间
    private String event_time;
    //事件等级 即可见范围
    private int event_level;
    //事件发生地点
    private String event_address;
    //关联宝宝id
    private int baby_id;
    //是否为宝宝大事件(即第一次)
    private String  event_first;
    //状态(逻辑删除）
    private int db_status;
    //事件图片
    private String event_photo;

    public GrowthEvents() {
    }

    public String getEvent_photo() {
        return event_photo;
    }

    public void setEvent_photo(String event_photo) {
        this.event_photo = event_photo;
    }

    public GrowthEvents(int event_id, String event_content, String event_time, int event_level, String event_address, int baby_id, String event_first, int db_status, String event_photo) {

        this.event_id = event_id;
        this.event_content = event_content;
        this.event_time = event_time;
        this.event_level = event_level;
        this.event_address = event_address;
        this.baby_id = baby_id;
        this.event_first = event_first;
        this.db_status = db_status;
        this.event_photo = event_photo;
    }

    public int getEvent_id() {
        return event_id;
    }

    public void setEvent_id(int event_id) {
        this.event_id = event_id;
    }

    public String getEvent_content() {
        return event_content;
    }

    public void setEvent_content(String event_content) {
        this.event_content = event_content;
    }

    public String getEvent_time() {
        return event_time;
    }

    public void setEvent_time(String event_time) {
        this.event_time = event_time;
    }

    public int getEvent_level() {
        return event_level;
    }

    public void setEvent_level(int event_level) {
        this.event_level = event_level;
    }

    public String getEvent_address() {
        return event_address;
    }

    public void setEvent_address(String event_address) {
        this.event_address = event_address;
    }

    public int getBaby_id() {
        return baby_id;
    }

    public void setBaby_id(int baby_id) {
        this.baby_id = baby_id;
    }

    public String getEvent_first() {
        return event_first;
    }

    public void setEvent_first(String event_first) {
        this.event_first = event_first;
    }

    public int getDb_status() {
        return db_status;
    }

    public void setDb_status(int db_status) {
        this.db_status = db_status;
    }
}
