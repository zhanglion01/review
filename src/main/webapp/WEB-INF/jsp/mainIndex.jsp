<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>系统首页</title>
    <link rel="stylesheet" href="/css/bootstrap.css">
    <script src="/css/jquery-3.3.1.min.js"></script>
    <script src="/css/bootstrap.js"></script>
    <style type="text/css">
        #main-nav {
            margin-left: 1px;
        }

        #main-nav.nav-tabs.nav-stacked > li > a {
            padding: 10px 8px;
            font-size: 12px;
            font-weight: 600;
            color: #4A515B;
            background: #E9E9E9;
            background: -moz-linear-gradient(top, #FAFAFA 0%, #E9E9E9 100%);
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#FAFAFA), color-stop(100%,#E9E9E9));
            background: -webkit-linear-gradient(top, #FAFAFA 0%,#E9E9E9 100%);
            background: -o-linear-gradient(top, #FAFAFA 0%,#E9E9E9 100%);
            background: -ms-linear-gradient(top, #FAFAFA 0%,#E9E9E9 100%);
            background: linear-gradient(top, #FAFAFA 0%,#E9E9E9 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#FAFAFA', endColorstr='#E9E9E9');
            -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr='#FAFAFA', endColorstr='#E9E9E9')";
            border: 1px solid #D5D5D5;
            border-radius: 4px;
        }

        #main-nav.nav-tabs.nav-stacked > li > a > span {
            color: #4A515B;
        }

        #main-nav.nav-tabs.nav-stacked > li.active > a, #main-nav.nav-tabs.nav-stacked > li > a:hover {
            color: #FFF;
            background: #3C4049;
            background: -moz-linear-gradient(top, #4A515B 0%, #3C4049 100%);
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#4A515B), color-stop(100%,#3C4049));
            background: -webkit-linear-gradient(top, #4A515B 0%,#3C4049 100%);
            background: -o-linear-gradient(top, #4A515B 0%,#3C4049 100%);
            background: -ms-linear-gradient(top, #4A515B 0%,#3C4049 100%);
            background: linear-gradient(top, #4A515B 0%,#3C4049 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#4A515B', endColorstr='#3C4049');
            -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr='#4A515B', endColorstr='#3C4049')";
            border-color: #2B2E33;
        }

        #main-nav.nav-tabs.nav-stacked > li.active > a, #main-nav.nav-tabs.nav-stacked > li > a:hover > span {
            color: #FFF;
        }

        #main-nav.nav-tabs.nav-stacked > li {
            margin-bottom: 4px;
        }
        .div-inline{ display:inline}
    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body background="/css/indexBack.png">
<div class="container-fluid" style="background: #4bffc3;height: 10%">
    <table width="100%">
        <tr>
            <td width="90%"><h2>评审系统</h2></td>
            <td><a href="#" onclick="exitSys()">退出</a></td>

        </tr>
    </table>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
            <ul id="main-nav" class="nav nav-tabs nav-stacked" style="">
                <li class="active">
                    <a href="#" onclick="changeFrameContent(0)">
                        首页
                    </a>
                </li>
                <li>
                    <a href="#" onclick="changeFrameContent(1)" >
                        评审参数设置
                    </a>
                </li>
                <li>
                    <a href="#" onclick="changeFrameContent(2)" >
                        评审信息填报
                    </a>
                </li>
                <li>
                    <a href="#" onclick="changeFrameContent(3)" >
                        评审专家打分
                    </a>
                </li>
                <li>
                    <a href="#" onclick="changeFrameContent(4)" >
                        评审信息汇总
                    </a>
                </li>
            </ul>
        </div>
        <div class="embed-responsive embed-responsive-4by3" style="height: 90%;padding-bottom:0%">
            <iframe class="embed-responsive-item" src="http://localhost:8080/reviewInfo/index" id="frame1"></iframe>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    function changeFrameContent(index) {
        if(index == "0"){
            $("#frame1")[0].src = "http://localhost:8080/reviewInfo/index";
        }else if(index == "1"){
            $("#frame1")[0].src = "http://localhost:8080/reviewInfo/params";
        }else if(index == "2"){
            $("#frame1")[0].src = "http://localhost:8080/reviewInfo/info";
        }else if(index == "3"){
            $("#frame1")[0].src = "http://localhost:8080/reviewInfo/score";
        }else if(index == "4"){
            $("#frame1")[0].src = "http://localhost:8080/reviewInfo/summary";
        }
    }
    
    function exitSys() {
        location.href = "http://localhost:8080/review/login";
    }
</script>
</html>