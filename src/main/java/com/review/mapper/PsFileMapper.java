package com.review.mapper;

import com.review.pojo.PsFile;
import com.review.pojo.PsInfoFill;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface PsFileMapper {
    public void insert(PsFile psFile);

    public void delete(String id);

    public void edit(PsFile psFile);

    public PsInfoFill find(String id);

    public List<PsInfoFill> listAll(PsFile psFilel);
}
