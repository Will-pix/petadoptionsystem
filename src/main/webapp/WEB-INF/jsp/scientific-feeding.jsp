<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>科学喂养 - 宠物社区</title>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <div class="container mt-4">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="community">宠物社区</a></li>
                <li class="breadcrumb-item"><a href="pet-experience.jsp">养宠心得</a></li>
                <li class="breadcrumb-item active">科学喂养</li>
            </ol>
        </nav>
        
        <h2 class="text-center mb-4"><i class="fas fa-bone me-2"></i>科学喂养</h2>
        
        <div class="card mb-4">
            <div class="card-body">
                <h3>宠物科学喂养指南</h3>
                <p>科学喂养是保证宠物健康的基础。不同种类、不同年龄段的宠物有着不同的营养需求。以下是一些基本原则：</p>
                
                <h4 class="mt-4">犬类喂养</h4>
                <ul>
                    <li><strong>幼犬（0-1岁）</strong>：需要高蛋白、高能量的食物，分3-4次/天喂食</li>
                    <li><strong>成犬（1-7岁）</strong>：均衡的蛋白质、脂肪和碳水化合物，分2次/天喂食</li>
                    <li><strong>老犬（7岁以上）</strong>：低脂肪、易消化的食物，可能需要添加关节保健成分</li>
                </ul>
                
                <h4 class="mt-4">猫类喂养</h4>
                <ul>
                    <li><strong>幼猫（0-1岁）</strong>：高蛋白、高脂肪食物，分3-4次/天喂食</li>
                    <li><strong>成猫（1-7岁）</strong>：高蛋白、适量脂肪，分2次/天喂食</li>
                    <li><strong>老猫（7岁以上）</strong>：易消化蛋白质，低磷食物，可能需要添加牛磺酸</li>
                </ul>
                
                <h4 class="mt-4">常见喂养误区</h4>
                <ol>
                    <li>人食喂养：许多人类食物对宠物有害，如巧克力、葡萄、洋葱等</li>
                    <li>过量喂食：导致肥胖和相关健康问题</li>
                    <li>食物单一：长期单一食物可能导致营养不均衡</li>
                    <li>忽视水分摄入：充足的清水对宠物健康至关重要</li>
                </ol>
            </div>
        </div>
        
        <div class="card mb-4">
            <div class="card-header">相关帖子</div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12 mb-3">
                        <h5><a href="post-detail.jsp" class="text-decoration-none">如何科学喂养1岁以下的金毛犬？</a></h5>
                        <p class="text-muted"><small>作者：金毛爱好者 | 发布时间：2023-06-15</small></p>
                    </div>
                    <div class="col-md-12 mb-3">
                        <h5><a href="post-detail.jsp" class="text-decoration-none">猫咪的科学饮食指南</a></h5>
                        <p class="text-muted"><small>作者：猫咪营养师 | 发布时间：2023-05-20</small></p>
                    </div>
                    <div class="col-md-12">
                        <h5><a href="post-detail.jsp" class="text-decoration-none">宠物零食选择与自制方法</a></h5>
                        <p class="text-muted"><small>作者：宠物美食家 | 发布时间：2023-04-10</small></p>
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