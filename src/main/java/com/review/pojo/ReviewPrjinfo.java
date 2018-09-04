package com.review.pojo;

import java.util.Date;

public class ReviewPrjinfo {
    private String reviewprjId;

    private String prjName;

    private String prjLeader;

    private String prjDept;

    private String prjUnit;

    private String prjInfo;

    public String getReviewprjId() {
        return reviewprjId;
    }

    public void setReviewprjId(String reviewprjId) {
        this.reviewprjId = reviewprjId;
    }

    public String getPrjName() {
        return prjName;
    }

    public void setPrjName(String prjName) {
        this.prjName = prjName;
    }

    public String getPrjLeader() {
        return prjLeader;
    }

    public void setPrjLeader(String prjLeader) {
        this.prjLeader = prjLeader;
    }

    public String getPrjDept() {
        return prjDept;
    }

    public void setPrjDept(String prjDept) {
        this.prjDept = prjDept;
    }

    public String getPrjUnit() {
        return prjUnit;
    }

    public void setPrjUnit(String prjUnit) {
        this.prjUnit = prjUnit;
    }

    public String getPrjInfo() {
        return prjInfo;
    }

    public void setPrjInfo(String prjInfo) {
        this.prjInfo = prjInfo;
    }

    public String getPrjYear() {
        return prjYear;
    }

    public void setPrjYear(String prjYear) {
        this.prjYear = prjYear;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    private String prjYear;

    private Date startTime;

    private Date endTime;

    private String validFlag;

    private Date updateTime;

    public ReviewPrjinfo(){}



    public String getValidFlag() {
        return validFlag;
    }

    public void setValidFlag(String validFlag) {
        this.validFlag = validFlag;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}
