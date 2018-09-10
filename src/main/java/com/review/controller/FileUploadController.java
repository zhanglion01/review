package com.review.controller;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.Clock;
import java.util.Date;

import com.review.pojo.PsFile;
import com.review.service.IFileUploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class FileUploadController {

    @Resource
    private IFileUploadService iFileUploadService;

    @RequestMapping(value="/upload", method=RequestMethod.POST)
    public @ResponseBody String handleFileUpload(@RequestParam("uuidName") String uuid,
                                                 @RequestParam("file") MultipartFile file){
        if (!file.isEmpty()) {
            try {
                //创建与上传文件相同的文件
                File saveFile=new File("D:/uploadfile/"+file.getOriginalFilename());
                saveFile.createNewFile();
                String fileName=file.getOriginalFilename();
                String[] obj=fileName.split("\\.");
                Timestamp sjc = Timestamp.valueOf(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
                Timestamp timestamp=new Timestamp(System.nanoTime());
                PsFile psFile=new PsFile();
                psFile.setFileName(obj[0]);
                psFile.setFileType(obj[1]);
                psFile.setFilePath("D:/uploadfile/");
                psFile.setSjc(sjc);
                psFile.setSheetId(uuid);
                //上传文件
                file.transferTo(saveFile);
                //保存文件信息
                iFileUploadService.save(psFile);

                return  "<Html><body><script>alert('上传成功')</script></body></Html>";
            } catch (Exception e) {
                return "<Html><body><script>alert('上传失败')</script></body></Html>";
            }
        } else {
            return "选择上传的文件为空";
        }
    }

}
