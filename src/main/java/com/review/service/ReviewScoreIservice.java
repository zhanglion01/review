package com.review.service;

import com.review.pojo.ReviewScore;

import java.util.List;

public interface ReviewScoreIservice {


    public List<ReviewScore> getSummaryList(String params);

    public List<ReviewScore> queryById(String params);

    public void deleteById(String params);

    public void insertSelective(ReviewScore reviewScore);

    public void grade(ReviewScore reviewScore);

    public void update(ReviewScore reviewScore);

}
