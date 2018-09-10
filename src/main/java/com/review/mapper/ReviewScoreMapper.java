package com.review.mapper;

import com.review.pojo.ReviewScore;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReviewScoreMapper {

    public List<ReviewScore> getSummaryList(String params);

    public List<ReviewScore> queryById(String params);

    public void deleteById(String  params);

    public  int updateByPrimaryKeySelective(ReviewScore record);

    public  int insertSelective(ReviewScore record);

    public  int deleteByPrimaryKey(String scoreId);


}
