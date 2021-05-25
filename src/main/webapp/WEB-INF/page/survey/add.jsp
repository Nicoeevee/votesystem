<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../static/lib/layui-src/css/layui.css" media="all">
    <link rel="stylesheet" href="../static/css/public.css" media="all">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <label class="layui-form-label">标题</label>
                <div class="layui-input-block">
                    <input type="text" name="title" lay-verify="required" autocomplete="off"  class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">开始时间</label>
                    <div class="layui-input-inline">
                        <input type="text" name="startTime" id="startTime" lay-verify="datetime" placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">结束时间</label>
                    <div class="layui-input-inline">
                        <input type="tel" name="endTime" id="endTime" lay-verify="datetime" autocomplete="off" placeholder="yyyy-MM-dd HH:mm:ss"  class="layui-input">
                    </div>
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">说明</label>
                <div class="layui-input-block">
                    <input type="text" name="remark" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">限制</label>
                <div class="layui-input-inline">
                    <select name="bounds" lay-filter="bounds">
                        <option value="0">不限制</option>
                        <option value="1">IP限制</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">访问规则</label>
                <div class="layui-input-inline">
                    <select name="rules" lay-filter="rules">
                        <option value="0">公开访问</option>
                        <option value="1">密码访问</option>
                    </select>
                </div>
                <div class="layui-input-inline">
                    <input type="text" name="password" id="password" placeholder="请设置访问密码" autocomplete="off" style="display: none;" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">匿名访问</label>
                <div class="layui-input-block">
                    <input type="checkbox" checked name="anon" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF" value="0">
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                </div>
            </div>

        </form>


    </div>
</div>

<script src="../static/lib/layui-src/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['form','jquery','layer','laydate'], function () {
        var form = layui.form,$=layui.jquery,layer=layui.layer,laydate=layui.laydate,layer = layui.layer;
        laydate.render({
            elem:"#startTime",
            type: 'datetime'
        })
        laydate.render({
            elem:"#endTime",
            type: 'datetime'
        })

        //监听提交
        var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
        form.on('submit(demo1)', function (data) {
            $.ajax({
               url:"create",
               type:"POST",
               contentType:'application/json',
               dataType:'json',
               data:JSON.stringify(data.field),
               success:function(data){
                   layer.msg(data.msg,{time:500},
                   function(){
                       parent.layer.close(index);
                   });
                }
            });
            return false;
        });

        form.on('select(rules)', function (data) {
            if(data.value == "1"){
                $('#password').show();
            }else{
                $('#password').hide();
            }
        });
    });
</script>

</body>
</html>