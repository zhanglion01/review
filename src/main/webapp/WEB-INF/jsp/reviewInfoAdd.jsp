<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>评审项目基本信息</title>
    <link rel="stylesheet" href="/css/bootstrap.css" rel="stylesheet" >
    <link rel="stylesheet" href="/css/bootstrap-table.min.css" rel="stylesheet" >
    <script src="/css/jquery-3.3.1.min.js"></script>
    <script src="/css/bootstrap.js"></script>
    <script src="/css/bootstrap-table.min.js"></script>
    <script src="/css/bootstrap-table-zh-CN.js"></script>
</head>
<body>
<form class="form-horizontal">
        <div id="legend" class="">
            <legend class="">基本信息</legend>
        </div>
        <div class="control-group">
            <label class="control-label" for="input01">项目名称</label>
            <div class="controls">
                <input id="input01" type="text" placeholder="placeholder" class="input-xlarge">
            </div>
        </div>

    <div class="form-actions" style="padding-left: 180px;">
        <button type="submit" name="doAddChannelInfo" class="btn btn-primary">
            <i class="icon-ok icon-white"></i>保存</button>&nbsp;&nbsp;
        <button type="button" class="btn btn-primary cancelBtn">
            <i class="icon-remove icon-white"></i>取消</button>
    </div>
</form>

</body>
<script type="text/javascript">

</script>
</html>
