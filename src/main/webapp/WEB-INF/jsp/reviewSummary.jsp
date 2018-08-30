<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>评审汇总信息</title>
    <link rel="stylesheet" href="/css/bootstrap.css" rel="stylesheet" >
    <link rel="stylesheet" href="/css/bootstrap-table.min.css" rel="stylesheet" >
    <script src="/css/jquery-3.3.1.min.js"></script>
    <script src="/css/bootstrap.js"></script>
    <script src="/css/bootstrap-table.min.js"></script>
    <script src="/css/bootstrap-table-zh-CN.js"></script>
</head>
<body>
<div class="panel-body" style="padding-bottom:0px;">
    <div class="panel panel-default">
        <div class="panel-heading">查询条件</div>
        <div class="panel-body">
            <form id="formSearch" class="form-horizontal">
                <div class="form-group" style="margin-top:15px">
                    <label class="control-label col-sm-2" for="txt_search_prjName">项目名称</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="txt_search_prjName">
                    </div>
                    <div class="col-sm-4" style="text-align:left;">
                        <button type="button" style="margin-left:50px" id="btn_query" class="btn btn-primary">查询</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <div id="toolbar" class="btn-group" >
        <button id="btn_add" type="button" class="btn btn-default" onclick="addPrj()">
            <span class="glyphicon-plus" aria-hidden="true"></span>新增
        </button>
        <button id="btn_edit" type="button" class="btn btn-default" >
            <span class="glyphicon-pencil" aria-hidden="true"></span>修改
        </button>
        <button id="btn_delete" type="button" class="btn btn-default">
            <span class="glyphicon-remove" aria-hidden="true"></span>删除
        </button>
    </div>
    <table id="tb_departments"></table>
</div>

<div id="myModal" class="modal hide fade">
    <div class="modal-body">
        <iframe id="myIframe" width="100%" height="100%"></iframe>
    </div>
</div>
</body>
<script type="text/javascript">
    function addPrj(){
        $("#myIframe").attr("src","http://localhost:8080/reviewInfo/addInfo");
        $('#myModal').modal({show:true});
    }

    $(function () {
        //1.初始化Table
        var oTable = new TableInit();
        oTable.Init();
        //2.初始化Button的点击事件
        var oButtonInit = new ButtonInit();
        oButtonInit.Init();
    });

    var TableInit = function () {
        var oTableInit = new Object();
        //初始化Table
        oTableInit.Init = function () {
            $('#tb_departments').bootstrapTable({
                url: '/reviewInfo/getSummaryList',         //请求后台的URL（*）
                contentType : "application/x-www-form-urlencoded",
                method: 'post',                      //请求方式（*）
                toolbar: '#toolbar',                //工具按钮用哪个容器
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
                sortable: false,                     //是否启用排序
                sortOrder: "asc",                   //排序方式
                queryParams: oTableInit.queryParams,//传递参数（*）
                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                pageNumber:1,                       //初始化加载第一页，默认第一页
                pageSize: 10,                       //每页的记录行数（*）
                showColumns: false,                  //是否显示所有的列
                minimumCountColumns: 2,             //最少允许的列数
                clickToSelect: true,                //是否启用点击选中行
                height: 380,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: "reviewprjId",                     //每一行的唯一标识，一般为主键列
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                columns: [{
                    checkbox: true
                }, {
                    field: 'prjName',
                    title: '项目名称'
                }, {
                    field: 'prjDept',
                    title: '项目部门'
                }, {
                    field: 'prjUnit',
                    title: '项目单位'
                }, {
                    field: 'prjInfo',
                    title: '项目简介'
                }, {
                    field: 'prjYear',
                    title: '项目年度'
                }, {
                    field: 'startTime',
                    title: '开始时间',
                    formatter: function (value, row, index) {
                        return changeDateFormat(value)
                    }
                }, {
                    field: 'endTime',
                    title: '结束时间',
                    formatter: function (value, row, index) {
                        return changeDateFormat(value)
                    }
                }, ]
            });
        };
        return oTableInit;

        //得到查询的参数
        oTableInit.queryParams = function (params) {
            var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                limit: params.limit,   //页面大小
                offset: params.offset,  //页码
                prjName: $("#txt_search_prjName").val()
            };
            return temp;
        };
    };


    var ButtonInit = function () {
        var oInit = new Object();
        var postdata = {};
        oInit.Init = function () {
            //初始化页面上面的按钮事件
        };
        return oInit;
    };

    function changeDateFormat(cellval) {
        if (cellval != null) {
            return  cellval.substring(0,10);
            /*
            var date = new Date(parseInt(cellval.replace("/Date(", "").replace(")/", ""), 10));
            var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
            var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
            return date.getFullYear() + "-" + month + "-" + currentDate;
            */
        }
    }
</script>
</html>
