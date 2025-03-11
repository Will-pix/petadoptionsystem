<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>宠物社区 - 宠物领养系统</title>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .post-card {
            transition: transform 0.2s;
            margin-bottom: 20px;
        }
        .post-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        .forum-card {
            border-radius: 10px;
            transition: all 0.3s ease;
            height: 100%;
            border: 1px solid rgba(0,0,0,0.125);
        }
        .forum-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        .forum-icon {
            font-size: 2.5rem;
            margin-bottom: 15px;
            color: #6c757d;
        }
        .forum-title {
            font-weight: 600;
            margin-bottom: 10px;
            color: #3a3a3a;
        }
        .forum-description {
            color: #6c757d;
            font-size: 0.95rem;
        }
        .tab-content {
            padding-top: 20px;
        }
    </style>
    <link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <jsp:include page="../common/header.jsp"/>

    <div class="container mt-4">
        <div class="row mb-4">
            <div class="col-md-8">
                <h2>宠物社区 <small class="text-muted">——爱心汇聚，温暖每一个毛孩子</small></h2>
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
        
        <!-- 社区板块导航 -->
        <ul class="nav nav-tabs" id="communityTabs" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="forums-tab" data-bs-toggle="tab" data-bs-target="#forums" type="button" role="tab">板块导航</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="all-posts-tab" data-bs-toggle="tab" data-bs-target="#all-posts" type="button" role="tab">全部帖子</button>
            </li>
        </ul>
        
        <div class="tab-content" id="communityTabContent">
            <!-- 板块导航 -->
            <div class="tab-pane fade show active" id="forums" role="tabpanel">
                <div class="row">
                    <!-- 养宠心得板块 -->
                    <div class="col-md-6 mb-4">
                        <div class="card forum-card">
                            <div class="card-body text-center p-4">
                                <i class="fas fa-paw forum-icon"></i>
                                <h4 class="forum-title">养宠心得</h4>
                                <p class="forum-description">
                                    在这里分享您的养宠经验与智慧，共同探讨科学喂养、日常护理、行为训练等话题。
                                    无论您是经验丰富的铲屎官还是新手父母，都能在这里获取专业建议和温暖支持，
                                    让我们一起成长，为爱宠提供更幸福健康的生活。
                                </p>
                                <a href="community?forum=pet-experience" class="btn btn-outline-primary mt-3">进入板块</a>
                            </div>
                        </div>
                    </div>
                    
                    <!-- 宠物救助板块 -->
                    <div class="col-md-6 mb-4">
                        <div class="card forum-card">
                            <div class="card-body text-center p-4">
                                <i class="fas fa-heart forum-icon"></i>
                                <h4 class="forum-title">宠物救助</h4>
                                <p class="forum-description">
                                    这里是流浪动物的希望之光，志愿者们发布需要救助的宠物信息，包括位置、状况和照片。
                                    您可以选择前往现场领养、提供临时寄养或定期投喂。每一个善举都能温暖一个生命，
                                    让我们携手构建更有爱的社会，不让任何一个小生命被遗忘。
                                </p>
                                <a href="community?forum=pet-rescue" class="btn btn-outline-danger mt-3">进入板块</a>
                            </div>
                        </div>
                    </div>
                    
                    <!-- 反虐动物曝光台 -->
                    <div class="col-md-6 mb-4">
                        <div class="card forum-card">
                            <div class="card-body text-center p-4">
                                <i class="fas fa-shield-alt forum-icon"></i>
                                <h4 class="forum-title">反虐动物曝光台</h4>
                                <p class="forum-description">
                                    这是守护动物权益的正义平台，用于曝光和制止虐待动物的行为。
                                    如果您发现疑似虐待动物的情况，请在此提供详细信息和证据。
                                    我们将联合社区力量，通过合法途径保护这些无辜生命，
                                    共同维护人与动物和谐共处的美好世界。
                                </p>
                                <a href="community?forum=animal-protection" class="btn btn-outline-warning mt-3">进入板块</a>
                            </div>
                        </div>
                    </div>
                    
                    <!-- 二手宠物用品 -->
                    <div class="col-md-6 mb-4">
                        <div class="card forum-card">
                            <div class="card-body text-center p-4">
                                <i class="fas fa-exchange-alt forum-icon"></i>
                                <h4 class="forum-title">二手宠物用品</h4>
                                <p class="forum-description">
                                    这是宠物用品的循环利用平台，您可以在这里分享闲置的宠物玩具、窝床、食盆等物品。
                                    通过二手交易或赠予，既环保又经济，让每一件宠物用品都发挥最大价值。
                                    这里不仅是物品交流的场所，更是爱心传递的纽带。
                                </p>
                                <a href="community?forum=pet-goods" class="btn btn-outline-success mt-3">进入板块</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- 全部帖子 -->
            <div class="tab-pane fade" id="all-posts" role="tabpanel">
                <!-- 帖子列表 -->
                <div class="row">
                    <c:forEach items="${posts}" var="post">
                        <div class="col-md-12">
                            <div class="card post-card">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                        <h5 class="card-title mb-0">
                                            <a href="community?action=detail&id=${post.id}" class="text-decoration-none">
                                                ${post.title}
                                            </a>
                                        </h5>
                                        <c:if test="${sessionScope.user.id == post.userId || sessionScope.user.role == 'ADMIN'}">
                                            <form action="community" method="post" class="d-inline">
                                                <input type="hidden" name="action" value="deletePost">
                                                <input type="hidden" name="postId" value="${post.id}">
                                                <button type="submit" class="btn btn-danger btn-sm" 
                                                        onclick="return confirm('确定要删除这个帖子吗？')">删除</button>
                                            </form>
                                        </c:if>
                                    </div>
                                    <p class="card-text text-muted">
                                        <small>
                                            <i class="fas fa-user me-1"></i> ${post.user.username} | 
                                            <i class="fas fa-clock me-1"></i> ${post.createTime} | 
                                            <i class="fas fa-comment me-1"></i> ${post.commentCount}
                                        </small>
                                    </p>
                                    <p class="card-text">${post.content}</p>
                                    <a href="community?action=detail&id=${post.id}" class="btn btn-outline-primary btn-sm">
                                        查看详情
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                    <c:if test="${empty posts}">
                        <div class="col-12">
                            <div class="alert alert-info text-center">
                                <i class="fas fa-info-circle me-2"></i> 暂无帖子
                            </div>
                        </div>
                    </c:if>
                </div>

                <!-- 分页 -->
                <c:if test="${totalPages > 1}">
                    <nav aria-label="Page navigation" class="mt-4">
                        <ul class="pagination justify-content-center">
                            <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                <a class="page-link" href="community?page=${currentPage - 1}">上一页</a>
                            </li>
                            <c:forEach begin="1" end="${totalPages}" var="i">
                                <li class="page-item ${currentPage == i ? 'active' : ''}">
                                    <a class="page-link" href="community?page=${i}">${i}</a>
                                </li>
                            </c:forEach>
                            <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                <a class="page-link" href="community?page=${currentPage + 1}">下一页</a>
                            </li>
                        </ul>
                    </nav>
                </c:if>
            </div>
        </div>
    </div>

    <!-- 发布新帖子的模态框 -->
    <div class="modal fade" id="newPostModal" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">发布新帖子</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <form action="community" method="post">
                    <input type="hidden" name="action" value="post">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="forum" class="form-label">选择板块</label>
                            <select class="form-select" id="forum" name="forum" required>
                                <option value="" disabled selected>请选择板块</option>
                                <option value="pet-experience">养宠心得</option>
                                <option value="pet-rescue">宠物救助</option>
                                <option value="animal-protection">反虐动物曝光台</option>
                                <option value="pet-goods">二手宠物用品</option>
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
                            <div class="form-text">如有需要，请提供图片的URL地址</div>
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