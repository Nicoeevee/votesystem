package com.yanzhen.controller;

import com.yanzhen.entity.Question;
import com.yanzhen.service.QuestionService;
import com.yanzhen.utils.MapControl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/question")
public class QuestionController {

    @Autowired
    private QuestionService questionService;


    @PostMapping("/create")
    @ResponseBody
    public Map<String,Object> create(@RequestBody Question question){
        int result = questionService.create(question);
        if(result<=0){
            //失败的情况下
            return MapControl.getInstance().error().getMap();
        }
        return MapControl.getInstance().success().add("id",result).getMap();
    }

    @PostMapping("/delete")
    @ResponseBody
    public Map<String,Object> delete(String ids){
        int result = questionService.deleteBatch(ids);
        if(result<=0){
            //失败的情况下
            return MapControl.getInstance().error().getMap();
        }
        return MapControl.getInstance().success().getMap();
    }

    @PostMapping("/update")
    @ResponseBody
    public Map<String, Object> update(@RequestBody Question question){
        int result = questionService.update(question);
        if(result<=0){
            //失败的情况下
            return MapControl.getInstance().error().getMap();
        }
        return MapControl.getInstance().success().getMap();
    }

    @GetMapping("/list")
    public String list(){
       return  "question/list";
    }

    @PostMapping("/query")
    @ResponseBody
    public Map<String,Object> query(@RequestBody Question question, ModelMap modelMap){
        List<Question> list = questionService.query(question);
        Integer count = questionService.count(question);
        return MapControl.getInstance().page(list,count).getMap();
    }


    @GetMapping("/detail")
    public String detail(Integer id,ModelMap modelMap){
        Question question = questionService.detail(id);
        modelMap.addAttribute("question",question);
        return "question/update";
    }

    @GetMapping("/question")
    public String question(Integer id,ModelMap modelMap){
        Question question = questionService.detail(id);
        modelMap.addAttribute("question",question);
        return "question/question";
    }


}
