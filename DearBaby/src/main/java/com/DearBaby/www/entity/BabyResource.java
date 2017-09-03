package com.DearBaby.www.entity;

/**
 * 育儿宝库资源对象类
 *
 * Created by wuxioayu on 2017/7/11.
 */
public class BabyResource {
    //主键 自增
    private int br_id;
    //资源标题
    private String br_title;
    //资源内容
    private String br_content;
    //关联BabyResourceType 的主键
    private int brt_id;

    public int getBr_id() {
        return br_id;
    }

    public void setBr_id(int br_id) {
        this.br_id = br_id;
    }

    public String getBr_title() {
        return br_title;
    }

    public void setBr_title(String br_title) {
        this.br_title = br_title;
    }

    public String getBr_content() {
        return br_content;
    }

    public void setBr_content(String br_content) {
        this.br_content = br_content;
    }

    public int getBrt_id() {
        return brt_id;
    }

    public void setBrt_id(int brt_id) {
        this.brt_id = brt_id;
    }

    public BabyResource(int br_id, String br_title, String br_content, int brt_id) {
        this.br_id = br_id;
        this.br_title = br_title;
        this.br_content = br_content;
        this.brt_id = brt_id;
    }

    public BabyResource() {
    }
}
