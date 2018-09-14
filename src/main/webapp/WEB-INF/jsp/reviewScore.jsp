<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>专家打分信息</title>
    <link rel="stylesheet" href="/css/bootstrap.css" rel="stylesheet" >
    <link rel="stylesheet" href="/css/bootstrap-select.min.css" rel="stylesheet" >
    <link rel="stylesheet" href="/css/bootstrap-table.min.css" rel="stylesheet" >

    <link rel="stylesheet" href="/css/bootstrap-editable.css" rel="stylesheet" >

    <script src="/css/jquery-3.3.1.min.js"></script>
    <script src="/css/bootstrap.js"></script>
    <script src="/css/bootstrap-table.min.js"></script>
    <script src="/css/bootstrap-table-zh-CN.js"></script>
    <script src="/css/bootstrap-select.min.js"></script>
    <script src="/css/bootstrap-editable.min.js"></script>
</head>
<body>
<div>

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
                        <button type="button" style="margin-left:50px" id="btn_query"  class="btn btn-primary" onclick="queryById()">查询</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div id="toolbar" class="btn-group" >
        <button id="btn_add" type="button" class="btn btn-primary" onclick="addScore()">
            <span class="glyphicon-plus" aria-hidden="true"></span>新增
        </button>
        <button id="btn_delete" type="button" class="btn btn-primary" onclick="btn_delete()">
            <span class="glyphicon-remove" aria-hidden="true"></span>删除
        </button>
    </div>
    <table id="tb_departments"></table>
</div>

<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-body">
        <iframe id="myIframe" width="100%" height="90%"></iframe>
    </div>
</div>

    <div id="editModal" class="modal fade"  role="dialog"   aria-hidden=true>
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" >打分</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="scoreId"></label>
                        <input  type="hidden" name="scoreUserName"  class="form-control" id="scoreId" >
                    </div>
                    <div class="form-group">
                        <label for="scoreUserName">专家名称</label>
                        <input type="text" name="scoreUserName" class="form-control" id="scoreUserName" placeholder="专家名称">
                    </div>
                    <div class="form-group">
                        <label for="reviewName">项目名称</label>
                        <input type="text" name="reviewName" class="form-control" id="reviewName" placeholder="项目名称">
                    </div>
                    <div class="form-group">
                        <label for="scoreValue">分值</label>
                        <input type="text" name="scoreValue" class="form-control" id="scoreValue" placeholder="分值">
                    </div>
                    <div class="form-group">
                        <label for="scoreUserDesc">专家批语</label>
                        <input type="text" name="txt_statu" class="form-control" id="scoreUserDesc" placeholder="专家批语">
                    </div>
                </div>

                <div class="modal-footer bg-info">
                    <input type="hidden" id="ID" name="ID" />
                    <button type="submit" class="btn btn-primary"  onclick ="grade()">确定</button>
                    <button type="button" class="btn green" data-dismiss="modal">取消</button>
                </div>

            </div>
        </div>
    </div>

    <!-- 模态框（Modal） -->
    <div class="modal fade" id="addModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        评审专家打分信息填写
                    </h4>
                </div>
                <div class="modal-bady">
                    <form id="form_data" class="bs-example bs-example-form" role = "form">
                        <div class="form-group">
                            <label for="scoreUserId1">专家ID</label>
                            <input type="text" name="scoreUserId" class="form-control" id="scoreUserId1" placeholder="专家ID">
                        </div>
                        <div class="form-group">
                            <label for="scoreUserName">专家名称</label>
                            <input type="text" name="scoreUserName" class="form-control" id="scoreUserName1" placeholder="专家名称">
                        </div>

                        <div class="form-group" >
                            <label >项目名称</label><br>
                            <select id="selectPrj" class="form-control">
                                <option></option>
                            </select>
                        </div>

                    </form>
                </div>
                <div class="modal-footer bg-info>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" onclick="add_info()" class="btn btn-primary">
                        保存
                    </button>
                </div>

            </div><!-- /.modal-content -->
        </div><!-- /.modal -->

    </div>
</body>
<script type="text/javascript">

    function queryById(){
        var prjName = $("#txt_search_prjName").val();
        if(prjName!=""){
        $.ajax({
            type : 'POST',
            url : "/reviewInfo/queryById?prjName="+prjName,
            contentType: "application/json;charset=utf-8",
            dataType : "json",
            success : function(datas) {//返回list数据并循环获取
                $("#tb_departments").bootstrapTable('load', datas);
            }
        });}
        else{
            $.ajax({
                type : 'POST',
                url : "/reviewInfo/getScoreList",
                contentType: "application/json;charset=utf-8",
                dataType : "json",
                success : function(data) {//返回list数据并循环获取
                    $("#tb_departments").bootstrapTable('load',data);

                }
            });
        }
    }

    function add_info(){
        var scoreUserId1 = $("#scoreUserId1").val();
        var scoreUserName1= $("#scoreUserName1").val();
        var reviewprjId= $("#selectPrj").val();
        var reviewName = $("#selectPrj").find("option:selected").text();
        var datas =[
            {"scoreUserId1":scoreUserId1,"scoreUserName1":scoreUserName1,"reviewprjId":reviewprjId,"reviewName":reviewName}
                ];

        $.ajax({
            type : 'POST',
            url : "/reviewInfo/addScore",
            contentType: "application/json;charset=utf-8",
            data :JSON.stringify(
                datas
            ) ,
            dataType : "json",
            success : function(data) {//返回list数据并循环获取
             if(data=="S"){
                 $('#addModal1').modal('hide');
                 alert("添加成功！");
                 var opt = {
                     url: "/reviewInfo/getScoreList",
                     silent: true,
                 };
                 $('#tb_departments').bootstrapTable('refresh',opt);
             }
            },
            error:function(){
            }
        });

    }

    function addScore(){

        $('#addModal1').modal({show:true});
        /*$.ajax({
            type : 'POST',
            url : "/reviewInfo/getSummaryList",
            contentType: "application/json;charset=utf-8",
            dataType : "json",
            success : function(data) {//返回list数据并循环获取
               var modelList = data.rows;
                for(var i =0;i<data.total;i++){
                    $("#sel_driver").append("<option value='"+modelList[i].reviewprjId+"'>"+modelList[i].prjName+"</option>");
                }
                $('#sel_driver').selectpicker('refresh');//最后重新刷新bootstrap-select的样式 这句很重要，不加不行
            },
            error:function(){
            }
        });*/

    }

    function grade(){
        var scoreId = $("#scoreId").val();
        var scoreUserName = $("#scoreUserName").val();
        var reviewName= $("#reviewName").val();
        var scoreValue = $("#scoreValue").val();
        var scoreUserDesc= $("#scoreUserDesc").val();
        var datas =[
            {"scoreId":scoreId,"scoreUserName":scoreUserName,"reviewName":reviewName,"scoreValue":scoreValue,"scoreUserDesc":scoreUserDesc}];
        $.ajax({
            type : 'POST',
            url : "/reviewInfo/grade",
            contentType: "application/json;charset=utf-8",
            data :JSON.stringify(
                datas
            ) ,
            dataType : "json",
            success : function(data) {//返回list数据并循环获取
                if(data=="S"){
                    $('#addModal1').modal('hide');
                    alert("添加成功！");
                    var opt = {
                        url: "/reviewInfo/getScoreList",
                        silent: true,
                    };
                    $('#tb_departments').bootstrapTable('refresh',opt);
                }
            },
            error:function(){
            }
        });
    }
   function btn_delete(){
        var row= $('#tb_departments').bootstrapTable('getSelections',function (row) {
                   return row;
        });

       if(row.length==0){
           alert("请选择一条数据进行删除！");
       }
       $.ajax({
           type : 'post',
           url : '/reviewInfo/delete',
           contentType: "application/json;charset=utf-8",
           data:JSON.stringify(row),
           dataType : "json",
           success : function(result) {//返回list数据并循环获取
               if(result="S")
               alert("删除成功!");
               var opt = {
                   url: "/reviewInfo/getScoreList",
                   silent: true,
               };
               $('#tb_departments').bootstrapTable('refresh',opt);

               },
           error : function (){
               alert("删除失败");
                },
           });
       }

    $(function () {
        //1.初始化Table
        var oTable = new TableInit();
        $.ajax({
            type : 'POST',
            url : "/reviewInfo/getSummaryList",
            contentType: "application/json;charset=utf-8",
            dataType : "json",
            success : function(data) {//返回list数据并循环获取
                var modelList = data.rows;
                for(var i =0;i<data.total;i++){
                    $("#selectPrj").append("<option value='"+modelList[i].reviewprjId+"'>"+modelList[i].prjName+"</option>");
                }
               // $('#selectPrj').selectpicker('refresh');//最后重新刷新bootstrap-select的样式 这句很重要，不加不行
            },
            error:function(){
            }
        });

        oTable.Init();
        $('#tb_departments').bootstrapTable('hideColumn', 'scoreId');
        $('#tb_departments').bootstrapTable('hideColumn', 'scoreUserId');

        //2.初始化Button的点击事件
        var oButtonInit = new ButtonInit();
        oButtonInit.Init();

    });

    var TableInit = function () {
        var oTableInit = new Object();
        //初始化Table
        oTableInit.Init = function () {
            $('#tb_departments').bootstrapTable({
               // editable:true,//开启编辑模式
                url: '/reviewInfo/getScoreList',         //请求后台的URL（*）
                contentType : "application/x-www-form-urlencoded",
                method: 'post',                      //请求方式（*）
                toolbar: '#toolbar',                //工具按钮用哪个容器
                striped: true,                      //是否显示行间隔色
                cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                pagination: true,                   //是否显示分页（*）
                sortable: false,                     //是否启用排序
                sortOrder: "asc",                   //排序方式
                //queryParams: oTableInit.queryParams,//传递参数（*）
                sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
                pageNumber:1,                       //初始化加载第一页，默认第一页
                pageSize: 10,                       //每页的记录行数（*）
                showColumns: false,                  //是否显示所有的列
                minimumCountColumns: 2,             //最少允许的列数
                clickToSelect: true,                //是否启用点击选中行
                height: 380,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
                uniqueId: "scoreId",                     //每一行的唯一标识，一般为主键列
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                columns: [{
                    checkbox: true
                }, {
                    field: 'scoreId',
                    title: '#',
                }, {
                    field: 'scoreUserId',
                    title: '专家ID',
                }, {
                    field: 'scoreUserName',
                    title: '专家姓名',
                }, {
                    field: 'reviewName',
                    title: '项目名称',
                }, {
                    field: 'scoreUserDesc',
                    title: '专家评语',
                },{
                    field: 'scoreValue',
                    title: '分值',
                }, {
                    field: 'scoreTime',
                    title: '打分时间',
                    sortable: true,
                    //——修改——获取日期列的值进行转换
                    formatter: function (value, row, index) {
                        return changeDateFormat(value);
                    },

                    },{
                    field: 'reviewprjId',
                    title: '打分',
                    align: 'center',
                    width : 100,
                    events: operateEvents,
                    formatter: operateFormatter

                }, ],


            });
        };
        return oTableInit;

//格式化日期
        function changeDateFormat(cellvalue) {
            if(cellvalue!=null){
            var oDate = new Date(cellvalue),
                oYear = oDate.getFullYear(),
                oMonth = oDate.getMonth() + 1,
                oDay = oDate.getDate(),
                oHour = oDate.getHours(),
                oMin = oDate.getMinutes(),
                oSen = oDate.getSeconds(),
                oTime = oYear + '-' + getzf(oMonth) + '-' + getzf(oDay) ;//+ ' ' + getzf(oHour) + ':' + getzf(oMin) + ':' + getzf(oSen);//最后拼接时间
            return oTime;
            }else{
                return null;
            }
        }
        function getzf(num) {
            if (parseInt(num) < 10) {
                num = '0' + num;
            }
            return num;
        }


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



    function operateFormatter(value, row, index) {
        return [
            '<button type="button" class="RoleOfedit btn btn-primary  btn-sm" style="margin-right:15px;">打分</button>'
        ].join('');
    }
    window.operateEvents = {
        'click .RoleOfedit': function (e, value, row, index) {
            $("#scoreId").attr("value",row.scoreId);
            $("#scoreUserName").attr("value",row.scoreUserName);
            $("#scoreUserName").attr("readonly","true");
            $("#reviewName").attr("value",row.reviewName);
            $("#reviewName").attr("readonly","true");
            $("#editModal").modal('show');

        }
    };

</script>
</html>
