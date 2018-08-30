package com.review.mapper;

import com.review.pojo.ReviewPrjinfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReviewPrjinfoMapper {

    public void insert(ReviewPrjinfo reviewPrjinfo);

    public void delete(String id);

    public void edit(ReviewPrjinfo reviewPrjinfo);

    public ReviewPrjinfo find(String id);

    public List<ReviewPrjinfo> getSummaryList(String params);
}
