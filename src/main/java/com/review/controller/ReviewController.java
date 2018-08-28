package com.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/reviewInfo")
public class ReviewController {
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
}
