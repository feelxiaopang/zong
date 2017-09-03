package com.DearBaby.www.entity;

/**
 * 育儿资源类型实体类
 *
 * Created by wuxiaoyu on 2017/7/11.
 */
public class BabyResourceType {
    //主键  自增
    private int brt_id;
    //育儿资源类型名称
    private String brt_type;
    //第一父级id
    private String first_father;
    //第二父级id
    private String second_father;
    //第三父级id
    private String third_father;

    public int getBrt_id() {
        return brt_id;
    }

    public void setBrt_id(int brt_id) {
        this.brt_id = brt_id;
    }

    public String getBrt_type() {
        return brt_type;
    }

    public void setBrt_type(String brt_type) {
        this.brt_type = brt_type;
    }

    public String getFirst_father() {
        return first_father;
    }

    public void setFirst_father(String first_father) {
        this.first_father = first_father;
    }

    public String getSecond_father() {
        return second_father;
    }

    public void setSecond_father(String second_father) {
        this.second_father = second_father;
    }

    public String getThird_father() {
        return third_father;
    }

    public void setThird_father(String third_father) {
        this.third_father = third_father;
    }

    public BabyResourceType(int brt_id, String brt_type, String first_father, String second_father, String third_father) {
        this.brt_id = brt_id;
        this.brt_type = brt_type;
        this.first_father = first_father;
        this.second_father = second_father;
        this.third_father = third_father;
    }

    public BabyResourceType() {

    }
}
