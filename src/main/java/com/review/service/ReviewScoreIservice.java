package com.review.service;

import com.review.pojo.ReviewScore;

import java.util.List;

public interface ReviewScoreIservice {


    public List<ReviewScore> getSummaryList(String params);

    public List<ReviewScore> queryById(String params);

}
