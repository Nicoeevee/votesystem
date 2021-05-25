<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>管理员列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../static/lib/layui-src/css/layui.css" media="all">
    <link rel="stylesheet" href="../static/lib/font-awesome-4.7.0/css/font-awesome.css" media="all">
    <link rel="stylesheet" href="../static/css/public.css" media="all">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">
        <fieldset class="table-search-fieldset">
            <legend>查询条件</legend>
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">标题</label>
                            <div class="layui-input-inline">
                                <input type="text" name="title" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">状态</label>
                            <div class="layui-input-inline">
                                <select name="state" lay-filter="state">
                                    <option value="">请选择</option>
                                    <option value="创建">创建</option>
                                    <option value="执行中">执行中</option>
                                    <option value="结束">结束</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <button type="submit" class="layui-btn "  lay-submit lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索</button>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>

        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-sm layui-btn-sm data-delete-btn" lay-event="query_detail">
                    <i class="fa fa-search"></i>
                    问卷详情
                </button>
            </div>
        </script>
        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>


    </div>
</div>
<script src="../static/lib/layui-src/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'table'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({
            elem: '#currentTableId',
            url: 'my_query',
            toolbar: '#toolbarDemo',
            contentType: 'application/json',
            method:"post",
            defaultToolbar: ['filter', 'exports', 'print'],
            cols: [[
                {type: "checkbox", width: 50},
                {field: 'id', width: 80, title: 'ID', sort: true},
                {field: 'title', title: '问卷标题'},
                {field: 'url',width:500, title: '问卷URL'},
                {field: 'startTime', width: 200, title: '开始时间'},
                {field: 'endTime', width: 200, title: '结束时间'},
                {field: 'state', width: 130, title: '状态'},
                {field: 'name', width: 100, title: '创建人',templet:'<div>{{d.admin.name}}</div>'},
                {field: 'createTime',width: 200,title: '创建时间'}
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 15,
            page: true,
            skin: 'line'
        });

        // 监听搜索操作
        form.on('submit(data-search-btn)', function (data) {
            var result = JSON.stringify(data.field);
            /*layer.alert(result, {
                title: '最终的搜索信息'
            });*/
            //执行搜索重载
            table.reload('currentTableId', {
                page: {
                    curr: 1
                },
                contentType:'application/json',
                where: data.field
            }, 'data');

            return false;
        });

        /**
         * toolbar监听事件
         */
        table.on('toolbar(currentTableFilter)', function (obj) {
            if(obj.event === 'query_detail'){
                var checkStatus = table.checkStatus('currentTableId')
                    , data = checkStatus.data;
                var arr=[];
                for(index in data){
                    arr.push(data[index].id);
                }
                if(arr.length !=1){
                    layer.msg("请选择一行数据查看",{time:1000});
                    return;
                }
                if(data[0].url == ""){
                    layer.msg("请先发布再查看详情",{time:1000});
                    return;
                }
                window.open("query_detail/"+arr[0]);
            }
        });

        //监听表格复选框选择
        table.on('checkbox(currentTableFilter)', function (obj) {

        });

    });
</script>

</body>
</html>
