<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>

    <title></title>
    <link rel="stylesheet" href="/css1/bootstrap.min.css">
    <link rel="stylesheet" href="/css/bootstrap-table.min.css">
    <link rel="stylesheet" href="/css1/fileinput.min.css">
    <link rel="stylesheet" href="/css1/fileinput.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.5.0/js/fileinput.min.js"></script>
    <script src="/js/jquery-3.3.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/css/bootstrap-table.min.js"></script>
    <script src="/js/bootstrap-table-zh-CN.js"></script>
    <%=request.getContextPath()%>
</head>

<body>
<div class="panel panel-default">
    <div class="panel-heading">
        查询条件
    </div>
    ${PsInfoFill}
    <div class="panel-body form-group" style="margin-bottom:0px;">
        <label class="col-sm-1 control-label" style="text-align: right; margin-top:5px">名称：</label>
        <div class="col-sm-2">
            <input type="text" class="form-control" name="reName" id="search_name"/>
        </div>
        <label class="col-sm-1 control-label" style="text-align: right; margin-top:5px">年度：</label>
        <div class="col-sm-2">
            <input type="text" class="form-control" name="reYear" id="search_year"/>
        </div>
        <div class="col-sm-1 col-sm-offset-4">
            <button class="btn btn-primary" id="search_btn">查询</button>
        </div>
    </div>

</div>
<table id="mytab" class="table table-hover"></table>
<div id="toolbar" class="btn-group pull-right" style="margin-right: 20px;">
    <button id="btn_edit" type="button" class="btn btn-default">
        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
    </button>
    <button id="btn_delete" type="button" class="btn btn-default">
        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
    </button>
    <button id="btn_add" type="button" class="btn btn-default">
        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
    </button>
</div>
<div id="editModal" class="modal fade"  role="dialog"   aria-hidden=true>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >信息填报</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="uuid"></label>
                    <input  type="hidden" name="uuid"  class="form-control" id="uuid" >
                </div>
                <div class="form-group">
                    <label for="reName">名称</label>
                    <input type="text" name="reName" class="form-control" id="reName" placeholder="xxxx奖项目">
                </div>
                <div class="form-group">
                    <label for="rePrj">所属项目</label>
                    <input type="text" name="rePrj" class="form-control" id="rePrj" placeholder="xxxx项目">
                </div>
                <div class="form-group">
                    <label for="reUnit">所属单位</label>
                    <input type="text" name="reUnit" class="form-control" id="reUnit" placeholder="xxxx单位">
                </div>
                <div class="form-group">
                    <label for="reYear">年份</label>
                    <input type="text" name="reYear" class="form-control" id="reYear" placeholder="2018年">
                </div>
            </div>

            <div class="modal-footer bg-info">
                <input type="hidden" id="ID" name="ID" />
                <button type="submit" class="btn btn-primary"  onclick ="saveInfo()">确定</button>
                <button type="button" class="btn green" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<div id="filemodel"  class="modal fade"  role="dialog" >
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >附件上传</h4>
            </div>
            <div class="modal-body">
                <form method="POST" enctype="multipart/form-data" action="/upload">
                    <input type="file" name="file"><br />
                    <input type="file" name="file"><br />
                    <input type="text" name="uuidName" id="uuidName" hidden="ture">
                    <input type="submit" value="上传">
                </form>
            </div>
            <div class="modal-footer bg-info">
                <button type="button" class="btn green" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

</body>
<script>

    //根据窗口调整表格高度
    $(window).resize(function () {
        $('#mytab').bootstrapTable('resetView', {
            height: tableHeight()
        })
    })
    //生成用户数据
    $('#mytab').bootstrapTable({
        method: 'post',
        contentType: "application/x-www-form-urlencoded",//必须要有！！！！
        url: "/PsInfoFill/getPsInfoFillList",//要请求数据的文件路径
        height: tableHeight(),//高度调整
        toolbar: '#toolbar',//指定工具栏
        striped: true, //是否显示行间隔色
        // dataField: "res",//bootstrap table 可以前端分页也可以后端分页，这里
        // // //我们使用的是后端分页，后端分页时需返回含有  total：总记录数,这个键值好像是固定的
        // // //rows： 记录集合 键值可以修改  dataField 自己定义成自己想要的就好
        // showPaginationSwitch: true,//是否显示分页数按钮

        sidePagination: 'server',//指定服务器端分页
        pagination: true,//是否分页
        pageNumber: 1, //初始化加载第一页，默认第一页
        pageSize: 10,//单页记录数
        pageList: [10, 20, 30],//分页步进值
        uniqueId: 'uuid',//每一行的唯一标识，一般为主键列
        // showRefresh:true,//刷新按钮
        queryParamsType: 'limit',//查询参数组织方式
        queryParams: queryParams,//请求服务器时所传的参数
        showColumns: true,
        clickToSelect: true,//是否启用点击选中行
        toolbarAlign: 'right',//工具栏对齐方式
        buttonsAlign: 'right',//按钮对齐方式
        columns: [{
            checkbox: true
        }, {
            field: 'reName',
            title: '名称'
        }, {
            field: 'rePrj',
            title: '所属项目'
        }, {
            field: 'reYear',
            title: '所属年度'
        }, {
            field: 'reUnit',
            title: '所属单位'
        }, {
            field:'operation',
            title:'操作',
            align:'center',
            formatter: upload,
        }],
        locale: 'zh-CN',//中文支持,
        responseHandler: function (res) {
            //在ajax获取到数据，渲染表格之前，修改数据源
            return res;
        }
    })
    //上传
    function upload(value, row, index) {
        var uuid=row.uuid;
        return [
            '<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" onclick="uploadPage('+uuid+')">\n' +
            ' 上传'+
            '</button>'
        ].join('');
    }
    function uploadPage(id){
        // var str=window.location.origin;
        // location.href = str+"/PsInfoFill/uploadjsp?uuid="+id;
        //$('#filemodel').modal({show:true});
        $('#filemodel').modal("show")
        $("#uuidName").attr("value",id);
    }
    //请求服务数据时所传参数
    function queryParams(params) {
        return {
            //每页多少条数据
            pageSize: params.limit,
            //请求第几页
            pageIndex: params.pageNumber,
            reName: $('#search_name').val(),
            reYear: $('#search_year').val()
        }
    }

    //查询按钮事件
    $('#search_btn').click(function () {
        $('#mytab').bootstrapTable('refresh', {url: '/PsInfoFill/getPsInfoFillList'});
    })
    //删除按钮事件
    $('#btn_delete').click(function () {
        var row = $.map($("#mytab").bootstrapTable('getSelections'), function (row) {
            return row;
        });
        if (row.length != 1) {
            alert("请选择一条数据！");
        }
        ;
        $.ajax({
            url: "/PsInfoFill/delete",
            data: row[0].uuid,
            dataType: "json",
            contentType: "application/json;charset=utf-8",
            type: "post",
            success: function (data) {
                if (data == 1) {
                    alert("删除成功！");
                    $('#mytab').bootstrapTable('refresh', {url: '/PsInfoFill/getPsInfoFillList'});
                } else {
                    alert("删除失败");
                }

            }, error: function () {
                alert("ajax请求错误！");
            }
        });
    })
    //新增事件
    $('#btn_add').click(function () {
        $('#editModal').modal({show:true});

    })


    //tableHeight函数
    function tableHeight() {
        //可以根据自己页面情况进行调整
        return $(window).height() - 280;

    }
    //新增保存
    function saveInfo() {
        var reName = $("#reName").val();
        var rePrj = $("#rePrj").val();
        var reYear = $("#reYear").val();
        var reUnit =$("#reUnit").val();
        var uuid=$("#uuid").val();
        var data = {reName: reName, rePrj: rePrj, reYear: reYear, reUnit: reUnit,uuid:uuid};
        $.ajax({
            url: "/PsInfoFill/saveInfo",
            data: JSON.stringify(data),
            dataType: "json",
            contentType: "application/json;charset=utf-8",
            type: "post",
            success: function (data) {
                if (data == 1) {
                    alert("保存成功！");
                    $("#editModal").modal("hide");
                    $('#mytab').bootstrapTable('refresh', {url:"/PsInfoFill/getPsInfoFillList"});
                } else {
                    alert("保存失败");
                }

            }, error: function () {
                alert("ajax请求错误！");
            }
        });
    }
    //修改
    $('#btn_edit').click(function () {
        var row = $.map($("#mytab").bootstrapTable('getSelections'), function (row) {
            return row;
        });
        if (row.length != 1) {
            alert("请选择一条数据！");
        };
        $("#reName").attr("value",row[0].reName);
        $("#rYear").attr("value",row[0].reYear);
        $("#rePrj").attr("value",row[0].rePrj);
        $("#reUnit").attr("value",row[0].reUnit);
        $("#uuid").attr("value",row[0].uuid);
        $("#editModal").modal('show');

    })
</script>
</html>
