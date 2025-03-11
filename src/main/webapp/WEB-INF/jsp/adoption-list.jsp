<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>领养申请列表 - 宠物领养系统</title>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="../common/header.jsp"/>

    <div class="container mt-4">
        <h2 class="text-center mb-4">
            <c:choose>
                <c:when test="${sessionScope.user.role == 'ADMIN'}">
                    待处理的领养申请
                </c:when>
                <c:otherwise>
                    我的领养申请
                </c:otherwise>
            </c:choose>
        </h2>

        <c:if test="${not empty param.error}">
            <div class="alert alert-danger">
                ${param.error}
            </div>
        </c:if>

        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>申请时间</th>
                        <th>宠物信息</th>
                        <c:if test="${sessionScope.user.role == 'ADMIN'}">
                            <th>申请人</th>
                        </c:if>
                        <th>居住环境</th>
                        <th>领养原因</th>
                        <th>联系方式</th>
                        <th>状态</th>
                        <c:if test="${sessionScope.user.role == 'ADMIN'}">
                            <th>操作</th>
                        </c:if>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${applications}" var="app">
                        <tr>
                            <td>${app.createTime}</td>
                            <td>
                                <a href="pets?action=detail&id=${app.pet.id}">${app.pet.name}</a>
                                <br>
                                <small class="text-muted">
                                    ${app.pet.type} | ${app.pet.age}岁 | ${app.pet.gender}
                                </small>
                            </td>
                            <c:if test="${sessionScope.user.role == 'ADMIN'}">
                                <td>
                                    ${app.adopter.username}
                                    <br>
                                    <small class="text-muted">${app.adopter.email}</small>
                                </td>
                            </c:if>
                            <td>${app.livingCondition}</td>
                            <td>${app.adoptionReason}</td>
                            <td>${app.contactInfo}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${app.status == 'PENDING'}">
                                        <span class="badge bg-warning">待处理</span>
                                    </c:when>
                                    <c:when test="${app.status == 'APPROVED'}">
                                        <span class="badge bg-success">已通过</span>
                                    </c:when>
                                    <c:when test="${app.status == 'REJECTED'}">
                                        <span class="badge bg-danger">已拒绝</span>
                                    </c:when>
                                </c:choose>
                            </td>
                            <c:if test="${sessionScope.user.role == 'ADMIN' && app.status == 'PENDING'}">
                                <td>
                                    <form action="adoption" method="post" class="d-inline">
                                        <input type="hidden" name="action" value="process">
                                        <input type="hidden" name="applicationId" value="${app.id}">
                                        <input type="hidden" name="status" value="APPROVED">
                                        <button type="submit" class="btn btn-success btn-sm">通过</button>
                                    </form>
                                    <form action="adoption" method="post" class="d-inline">
                                        <input type="hidden" name="action" value="process">
                                        <input type="hidden" name="applicationId" value="${app.id}">
                                        <input type="hidden" name="status" value="REJECTED">
                                        <button type="submit" class="btn btn-danger btn-sm">拒绝</button>
                                    </form>
                                </td>
                            </c:if>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

            <c:if test="${empty applications}">
                <div class="alert alert-info text-center">
                    暂无领养申请记录
                </div>
            </c:if>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"/>
    <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html> 