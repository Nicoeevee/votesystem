package com.yanzhen.controller;

import com.yanzhen.entity.Question;
import com.yanzhen.entity.Survey;
import com.yanzhen.service.QuestionService;
import com.yanzhen.service.SurveyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
public class DynamicController {

    @Autowired
    private SurveyService surveyService;

    @Autowired
    private QuestionService questionService;

    @GetMapping("/dy/{uuid}")
    public String preview(@PathVariable("uuid") String uuid, ModelMap modelMap){
        Survey param = new Survey();
        param.setState(Survey.state_exec);
        List<Survey> list = surveyService.queryAll(param);
        Survey entity = null;
        for (Survey survey : list) {
            if(survey.getUrl() !=null && survey.getUrl().contains(uuid)){
                entity = survey;
            }
        }
        if(entity == null){
            modelMap.addAttribute("msg","你要访问的问卷已过期或不存在");
            return "error";
        }else{
            Question question = new Question();
            question.setSurveyId(entity.getId());
            //查询一个问卷中的所有问题及选项
            List<Question> questions = questionService.query(question);
            //将问题设置为survey的属性
            entity.setQuestions(questions);
            modelMap.addAttribute("survey",entity);
            return "survey/exec";
        }

    }

    @GetMapping("/dy/success")
    public String success(){
        return "survey/success";
    }

}
