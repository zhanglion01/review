package com.review.controller;

import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.review.pojo.PsInfoFill;
import com.review.service.IPsInfoFillService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value="/PsInfoFill")
public class PsInfoFillController {
    @Resource
    private IPsInfoFillService iPsInfoFillService;

    @ResponseBody
    @RequestMapping(value="/getPsInfoFillList",method = RequestMethod.POST)
    public  Map<String,Object> getPsfillList(HttpServletRequest request){
        Map<String,Object> map =new HashMap<>();
        String Name=request.getParameter("reName");
        String year=request.getParameter("reYear");
        PsInfoFill psInfoFill=new PsInfoFill();
        psInfoFill.setReName("%"+Name+"%");
        psInfoFill.setReYear("%"+year+"%");
        List<PsInfoFill> poList = new ArrayList<PsInfoFill>();
        poList = iPsInfoFillService.getPsfillList(psInfoFill);
        map.put("total",poList.size());
        map.put("rows",poList);
        return map;
    }
    @ResponseBody
    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    public String  delete(@RequestBody String uuid ){
         iPsInfoFillService.delete(uuid);
        return "1";
    }
    @RequestMapping(value = "/add")
    public String addinfo(HttpServletRequest request){
        return "addInfo";
    }

    @RequestMapping(value = "/uploadjsp")
    public String uploadjsp(HttpServletRequest request){
        return "uploadjsp";
    }


    @ResponseBody
    @RequestMapping(value ="/saveInfo")
    public  String save(@RequestBody String json){
        JSONObject jsonObject = JSONObject.parseObject(json);

        String uuid = jsonObject.getString("uuid");
        String reName = jsonObject.getString("reName");
        String reYear = jsonObject.getString("reYear");
        String rePrj = jsonObject.getString("rePrj");
        String reUnit = jsonObject.getString("reUnit");
        PsInfoFill psInfoFill=new PsInfoFill();
        psInfoFill.setReYear(reYear);
        psInfoFill.setReName(reName);
        psInfoFill.setRePrj(rePrj);
        psInfoFill.setReUnit(reUnit);
        psInfoFill.setUuid(uuid);
        if("".equals(uuid)||null==uuid){
            iPsInfoFillService.save(psInfoFill);
        }else{
            iPsInfoFillService.edit(psInfoFill);
        }
        return "1";
    }
}
