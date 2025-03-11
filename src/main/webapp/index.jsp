<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>首页 - 宠物领养系统</title>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .process-step {
            padding: 20px;
            margin: 10px 0;
            border-radius: 5px;
            background-color: #f8f9fa;
        }
        .pet-gallery {
            margin-top: 50px;
            margin-bottom: 30px;
        }
        .pet-card {
            transition: transform 0.3s;
            margin-bottom: 20px;
            border-radius: 10px;
            overflow: hidden;
        }
        .pet-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        .pet-img {
            height: 200px;
            object-fit: cover;
        }
        .carousel-item img {
            height: 400px;
            object-fit: cover;
        }
    </style>
</head>
<body>
    <jsp:include page="WEB-INF/common/header.jsp"/>

    <div class="container mt-4">
        <div id="petCarousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#petCarousel" data-bs-slide-to="0" class="active"></button>
                <button type="button" data-bs-target="#petCarousel" data-bs-slide-to="1"></button>
                <button type="button" data-bs-target="#petCarousel" data-bs-slide-to="2"></button>
            </div>
            <div class="carousel-inner rounded">
                <div class="carousel-item active">
                    <img src="https://images.unsplash.com/photo-1543466835-00a7907e9de1" class="d-block w-100" alt="宠物图片1">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>欢迎来到宠物领养系统</h5>
                        <p>我们致力于为流浪动物找到温暖的家</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="https://images.unsplash.com/photo-1548247416-ec66f4900b2e" class="d-block w-100" alt="宠物图片2">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>领养不买卖</h5>
                        <p>给流浪动物一个家，给自己一份爱</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="https://images.unsplash.com/photo-1573865526739-10659fec78a5" class="d-block w-100" alt="宠物图片3">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>爱心捐赠</h5>
                        <p>您的每一份爱心都能帮助更多的流浪动物</p>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#petCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon"></span>
                <span class="visually-hidden">上一个</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#petCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon"></span>
                <span class="visually-hidden">下一个</span>
            </button>
        </div>

        <h2 class="text-center my-4">领养流程</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="process-step">
                    <h4>1. 浏览宠物信息</h4>
                    <p>在宠物列表中查看详细信息，包括品种、年龄、性格等。</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="process-step">
                    <h4>2. 提交领养申请</h4>
                    <p>填写详细的领养申请表，说明您的居住环境和领养意向。</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="process-step">
                    <h4>3. 等待审核确认</h4>
                    <p>我们的志愿者将与您联系，确认领养事宜。</p>
                </div>
            </div>
        </div>

        <div class="pet-gallery">
            <h2 class="text-center mb-4">宠物图片展示</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="card pet-card">
                        <img src="https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba" class="card-img-top pet-img" alt="猫咪">
                        <div class="card-body">
                            <h5 class="card-title">可爱猫咪</h5>
                            <p class="card-text">温顺亲人，喜欢安静的环境。</p>
                            <a href="${pageContext.request.contextPath}/pets" class="btn btn-primary">查看更多</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card pet-card">
                        <img src="https://images.unsplash.com/photo-1583511655857-d19b40a7a54e" class="card-img-top pet-img" alt="狗狗">
                        <div class="card-body">
                            <h5 class="card-title">忠诚狗狗</h5>
                            <p class="card-text">活泼开朗，适合有小孩的家庭。</p>
                            <a href="${pageContext.request.contextPath}/pets" class="btn btn-primary">查看更多</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card pet-card">
                        <img src="https://images.unsplash.com/photo-1425082661705-1834bfd09dca" class="card-img-top pet-img" alt="兔子">
                        <div class="card-body">
                            <h5 class="card-title">可爱兔子</h5>
                            <p class="card-text">安静乖巧，适合小户型家庭。</p>
                            <a href="${pageContext.request.contextPath}/pets" class="btn btn-primary">查看更多</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="WEB-INF/common/footer.jsp"/>
    <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
