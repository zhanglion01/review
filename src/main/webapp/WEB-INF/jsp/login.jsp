<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆页面</title>
    <link rel="stylesheet" href="/css/bootstrap.css">
    <script src="/css/jquery-3.3.1.min.js"></script>
    <script src="/css/bootstrap.js"></script>
</head>
<body background="/css/loginBack.png">
<div align="right" style="padding-top: 70px;margin-right: 100px">
    <span style="font-size: 50pt">评 审 系 统</span>
</div>
<div style="height: 20%"></div>
<div class="container" align="right" style="width: 30%;margin-right: 50px">
    <table>
        <tr>
            <td><h5>用 户 名 ：</h5></td>
            <td><input type="text" id="userName" class="form-control" placeholder="用户名" required></td>
        </tr>
        <tr><td></td></tr>
        <tr>
            <td><h5>  密  码 ：</h5></td>
            <td><input type="password" id="password" class="form-control" placeholder="密码" required></td>
        </tr>
        <tr><td></td></tr>
        <tr>
            <td colspan="2"><button class="btn btn-lg btn-primary btn-block" type="submit">登录</button></td>
        </tr>
    </table>
</div>

</body>
<script type="text/javascript">
    $(function(){
        var $btn=$(".btn");
        var $username=$("#userName");
        var $password=$("#password");
        $btn.on(
            "click",function(){
                if($username.val() == "" || $username.val() == null){
                    alert("请输入用户名！");
                    return;
                }
                if($password.val() == "" || $password.val() == null){
                    alert("请输入密码！");
                    return;
                }
                $.ajax({
                    url:"/review/loginCheck",
                    data:$username.val()+"&"+encode64($password.val()),
                    dataType:"json",
                    contentType: "application/json;charset=utf-8",
                    type:"post",
                    success:function(redata){
                        if(redata.msg=="sucess"){
                            alert("登陆成功！");
                            location.href = "/review/index";
                        }else if(redata.msg=="usernameerror"){
                            alert("用户不存在");
                            return;
                        }else if(redata.msg=="passworderror"){
                            alert("密码错误");
                            return;
                        }
                    },error:function (redata) {
                        alert("出错了！");
                    }
                })
            })
    })

    var keyStr = "ABCDEFGHIJKLMNOP" + "QRSTUVWXYZabcdef" + "ghijklmnopqrstuv"
        + "wxyz0123456789+/" + "=";

    function encode64(input) {

        var output = "";
        var chr1, chr2, chr3 = "";
        var enc1, enc2, enc3, enc4 = "";
        var i = 0;
        do {
            chr1 = input.charCodeAt(i++);
            chr2 = input.charCodeAt(i++);
            chr3 = input.charCodeAt(i++);
            enc1 = chr1 >> 2;
            enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
            enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
            enc4 = chr3 & 63;
            if (isNaN(chr2)) {
                enc3 = enc4 = 64;
            } else if (isNaN(chr3)) {
                enc4 = 64;
            }
            output = output + keyStr.charAt(enc1) + keyStr.charAt(enc2)
                + keyStr.charAt(enc3) + keyStr.charAt(enc4);
            chr1 = chr2 = chr3 = "";
            enc1 = enc2 = enc3 = enc4 = "";
        } while (i < input.length);

        return output;
    }
    // base64加密结束
</script>
</html>
