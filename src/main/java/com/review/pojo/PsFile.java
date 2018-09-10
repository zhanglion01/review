package com.review.pojo;


public class PsFile {

  private String uuid;
  private String sheetId;
  private String fileName;
  private String filePath;
  private String fileType;
  private java.sql.Timestamp sjc;


  public String getUuid() {
    return uuid;
  }

  public void setUuid(String uuid) {
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


  public java.sql.Timestamp getSjc() {
    return sjc;
  }

  public void setSjc(java.sql.Timestamp sjc) {
    this.sjc = sjc;
  }

}
