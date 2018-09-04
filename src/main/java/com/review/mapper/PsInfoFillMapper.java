package com.review.mapper;

import com.review.pojo.PsInfoFill;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PsInfoFillMapper {

    public void insert(PsInfoFill user);

    public void delete(String id);

    public void edit(PsInfoFill user);

    public PsInfoFill find(String id);

    public List<PsInfoFill> listAll(PsInfoFill psInfoFill);
}
