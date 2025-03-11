<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>品种介绍 - 宠物社区</title>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <div class="container mt-4">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="community">宠物社区</a></li>
                <li class="breadcrumb-item"><a href="pet-experience.jsp">养宠心得</a></li>
                <li class="breadcrumb-item active">品种介绍</li>
            </ol>
        </nav>
        
        <h2 class="text-center mb-4"><i class="fas fa-paw me-2"></i>品种介绍</h2>
        
        <div class="card mb-4">
            <div class="card-body">
                <h3>常见宠物品种介绍</h3>
                <p>了解不同宠物品种的特点，有助于选择适合自己生活方式的宠物伙伴。以下是一些常见宠物品种的介绍：</p>
                
                <h4 class="mt-4">热门犬种</h4>
                <div class="row">
                    <div class="col-md-6">
                        <h5>金毛寻回犬</h5>
                        <p><strong>性格特点：</strong>友善、聪明、忠诚，适合家庭饲养</p>
                        <p><strong>护理需求：</strong>需要定期梳理被毛，适量运动</p>
                        <p><strong>适合人群：</strong>有小孩的家庭，喜欢户外活动的人</p>
                    </div>
                    <div class="col-md-6">
                        <h5>拉布拉多寻回犬</h5>
                        <p><strong>性格特点：</strong>活泼、友好、容易训练</p>
                        <p><strong>护理需求：</strong>需要大量运动，定期梳理</p>
                        <p><strong>适合人群：</strong>活跃的家庭，有足够活动空间的人</p>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-6">
                        <h5>柯基犬</h5>
                        <p><strong>性格特点：</strong>聪明、活泼、警觉</p>
                        <p><strong>护理需求：</strong>需要适量运动，定期梳理</p>
                        <p><strong>适合人群：</strong>公寓居住者，有时间陪伴的人</p>
                    </div>
                    <div class="col-md-6">
                        <h5>哈士奇</h5>
                        <p><strong>性格特点：</strong>独立、活泼、友好</p>
                        <p><strong>护理需求：</strong>需要大量运动，定期梳理，掉毛较多</p>
                        <p><strong>适合人群：</strong>有足够活动空间，喜欢户外活动的人</p>
                    </div>
                </div>
                
                <h4 class="mt-4">热门猫种</h4>
                <div class="row">
                    <div class="col-md-6">
                        <h5>英国短毛猫</h5>
                        <p><strong>性格特点：</strong>温顺、安静、独立</p>
                        <p><strong>护理需求：</strong>需要定期梳理，适量运动</p>
                        <p><strong>适合人群：</strong>上班族，公寓居住者</p>
                    </div>
                    <div class="col-md-6">
                        <h5>美国短毛猫</h5>
                        <p><strong>性格特点：</strong>友好、活泼、适应性强</p>
                        <p><strong>护理需求：</strong>需要适量运动，定期梳理</p>
                        <p><strong>适合人群：</strong>家庭饲养，有小孩的家庭</p>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-md-6">
                        <h5>布偶猫</h5>
                        <p><strong>性格特点：</strong>温顺、粘人、安静</p>
                        <p><strong>护理需求：</strong>需要定期梳理长毛，适量运动</p>
                        <p><strong>适合人群：</strong>有时间陪伴的人，喜欢安静的人</p>
                    </div>
                    <div class="col-md-6">
                        <h5>暹罗猫</h5>
                        <p><strong>性格特点：</strong>聪明、活泼、好奇</p>
                        <p><strong>护理需求：</strong>需要适量运动，定期梳理</p>
                        <p><strong>适合人群：</strong>喜欢互动的人，有时间陪伴的人</p>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="card mb-4">
            <div class="card-header">相关帖子</div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12 mb-3">
                        <h5><a href="post-detail.jsp" class="text-decoration-none">如何选择适合自己的狗狗品种</a></h5>
                        <p class="text-muted"><small>作者：犬种专家 | 发布时间：2023-06-05</small></p>
                    </div>
                    <div class="col-md-12 mb-3">
                        <h5><a href="post-detail.jsp" class="text-decoration-none">猫咪品种大全：从性格到护理</a></h5>
                        <p class="text-muted"><small>作者：猫咪爱好者 | 发布时间：2023-05-15</small></p>
                    </div>
                    <div class="col-md-12">
                        <h5><a href="post-detail.jsp" class="text-decoration-none">小型犬品种推荐：适合公寓生活的选择</a></h5>
                        <p class="text-muted"><small>作者：城市养犬指南 | 发布时间：2023-04-25</small></p>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="text-center mt-4">
            <a href="pet-experience.jsp" class="btn btn-primary">返回养宠心得</a>
        </div>
    </div>
    <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html> 