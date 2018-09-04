package com.review.service;

import com.review.mapper.PsInfoFillMapper;
import com.review.pojo.PsInfoFill;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
@ComponentScan({"com.review.mapper"})
public class PsInfoFillService implements IPsInfoFillService {
    @Resource
    private PsInfoFillMapper psInfoFillMapper;
    @Override
    public List<PsInfoFill> getPsfillList(PsInfoFill psInfoFill) {
        return psInfoFillMapper.listAll(psInfoFill);
    }
}
