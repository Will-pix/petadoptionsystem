<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>二手宠物用品 - 宠物社区</title>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .goods-card {
            transition: transform 0.2s;
            margin-bottom: 20px;
        }
        .goods-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        .goods-image {
            height: 200px;
            object-fit: cover;
        }
        .price {
            font-weight: bold;
            color: #28a745;
        }
        .free-tag {
            color: #28a745;
            font-weight: bold;
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
                <li class="breadcrumb-item active">二手宠物用品</li>
            </ol>
        </nav>

        <div class="row mb-4">
            <div class="col-md-8">
                <h2><i class="fas fa-exchange-alt me-2"></i>二手宠物用品</h2>
                <p class="text-muted">这是宠物用品的循环利用平台，您可以在这里分享闲置的宠物玩具、窝床、食盆等物品。</p>
            </div>
            <div class="col-md-4 text-end">
                <c:if test="${not empty sessionScope.user}">
                    <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#newGoodsModal">
                        <i class="fas fa-plus me-1"></i> 发布闲置物品
                    </button>
                </c:if>
            </div>
        </div>

        <c:if test="${not empty param.error}">
            <div class="alert alert-danger">
                ${param.error}
            </div>
        </c:if>

        <!-- 筛选条件 -->
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-filter me-1"></i> 筛选条件
            </div>
            <div class="card-body">
                <form action="community" method="get" class="row g-3">
                    <input type="hidden" name="forum" value="pet-goods">
                    <div class="col-md-3">
                        <label class="form-label">宠物类型</label>
                        <select name="petType" class="form-select">
                            <option value="">全部</option>
                            <option value="dog">狗狗用品</option>
                            <option value="cat">猫咪用品</option>
                            <option value="other">其他宠物</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">物品类型</label>
                        <select name="goodsType" class="form-select">
                            <option value="">全部</option>
                            <option value="food">食物相关</option>
                            <option value="toy">玩具娱乐</option>
                            <option value="house">窝床家居</option>
                            <option value="clean">清洁用品</option>
                            <option value="other">其他物品</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">交易方式</label>
                        <select name="tradeType" class="form-select">
                            <option value="">全部</option>
                            <option value="free">免费赠送</option>
                            <option value="exchange">物品交换</option>
                            <option value="sell">出售转让</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label">&nbsp;</label>
                        <button type="submit" class="btn btn-primary d-block w-100">筛选</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- 二手物品列表 -->
        <div class="row">
            <!-- 物品1 -->
            <div class="col-md-3 mb-4">
                <div class="card goods-card h-100">
                    <div class="position-relative">
                        <img src="https://images.unsplash.com/photo-1599839575945-a9e5af0c3fa5" class="card-img-top goods-image" alt="猫爬架">
                        <span class="position-absolute top-0 end-0 badge bg-success m-2">9成新</span>
                    </div>
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title">二手猫爬架转让</h5>
                        <p class="card-text text-muted">
                            <small>
                                <i class="fas fa-user me-1"></i> 猫咪主人小王 | 
                                <i class="fas fa-clock me-1"></i> 2023-06-18
                            </small>
                        </p>
                        <p class="card-text">三层猫爬架，带猫窝和吊床，9成新，因搬家转让。适合中小型猫咪。</p>
                        <div class="mt-auto d-flex justify-content-between align-items-center">
                            <span class="price">¥ 120</span>
                            <span class="badge bg-primary">猫咪用品</span>
                        </div>
                        <a href="#" class="btn btn-outline-success mt-2 w-100">查看详情</a>
                    </div>
                </div>
            </div>

            <!-- 物品2 -->
            <div class="col-md-3 mb-4">
                <div class="card goods-card h-100">
                    <div class="position-relative">
                        <img src="https://images.unsplash.com/photo-1560743641-3914f2c45636" class="card-img-top goods-image" alt="狗狗玩具">
                        <span class="position-absolute top-0 end-0 badge bg-info m-2">全新</span>
                    </div>
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title">全新狗狗磨牙玩具</h5>
                        <p class="card-text text-muted">
                            <small>
                                <i class="fas fa-user me-1"></i> 金毛铲屎官 | 
                                <i class="fas fa-clock me-1"></i> 2023-06-16
                            </small>
                        </p>
                        <p class="card-text">买多了几个狗狗磨牙玩具，全新未拆封，适合中大型犬。</p>
                        <div class="mt-auto d-flex justify-content-between align-items-center">
                            <span class="free-tag"><i class="fas fa-gift me-1"></i>免费赠送</span>
                            <span class="badge bg-primary">狗狗用品</span>
                        </div>
                        <a href="#" class="btn btn-outline-success mt-2 w-100">查看详情</a>
                    </div>
                </div>
            </div>

            <!-- 物品3 -->
            <div class="col-md-3 mb-4">
                <div class="card goods-card h-100">
                    <div class="position-relative">
                        <img src="https://images.unsplash.com/photo-1591946614720-90a587da4a36" class="card-img-top goods-image" alt="自动喂食器">
                        <span class="position-absolute top-0 end-0 badge bg-warning m-2">8成新</span>
                    </div>
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title">智能自动喂食器</h5>
                        <p class="card-text text-muted">
                            <small>
                                <i class="fas fa-user me-1"></i> 科技爱好者 | 
                                <i class="fas fa-clock me-1"></i> 2023-06-15
                            </small>
                        </p>
                        <p class="card-text">8成新智能喂食器，可APP控制，定时定量，使用正常，有轻微磨损。</p>
                        <div class="mt-auto d-flex justify-content-between align-items-center">
                            <span class="price">¥ 150</span>
                            <span class="badge bg-primary">通用用品</span>
                        </div>
                        <a href="#" class="btn btn-outline-success mt-2 w-100">查看详情</a>
                    </div>
                </div>
            </div>

            <!-- 物品4 -->
            <div class="col-md-3 mb-4">
                <div class="card goods-card h-100">
                    <div class="position-relative">
                        <img src="https://images.unsplash.com/photo-1596854407944-bf87f6fdd49e" class="card-img-top goods-image" alt="猫砂盆">
                        <span class="position-absolute top-0 end-0 badge bg-secondary m-2">6成新</span>
                    </div>
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title">全自动猫砂盆</h5>
                        <p class="card-text text-muted">
                            <small>
                                <i class="fas fa-user me-1"></i> 双猫之家 | 
                                <i class="fas fa-clock me-1"></i> 2023-06-10
                            </small>
                        </p>
                        <p class="card-text">全自动猫砂盆，带感应功能，使用一年，功能正常，有划痕。</p>
                        <div class="mt-auto d-flex justify-content-between align-items-center">
                            <span class="price">¥ 200</span>
                            <span class="badge bg-primary">猫咪用品</span>
                        </div>
                        <a href="#" class="btn btn-outline-success mt-2 w-100">查看详情</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- 第二行物品 -->
        <div class="row">
            <!-- 物品5 -->
            <div class="col-md-3 mb-4">
                <div class="card goods-card h-100">
                    <div class="position-relative">
                        <img src="https://images.unsplash.com/photo-1576377388478-77a98e8103ad" class="card-img-top goods-image" alt="狗狗窝">
                        <span class="position-absolute top-0 end-0 badge bg-success m-2">9成新</span>
                    </div>
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title">宠物舒适窝垫</h5>
                        <p class="card-text text-muted">
                            <small>
                                <i class="fas fa-user me-1"></i> 柯基妈妈 | 
                                <i class="fas fa-clock me-1"></i> 2023-06-08
                            </small>
                        </p>
                        <p class="card-text">中小型犬舒适窝垫，可拆洗，已洗净消毒，适合柯基体型的狗狗。</p>
                        <div class="mt-auto d-flex justify-content-between align-items-center">
                            <span class="free-tag"><i class="fas fa-retweet me-1"></i>物品交换</span>
                            <span class="badge bg-primary">狗狗用品</span>
                        </div>
                        <a href="#" class="btn btn-outline-success mt-2 w-100">查看详情</a>
                    </div>
                </div>
            </div>

            <!-- 物品6 -->
            <div class="col-md-3 mb-4">
                <div class="card goods-card h-100">
                    <div class="position-relative">
                        <img src="https://images.unsplash.com/photo-1534361960057-19889db9621e" class="card-img-top goods-image" alt="猫咪玩具">
                        <span class="position-absolute top-0 end-0 badge bg-info m-2">7成新</span>
                    </div>
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title">猫咪玩具套装</h5>
                        <p class="card-text text-muted">
                            <small>
                                <i class="fas fa-user me-1"></i> 三花猫主人 | 
                                <i class="fas fa-clock me-1"></i> 2023-06-05
                            </small>
                        </p>
                        <p class="card-text">一套10件猫咪玩具，包括逗猫棒、球、鼠标等，我家猫不太感兴趣所以转让。</p>
                        <div class="mt-auto d-flex justify-content-between align-items-center">
                            <span class="price">¥ 30</span>
                            <span class="badge bg-primary">猫咪用品</span>
                        </div>
                        <a href="#" class="btn btn-outline-success mt-2 w-100">查看详情</a>
                    </div>
                </div>
            </div>

            <!-- 物品7 -->
            <div class="col-md-3 mb-4">
                <div class="card goods-card h-100">
                    <div class="position-relative">
                        <img src="https://images.unsplash.com/photo-1516750105099-4b8a83e217ee" class="card-img-top goods-image" alt="宠物背包">
                        <span class="position-absolute top-0 end-0 badge bg-success m-2">9成新</span>
                    </div>
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title">宠物外出背包</h5>
                        <p class="card-text text-muted">
                            <small>
                                <i class="fas fa-user me-1"></i> 爱旅行的喵星人 | 
                                <i class="fas fa-clock me-1"></i> 2023-06-02
                            </small>
                        </p>
                        <p class="card-text">猫咪外出背包，透气舒适，使用两次几乎全新，适合5kg以下宠物使用。</p>
                        <div class="mt-auto d-flex justify-content-between align-items-center">
                            <span class="price">¥ 80</span>
                            <span class="badge bg-primary">通用用品</span>
                        </div>
                        <a href="#" class="btn btn-outline-success mt-2 w-100">查看详情</a>
                    </div>
                </div>
            </div>

            <!-- 物品8 -->
            <div class="col-md-3 mb-4">
                <div class="card goods-card h-100">
                    <div class="position-relative">
                        <img src="https://images.unsplash.com/photo-1541690212779-d8c25b4672c2" class="card-img-top goods-image" alt="宠物食盆">
                        <span class="position-absolute top-0 end-0 badge bg-info m-2">全新</span>
                    </div>
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title">防滑宠物食盆</h5>
                        <p class="card-text text-muted">
                            <small>
                                <i class="fas fa-user me-1"></i> 宠物小店 | 
                                <i class="fas fa-clock me-1"></i> 2023-05-28
                            </small>
                        </p>
                        <p class="card-text">全新不锈钢防滑食盆，买多了用不完，适合中小型犬猫使用。</p>
                        <div class="mt-auto d-flex justify-content-between align-items-center">
                            <span class="free-tag"><i class="fas fa-gift me-1"></i>免费赠送</span>
                            <span class="badge bg-primary">通用用品</span>
                        </div>
                        <a href="#" class="btn btn-outline-success mt-2 w-100">查看详情</a>
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

    <!-- 发布二手物品的模态框 -->
    <div class="modal fade" id="newGoodsModal" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-success text-white">
                    <h5 class="modal-title">发布闲置宠物用品</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <form action="community" method="post">
                    <input type="hidden" name="action" value="post">
                    <input type="hidden" name="forum" value="pet-goods">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="title" class="form-label">物品名称</label>
                            <input type="text" class="form-control" id="title" name="title" required>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-4">
                                <label for="petType" class="form-label">适用宠物</label>
                                <select class="form-select" id="petType" name="petType" required>
                                    <option value="" disabled selected>请选择</option>
                                    <option value="dog">狗狗用品</option>
                                    <option value="cat">猫咪用品</option>
                                    <option value="both">通用</option>
                                    <option value="other">其他宠物</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label for="goodsType" class="form-label">物品类型</label>
                                <select class="form-select" id="goodsType" name="goodsType" required>
                                    <option value="" disabled selected>请选择</option>
                                    <option value="food">食物相关</option>
                                    <option value="toy">玩具娱乐</option>
                                    <option value="house">窝床家居</option>
                                    <option value="clean">清洁用品</option>
                                    <option value="other">其他物品</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label for="condition" class="form-label">新旧程度</label>
                                <select class="form-select" id="condition" name="condition" required>
                                    <option value="" disabled selected>请选择</option>
                                    <option value="new">全新</option>
                                    <option value="like_new">9成新</option>
                                    <option value="good">8成新</option>
                                    <option value="fair">6成新</option>
                                    <option value="poor">5成新以下</option>
                                </select>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="tradeType" class="form-label">交易方式</label>
                                <select class="form-select" id="tradeType" name="tradeType" required>
                                    <option value="" disabled selected>请选择</option>
                                    <option value="free">免费赠送</option>
                                    <option value="exchange">物品交换</option>
                                    <option value="sell">出售转让</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label for="price" class="form-label">价格（元）</label>
                                <input type="number" class="form-control" id="price" name="price" placeholder="免费赠送或物品交换可填0">
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="content" class="form-label">物品描述</label>
                            <textarea class="form-control" id="content" name="content" rows="4" required placeholder="请详细描述物品的品牌、尺寸、使用情况等，以及您的期望交易方式"></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="contactInfo" class="form-label">联系方式</label>
                            <input type="text" class="form-control" id="contactInfo" name="contactInfo" placeholder="请留下您的联系方式，如电话或微信">
                            <div class="form-text">联系方式仅交易双方可见</div>
                        </div>
                        <div class="mb-3">
                            <label for="location" class="form-label">交易地点</label>
                            <input type="text" class="form-control" id="location" name="location" placeholder="例如：海淀区某地铁站附近">
                        </div>
                        <div class="mb-3">
                            <label for="imageUrl" class="form-label">图片链接</label>
                            <input type="url" class="form-control" id="imageUrl" name="imageUrl" placeholder="http://example.com/image.jpg">
                            <div class="form-text">建议上传物品实拍照片</div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                        <button type="submit" class="btn btn-success">发布物品</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"/>
    <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html> 