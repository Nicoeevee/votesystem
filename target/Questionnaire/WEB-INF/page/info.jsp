<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <style>
        .layui-card-body ul {
            list-style: none;
        }

        .layui-card-body ul li {
            float: left;
            padding: 5px;
        }

        .layui-card-body ul li:hover {
            background-color: #f0f0f0;
        }

        .layui-card-body ul li table {
            width: 150px;
        }

        .layui-card-body ul li table i {
            font-size: 36px;
            color: #1aa094
        }

        .layui-card-body ul li table .number {
            font-size: 24px;
            color: red
        }

        .layui-card-body ul li table .txt {
            color: #888888;
        }
    </style>
    <link rel="icon" href="images/favicon.ico">
    <link rel="stylesheet" href="static/lib/layui-src/css/layui.css" media="all">
    <link rel="stylesheet" href="static/css/layuimini.css?v=2.0.4.2" media="all">
    <link rel="stylesheet" href="static/css/themes/default.css" media="all">
    <link rel="stylesheet" href="static/lib/font-awesome-4.7.0/css/font-awesome.min.css" media="all">
</head>
<body>
<div class="layui-fluid">

    <div class="layui-row layui-col-space15" style="margin-top: 10px;">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">个人资料</div>
                <div class="layui-card-body">
                    <div style="height: 520px">
                        <form class="layui-form">
                                <div class="layui-form-item">
                                    <label class="layui-form-label">ID</label>
                                    <div class="layui-input-block">
                                        <input class="layui-input" readonly value="${admin.id}">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">账号</label>
                                    <div class="layui-input-block">
                                        <input class="layui-input" readonly value="${admin.account}">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">姓名</label>
                                    <div class="layui-input-block">
                                        <input class="layui-input" readonly value="${admin.name}">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">手机</label>
                                    <div class="layui-input-block">
                                        <input class="layui-input" readonly value="${admin.phone}">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">备注</label>
                                    <div class="layui-input-block">
                                        <input class="layui-input" readonly value="${admin.remark}">
                                    </div>
                                </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<script>
    layui.use(['form'], function () {

    });
</script>
</body>
</html>
