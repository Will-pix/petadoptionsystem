<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>反虐动物曝光台 - 宠物社区</title>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .report-card {
            transition: transform 0.2s;
            margin-bottom: 20px;
            border-left: 5px solid #dc3545;
        }
        .report-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        .report-image {
            height: 200px;
            object-fit: cover;
        }
        .alert-box {
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            border-radius: 5px;
            padding: 15px;
            margin-bottom: 20px;
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
                <li class="breadcrumb-item active">反虐动物曝光台</li>
            </ol>
        </nav>

        <div class="row mb-4">
            <div class="col-md-8">
                <h2><i class="fas fa-shield-alt me-2"></i>反虐动物曝光台</h2>
                <p class="text-muted">这是守护动物权益的正义平台，用于曝光和制止虐待动物的行为。</p>
            </div>
            <div class="col-md-4 text-end">
                <c:if test="${not empty sessionScope.user}">
                    <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#newReportModal">
                        <i class="fas fa-exclamation-triangle me-1"></i> 提交曝光信息
                    </button>
                </c:if>
            </div>
        </div>

        <c:if test="${not empty param.error}">
            <div class="alert alert-danger">
                ${param.error}
            </div>
        </c:if>

        <!-- 温馨提示 -->
        <div class="alert-box mb-4">
            <h5><i class="fas fa-exclamation-circle text-danger me-2"></i>提示</h5>
            <p class="mb-0">请确保提交的曝光信息真实可靠，不得恶意诽谤或捏造事实。平台鼓励通过合法途径保护动物权益，反对任何形式的网络暴力。每一次举报都将经过审核，如有违规将被删除。</p>
        </div>

        <!-- 举报指南 -->
        <div class="card mb-4">
            <div class="card-header bg-warning text-white">
                <i class="fas fa-info-circle me-1"></i> 举报指南
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-4 text-center mb-3">
                        <i class="fas fa-camera fs-3 mb-2 text-warning"></i>
                        <h5>收集证据</h5>
                        <p class="small">尽可能收集照片、视频等证据，但请注意个人安全</p>
                    </div>
                    <div class="col-md-4 text-center mb-3">
                        <i class="fas fa-map-marked-alt fs-3 mb-2 text-warning"></i>
                        <h5>记录位置</h5>
                        <p class="small">详细记录事发地点，便于有关部门或志愿者前往调查</p>
                    </div>
                    <div class="col-md-4 text-center mb-3">
                        <i class="fas fa-phone-alt fs-3 mb-2 text-warning"></i>
                        <h5>联系专业机构</h5>
                        <p class="small">情况紧急时请直接联系动物保护协会或报警求助</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- 曝光信息列表 -->
        <div class="row">
            <!-- 曝光信息1 -->
            <div class="col-md-12">
                <div class="card report-card">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center mb-2">
                            <h5 class="card-title mb-0">
                                <i class="fas fa-exclamation-circle text-danger me-1"></i>
                                <a href="#" class="text-decoration-none">发现小区内有人私自投放有毒食物伤害流浪猫</a>
                            </h5>
                            <span class="badge bg-danger">紧急</span>
                        </div>
                        <p class="card-text text-muted">
                            <small>
                                <i class="fas fa-user me-1"></i> 小区业主李先生 | 
                                <i class="fas fa-clock me-1"></i> 2023-06-18 10:30 | 
                                <i class="fas fa-map-marker-alt me-1"></i> 朝阳区某小区
                            </small>
                        </p>
                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <img src="https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba" class="img-fluid rounded report-image" alt="受伤猫咪">
                            </div>
                            <div class="col-md-8">
                                <p class="card-text">近日在小区内发现有人在花园和垃圾桶附近投放疑似有毒食物，已导致2只流浪猫中毒，其中1只不幸死亡。我已收集了部分食物样本，并且有监控显示一名中年男子可疑的活动。希望相关部门介入调查，制止这种残忍行为。</p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <a href="#" class="btn btn-outline-danger btn-sm">
                                        查看详情
                                    </a>
                                    <span class="text-muted small">处理状态：<span class="badge bg-info">调查中</span></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 曝光信息2 -->
            <div class="col-md-12">
                <div class="card report-card">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center mb-2">
                            <h5 class="card-title mb-0">
                                <i class="fas fa-exclamation-circle text-danger me-1"></i>
                                <a href="#" class="text-decoration-none">发现某宠物店内存在虐待动物行为</a>
                            </h5>
                            <span class="badge bg-warning">待核实</span>
                        </div>
                        <p class="card-text text-muted">
                            <small>
                                <i class="fas fa-user me-1"></i> 关注动物福利 | 
                                <i class="fas fa-clock me-1"></i> 2023-06-15 16:45 | 
                                <i class="fas fa-map-marker-alt me-1"></i> 西城区某宠物店
                            </small>
                        </p>
                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <img src="https://images.unsplash.com/photo-1425082661705-1834bfd09dca" class="img-fluid rounded report-image" alt="宠物店">
                            </div>
                            <div class="col-md-8">
                                <p class="card-text">经过多次观察，发现西城区某宠物店存在长期笼养、不给食物水、不清理笼舍等虐待行为。店内的狗狗和兔子生活在极其狭小的空间中，很多都有明显的营养不良迹象。建议有关部门前往检查该宠物店的经营资质和动物饲养条件。</p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <a href="#" class="btn btn-outline-warning btn-sm">
                                        查看详情
                                    </a>
                                    <span class="text-muted small">处理状态：<span class="badge bg-secondary">核实中</span></span>
                                </div>
                            </div>
                        </div>
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
                <li class="page-item">
                    <a class="page-link" href="#">下一页</a>
                </li>
            </ul>
        </nav>
    </div>

    <!-- 提交曝光信息的模态框 -->
    <div class="modal fade" id="newReportModal" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-warning text-white">
                    <h5 class="modal-title">提交曝光信息</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <form action="community" method="post">
                    <input type="hidden" name="action" value="post">
                    <input type="hidden" name="forum" value="animal-protection">
                    <div class="modal-body">
                        <div class="alert alert-warning mb-3">
                            <i class="fas fa-exclamation-triangle me-1"></i> 请确保您提供的信息真实可靠，不得捏造事实或恶意诽谤。
                        </div>
                        <div class="mb-3">
                            <label for="reportType" class="form-label">举报类型</label>
                            <select class="form-select" id="reportType" name="reportType" required>
                                <option value="" disabled selected>请选择举报类型</option>
                                <option value="abuse">虐待动物</option>
                                <option value="abandon">遗弃动物</option>
                                <option value="illegal">非法贩卖</option>
                                <option value="poison">投毒行为</option>
                                <option value="other">其他</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="title" class="form-label">标题</label>
                            <input type="text" class="form-control" id="title" name="title" required>
                        </div>
                        <div class="mb-3">
                            <label for="location" class="form-label">事发地点</label>
                            <input type="text" class="form-control" id="location" name="location" required>
                        </div>
                        <div class="mb-3">
                            <label for="content" class="form-label">详细描述</label>
                            <textarea class="form-control" id="content" name="content" rows="5" required placeholder="请详细描述虐待行为、动物状况、涉事人员特征等信息，以便调查核实"></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="evidence" class="form-label">证据说明</label>
                            <textarea class="form-control" id="evidence" name="evidence" rows="2" placeholder="说明您拥有的证据类型，如照片、视频、目击证人等"></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="imageUrl" class="form-label">图片链接</label>
                            <input type="url" class="form-control" id="imageUrl" name="imageUrl" placeholder="http://example.com/image.jpg">
                        </div>
                        <div class="mb-3">
                            <label for="contactInfo" class="form-label">联系方式（非公开）</label>
                            <input type="text" class="form-control" id="contactInfo" name="contactInfo" placeholder="您的联系方式仅用于核实信息，不会公开显示">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                        <button type="submit" class="btn btn-warning">提交曝光信息</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"/>
    <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html> 