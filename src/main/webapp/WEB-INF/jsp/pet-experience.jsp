<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>养宠心得 - 宠物社区</title>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .post-card {
            transition: transform 0.2s;
            margin-bottom: 20px;
        }
        .post-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        .forum-icon {
            font-size: 2.5rem;
            color: #6c757d;
        }
    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>

    <div class="container mt-4">
        <!-- 面包屑导航 -->
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="community">宠物社区</a></li>
                <li class="breadcrumb-item active">养宠心得</li>
            </ol>
        </nav>

        <div class="row mb-4">
            <div class="col-md-8">
                <h2><i class="fas fa-paw me-2"></i>养宠心得</h2>
                <p class="text-muted">在这里分享您的养宠经验与智慧，共同探讨科学喂养、日常护理、行为训练等话题。</p>
            </div>
            <div class="col-md-4 text-end">
                <c:if test="${not empty sessionScope.user}">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#newPostModal">
                        <i class="fas fa-edit me-1"></i> 发布新帖子
                    </button>
                </c:if>
            </div>
        </div>

        <c:if test="${not empty param.error}">
            <div class="alert alert-danger">
                ${param.error}
            </div>
        </c:if>

        <!-- 热门话题 -->
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-fire me-1"></i> 热门话题
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-3 text-center">
                        <a href="scientific-feeding.jsp" class="btn btn-outline-secondary rounded-pill mb-2">
                            <i class="fas fa-bone me-1"></i> 科学喂养
                        </a>
                    </div>
                    <div class="col-md-3 text-center">
                        <a href="health-care.jsp" class="btn btn-outline-secondary rounded-pill mb-2">
                            <i class="fas fa-heartbeat me-1"></i> 健康护理
                        </a>
                    </div>
                    <div class="col-md-3 text-center">
                        <a href="behavior-training.jsp" class="btn btn-outline-secondary rounded-pill mb-2">
                            <i class="fas fa-graduation-cap me-1"></i> 行为训练
                        </a>
                    </div>
                    <div class="col-md-3 text-center">
                        <a href="breed-introduction.jsp" class="btn btn-outline-secondary rounded-pill mb-2">
                            <i class="fas fa-paw me-1"></i> 品种介绍
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!-- 帖子列表 -->
        <div class="row">
            <!-- 示例帖子1 -->
            <div class="col-md-12">
                <div class="card post-card">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center mb-2">
                            <h5 class="card-title mb-0">
                                <a href="post-detail.jsp" class="text-decoration-none">如何科学喂养1岁以下的金毛犬？</a>
                            </h5>
                            <span class="badge bg-primary">科学喂养</span>
                        </div>
                        <p class="card-text text-muted">
                            <small>
                                <i class="fas fa-user me-1"></i> 金毛爱好者 | 
                                <i class="fas fa-clock me-1"></i> 2023-06-15 14:30 | 
                                <i class="fas fa-comment me-1"></i> 15
                            </small>
                        </p>
                        <p class="card-text">金毛幼犬的饮食需要特别注意营养均衡，我家的金毛现在11个月大，分享一下我的喂养经验...</p>
                        <a href="post-detail.jsp" class="btn btn-outline-primary btn-sm">
                            查看详情
                        </a>
                    </div>
                </div>
            </div>

            <!-- 示例帖子2 -->
            <div class="col-md-12">
                <div class="card post-card">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center mb-2">
                            <h5 class="card-title mb-0">
                                <a href="post-detail.jsp" class="text-decoration-none">分享：如何训练猫咪使用猫砂盆</a>
                            </h5>
                            <span class="badge bg-success">行为训练</span>
                        </div>
                        <p class="card-text text-muted">
                            <small>
                                <i class="fas fa-user me-1"></i> 猫咪训练师 | 
                                <i class="fas fa-clock me-1"></i> 2023-06-10 09:15 | 
                                <i class="fas fa-comment me-1"></i> 23
                            </small>
                        </p>
                        <p class="card-text">刚领养的小猫不会使用猫砂盆是常见问题，这里有几个实用的训练技巧，帮助新手铲屎官解决这个烦恼...</p>
                        <a href="post-detail.jsp" class="btn btn-outline-primary btn-sm">
                            查看详情
                        </a>
                    </div>
                </div>
            </div>

            <!-- 示例帖子3 -->
            <div class="col-md-12">
                <div class="card post-card">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center mb-2">
                            <h5 class="card-title mb-0">
                                <a href="post-detail.jsp" class="text-decoration-none">春季宠物皮肤病预防与护理指南</a>
                            </h5>
                            <span class="badge bg-info">健康护理</span>
                        </div>
                        <p class="card-text text-muted">
                            <small>
                                <i class="fas fa-user me-1"></i> 宠物医生小王 | 
                                <i class="fas fa-clock me-1"></i> 2023-05-20 16:45 | 
                                <i class="fas fa-comment me-1"></i> 19
                            </small>
                        </p>
                        <p class="card-text">春季是宠物皮肤病的高发期，本文将介绍几种常见的皮肤问题及其预防措施，帮助您的爱宠度过舒适的春季...</p>
                        <a href="post-detail.jsp" class="btn btn-outline-primary btn-sm">
                            查看详情
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!-- 分页 -->
        <nav aria-label="Page navigation" class="mt-4">
            <ul class="pagination justify-content-center">
                <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1">上一页</a>
                </li>
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#">下一页</a>
                </li>
            </ul>
        </nav>
    </div>

    <!-- 发布新帖子的模态框 -->
    <div class="modal fade" id="newPostModal" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">发布养宠心得</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <form action="community" method="post">
                    <input type="hidden" name="action" value="post">
                    <input type="hidden" name="forum" value="pet-experience">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="topic" class="form-label">选择话题</label>
                            <select class="form-select" id="topic" name="topic">
                                <option value="科学喂养">科学喂养</option>
                                <option value="健康护理">健康护理</option>
                                <option value="行为训练">行为训练</option>
                                <option value="品种介绍">品种介绍</option>
                                <option value="其他">其他</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="title" class="form-label">标题</label>
                            <input type="text" class="form-control" id="title" name="title" required>
                        </div>
                        <div class="mb-3">
                            <label for="content" class="form-label">内容</label>
                            <textarea class="form-control" id="content" name="content" rows="5" required></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="imageUrl" class="form-label">图片链接（可选）</label>
                            <input type="url" class="form-control" id="imageUrl" name="imageUrl" placeholder="http://example.com/image.jpg">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                        <button type="submit" class="btn btn-primary">发布</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"/>
    <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html> 