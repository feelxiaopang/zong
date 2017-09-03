package com.DearBaby.www.entity;

/**
 * Created by chenfumei on 2017/7/3.
 */
public class MyOrder {
    // 订单id 自增
    private int order_id;
    // 订单状态 是否已处理
    private int order_status;
    // 订单号
    private String order_num;
    // 订单时间
    private String order_time;
    // 状态  是否被删
    private int db_status;
    // 收货地址
    private String address;
    // 邮编
    private int zipcode;
    // 收货人
    private String consignee;
    // 电话
    private String tel;

    public MyOrder(int order_id, int order_status, String order_num, String order_time, int db_status, String address, int zipcode, String consignee, String tel) {
        this.order_id = order_id;
        this.order_status = order_status;
        this.order_num = order_num;
        this.order_time = order_time;
        this.db_status = db_status;
        this.address = address;
        this.zipcode = zipcode;
        this.consignee = consignee;
        this.tel = tel;
    }

    public MyOrder() {

    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getOrder_status() {
        return order_status;
    }

    public void setOrder_status(int order_status) {
        this.order_status = order_status;
    }

    public String getOrder_num() {
        return order_num;
    }

    public void setOrder_num(String order_num) {
        this.order_num = order_num;
    }

    public String getOrder_time() {
        return order_time;
    }

    public void setOrder_time(String order_time) {
        this.order_time = order_time;
    }

    public int getDb_status() {
        return db_status;
    }

    public void setDb_status(int db_status) {
        this.db_status = db_status;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getZipcode() {
        return zipcode;
    }

    public void setZipcode(int zipcode) {
        this.zipcode = zipcode;
    }

    public String getConsignee() {
        return consignee;
    }

    public void setConsignee(String consignee) {
        this.consignee = consignee;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }
}
