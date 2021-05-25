<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${survey.title}</title>
    <link rel="stylesheet" href="../static/lib/layui-src/css/layui.css" media="all">
    <link rel="stylesheet" href="../static/css/question.css" media="all">
    <style>
        .bg{
            background-image: url("../upload/${survey.bgimg}");
            background-size: 100% 100%;
            margin:0px;
            padding: 0px;
        }
    </style>
</head>
<body class="bg">
<div style="text-align: center;font-size: 24px;padding-top: 20px;box-sizing: border-box;">
    ${survey.title}
</div>
<div style="text-align: center;font-size: 16px;padding-top: 20px;box-sizing: border-box;color: #999;">
    ${survey.remark}
</div>
<div class="layuimini-container" style="position: absolute;bottom: 0px;top:100px;left: 0px;right:0px;margin: 10px;">
    <div class="preview" id="preview" style="overflow: auto;">
        <ul class="content">
            <c:forEach items="${survey.questions}" var="question" varStatus="status">
                <c:if test="${question.type == 1  or question.type == 2 }">
                    <div class="radioTemplate spliter">
                        <li class="using radio">
                            <input type="hidden" name="questionId" xtype="${question.type}" value="${question.id}">
                            <div class="title">
                                <div class="no_edit"><strong>${status.index+1}、${question.title}</strong></div>
                                <c:if test="${question.remark != null && question.remark != ''}">
                                    <div class="no_edit">${question.remark}</div>
                                </c:if>
                            </div>
                            <div class="options">
                                <ul>
                                    <c:forEach items="${question.options}" var="option">
                                        <li>
                                           <table>
                                               <tr>
                                                   <td>
                                                       <c:if test="${question.type == 1}"><input class="myselect" type="radio" name="r${question.id}" value="${option.id}"></c:if>
                                                       <c:if test="${question.type == 2}"><input class="myselect" type="checkbox" name="r${question.id}" value="${option.id}"></c:if>
                                                   </td>
                                                   <td>${option.opt}</td>
                                               </tr>
                                           </table>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </li>
                    </div>
                </c:if>
                <c:if test="${question.type == 3  or question.type == 4 }">
                    <div class="inputTemplate spliter">
                        <li class="using inputx">
                            <input type="hidden" name="questionId" xtype="${question.type}" value="${question.id}">
                            <div class="title">
                                <div class="no_edit"><strong>${status.index+1}、${question.title}</strong></div>
                                <c:if test="${question.remark != null && question.remark != ''}">
                                    <div class="no_edit">${question.remark}</div>
                                </c:if>
                            </div>
                            <div>
                            <c:if test="${question.type == 3 }">
                                <input type="text"  class="inputx" id="r${question.id}">
                            </c:if>
                               <c:if test="${question.type == 4 }">
                                   <textarea class="mytext" id="r${question.id}"></textarea>
                               </c:if>
                            </div>
                        </li>
                    </div>
                </c:if>
            </c:forEach>
            <li style="text-align: center">
                <button class="layui-btn mysave">立即提交</button>
            </li>
        </ul>
    </div>
    <div>
    </div>
</div>
<script src="../static/lib/layui-src/layui.js" charset="utf-8"></script>
<script src="../static/js/lay-config.js" charset="utf-8"></script>
<script>
    layui.use(['jquery','layer'],function () {
        let $ = layui.jquery, layer = layui.layer;

        $('.mysave').click(function(){
            var optionArray = $('.myselect');
            optionArray.each(function(index){
                //console.log($(this).prop("name"));
            })
            var list = [];//待提交的数组
            var questionArr = $('input[name="questionId"]');
            questionArr.each(function(index){
                var that = $(this);
                var obj = {};
                obj.questionId = $(this).val();
                obj.surveyId = "${survey.id}";
                obj.type = $(this).attr("xtype");
                //一个问题产生一个数组结果
                if(obj.type == 1 || obj.type == 2){
                    var tmp = [];
                    optionArray.each(function(index){
                        if($(this).prop("name") == ("r"+that.val())){
                            if($(this).prop("checked")){
                                tmp.push($(this).val());
                            }
                        }
                    })
                    obj.opts = tmp;
                }else {
                    obj.result = $("#r"+that.val()).val();
                }
                list.push(obj);
            })

            $.ajax({
                url:"../survey/submit",
                type:"POST",
                contentType:'application/json',
                dataType:'json',
                data:JSON.stringify(list),
                success:function(data){
                    layer.msg(data.msg,{time:500},
                        function(){
                        window.location.href="success";
                    });
                }
            });
        });



    });
</script>
</body>
</html>