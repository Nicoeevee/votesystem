<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="static/lib/layui-src/css/layui.css" media="all">
    <style>
        html, body {width: 100%;height: 100%;overflow: hidden}
        body {background: url("static/images/login_bg.jpg");}
        body:after {content:'';background-repeat:no-repeat;background-size:cover;-webkit-filter:blur(3px);-moz-filter:blur(3px);-o-filter:blur(3px);-ms-filter:blur(3px);filter:blur(3px);position:absolute;top:0;left:0;right:0;bottom:0;z-index:-1;}
        .layui-container {width: 100%;height: 100%;overflow: hidden}
        .admin-login-background {width:560px;height:300px;position:absolute;left:50%;top:40%;margin-left:-180px;margin-top:-100px;}
        .logo-title {text-align:center;letter-spacing:2px;padding:14px 0;}
        .logo-title h1 {color:#1E9FFF;font-size:25px;font-weight:bold;}
        .login-form {background-color:#fff;border:1px solid #fff;border-radius:3px;padding:14px 20px;box-shadow:0 0 8px #eeeeee;}
        .login-form .layui-form-item {position:relative;}
        .login-form .layui-form-item label {position:absolute;left:1px;top:1px;width:38px;line-height:36px;text-align:center;color:#d2d2d2;}
        .login-form .layui-form-item input {padding-left:36px;}
        .captcha-img img {height:34px;border:1px solid #e6e6e6;height:36px;width:100%;}
        .layui-form-label{color: #000000 !important;}
    </style>
</head>
<body>
<div class="layuimini-container">
    <div class="admin-login-background">
    <div class="layuimini-main">
        <div class="layui-form login-form">
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <label class="layui-form-label">账号</label>
                <div class="layui-input-block">
                    <input type="text" name="account" lay-verify="required" autocomplete="off" placeholder="请输入账号" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-block">
                    <input type="password" name="password" lay-verify="required" autocomplete="off" placeholder="请输入密码" class="layui-input">
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
                    <input type="text" name="phone"  autocomplete="off" placeholder="请输入手机" class="layui-input">
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
                    <button class="layui-btn layui-btn-fluid" lay-submit="" lay-filter="demo1">注册提交</button>
                </div>
            </div>
        </form>
        </div>
    </div>
    </div>
</div>

<script src="static/lib/layui-src/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use(['form','jquery','layer'], function () {
        var form = layui.form,$=layui.jquery,layer=layui.layer,layer = layui.layer;
        //监听提交
        var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
        form.on('submit(demo1)', function (data) {
            $.ajax({
               url:"reg",
               type:"POST",
               contentType:'application/json',
               dataType:'json',
               data:JSON.stringify(data.field),
               success:function(data){
                   layer.msg(data.msg,{time:500},
                   function(){
                       if(data.code  != 500){
                           window.location.href = 'login';
                       }
                   });
                }
            });
            return false;
        });
    });
</script>

</body>
</html>