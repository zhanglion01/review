package com.review.controller;

import com.alibaba.fastjson.JSONObject;
import com.review.pojo.PsFile;
import com.review.service.IPsFileService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/psfile")
public class PsFileController {
    @Resource
    private IPsFileService iPsFileService;

    @ResponseBody
    @RequestMapping(value="/findlist",method = RequestMethod.POST)
    public  Map<String,Object> findList(@RequestBody String json, HttpServletRequest request){
        JSONObject jsonObject=JSONObject.parseObject(json);
        String id=jsonObject.getString("id");
        Map<String,Object> dataMap=new HashMap<String,Object>();
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

    @RequestMapping("/download")
    public void downloadExcelTemplet(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String fileName = request.getParameter("fileName");// 文件名称
        String filePath = request.getParameter("filePath");// 文件路徑
        response.reset();// 可以加也可以不加
        try {
            response.setContentType("application/x-download");
            response.addHeader("Content-Disposition", "attachment;filename="+URLEncoder.encode(fileName, "UTF-8"));
            response.setContentType("application/octet-stream; charset=utf-8");
            File file=new File(filePath+fileName);
            OutputStream outp =response.getOutputStream();//构造输出流
            FileInputStream in = new FileInputStream(file);//构造输入流，读取文件
            byte[] b = new byte[1024];
            int i = 0;
            while ((i = in.read(b)) > 0) {
                outp.write(b, 0, i);
            }
            outp.flush();
            in.close();
            in = null;
            outp.close();
            outp = null;
        } catch (IllegalStateException e) {
            System.out.print(e);
            e.printStackTrace();
        }
    }
}
