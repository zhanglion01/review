package com.review.controller;

import com.review.pojo.PsUser;
import com.review.service.PsUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "/review")
public class LoginController {
    @Resource
    private PsUserService psUserService;

    @Autowired
    @RequestMapping(value = "/login")
    public String user(HttpServletRequest request) {
        return "login";
    }

    @RequestMapping(value = "/index")
    public String index(HttpServletRequest request) {
        return "index";
    }

    @ResponseBody
    @RequestMapping(value = "/loginCheck",method = RequestMethod.POST)
    public Map<String, String> loginCheck(@RequestBody String user) {
        String userName = user.split("&")[0];
        String password = user.split("&")[1];
        System.out.println(password);
        PsUser psUser = psUserService.find(userName);
        /*if(psUser.getPsuserPass().equals(password)){
            System.out.println("登录成功");
        }else{
            System.out.println("登录失败");
        }*/
        Map<String, String> hashMap = new HashMap<String, String>();
        hashMap.put("msg", "Sucess");
        return hashMap;
    }
}
