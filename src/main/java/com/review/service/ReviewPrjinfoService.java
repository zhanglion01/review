package com.review.service;

import com.review.mapper.ReviewPrjinfoMapper;
import com.review.pojo.ReviewPrjinfo;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("reviewPrjinfoService")
@ComponentScan({"com.review.mapper"})
public class ReviewPrjinfoService implements ReviewPrjinfoIservice {

    @Resource
    private ReviewPrjinfoMapper reviewPrjinfoMapper;

    @Override
    public void insert(ReviewPrjinfo reviewPrjinfo){
        reviewPrjinfoMapper.insert(reviewPrjinfo);
    };

    @Override
    public void delete(String id){
        reviewPrjinfoMapper.delete(id);
    };

    @Override
    public void edit(ReviewPrjinfo reviewPrjinfo){
        reviewPrjinfoMapper.edit(reviewPrjinfo);
    };

    @Override
    public ReviewPrjinfo find(String id){
        return reviewPrjinfoMapper.find(id);
    };

    @Override
    public List<ReviewPrjinfo> getSummaryList(String params){
        return reviewPrjinfoMapper.getSummaryList(params);
    };
}
