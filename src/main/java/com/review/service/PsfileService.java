package com.review.service;

import com.review.mapper.PsFileMapper;
import com.review.pojo.PsFile;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class PsfileService implements IPsFileService{
    @Resource
    private PsFileMapper psFileMapper;
    public List findlist(PsFile psFile){
       return psFileMapper.listAll(psFile);
    };
}
