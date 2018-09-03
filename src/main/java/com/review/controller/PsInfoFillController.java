package com.review.controller;

import com.review.pojo.PsInfoFill;
import com.review.pojo.ReviewPrjinfo;
import com.review.service.IPsInfoFillService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value="/PsInfoFill")
public class PsInfoFillController {
    @Resource
    private IPsInfoFillService iPsInfoFillService;

    @RequestMapping(value="/getPsInfoFillList",method = RequestMethod.POST)
    public  Map<String,Object> getPsfillList(HttpServletRequest request){
        Map<String,Object> map =new HashMap<>();
        String params=request.getParameter("params");
        List<PsInfoFill> poList = new ArrayList<PsInfoFill>();
        poList = iPsInfoFillService.getPsfillList(params);
        map.put("total",poList.size());
        map.put("rows",poList);
        return map;
    }
}
