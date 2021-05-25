package com.yanzhen.controller;

import com.yanzhen.entity.Admin;
import com.yanzhen.utils.SessionUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Scanner;

@Controller
public class IndexController {

    @Value("classpath:init.json")
    private Resource resource;
    @Value("classpath:init2.json")
    private Resource resource2;

    @GetMapping("/index")
    public String index() {
        return "index";
    }

    @GetMapping("/info")
    public String info(){
        return "info";
    }

    @GetMapping("/menu")
    @ResponseBody
    public void menu(HttpServletRequest request, HttpServletResponse response) {
        Admin admin = SessionUtils.getAdmin(request);
        try {
            File file = null;
            if(admin.getType() == 0){
                file = resource.getFile();
            }else{
                file = resource2.getFile();
            }
            FileInputStream inputStream = new FileInputStream(file);
            InputStreamReader isr = new InputStreamReader(inputStream,"utf-8");
            BufferedReader bufferedReader = new BufferedReader(isr);
            String str;
            StringBuffer sb = new StringBuffer();
            while ((str = bufferedReader.readLine()) !=null){
                sb.append(str);
            }
            bufferedReader.close();
            isr.close();
            inputStream.close();
            response.setContentType("application/json;charset=utf-8");
            response.getWriter().print(sb.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
