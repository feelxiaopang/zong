package com.DearBaby.www.entity;

/**
 * Created by Administrator on 2017/7/10.
 */
public class Theme {
    private int theme_id;
    private String theme_type;

    public int getTheme_id() {
        return theme_id;
    }

    public void setTheme_id(int theme_id) {
        this.theme_id = theme_id;
    }

    public String getTheme_type() {
        return theme_type;
    }

    public void setTheme_type(String theme_type) {
        this.theme_type = theme_type;
    }

    public Theme() {

    }

    public Theme(int theme_id, String theme_type) {
        this.theme_id = theme_id;
        this.theme_type = theme_type;
    }
}
