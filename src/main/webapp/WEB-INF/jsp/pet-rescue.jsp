<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>宠物救助 - 宠物社区</title>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .rescue-card {
            transition: transform 0.2s;
            margin-bottom: 20px;
        }
        .rescue-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        .pet-image {
            height: 200px;
            object-fit: cover;
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
                <li class="breadcrumb-item active">宠物救助</li>
            </ol>
        </nav>

        <div class="row mb-4">
            <div class="col-md-8">
                <h2><i class="fas fa-heart me-2"></i>宠物救助</h2>
                <p class="text-muted">这里是流浪动物的希望之光，志愿者们发布需要救助的宠物信息，包括位置、状况和照片。</p>
            </div>
            <div class="col-md-4 text-end">
                <c:if test="${not empty sessionScope.user}">
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#newRescueModal">
                        <i class="fas fa-plus me-1"></i> 发布救助信息
                    </button>
                </c:if>
            </div>
        </div>

        <c:if test="${not empty param.error}">
            <div class="alert alert-danger">
                ${param.error}
            </div>
        </c:if>

        <!-- 救助地区筛选 -->
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-map-marker-alt me-1"></i> 选择地区
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-2 text-center mb-2">
                        <a href="#" class="btn btn-outline-secondary btn-sm w-100">全部地区</a>
                    </div>
                    <div class="col-md-2 text-center mb-2">
                        <a href="#" class="btn btn-outline-secondary btn-sm w-100">朝阳区</a>
                    </div>
                    <div class="col-md-2 text-center mb-2">
                        <a href="#" class="btn btn-outline-secondary btn-sm w-100">海淀区</a>
                    </div>
                    <div class="col-md-2 text-center mb-2">
                        <a href="#" class="btn btn-outline-secondary btn-sm w-100">东城区</a>
                    </div>
                    <div class="col-md-2 text-center mb-2">
                        <a href="#" class="btn btn-outline-secondary btn-sm w-100">西城区</a>
                    </div>
                    <div class="col-md-2 text-center mb-2">
                        <a href="#" class="btn btn-outline-secondary btn-sm w-100">更多区域</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- 救助宠物列表 -->
        <div class="row">
            <!-- 救助宠物1 -->
            <div class="col-md-4 mb-4">
                <div class="card rescue-card h-100">
                    <div class="position-relative">
                        <img src="https://images.unsplash.com/photo-1529778873920-4da4926a72c2" class="card-img-top pet-image" alt="流浪猫">
                        <span class="position-absolute top-0 end-0 badge bg-danger m-2">紧急</span>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">受伤流浪猫需要救助</h5>
                        <p class="card-text text-muted">
                            <small>
                                <i class="fas fa-user me-1"></i> 爱心志愿者小李 | 
                                <i class="fas fa-clock me-1"></i> 2023-06-18 10:30
                            </small>
                        </p>
                        <p class="card-text">
                            <i class="fas fa-map-marker-alt me-1 text-danger"></i> 
                            <span class="text-muted">位置：</span>朝阳区三里屯附近
                        </p>
                        <p class="card-text">这只小猫右前腿受伤，需要医疗救助。性格温顺，不怕人。</p>
                        <a href="#" class="btn btn-outline-danger">查看详情</a>
                    </div>
                </div>
            </div>

            <!-- 救助宠物2 -->
            <div class="col-md-4 mb-4">
                <div class="card rescue-card h-100">
                    <div class="position-relative">
                        <img src="https://images.unsplash.com/photo-1567752881298-894bb81f9379" class="card-img-top pet-image" alt="流浪狗">
                        <span class="position-absolute top-0 end-0 badge bg-warning m-2">需要喂食</span>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">小区内流浪狗群需定期投喂</h5>
                        <p class="card-text text-muted">
                            <small>
                                <i class="fas fa-user me-1"></i> 社区志愿者小张 | 
                                <i class="fas fa-clock me-1"></i> 2023-06-15 16:45
                            </small>
                        </p>
                        <p class="card-text">
                            <i class="fas fa-map-marker-alt me-1 text-danger"></i> 
                            <span class="text-muted">位置：</span>海淀区中关村南大街某小区
                        </p>
                        <p class="card-text">小区内有5只流浪狗，需要志愿者参与定期投喂，特别是恶劣天气时。</p>
                        <a href="#" class="btn btn-outline-warning">查看详情</a>
                    </div>
                </div>
            </div>

            <!-- 救助宠物3 -->
            <div class="col-md-4 mb-4">
                <div class="card rescue-card h-100">
                    <div class="position-relative">
                        <img src="https://images.unsplash.com/photo-1548366086-7f1b76106622" class="card-img-top pet-image" alt="流浪幼犬">
                        <span class="position-absolute top-0 end-0 badge bg-success m-2">可领养</span>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">3只刚出生的幼犬寻找领养家庭</h5>
                        <p class="card-text text-muted">
                            <small>
                                <i class="fas fa-user me-1"></i> 流浪动物救助站 | 
                                <i class="fas fa-clock me-1"></i> 2023-06-10 09:15
                            </small>
                        </p>
                        <p class="card-text">
                            <i class="fas fa-map-marker-alt me-1 text-danger"></i> 
                            <span class="text-muted">位置：</span>东城区和平里救助站
                        </p>
                        <p class="card-text">3只出生约一个月的小狗，健康状况良好，已驱虫，现寻找爱心家庭领养。</p>
                        <a href="#" class="btn btn-outline-success">查看详情</a>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="row">
            <!-- 救助宠物4 -->
            <div class="col-md-4 mb-4">
                <div class="card rescue-card h-100">
                    <div class="position-relative">
                        <img src="https://images.unsplash.com/photo-1543852786-1cf6624b9987" class="card-img-top pet-image" alt="布偶猫">
                        <span class="position-absolute top-0 end-0 badge bg-info m-2">寻找临时寄养</span>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">布偶猫需要临时寄养家庭</h5>
                        <p class="card-text text-muted">
                            <small>
                                <i class="fas fa-user me-1"></i> 猫咪爱好者王女士 | 
                                <i class="fas fa-clock me-1"></i> 2023-06-05 11:20
                            </small>
                        </p>
                        <p class="card-text">
                            <i class="fas fa-map-marker-alt me-1 text-danger"></i> 
                            <span class="text-muted">位置：</span>西城区德胜门附近
                        </p>
                        <p class="card-text">因为突发原因需要出差一个月，寻找爱猫人士临时照顾我的布偶猫，会支付寄养费用。</p>
                        <a href="#" class="btn btn-outline-info">查看详情</a>
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

    <!-- 发布救助信息的模态框 -->
    <div class="modal fade" id="newRescueModal" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">发布宠物救助信息</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <form action="community" method="post">
                    <input type="hidden" name="action" value="post">
                    <input type="hidden" name="forum" value="pet-rescue">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="rescueType" class="form-label">救助类型</label>
                            <select class="form-select" id="rescueType" name="rescueType" required>
                                <option value="" disabled selected>请选择救助类型</option>
                                <option value="emergency">紧急救助</option>
                                <option value="feeding">需要喂食</option>
                                <option value="adoption">寻找领养</option>
                                <option value="fostering">寻找寄养</option>
                                <option value="other">其他</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="title" class="form-label">标题</label>
                            <input type="text" class="form-control" id="title" name="title" required>
                        </div>
                        <div class="mb-3">
                            <label for="location" class="form-label">地点</label>
                            <input type="text" class="form-control" id="location" name="location" required placeholder="例如：朝阳区三里屯附近">
                        </div>
                        <div class="mb-3">
                            <label for="content" class="form-label">详细描述</label>
                            <textarea class="form-control" id="content" name="content" rows="5" required placeholder="请描述宠物的状况、品种、年龄、性别等信息，以及需要的救助方式"></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="contactInfo" class="form-label">联系方式</label>
                            <input type="text" class="form-control" id="contactInfo" name="contactInfo" placeholder="手机号或微信（选填）">
                            <div class="form-text">联系方式仅用于救助沟通，不会公开显示</div>
                        </div>
                        <div class="mb-3">
                            <label for="imageUrl" class="form-label">图片链接</label>
                            <input type="url" class="form-control" id="imageUrl" name="imageUrl" placeholder="http://example.com/image.jpg">
                            <div class="form-text">建议上传宠物照片，便于志愿者识别</div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                        <button type="submit" class="btn btn-danger">发布救助信息</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"/>
    <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html> 