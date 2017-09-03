package com.DearBaby.www.common;

/**
 * 分页模型
 * Created by wuxiaoyu on 2017/6/29.
 */
import java.util.List;
public class PageModel<T> {

    //当前页码 默认当前页码1
    private int pageNo=1;
    //每页数据数 默认为15
    private int pageSize=15;
    //总数据数
    private int recordCounts;
    //总页数
    private int pageCounts;
    //存放分页数据的list
    private List<T> list;

    public PageModel(int pageNo, int pageSize) {
        this.pageNo = pageNo;
        this.pageSize = pageSize;
    }

    public PageModel() {
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getRecordCounts() {
        return recordCounts;
    }

    public void setRecordCounts(int recordCounts) {
        this.recordCounts = recordCounts;
    }

    public int getPageCounts() {
        if(this.recordCounts<=0){
            return 0;
        }else{
            pageCounts = (recordCounts + pageSize - 1) / pageSize;
        }
        return pageCounts;
    }

    public void setPageCounts(int pageCounts) {
        this.pageCounts = pageCounts;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }


}
