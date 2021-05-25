package com.yanzhen.controller;

import com.google.common.base.Strings;
import com.yanzhen.entity.Admin;
import com.yanzhen.service.AdminService;
import com.yanzhen.utils.MD5Utils;
import com.yanzhen.utils.MapControl;
import com.yanzhen.utils.MapParameter;
import com.yanzhen.utils.SessionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
public class LoginController {

    @Autowired
    private AdminService adminService;

    @GetMapping("/login")
    public String v_login(){
        return "login";
    }

    @PostMapping("/login")
    @ResponseBody
    public Map<String, Object> login(@RequestBody Map<String,Object> map, HttpServletRequest request){
        String account = map.get("account")+"";
        String password = map.get("password")+"";
        if(Strings.isNullOrEmpty(account) || Strings.isNullOrEmpty(password)){
            return MapControl.getInstance().error("用户名或密码不能为空").getMap();
        }
        Admin admin = adminService.login(account, MD5Utils.getMD5(password));
        if(admin != null){
            SessionUtils.setAdmin(request,admin);
            return MapControl.getInstance().success().getMap();
        }else{
            return MapControl.getInstance().error("用户名或密码错误").getMap();
        }
    }

    @GetMapping("/pwd")
    public String pwd(){
        return "pwd";
    }
    @PostMapping("/pwd")
    @ResponseBody
    public Map<String,Object> pwd(Integer id,String type,String sourcePwd,String newPwd){
        Admin user = adminService.detail(id);
        if(user.getPassword().equals(MD5Utils.getMD5(sourcePwd))){
            Admin entity = new Admin();
            entity.setId(id);
            entity.setPassword(MD5Utils.getMD5(newPwd));
            int update = adminService.update(entity);
            if(update>0){
                return MapControl.getInstance().success().getMap();
            }else{
                return MapControl.getInstance().error().getMap();
            }
        }else{
            return MapControl.getInstance().error("原密码错误").getMap();
        }
    }
}
