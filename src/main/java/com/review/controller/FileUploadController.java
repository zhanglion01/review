package com.review.controller;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.time.Clock;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class FileUploadController {

    @RequestMapping(value="/upload", method=RequestMethod.GET)
    public @ResponseBody String provideUploadInfo() {
        return "You can upload a file by posting to this same URL.";
    }

    @RequestMapping(value="/upload", method=RequestMethod.POST)
    public @ResponseBody String handleFileUpload(@RequestParam("name") String name,
                                                 @RequestParam("file") MultipartFile file){
        if (!file.isEmpty()) {
            try {
                //创建与上传文件相同的文件
                File saveFile=new File("D:/uploadfile/"+file.getOriginalFilename());
                saveFile.createNewFile();

                file.transferTo(saveFile);
                return  "<Html><body><script>alert('上传成功')</script></body></Html>";
            } catch (Exception e) {
                return "<Html><body><script>alert('上传失败')</script></body></Html>";
            }
        } else {
            return "选择上传的文件为空";
        }
    }

}
