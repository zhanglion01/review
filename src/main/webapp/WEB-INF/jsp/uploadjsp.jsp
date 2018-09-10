<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <script src="/js/jquery-3.3.1.min.js"></script>
    <script src="/js/jquery-form.js"></script>
</head>
<body>

<form method="POST" enctype="multipart/form-data" action="/upload">
    <input type="file" name="file"><br />
    <input type="file" name="file"><br />
    <input type="text" name="name" hidden="ture" value="<%=request.getParameter("uuid")%>">
    <input type="submit" value="上传">
</form>
</body>
</html>