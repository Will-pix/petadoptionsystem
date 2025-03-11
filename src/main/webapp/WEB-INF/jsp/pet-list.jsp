<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>领养中心 - 宠物领养系统</title>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .pet-card {
            transition: transform 0.3s;
            margin-bottom: 20px;
            border-radius: 10px;
            overflow: hidden;
            height: 100%;
        }
        .pet-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        .pet-image {
            height: 220px;
            object-fit: cover;
        }
        .badge {
            font-size: 0.8rem;
            margin-right: 5px;
        }
        .pagination {
            margin-top: 30px;
        }
    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>

    <div class="container mt-4">
        <h2 class="text-center mb-4">领养中心</h2>
        
        <!-- 筛选条件 -->
        <div class="row mb-4">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <form action="pets" method="get" class="row g-3">
                            <div class="col-md-3">
                                <label class="form-label">宠物类型</label>
                                <select name="type" class="form-select">
                                    <option value="">全部</option>
                                    <option value="DOG" ${param.type == 'DOG' ? 'selected' : ''}>狗狗</option>
                                    <option value="CAT" ${param.type == 'CAT' ? 'selected' : ''}>猫咪</option>
                                    <option value="OTHER" ${param.type == 'OTHER' ? 'selected' : ''}>其他</option>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <label class="form-label">年龄范围</label>
                                <select name="age" class="form-select">
                                    <option value="">全部</option>
                                    <option value="0-1" ${param.age == '0-1' ? 'selected' : ''}>1岁以下</option>
                                    <option value="1-3" ${param.age == '1-3' ? 'selected' : ''}>1-3岁</option>
                                    <option value="3-7" ${param.age == '3-7' ? 'selected' : ''}>3-7岁</option>
                                    <option value="7+" ${param.age == '7+' ? 'selected' : ''}>7岁以上</option>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <label class="form-label">性别</label>
                                <select name="gender" class="form-select">
                                    <option value="">全部</option>
                                    <option value="MALE" ${param.gender == 'MALE' ? 'selected' : ''}>公</option>
                                    <option value="FEMALE" ${param.gender == 'FEMALE' ? 'selected' : ''}>母</option>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <label class="form-label">&nbsp;</label>
                                <button type="submit" class="btn btn-primary d-block w-100">筛选</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- 当前页码标识 -->
        <c:set var="currentPage" value="${param.page == null ? 1 : param.page}" />

        <!-- 第一页内容 -->
        <c:if test="${currentPage == 1 || currentPage == null}">
            <!-- 宠物列表 - 第一行 -->
            <div class="row mb-4">
                <!-- 狗狗1 -->
                <div class="col-md-3 mb-4">
                    <div class="card pet-card">
                        <img src="https://images.unsplash.com/photo-1587300003388-59208cc962cb" class="card-img-top pet-image" alt="金毛">
                        <div class="card-body">
                            <h5 class="card-title">阳阳</h5>
                            <p>
                                <span class="badge bg-primary">狗狗</span>
                                <span class="badge bg-info">2岁</span>
                                <span class="badge bg-secondary">公</span>
                            </p>
                            <p class="card-text">活泼开朗的金毛，喜欢和人互动，适合有小孩的家庭。</p>
                        </div>
                        <div class="card-footer">
                            <a href="pets?action=detail&id=1" class="btn btn-primary w-100">查看详情</a>
                        </div>
                    </div>
                </div>
                
                <!-- 狗狗2 -->
                <div class="col-md-3 mb-4">
                    <div class="card pet-card">
                        <img src="https://images.unsplash.com/photo-1537151608828-ea2b11777ee8" class="card-img-top pet-image" alt="哈士奇">
                        <div class="card-body">
                            <h5 class="card-title">雪球</h5>
                            <p>
                                <span class="badge bg-primary">狗狗</span>
                                <span class="badge bg-info">1岁</span>
                                <span class="badge bg-secondary">公</span>
                            </p>
                            <p class="card-text">活力十足的哈士奇，喜欢户外活动，需要有足够的运动空间。</p>
                        </div>
                        <div class="card-footer">
                            <a href="pets?action=detail&id=2" class="btn btn-primary w-100">查看详情</a>
                        </div>
                    </div>
                </div>
                
                <!-- 狗狗3 -->
                <div class="col-md-3 mb-4">
                    <div class="card pet-card">
                        <img src="https://images.unsplash.com/photo-1583301286816-f4f05e1e8b25" class="card-img-top pet-image" alt="柯基">
                        <div class="card-body">
                            <h5 class="card-title">豆豆</h5>
                            <p>
                                <span class="badge bg-primary">狗狗</span>
                                <span class="badge bg-info">1.5岁</span>
                                <span class="badge bg-secondary">母</span>
                            </p>
                            <p class="card-text">威尔士柯基，活泼可爱，喜欢和人玩耍，已接种疫苗。</p>
                        </div>
                        <div class="card-footer">
                            <a href="pets?action=detail&id=3" class="btn btn-primary w-100">查看详情</a>
                        </div>
                    </div>
                </div>
                
                <!-- 狗狗4 -->
                <div class="col-md-3 mb-4">
                    <div class="card pet-card">
                        <img src="https://images.unsplash.com/photo-1552053831-71594a27632d" class="card-img-top pet-image" alt="拉布拉多">
                        <div class="card-body">
                            <h5 class="card-title">贝贝</h5>
                            <p>
                                <span class="badge bg-primary">狗狗</span>
                                <span class="badge bg-info">3岁</span>
                                <span class="badge bg-secondary">公</span>
                            </p>
                            <p class="card-text">温顺友好的拉布拉多，适合家庭饲养，已完成基础训练。</p>
                        </div>
                        <div class="card-footer">
                            <a href="pets?action=detail&id=4" class="btn btn-primary w-100">查看详情</a>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- 宠物列表 - 第二行 -->
            <div class="row">
                <!-- 猫咪1 -->
                <div class="col-md-3 mb-4">
                    <div class="card pet-card">
                        <img src="https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba" class="card-img-top pet-image" alt="橘猫">
                        <div class="card-body">
                            <h5 class="card-title">小橘</h5>
                            <p>
                                <span class="badge bg-primary">猫咪</span>
                                <span class="badge bg-info">3岁</span>
                                <span class="badge bg-secondary">公</span>
                            </p>
                            <p class="card-text">温顺亲人的橘猫，喜欢安静的环境，已绝育。</p>
                        </div>
                        <div class="card-footer">
                            <a href="pets?action=detail&id=5" class="btn btn-primary w-100">查看详情</a>
                        </div>
                    </div>
                </div>
                
                <!-- 猫咪2 -->
                <div class="col-md-3 mb-4">
                    <div class="card pet-card">
                        <img src="https://images.unsplash.com/photo-1533738363-b7f9aef128ce" class="card-img-top pet-image" alt="英短">
                        <div class="card-body">
                            <h5 class="card-title">灰灰</h5>
                            <p>
                                <span class="badge bg-primary">猫咪</span>
                                <span class="badge bg-info">2岁</span>
                                <span class="badge bg-secondary">母</span>
                            </p>
                            <p class="card-text">英国短毛猫，性格独立，但也喜欢与人互动，已绝育。</p>
                        </div>
                        <div class="card-footer">
                            <a href="pets?action=detail&id=6" class="btn btn-primary w-100">查看详情</a>
                        </div>
                    </div>
                </div>
                
                <!-- 猫咪3 -->
                <div class="col-md-3 mb-4">
                    <div class="card pet-card">
                        <img src="https://images.unsplash.com/photo-1573865526739-10659fec78a5" class="card-img-top pet-image" alt="三花猫">
                        <div class="card-body">
                            <h5 class="card-title">花花</h5>
                            <p>
                                <span class="badge bg-primary">猫咪</span>
                                <span class="badge bg-info">1岁</span>
                                <span class="badge bg-secondary">母</span>
                            </p>
                            <p class="card-text">三花猫，性格活泼，喜欢玩耍，已绝育。</p>
                        </div>
                        <div class="card-footer">
                            <a href="pets?action=detail&id=7" class="btn btn-primary w-100">查看详情</a>
                        </div>
                    </div>
                </div>
                
                <!-- 其他宠物 -->
                <div class="col-md-3 mb-4">
                    <div class="card pet-card">
                        <img src="https://images.unsplash.com/photo-1425082661705-1834bfd09dca" class="card-img-top pet-image" alt="兔子">
                        <div class="card-body">
                            <h5 class="card-title">小白兔</h5>
                            <p>
                                <span class="badge bg-primary">其他</span>
                                <span class="badge bg-info">1岁</span>
                                <span class="badge bg-secondary">母</span>
                            </p>
                            <p class="card-text">荷兰垂耳兔，性格温顺，适合小户型家庭饲养。</p>
                        </div>
                        <div class="card-footer">
                            <a href="pets?action=detail&id=8" class="btn btn-primary w-100">查看详情</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
        
        <!-- 分页 -->
        <nav aria-label="Page navigation" class="mt-4">
            <ul class="pagination justify-content-center">
                <li class="page-item ${currentPage == 1 || currentPage == null ? 'disabled' : ''}">
                    <a class="page-link" href="pets?page=${currentPage == null ? 1 : currentPage - 1}" 
                       tabindex="${currentPage == 1 || currentPage == null ? '-1' : '0'}" 
                       aria-disabled="${currentPage == 1 || currentPage == null ? 'true' : 'false'}">上一页</a>
                </li>
                <li class="page-item ${currentPage == 1 || currentPage == null ? 'active' : ''}">
                    <a class="page-link" href="pets?page=1">1</a>
                </li>
                <li class="page-item ${currentPage == 2 ? 'active' : ''}">
                    <a class="page-link" href="pets?page=2">2</a>
                </li>
                <li class="page-item ${currentPage == 3 ? 'active' : ''}">
                    <a class="page-link" href="pets?page=3">3</a>
                </li>
                <li class="page-item ${currentPage == 3 ? 'disabled' : ''}">
                    <a class="page-link" href="pets?page=${currentPage == null ? 2 : (currentPage == 3 ? 3 : currentPage + 1)}"
                       tabindex="${currentPage == 3 ? '-1' : '0'}" 
                       aria-disabled="${currentPage == 3 ? 'true' : 'false'}">下一页</a>
                </li>
            </ul>
        </nav>
    </div>

    <jsp:include page="../common/footer.jsp"/>
    <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html> 