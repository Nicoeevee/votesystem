package com.yanzhen.controller;

import com.google.common.base.Strings;
import com.yanzhen.entity.Admin;
import com.yanzhen.service.AdminService;
import com.yanzhen.utils.MD5Utils;
import com.yanzhen.utils.MapControl;
import com.yanzhen.utils.SessionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
public class RegController {

    @Autowired
    private AdminService adminService;

    @GetMapping("/reg")
    public String reg(){
        return "reg";
    }

    @PostMapping("/reg")
    @ResponseBody
    public Map<String,Object> create(@RequestBody Admin admin){
        Admin param = new Admin();
        admin.setType(Admin.TYPE_REG);
        param.setAccount(admin.getAccount());
        List<Admin> list = adminService.query(param);
        if(list.size()>0){
            return MapControl.getInstance().error("注册失败，账号已存在").getMap();
        }else{
            admin.setPassword(MD5Utils.getMD5(admin.getPassword()));
            int result = adminService.create(admin);
            if(result<=0){
                return MapControl.getInstance().error().getMap();
            }
            return MapControl.getInstance().success().getMap();
        }
    }

}
