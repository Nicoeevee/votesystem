package com.yanzhen.utils;

import com.yanzhen.entity.Admin;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SessionInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Admin admin = SessionUtils.getAdmin(request);
        if(admin == null){
            response.setContentType("text/html;charset=utf-8");
//            response.sendRedirect("http://localhost:8080/Questionnaire_war_exploded/static/404.html");
            response.getWriter().print("您没有权限，请<a href='login'>登录</a>");
            return false;
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
