package com.review.controller;
import java.io.File;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.review.pojo.PsFile;
import com.review.service.IFileUploadService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class FileUploadController {

    @Resource
    private IFileUploadService iFileUploadService;

    @RequestMapping(value="/upload", method=RequestMethod.POST)
    public @ResponseBody
    String handleFileUpload(@RequestParam("uuidName") String uuid,
                            @RequestParam("file") MultipartFile file, HttpServletRequest request, HttpServletResponse response){
        Map msgMap=new HashMap();
        if (!file.isEmpty()) {
            try {
                //创建文件夹
                File mkdFile=new File("F:/uploadfile/"+uuid);
                if(!mkdFile.exists()){
                        mkdFile.mkdirs();
                }
                //创建与上传文件相同的文件
                File saveFile=new File("F:/uploadfile/"+uuid+"/"+file.getOriginalFilename());
                saveFile.createNewFile();
                //设置文件信息参数
                String fileName=file.getOriginalFilename();
                String[] obj=fileName.split("\\.");
                Timestamp sjc = Timestamp.valueOf(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
                //String  newfileName = URLEncoder.encode(obj[0], "UTF-8");
                PsFile psFile=new PsFile();
                psFile.setFileName(obj[0]);
                psFile.setFileType(obj[1]);
                psFile.setFilePath("F:/uploadfile/");
                psFile.setSjc(sjc);
                psFile.setSheetId(uuid);
                //上传文件
                file.transferTo(saveFile);
                //保存文件信息
               iFileUploadService.save(psFile);
                return "<Html><body><script>alert('上传成功')</script></body></Html>";
              //  return  "reviewInfo";
            } catch (Exception e) {
               return "<Html><body><script>alert('上传失败')</script></body></Html>";
//                msgMap.put("msg","上传失败");
            }
        } else {
           // msgMap.put("msg","上传的文件为空");
            return  "上传的文件为空";

        }

    }

}
