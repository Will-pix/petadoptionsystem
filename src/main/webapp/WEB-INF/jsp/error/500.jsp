<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>服务器错误 - 宠物领养系统</title>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="../../common/header.jsp"/>
    
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6 text-center">
                <h1 class="display-1">500</h1>
                <h2>服务器错误</h2>
                <p class="lead">抱歉，服务器出现了一些问题。请稍后再试。</p>
                <a href="${pageContext.request.contextPath}/" class="btn btn-primary">返回首页</a>
            </div>
        </div>
    </div>

    <jsp:include page="../../common/footer.jsp"/>
    <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html> 