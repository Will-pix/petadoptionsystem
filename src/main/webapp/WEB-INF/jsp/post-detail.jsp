<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>帖子详情 - 宠物社区</title>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <div class="container mt-4">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="community">宠物社区</a></li>
                <li class="breadcrumb-item"><a href="pet-experience.jsp">养宠心得</a></li>
                <li class="breadcrumb-item active">帖子详情</li>
            </ol>
        </nav>
        
        <div class="card mb-4">
            <div class="card-header">
                <h3 class="mb-0">如何科学喂养1岁以下的金毛犬？</h3>
                <p class="text-muted mb-0">
                    <small>
                        <i class="fas fa-user me-1"></i> 金毛爱好者 | 
                        <i class="fas fa-clock me-1"></i> 2023-06-15 14:30 | 
                        <i class="fas fa-tag me-1"></i> 科学喂养
                    </small>
                </p>
            </div>
            <div class="card-body">
                <p>大家好，我是一位金毛犬的主人，我家的金毛现在11个月大。在这段养育的过程中，我积累了一些关于幼犬喂养的经验，今天想和大家分享一下。</p>
                
                <h4 class="mt-4">1. 喂食频率</h4>
                <p>金毛幼犬的喂食频率应该根据年龄调整：</p>
                <ul>
                    <li>2-3个月：每天4次</li>
                    <li>3-6个月：每天3次</li>
                    <li>6-12个月：每天2次</li>
                </ul>
                <p>定时定量喂食有助于建立良好的饮食习惯，也便于管理排便时间。</p>
                
                <h4 class="mt-4">2. 食物选择</h4>
                <p>幼犬阶段需要高蛋白、高能量的食物支持生长发育：</p>
                <ul>
                    <li>专业幼犬粮：选择含有DHA的幼犬专用狗粮，有助于大脑发育</li>
                    <li>蛋白质来源：鸡肉、鱼肉、牛肉等优质蛋白</li>
                    <li>钙质补充：适量补充钙质，但不要过量，以免影响骨骼发育</li>
                </ul>
                
                <h4 class="mt-4">3. 注意事项</h4>
                <ul>
                    <li>避免人类食物：巧克力、葡萄、洋葱等对狗狗有毒</li>
                    <li>控制零食量：零食不应超过每日总热量的10%</li>
                    <li>充足的水：确保随时有干净的饮用水</li>
                    <li>观察粪便：粪便状态是判断消化健康的重要指标</li>
                </ul>
                
                <h4 class="mt-4">4. 我的实践经验</h4>
                <p>我家金毛从4个月开始，我采用了"主食+鲜食"的喂养方式：</p>
                <ul>
                    <li>早晚各一餐优质幼犬粮</li>
                    <li>每周2-3次添加煮熟的鸡胸肉、胡萝卜等</li>
                    <li>每天固定时间喂食，建立规律</li>
                </ul>
                <p>这种方式既保证了营养均衡，又增加了食物多样性，我家金毛目前毛发亮丽，精力充沛，体重控制也很理想。</p>
                
                <p class="mt-4">以上就是我的一些经验分享，希望对各位金毛新手爸妈有所帮助。欢迎在评论区交流你们的喂养心得！</p>
            </div>
        </div>
        
        <div class="card mb-4">
            <div class="card-header">
                <h5 class="mb-0">评论 (3)</h5>
            </div>
            <div class="card-body">
                <div class="border-bottom pb-3 mb-3">
                    <div class="d-flex justify-content-between">
                        <h6>狗狗训练师</h6>
                        <small class="text-muted">2023-06-15 15:45</small>
                    </div>
                    <p>非常实用的建议！我想补充一点，金毛幼犬在6个月左右会开始换牙，这个阶段可以适当增加一些磨牙棒或咬胶，帮助它们缓解牙龈不适。</p>
                </div>
                
                <div class="border-bottom pb-3 mb-3">
                    <div class="d-flex justify-content-between">
                        <h6>金毛妈妈</h6>
                        <small class="text-muted">2023-06-16 09:20</small>
                    </div>
                    <p>感谢分享！请问你家金毛有挑食的问题吗？我家的小金有时候会对狗粮不太感兴趣，不知道该怎么解决。</p>
                </div>
                
                <div>
                    <div class="d-flex justify-content-between">
                        <h6>宠物营养师</h6>
                        <small class="text-muted">2023-06-16 14:10</small>
                    </div>
                    <p>很专业的分享！建议大家在喂养幼犬时，要特别注意钙磷比例，理想的钙磷比例是1.2:1。过量的钙质反而会影响骨骼发育和关节健康。</p>
                </div>
            </div>
        </div>
        
        <div class="card mb-4">
            <div class="card-header">
                <h5 class="mb-0">发表评论</h5>
            </div>
            <div class="card-body">
                <form>
                    <div class="mb-3">
                        <textarea class="form-control" rows="3" placeholder="分享你的想法..."></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">提交评论</button>
                </form>
            </div>
        </div>
        
        <div class="text-center mt-4">
            <a href="pet-experience.jsp" class="btn btn-primary">返回养宠心得</a>
        </div>
    </div>
    <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html> 