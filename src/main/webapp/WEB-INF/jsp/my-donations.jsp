<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>我的捐赠 - 宠物领养系统</title>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .donation-card {
            transition: transform 0.2s;
        }
        .donation-card:hover {
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>

    <div class="container mt-4">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="donation">爱心捐赠</a></li>
                <li class="breadcrumb-item active">我的捐赠</li>
            </ol>
        </nav>

        <div class="row mb-4">
            <div class="col-md-8">
                <h2>我的捐赠记录</h2>
            </div>
            <div class="col-md-4 text-end">
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#donationModal">
                    立即捐赠
                </button>
            </div>
        </div>

        <c:if test="${not empty param.error}">
            <div class="alert alert-danger">
                ${param.error}
            </div>
        </c:if>

        <!-- 捐赠列表 -->
        <div class="row">
            <c:forEach items="${donations}" var="donation">
                <div class="col-md-6 mb-3">
                    <div class="card donation-card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-center mb-2">
                                <h5 class="card-title mb-0">￥${donation.amount}</h5>
                                <span class="badge bg-${donation.status == 'COMPLETED' ? 'success' : 
                                                      donation.status == 'PENDING' ? 'warning' : 'danger'}">
                                    ${donation.status == 'COMPLETED' ? '已完成' : 
                                      donation.status == 'PENDING' ? '处理中' : '已取消'}
                                </span>
                            </div>
                            <p class="card-text">
                                <small class="text-muted">
                                    时间：${donation.createTime}
                                </small>
                            </p>
                            <p class="card-text">用途：${donation.purpose}</p>
                            <c:if test="${not empty donation.message}">
                                <p class="card-text">留言：${donation.message}</p>
                            </c:if>
                        </div>
                    </div>
                </div>
            </c:forEach>

            <c:if test="${empty donations}">
                <div class="col-12">
                    <div class="alert alert-info text-center">
                        您还没有捐赠记录，立即参与爱心捐赠吧！
                    </div>
                </div>
            </c:if>
        </div>
    </div>

    <!-- 捐赠表单模态框 -->
    <div class="modal fade" id="donationModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">爱心捐赠</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <form action="donation" method="post">
                    <input type="hidden" name="action" value="donate">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="amount" class="form-label">捐赠金额（元）</label>
                            <input type="number" class="form-control" id="amount" name="amount" 
                                   min="0.01" step="0.01" required>
                        </div>
                        <div class="mb-3">
                            <label for="purpose" class="form-label">捐赠用途</label>
                            <select class="form-select" id="purpose" name="purpose" required>
                                <option value="宠物医疗">宠物医疗</option>
                                <option value="宠物救助">宠物救助</option>
                                <option value="宠物食品">宠物食品</option>
                                <option value="基地建设">基地建设</option>
                                <option value="其他">其他</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="message" class="form-label">留言（可选）</label>
                            <textarea class="form-control" id="message" name="message" rows="3"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                        <button type="submit" class="btn btn-primary">确认捐赠</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"/>
    <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html> 