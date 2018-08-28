package com.review.mapper;

import com.review.pojo.PsUser;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PsUserMapper {

    public void insert(PsUser user);

    public void delete(String id);

    public void edit(PsUser user);

    public PsUser find(String id);
}
