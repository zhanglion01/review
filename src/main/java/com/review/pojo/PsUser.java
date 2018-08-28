package com.review.pojo;

import java.sql.Date;

public class PsUser {
    private String psuserId;

    private String psuserName;

    private String psuserPass;

    private String psuserDept;

    private String psuserUnit;

    private String validFlag;

    private Date updateTime;

    public PsUser(){}

    public String getPsuserId() {
        return psuserId;
    }

    public void setPsuserId(String psuserId) {
        this.psuserId = psuserId;
    }

    public String getPsuserName() {
        return psuserName;
    }

    public void setPsuserName(String psuserName) {
        this.psuserName = psuserName;
    }

    public String getPsuserPass() {
        return psuserPass;
    }

    public void setPsuserPass(String psuserPass) {
        this.psuserPass = psuserPass;
    }

    public String getPsuserDept() {
        return psuserDept;
    }

    public void setPsuserDept(String psuserDept) {
        this.psuserDept = psuserDept;
    }

    public String getPsuserUnit() {
        return psuserUnit;
    }

    public void setPsuserUnit(String psuserUnit) {
        this.psuserUnit = psuserUnit;
    }

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
