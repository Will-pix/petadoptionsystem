<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>申请领养 - ${pet.name} - 宠物领养系统</title>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="../common/header.jsp"/>

    <div class="container mt-4">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="card">
                    <div class="card-header">
                        <h3 class="text-center">申请领养 - ${pet.name}</h3>
                    </div>
                    <div class="card-body">
                        <div class="row mb-4">
                            <div class="col-md-4">
                                <img src="${empty pet.imageUrl ? 'assets/images/pet-placeholder.jpg' : pet.imageUrl}" 
                                     class="img-fluid rounded" alt="${pet.name}">
                            </div>
                            <div class="col-md-8">
                                <h4>${pet.name}</h4>
                                <p>
                                    <span class="badge bg-primary">${pet.type}</span>
                                    <span class="badge bg-info">${pet.age}岁</span>
                                    <span class="badge bg-secondary">${pet.gender}</span>
                                </p>
                                <p>${pet.description}</p>
                            </div>
                        </div>

                        <c:if test="${not empty error}">
                            <div class="alert alert-danger">
                                ${error}
                            </div>
                        </c:if>

                        <form action="adoption" method="post" class="needs-validation" novalidate>
                            <input type="hidden" name="action" value="submit">
                            <input type="hidden" name="petId" value="${pet.id}">

                            <div class="mb-3">
                                <label for="livingCondition" class="form-label">居住环境</label>
                                <textarea class="form-control" id="livingCondition" name="livingCondition" 
                                          rows="3" required></textarea>
                                <div class="form-text">请详细描述您的居住环境，包括住房类型、面积等信息。</div>
                                <div class="invalid-feedback">
                                    请填写居住环境信息
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="adoptionReason" class="form-label">领养原因</label>
                                <textarea class="form-control" id="adoptionReason" name="adoptionReason" 
                                          rows="3" required></textarea>
                                <div class="form-text">请说明您想要领养的原因，以及是否有养宠物的经验。</div>
                                <div class="invalid-feedback">
                                    请填写领养原因
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="contactInfo" class="form-label">联系方式</label>
                                <textarea class="form-control" id="contactInfo" name="contactInfo" 
                                          rows="2" required></textarea>
                                <div class="form-text">请留下您的详细联系方式，包括手机号码、微信等。</div>
                                <div class="invalid-feedback">
                                    请填写联系方式
                                </div>
                            </div>

                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-primary">提交申请</button>
                                <a href="pets?action=detail&id=${pet.id}" class="btn btn-secondary">返回详情</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"/>
    <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
    <script>
        // 表单验证
        (function () {
            'use strict'
            var forms = document.querySelectorAll('.needs-validation')
            Array.prototype.slice.call(forms)
                .forEach(function (form) {
                    form.addEventListener('submit', function (event) {
                        if (!form.checkValidity()) {
                            event.preventDefault()
                            event.stopPropagation()
                        }
                        form.classList.add('was-validated')
                    }, false)
                })
        })()
    </script>
</body>
</html> 