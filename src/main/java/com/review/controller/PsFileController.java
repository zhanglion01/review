package com.review.controller;

import com.review.pojo.PsFile;
import com.review.service.IPsFileService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class PsFileController {
    @Resource
    private IPsFileService iPsFileService;
    @PostMapping(value = "/psfile/findlist")
    public Map<String,Object> findList(Model model,@RequestBody String json){
        Map<String,Object> dataMap=new HashMap<String,Object>();
        String id=json.toString();
        PsFile psFile=new PsFile();
        psFile.setSheetId(id);
        List list=iPsFileService.findlist(psFile);
        if(list.size()==0){
            dataMap.put("msg","该单据无附件");
        }else{
            dataMap.put("msg","success");
        }
        dataMap.put("data",list);
        return dataMap;
    }
}
