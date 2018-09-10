package com.review.service;

import com.review.pojo.PsFile;
import com.review.pojo.PsInfoFill;

import java.util.List;

public interface IFileUploadService {
    public List<PsInfoFill> getPsfillList(PsFile psFile);
    public void delete(String uuid);
    public void save(PsFile psFile);
    public void edit(PsFile psFile);

}
