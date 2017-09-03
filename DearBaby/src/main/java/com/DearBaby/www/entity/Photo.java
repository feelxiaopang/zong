package com.DearBaby.www.entity;

/**
 * 相册实体类
 * Created by chenfumei on 2017/7/18.
 */
public class Photo {
    // 照片id自增
    private int photo_id;
    // 照片上传时间
    private String photo_date;
    // 照片路径
    private String photo_url;
    // 状态
    private int db_status;
    // 宝宝id
    private int baby_id;

    public Photo(int photo_id, String photo_date, String photo_url, int db_status, int baby_id) {
        this.photo_id = photo_id;
        this.photo_date = photo_date;
        this.photo_url = photo_url;
        this.db_status = db_status;
        this.baby_id = baby_id;
    }

    public Photo() {

    }

    public int getPhoto_id() {
        return photo_id;
    }

    public void setPhoto_id(int photo_id) {
        this.photo_id = photo_id;
    }

    public String getPhoto_date() {
        return photo_date;
    }

    public void setPhoto_date(String photo_date) {
        this.photo_date = photo_date;
    }

    public String getPhoto_url() {
        return photo_url;
    }

    public void setPhoto_url(String photo_url) {
        this.photo_url = photo_url;
    }

    public int getDb_status() {
        return db_status;
    }

    public void setDb_status(int db_status) {
        this.db_status = db_status;
    }

    public int getBaby_id() {
        return baby_id;
    }

    public void setBaby_id(int baby_id) {
        this.baby_id = baby_id;
    }
}
