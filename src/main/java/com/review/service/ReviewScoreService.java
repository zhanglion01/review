package com.review.service;

import com.review.pojo.ReviewScore;
import com.review.mapper.ReviewScoreMapper;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

@Service("reviewScoreService")
@ComponentScan({"com.review.mapper"})
public class ReviewScoreService  implements ReviewScoreIservice{
    @Resource
    private ReviewScoreMapper reviewScoreMapper;



    @Override
    public List<ReviewScore> getSummaryList(String params){

        List<ReviewScore> list =reviewScoreMapper.getSummaryList(params);
        return list;
    }

    @Override
    public List<ReviewScore> queryById(String params) {
        List<ReviewScore> list =reviewScoreMapper.queryById(params);
        return list;
    }

    @Override
    public void deleteById(String params){
        reviewScoreMapper.deleteById(params);
    }


}
