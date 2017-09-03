package com.DearBaby.www.entity;

/**
 * 系统消息对象实体类
 * Created by chenfumei on 2017/7/3.
 */
public class Message {
    // 消息id 自增
    private int message_id;
    // 主题
    private String message_type;
    // 内容
    private String message_content;
    // 标记  是否已读
    private String message_sign;
    // 时间 发布系统消息时间
    private String message_date;
    // 系统消息路径
    private String message_url;
    // 状态  是否被删
    private String db_status;

    public Message(int message_id, String message_type, String message_content, String message_sign, String message_date, String message_url, String db_status) {
        this.message_id = message_id;
        this.message_type = message_type;
        this.message_content = message_content;
        this.message_sign = message_sign;
        this.message_date = message_date;
        this.message_url = message_url;
        this.db_status = db_status;
    }

    public Message() {

    }

    public int getMessage_id() {
        return message_id;
    }

    public void setMessage_id(int message_id) {
        this.message_id = message_id;
    }

    public String getMessage_type() {
        return message_type;
    }

    public void setMessage_type(String message_type) {
        this.message_type = message_type;
    }

    public String getMessage_content() {
        return message_content;
    }

    public void setMessage_content(String message_content) {
        this.message_content = message_content;
    }

    public String getMessage_sign() {
        return message_sign;
    }

    public void setMessage_sign(String message_sign) {
        this.message_sign = message_sign;
    }

    public String getMessage_date() {
        return message_date;
    }

    public void setMessage_date(String message_date) {
        this.message_date = message_date;
    }

    public String getMessage_url() {
        return message_url;
    }

    public void setMessage_url(String message_url) {
        this.message_url = message_url;
    }

    public String getDb_status() {
        return db_status;
    }

    public void setDb_status(String db_status) {
        this.db_status = db_status;
    }
}
