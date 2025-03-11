<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>常见问题 - 宠物领养系统</title>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    
    <div class="container mt-4">
        <h2 class="mb-4">常见问题</h2>
        
        <div class="accordion" id="faqAccordion">
            <div class="accordion-item">
                <h3 class="accordion-header" id="heading1">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse1">
                        如何领养宠物？
                    </button>
                </h3>
                <div id="collapse1" class="accordion-collapse collapse show" data-bs-parent="#faqAccordion">
                    <div class="accordion-body">
                        <p>领养宠物的步骤如下：</p>
                        <ol>
                            <li>注册并登录账号</li>
                            <li>浏览领养中心的宠物列表</li>
                            <li>选择心仪的宠物，点击"申请领养"</li>
                            <li>填写领养申请表</li>
                            <li>等待工作人员审核</li>
                            <li>审核通过后，到线下完成领养手续</li>
                        </ol>
                    </div>
                </div>
            </div>
            
            <div class="accordion-item">
                <h3 class="accordion-header" id="heading2">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse2">
                        领养需要哪些条件？
                    </button>
                </h3>
                <div id="collapse2" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                    <div class="accordion-body">
                        <p>领养宠物需要满足以下条件：</p>
                        <ul>
                            <li>年满18岁，有完全民事行为能力</li>
                            <li>有稳定的居住环境</li>
                            <li>有稳定的经济来源</li>
                            <li>家庭成员同意领养</li>
                            <li>有足够的时间照顾宠物</li>
                            <li>承诺不遗弃、不虐待宠物</li>
                        </ul>
                    </div>
                </div>
            </div>
            
            <div class="accordion-item">
                <h3 class="accordion-header" id="heading3">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse3">
                        领养后需要注意什么？
                    </button>
                </h3>
                <div id="collapse3" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                    <div class="accordion-body">
                        <p>领养后请注意以下事项：</p>
                        <ul>
                            <li>按时接种疫苗</li>
                            <li>定期体检和驱虫</li>
                            <li>保持良好的卫生习惯</li>
                            <li>提供健康的饮食</li>
                            <li>适当运动和玩耍</li>
                            <li>有问题及时就医</li>
                            <li>遵守社区养宠物规定</li>
                        </ul>
                    </div>
                </div>
            </div>
            
            <div class="accordion-item">
                <h3 class="accordion-header" id="heading4">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse4">
                        如何参与爱心捐赠？
                    </button>
                </h3>
                <div id="collapse4" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                    <div class="accordion-body">
                        <p>您可以通过以下方式参与爱心捐赠：</p>
                        <ul>
                            <li>在线捐款：通过网站的爱心捐赠页面进行捐款</li>
                            <li>物资捐赠：捐赠宠物食品、用品等物资</li>
                            <li>志愿服务：参与志愿者活动，提供人力支持</li>
                        </ul>
                        <p>所有捐赠都将用于：</p>
                        <ul>
                            <li>宠物医疗救助</li>
                            <li>改善收容环境</li>
                            <li>购买宠物食品和用品</li>
                            <li>支持流浪动物救助工作</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"/>
    <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
</body>
</html> 