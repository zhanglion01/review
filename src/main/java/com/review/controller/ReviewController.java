package com.review.controller;

import com.review.pojo.ReviewPrjinfo;
import com.review.service.ReviewPrjinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/reviewInfo")
public class ReviewController {
    @Resource
    private ReviewPrjinfoService reviewPrjinfoService;

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
}
