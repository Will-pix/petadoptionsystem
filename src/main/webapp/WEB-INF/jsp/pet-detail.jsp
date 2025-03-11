<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>${pet.name} - 宠物领养系统</title>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .pet-image {
            max-height: 400px;
            object-fit: cover;
        }
        .info-label {
            font-weight: bold;
            color: #666;
        }
    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>

    <div class="container mt-4">
        <div class="row">
            <div class="col-md-6">
                <img src="${empty pet.imageUrl ? 'assets/images/pet-placeholder.jpg' : pet.imageUrl}" 
                     class="img-fluid rounded pet-image w-100" alt="${pet.name}">
            </div>
            <div class="col-md-6">
                <h2>${pet.name}</h2>
                <div class="mb-3">
                    <span class="badge bg-primary">${pet.type}</span>
                    <span class="badge bg-info">${pet.age}岁</span>
                    <span class="badge bg-secondary">${pet.gender}</span>
                </div>
                
                <div class="mb-3">
                    <p class="info-label">品种</p>
                    <p>${pet.breed}</p>
                </div>
                
                <div class="mb-3">
                    <p class="info-label">性格特点</p>
                    <p>${pet.character}</p>
                </div>
                
                <div class="mb-3">
                    <p class="info-label">健康状况</p>
                    <p>${pet.health}</p>
                </div>
                
                <div class="mb-3">
                    <p class="info-label">发现地点</p>
                    <p>${pet.foundLocation}</p>
                </div>
                
                <div class="mb-3">
                    <p class="info-label">详细描述</p>
                    <p>${pet.description}</p>
                </div>
                
                <c:if test="${not empty sessionScope.user}">
                    <c:choose>
                        <c:when test="${sessionScope.user.role == 'ADOPTER'}">
                            <a href="adoption?action=apply&petId=${pet.id}" class="btn btn-primary btn-lg w-100">
                                申请领养
                            </a>
                        </c:when>
                        <c:otherwise>
                            <div class="alert alert-info">
                                只有注册为领养人的用户才能申请领养宠物
                            </div>
                        </c:otherwise>
                    </c:choose>
                </c:if>
                
                <c:if test="${empty sessionScope.user}">
                    <div class="alert alert-warning">
                        请<a href="login.jsp">登录</a>后申请领养
                    </div>
                </c:if>
            </div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"/>
    <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html> 