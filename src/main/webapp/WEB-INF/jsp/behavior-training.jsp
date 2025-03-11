<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>行为训练 - 宠物社区</title>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <div class="container mt-4">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="community">宠物社区</a></li>
                <li class="breadcrumb-item"><a href="pet-experience.jsp">养宠心得</a></li>
                <li class="breadcrumb-item active">行为训练</li>
            </ol>
        </nav>
        
        <h2 class="text-center mb-4"><i class="fas fa-graduation-cap me-2"></i>行为训练</h2>
        
        <div class="card mb-4">
            <div class="card-body">
                <h3>宠物行为训练基础</h3>
                <p>良好的行为训练不仅能让宠物更听话，也能增强宠物的安全感和幸福感。以下是一些基本的训练原则和方法：</p>
                
                <h4 class="mt-4">训练原则</h4>
                <ul>
                    <li><strong>正向强化</strong>：通过奖励（食物、玩具、抚摸）鼓励良好行为</li>
                    <li><strong>一致性</strong>：保持指令和奖励的一致性，避免混淆宠物</li>
                    <li><strong>耐心</strong>：训练需要时间，不要期望立竿见影的效果</li>
                    <li><strong>短时多次</strong>：每次训练时间不宜过长，但可以增加训练频次</li>
                </ul>
                
                <h4 class="mt-4">犬类基础训练</h4>
                <ol>
                    <li><strong>坐下（Sit）</strong>：基础指令，是其他训练的基础</li>
                    <li><strong>待命（Stay）</strong>：教导狗狗在指定位置保持不动</li>
                    <li><strong>过来（Come）</strong>：召唤狗狗回到主人身边，对安全至关重要</li>
                    <li><strong>不要（No/Leave it）</strong>：阻止狗狗做某些行为</li>
                </ol>
                
                <h4 class="mt-4">猫咪训练技巧</h4>
                <ul>
                    <li><strong>使用猫砂盆</strong>：大多数猫咪天生会使用，但有时需要引导</li>
                    <li><strong>抓挠训练</strong>：提供猫抓板，引导猫咪在适当的地方抓挠</li>
                    <li><strong>简单指令</strong>：如"过来"、"坐下"等，猫咪也能学会</li>
                </ul>
                
                <h4 class="mt-4">常见行为问题纠正</h4>
                <ul>
                    <li><strong>乱叫/乱叫</strong>：找出原因（无聊、焦虑、领地意识），针对性解决</li>
                    <li><strong>咬人/抓人</strong>：区分玩耍和攻击行为，及时制止不当行为</li>
                    <li><strong>分离焦虑</strong>：逐渐训练宠物适应独处，提供足够的玩具和活动</li>
                </ul>
            </div>
        </div>
        
        <div class="card mb-4">
            <div class="card-header">相关帖子</div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-12 mb-3">
                        <h5><a href="post-detail.jsp" class="text-decoration-none">分享：如何训练猫咪使用猫砂盆</a></h5>
                        <p class="text-muted"><small>作者：猫咪训练师 | 发布时间：2023-06-10</small></p>
                    </div>
                    <div class="col-md-12 mb-3">
                        <h5><a href="post-detail.jsp" class="text-decoration-none">狗狗基础服从训练指南</a></h5>
                        <p class="text-muted"><small>作者：专业训犬师 | 发布时间：2023-05-05</small></p>
                    </div>
                    <div class="col-md-12">
                        <h5><a href="post-detail.jsp" class="text-decoration-none">如何纠正宠物的分离焦虑问题</a></h5>
                        <p class="text-muted"><small>作者：宠物行为学家 | 发布时间：2023-04-20</small></p>
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