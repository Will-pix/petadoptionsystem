<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">宠物领养系统</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/">首页</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/pets">领养中心</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/community">宠物社区</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/donation">爱心捐赠</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/faq">常见问题</a>
                </li>
            </ul>
            <ul class="navbar-nav">
                <c:choose>
                    <c:when test="${empty sessionScope.user}">
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/login.jsp">登录</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/register.jsp">注册</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" 
                               data-bs-toggle="dropdown">
                                ${sessionScope.user.username}
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <c:if test="${sessionScope.user.role == 'ADMIN'}">
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin">管理后台</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                </c:if>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/profile">个人中心</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/adoption?action=my">我的领养</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/donation?action=my">我的捐赠</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">退出登录</a></li>
                            </ul>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav> 