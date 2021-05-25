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
        <form class="layui-form" action="" lay-filter="demo2">
            <input type="hidden" name="id" value="${admin.id}" lay-verify="required" autocomplete="off" placeholder="请输入账号" class="layui-input">
            <div class="layui-form-item">
                <label class="layui-form-label">账号</label>
                <div class="layui-input-block">
                    <input type="text" name="account" lay-verify="required" autocomplete="off" placeholder="请输入账号" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">姓名</label>
                <div class="layui-input-block">
                    <input type="text" name="name" lay-verify="required" autocomplete="off" placeholder="请输入姓名" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">手机</label>
                <div class="layui-input-block">
                    <input type="text" name="phone" lay-verify="phone" value="18533333333" autocomplete="off" placeholder="请输入手机" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">备注</label>
                <div class="layui-input-block">
                    <textarea placeholder="请输入备注" name="remark" class="layui-textarea"></textarea>
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
    layui.use(['form','jquery','layer'], function () {
        var form = layui.form,$=layui.jquery,layer=layui.layer,layer = layui.layer;
        //监听提交
        var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
        form.on('submit(demo1)', function (data) {
            $.ajax({
               url:"update",
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

        form.val('demo2', {
            "account":"${admin.account}",
            "name":"${admin.name}",
            "phone":"${admin.phone}",
            "remark":"${admin.remark}",
        })
    });
</script>

</body>
</html>