package com.review.service;

import com.review.pojo.ReviewPrjinfo;

import java.util.List;

public interface ReviewPrjinfoIservice {

    public void insert(ReviewPrjinfo reviewPrjinfo);

    public void delete(String id);

    public void edit(ReviewPrjinfo reviewPrjinfo);

    public ReviewPrjinfo find(String id);

    public List<ReviewPrjinfo> getSummaryList(String params);
}
