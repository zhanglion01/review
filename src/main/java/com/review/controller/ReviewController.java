package com.review.controller;




import com.alibaba.fastjson.JSONObject;
import com.review.pojo.ReviewPrjinfo;
import com.review.pojo.ReviewScore;
import com.review.service.ReviewPrjinfoService;
import com.review.service.ReviewScoreService;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import java.util.*;

@Controller
@RequestMapping(value = "/reviewInfo")
public class ReviewController {
    @Resource
    private ReviewPrjinfoService reviewPrjinfoService;

    @Resource
    private ReviewScoreService reviewScoreService;

    @Autowired

    @RequestMapping(value = "/params")
    public String reviewParams(HttpServletRequest request) {
        return "reviewParams";
    }

    @RequestMapping(value = "/info")
    public String reviewInfo(HttpServletRequest request) {
        return "reviewInfo";
    }

    @RequestMapping(value = "/score")
    public String reviewScore(HttpServletRequest request) {
        return "reviewScore";
    }

    @RequestMapping(value = "/summary")
    public String reviewSummary(HttpServletRequest request) {
        return "reviewSummary";
    }

    @RequestMapping(value = "/index")
    public String reviewIndex(HttpServletRequest request) {
        return "reviewIndex";
    }

    @RequestMapping(value = "/addInfo")
    public String reviewInfoAdd(HttpServletRequest request) {
        return "reviewInfoAdd";
    }

    @ResponseBody
    @RequestMapping(value = "/getSummaryList",method = RequestMethod.POST)
    public Map<String,Object> getSummaryList(HttpServletRequest request){
            Map<String,Object> map = new HashMap<String,Object>();
            List<ReviewPrjinfo> poList = new ArrayList<ReviewPrjinfo>();
            String params = request.getParameter("params");
            poList = reviewPrjinfoService.getSummaryList(params);
            map.put("total",poList.size());
            map.put("rows",poList);
            return map;
    }

    @ResponseBody
    @RequestMapping(value = "/getList",method = RequestMethod.POST)
    public List getList(HttpServletRequest request){
        List poList = new ArrayList<>();
        String params = request.getParameter("params");
        poList = reviewPrjinfoService.getSummaryList(params);
        List list = null;
        for(int i=0;i<poList.size();i++){
            Object[] obj = (Object[])poList.get(i);
            ReviewPrjinfo reviewPrjinfo = new ReviewPrjinfo();
            reviewPrjinfo.setReviewprjId((String)obj[0]);
            reviewPrjinfo.setPrjUnit((String)obj[1]);
            list.add(reviewPrjinfo);
        }
        System.out.println("getAAAA");
        return list;
    }

    @ResponseBody
    @RequestMapping(value = "/getScoreList",method = RequestMethod.POST)
    public Map<String,Object> getScoreList(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        List<ReviewScore> poList = new ArrayList<ReviewScore>();
            String params = request.getParameter("prjName");
        poList = reviewScoreService.getSummaryList(params);
        map.put("total", poList.size());
        map.put("rows", poList);
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "/queryById",method = RequestMethod.POST)
    public Map<String,Object> queryById(HttpServletRequest request){
        Map<String, Object> map = new HashMap<String, Object>();
        List<ReviewScore> poList = new ArrayList<ReviewScore>();
        String params = request.getParameter("prjName");
        poList = reviewScoreService.queryById(params);
        System.out.println(params);
        map.put("total", poList.size());
        map.put("rows", poList);
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    public Object delete(@RequestBody String  reviewScore)  {
        System.out.println(reviewScore);
        reviewScore=reviewScore.replace("[", "");
        reviewScore=reviewScore.replace("]", "");
        JSONObject jsonObject = JSONObject.parseObject(reviewScore);
        String scoreID = jsonObject.getString("scoreId");
        reviewScoreService.deleteById(scoreID);

        return 'S';
    }


    @ResponseBody
    @RequestMapping(value = "/addScore",method = RequestMethod.POST)
    public Object addScore(@RequestBody String  reviewScore)  {
        System.out.println(reviewScore);
        reviewScore=reviewScore.replace("[", "");
        reviewScore=reviewScore.replace("]", "");
        JSONObject jsonObject = JSONObject.parseObject(reviewScore);
        String scoreUserID = jsonObject.getString("scoreUserId1");
        String scoreUserName = jsonObject.getString("scoreUserName1");
        String reviewprjId = jsonObject.getString("slpk");
        System.out.println("AAA"+scoreUserID);
        ReviewScore score = new ReviewScore();
        score.setScoreUserId(scoreUserID);
        score.setScoreUserName(scoreUserName);
        score.setReviewprjId(reviewprjId);
        reviewScoreService.insertSelective(score);
        return 'S';
    }

    @ResponseBody
    @RequestMapping(value = "/grade",method = RequestMethod.POST)
    public Object grade(@RequestBody String  reviewScore)  {
        System.out.println(reviewScore);
        reviewScore=reviewScore.replace("[", "");
        reviewScore=reviewScore.replace("]", "");
        JSONObject jsonObject = JSONObject.parseObject(reviewScore);
        String scoreId = jsonObject.getString("scoreId");
        String scoreUserName = jsonObject.getString("scoreUserName");
        String reviewName = jsonObject.getString("reviewName");
        String scoreValue = jsonObject.getString("scoreValue");
        String scoreUserDesc = jsonObject.getString("scoreUserDesc");
       System.out.println("AA"+scoreId);
        ReviewScore score = new ReviewScore();
        score.setScoreId(scoreId);
        score.setScoreUserName(scoreUserName);
        score.setReviewName(reviewName);
        score.setScoreValue(scoreValue);
        score.setScoreUserDesc(scoreUserDesc);
        score.setScoreTime(new Date());
        reviewScoreService.grade(score);
        return 'S';
    }

}
