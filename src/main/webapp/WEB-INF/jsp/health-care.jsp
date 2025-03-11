<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>健康护理 - 宠物社区</title>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <div class="container mt-4">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="community">宠物社区</a></li>
                <li class="breadcrumb-item"><a href="pet-experience.jsp">养宠心得</a></li>
                <li class="breadcrumb-item active">健康护理</li>
            </ol>
        </nav>
        
        <h2 class="text-center mb-4"><i class="fas fa-heartbeat me-2"></i>健康护理</h2>
        
        <div class="card mb-4">
            <div class="card-body">
                <h3>宠物健康护理指南</h3>
                <p>定期的健康护理是预防疾病、保持宠物健康的关键。以下是一些基本的健康护理知识：</p>
                
                <h4 class="mt-4">日常检查</h4>
                <ul>
                    <li><strong>皮肤和被毛</strong>：检查是否有寄生虫、皮疹、脱毛或异常肿块</li>
                    <li><strong>眼睛和耳朵</strong>：观察是否有分泌物、发红或异味</li>
                    <li><strong>口腔</strong>：检查牙齿和牙龈健康，注意口臭问题</li>
                    <li><strong>爪子</strong>：定期修剪指甲，检查肉垫是否有伤口</li>
                </ul>
                
                <h4 class="mt-4">疫苗接种</h4>
                <p>定期接种疫苗是预防传染病的重要措施：</p>
                <ul>
                    <li><strong>犬类</strong>：狂犬病、犬瘟热、犬细小病毒、犬传染性肝炎等</li>
                    <li><strong>猫类</strong>：猫瘟、猫杯状病毒、猫白血病、狂犬病等</li>
                </ul>
                
                <h4 class="mt-4">驱虫</h4>
                <p>内外驱虫是宠物健康护理的重要环节：</p>
                <ul>
                    <li><strong>外部寄生虫</strong>：跳蚤、蜱虫等，可使用滴剂、喷剂或药浴</li>
                    <li><strong>内部寄生虫</strong>：蛔虫、绦虫等，需定期口服驱虫药</li>
                </ul>
                
                <h4 class="mt-4">季节性护理</h4>
                <ul>
                    <li><strong>夏季</strong>：防暑降温、防蚊虫叮咬</li>
                    <li><strong>冬季</strong>：保暖、防止皮肤干燥</li>
                    <li><strong>春秋季</strong>：注意过敏原，如花粉等</li>
                </ul>
            </div>
        </div>
        
        <div class="card mb-4">
            <div class="card-header">相关帖子</div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12 mb-3">
                        <h5><a href="post-detail.jsp" class="text-decoration-none">春季宠物皮肤病预防与护理指南</a></h5>
                        <p class="text-muted"><small>作者：宠物医生小王 | 发布时间：2023-05-20</small></p>
                    </div>
                    <div class="col-md-12 mb-3">
                        <h5><a href="post-detail.jsp" class="text-decoration-none">如何给猫咪做好口腔护理</a></h5>
                        <p class="text-muted"><small>作者：猫咪护理师 | 发布时间：2023-04-15</small></p>
                    </div>
                    <div class="col-md-12">
                        <h5><a href="post-detail.jsp" class="text-decoration-none">宠物常见疾病的早期症状识别</a></h5>
                        <p class="text-muted"><small>作者：宠物健康顾问 | 发布时间：2023-03-10</small></p>
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