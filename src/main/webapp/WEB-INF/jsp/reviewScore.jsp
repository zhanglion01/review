<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>专家打分信息</title>
    <link rel="stylesheet" href="/css/bootstrap.css" rel="stylesheet" >
    <link rel="stylesheet" href="/css/bootstrap-table.min.css" rel="stylesheet" >
    <link rel="stylesheet" href="/css/bootstrap-select.min.css" rel="stylesheet" >

    <script src="/css/jquery-3.3.1.min.js"></script>
    <script src="/css/bootstrap.js"></script>
    <script src="/css/bootstrap-table.min.js"></script>
    <script src="/css/bootstrap-table-zh-CN.js"></script>
    <script src="/css/bootstrap-select.min.js"></script>
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
        <button id="btn_edit" type="button" class="btn btn-primary" >
            <span class="glyphicon-pencil" aria-hidden="true"></span>修改
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
                        <label for="txt_statu">专家批语</label>
                        <input type="text" name="txt_statu" class="form-control" id="txt_statu" placeholder="专家批语">
                    </div>
                </div>

                <div class="modal-footer bg-info">
                    <input type="hidden" id="ID" name="ID" />
                    <button type="submit" class="btn btn-primary"  onclick =search()>确定</button>
                    <button type="button" class="btn green" data-dismiss="modal">取消</button>
                </div>
                </form>
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
                <form id="form_data" class="bs-example bs-example-form" role = "form">
                    <div class="form-group">
                        <label for="txt_parentdepartment">专家名称</label>
                        <input type="text" name="txt_parentdepartment" class="form-control" id="txt_parentdepartment" placeholder="专家名称">
                    </div>
                    <div class="form-group">
                        <label for="txt_departmentlevel">项目名称</label>
                        <input type="text" name="txt_departmentlevel" class="form-control" id="txt_departmentlevel" placeholder="项目名称">
                    </div>
                    <div class="container">
                        <label for="txt_departmentlevel">项目名称</label>
                            <select id="slpk" class="selectpicker" data-live-search="false" ></select>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="button" onclick="add_info()" class="btn btn-primary">
                            保存
                        </button>
                    </div>
                </form>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->

    </div>
</body>
<script type="text/javascript">

    function queryById(){
        var prjName = $("#txt_search_prjName").val();
        $.ajax({
            type : 'POST',
            url : "/reviewInfo/getScoreList?prjName="+prjName,
            contentType: "application/json;charset=utf-8",
            dataType : "json",
            success : function(datas) {//返回list数据并循环获取
                $(function () {
                    //1.初始化Table
                    var oTable = new TableInit();
                    oTable.Init();
                });
            }
        });
    }

    function addScore(){

       //$("#myIframe")[0].src="http://localhost:8080/reviewInfo/addInfo";
        $('#addModal1').modal({show:true});
        $(".selectpicker").selectpicker({
            noneSelectedText : '请选择'
        });
        $(window).on('load', function() {
            $('.selectpicker').selectpicker('val', '');
            $('.selectpicker').selectpicker('refresh');
        });
        //下拉数据加载
        $.ajax({
            type : 'POST',
            url : '/reviewInfo/getList',
            contentType: "application/json;charset=utf-8",
            dataType : "json",
            success : function(datas) {//返回list数据并循环获取
                var select = $("#slpk");
                for (var i = 0; i < datas.length; i++) {
                    select.append("<option value='"+datas[i].prjName+"'>"
                        + datas[i].prjName + "</option>");
                }
                $('.selectpicker').selectpicker('val', '');
                $('.selectpicker').selectpicker('refresh');
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
               },
           error : function (){
               alert("删除失败");
                },
           });
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
                url: '/reviewInfo/getScoreList',         //请求后台的URL（*）
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
                uniqueId: "scoreId",                     //每一行的唯一标识，一般为主键列
                cardView: false,                    //是否显示详细视图
                detailView: false,                   //是否显示父子表
                columns: [{
                    checkbox: true
                }, {
                    field: 'scoreId',
                    title: '项目名称',

                }, {
                    field: 'scoreUserId',
                    title: '专家ID'
                }, {
                    field: 'scoreUserName',
                    title: '专家姓名'
                }, {
                    field: 'scoreUserDesc',
                    title: '专家评语'
                }, {
                    field: 'reviewName',
                    title: '项目名称',

                },{
                    field: 'scoreValue',
                    title: '分值'
                }, {
                    field: 'scoreTime',
                    title: '打分时间',
                    sortable: true,
                    //——修改——获取日期列的值进行转换
                    formatter: function (value, row, index) {
                        return changeDateFormat(value);
                    }

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
            $("#editModal").modal('show');

        }
    };

</script>
</html>
