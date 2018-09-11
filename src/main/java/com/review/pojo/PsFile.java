package com.review.pojo;


import java.util.Date;

public class PsFile {

  private int uuid;
  private String sheetId;
  private String fileName;
  private String filePath;
  private String fileType;
  private Date sjc;


  public int getUuid() {
    return uuid;
  }

  public void setUuid(int uuid) {
    this.uuid = uuid;
  }


  public String getSheetId() {
    return sheetId;
  }

  public void setSheetId(String sheetId) {
    this.sheetId = sheetId;
  }


  public String getFileName() {
    return fileName;
  }

  public void setFileName(String fileName) {
    this.fileName = fileName;
  }


  public String getFilePath() {
    return filePath;
  }

  public void setFilePath(String filePath) {
    this.filePath = filePath;
  }


  public String getFileType() {
    return fileType;
  }

  public void setFileType(String fileType) {
    this.fileType = fileType;
  }


  public Date getSjc() {
    return sjc;
  }

  public void setSjc(Date sjc) {
    this.sjc = sjc;
  }

}
