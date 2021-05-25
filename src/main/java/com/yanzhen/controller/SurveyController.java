package com.yanzhen.controller;

import com.github.pagehelper.PageInfo;
import com.yanzhen.entity.*;
import com.yanzhen.service.QuestionService;
import com.yanzhen.service.SurveyService;
import com.yanzhen.utils.MapControl;
import com.yanzhen.utils.SessionUtils;
import com.yanzhen.utils.SystemInit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/survey")
public class SurveyController {

    @Autowired
    private SurveyService surveyService;
    @Autowired
    private QuestionService questionService;

    @GetMapping("/create")
    public String v_create(){
        return "survey/add";
    }

    @PostMapping("/create")
    @ResponseBody
    public Map<String,Object> create(@RequestBody Survey survey, HttpServletRequest request){
        Admin currAdmin = SessionUtils.getAdmin(request);
        survey.setCreator(currAdmin.getId());
        survey.setState(Survey.state_create);
        survey.setAnon(survey.getAnon()!=null?0:1);
        int result = surveyService.create(survey);
        if(result<=0){
            //失败的情况下
            return MapControl.getInstance().error().getMap();
        }
        return MapControl.getInstance().success().getMap();
    }

    @PostMapping("/delete")
    @ResponseBody
    public Map<String,Object> delete(String ids){
        int result = surveyService.deleteBatch(ids);
        if(result<=0){
            //失败的情况下
            return MapControl.getInstance().error().getMap();
        }
        return MapControl.getInstance().success().getMap();
    }

    @PostMapping("/update")
    @ResponseBody
    public Map<String, Object> update(@RequestBody Survey survey){
        survey.setAnon(survey.getAnon()!=null?0:1);
        int result = surveyService.update(survey);
        if(result<=0){
            //失败的情况下
            return MapControl.getInstance().error().getMap();
        }
        return MapControl.getInstance().success().getMap();
    }

    @GetMapping("/list")
    public String list(){
       return  "survey/list";
    }

    @PostMapping("/query")
    @ResponseBody
    public Map<String,Object> query(@RequestBody Survey survey,HttpServletRequest request, ModelMap modelMap){


        Admin admin = SessionUtils.getAdmin(request);
        if(admin.getType() == 1){//非管理人员仅能看到自己的
            survey.setCreator(admin.getId());
        }

        List<Survey> list = surveyService.query(survey);
        //创建者信息写入survey对象
        for (Survey entity : list) {
             entity.setAdmin(SystemInit.adminMap.get(entity.getCreator()));
        }
        Integer count = surveyService.count(survey);
        return MapControl.getInstance().page(list,count).getMap();
    }


    @GetMapping("/detail")
    public String detail(Integer id,ModelMap modelMap){
        Survey survey = surveyService.detail(id);
        modelMap.addAttribute("survey",survey);
        return "survey/update";
    }

    @GetMapping("/question")
    public String question(Integer id,ModelMap modelMap){
        Survey survey = surveyService.detail(id);
        modelMap.addAttribute("survey",survey);
        return "survey/question";
    }

    @GetMapping("/preview/{id}")
    public String preview(@PathVariable("id") Integer id,ModelMap modelMap){
        Survey survey = surveyService.detail(id);
        Question question = new Question();
        question.setSurveyId(survey.getId());
        //查询一个问卷中的所有问题及选项
        List<Question> questions = questionService.query(question);
        //将问题设置为survey的属性
        survey.setQuestions(questions);
        modelMap.addAttribute("survey",survey);
        return "survey/preview";
    }

    @RequestMapping(value = "/upload",method = RequestMethod.POST)
    public String upload(Integer id,@RequestParam("file") MultipartFile multipartFile,HttpServletRequest request){
        //上传的位置
        String path = request.getSession().getServletContext().getRealPath("/upload/");
        //判断该路径是否存在
        File file = new File(path);
        if (!file.exists()) {
            file.mkdirs();
        }
        //上传文件项
        String filename = multipartFile.getOriginalFilename();
        String uuid = UUID.randomUUID().toString().replace("-", "");
        String saveName = uuid + "_" + filename.substring(filename.lastIndexOf(File.separator) + 1);
        try {
            multipartFile.transferTo(new File(path, saveName));
            Survey survey = new Survey();
            survey.setId(id);
            survey.setBgimg(saveName);
            surveyService.update(survey);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:preview/"+id;
    }

    @PostMapping("/publish")
    @ResponseBody
    public Map<String,Object> publish(Integer id,HttpServletRequest request){

        Survey param = surveyService.detail(id);
        if(!Survey.state_exec.equals(param.getState())){
            return MapControl.getInstance().error("操作失败，当前问卷未在执行中！").getMap();
        }
        String uuid = "/dy/"+UUID.randomUUID().toString();
        Survey survey = new Survey();
        survey.setId(id);
        //http://localhost:8080/survey/ieieas-asdf-asdf-3-asd-f-asdf
        String url = "http://"+request.getServerName()+ ":" + request.getServerPort() + request.getContextPath()+uuid;
        survey.setUrl(url);
        surveyService.update(survey);
        return MapControl.getInstance().success().getMap();
    }

    @PostMapping("/submit")
    @ResponseBody
    public Map<String,Object> submit(@RequestBody List<Map<String,Object>> list){

        List<AnswerOpt> optList = new ArrayList();
        List<AnswerTxt> txtList = new ArrayList();

        String uuid = UUID.randomUUID().toString();
        for (Map<String, Object> stringObjectMap : list) {
            if(object2String(stringObjectMap.get("type")).equals("1") || object2String(stringObjectMap.get("type")).equals("2")){
                List<Object> opts = (List<Object>) stringObjectMap.get("opts");
                for (Object opt : opts) {
                    AnswerOpt answerOpt = new AnswerOpt();
                    answerOpt.setQuestionId(object2Integer(stringObjectMap.get("questionId")));
                    answerOpt.setSurveyId(object2Integer(stringObjectMap.get("surveyId")));
                    answerOpt.setType(object2String(stringObjectMap.get("type")));
                    answerOpt.setOptId(object2Integer(opt));
                    answerOpt.setCreateTime(new Date());
                    answerOpt.setVoter(uuid);
                    optList.add(answerOpt);
                }
            }
            if(object2String(stringObjectMap.get("type")).equals("3") || object2String(stringObjectMap.get("type")).equals("4")){
                AnswerTxt answerTxt = new AnswerTxt();
                answerTxt.setQuestionId(object2Integer(stringObjectMap.get("questionId")));
                answerTxt.setSurveyId(object2Integer(stringObjectMap.get("surveyId")));
                answerTxt.setResult(object2String(stringObjectMap.get("result")));
                answerTxt.setCreateTime(new Date());
                answerTxt.setVoter(uuid);
                txtList.add(answerTxt);
            }
        }
        surveyService.submit(optList,txtList);
        return MapControl.getInstance().success().getMap();
    }


    @GetMapping("/query_detail/{id}")
    public String query_detail(@PathVariable("id") Integer id,ModelMap modelMap){
        Survey survey = surveyService.detail(id);
        Question question = new Question();
        question.setSurveyId(survey.getId());
        //查询一个问卷中的所有问题及选项
        List<Question> questions = questionService.query(question);
        //将问题设置为survey的属性
        survey.setQuestions(questions);


        //总投票人数
        AnswerOpt answerOpt = new AnswerOpt();
        answerOpt.setSurveyId(id);
        List<AnswerOpt> answerOpts = surveyService.queryAnswerOpt(answerOpt);
        Set<String> set = new HashSet<String>();
        for (AnswerOpt opt : answerOpts) {
            set.add(opt.getVoter());
        }

        for (Question question1 : questions) {
            for (QuestionOpt questionOpt : question1.getOptions()) {
                int num = 0;
                for (AnswerOpt opt : answerOpts) {
                    if(questionOpt.getId() == opt.getOptId().intValue()){
                        num++;
                    }
                }
                questionOpt.setNum(num);
            }
        }
        modelMap.addAttribute("survey",survey);
        modelMap.addAttribute("total",set.size());
        return "survey/query_detail";
    }


    public String object2String(Object object){
        if(object !=null){
            return object+"";
        }else{
            return null;
        }
    }
    public Integer object2Integer(Object object){
        if(object !=null){
            return Integer.parseInt(object+"");
        }else{
            return null;
        }
    }

    @GetMapping("/my")
    public String my(){
        return  "survey/my";
    }

    @PostMapping("/my_query")
    @ResponseBody
    public Map<String,Object> my_query(@RequestBody Survey survey, ModelMap modelMap){
        PageInfo<Survey> pageInfo = surveyService.queryMySurvey(survey);
        Integer count = surveyService.count(survey);
        return MapControl.getInstance().page(pageInfo.getList(),Integer.parseInt(pageInfo.getTotal()+"")).getMap();
    }




}
