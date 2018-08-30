package com.review.service;

import com.review.mapper.PsUserMapper;
import com.review.pojo.PsUser;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("userService")
@ComponentScan({"com.review.mapper"})
public class PsUserService implements PsUserIservice {

    @Resource
    private PsUserMapper psUserMapper;

    @Override
    public void insert(PsUser user){
        psUserMapper.insert(user);
    };

    @Override
    public void delete(String id){
        psUserMapper.delete(id);
    };

    @Override
    public void edit(PsUser user){
        psUserMapper.edit(user);
    };

    @Override
    public PsUser find(String id){
        return psUserMapper.find(id);
    };
}
