<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>页面未找到 - 宠物领养系统</title>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="../../common/header.jsp"/>
    
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6 text-center">
                <h1 class="display-1">404</h1>
                <h2>页面未找到</h2>
                <p class="lead">抱歉，您访问的页面不存在。</p>
                <a href="${pageContext.request.contextPath}/" class="btn btn-primary">返回首页</a>
            </div>
        </div>
    </div>

    <jsp:include page="../../common/footer.jsp"/>
    <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html> 