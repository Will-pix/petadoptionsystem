<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.petadoption.dao.PetDAO" %>
<%@ page import="com.petadoption.model.Pet" %>
<%@ page import="java.util.List" %>
<%@ page import="com.petadoption.util.DBUtil" %>
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
<head>
    <title>测试宠物数据 - 宠物领养系统</title>
    <link href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h2>测试宠物数据</h2>
        
        <% 
        // 测试数据库连接
        try {
            Connection conn = DBUtil.getConnection();
            out.println("<div class='alert alert-success'>数据库连接成功！</div>");
            conn.close();
        } catch (Exception e) {
            out.println("<div class='alert alert-danger'>数据库连接失败：" + e.getMessage() + "</div>");
            e.printStackTrace();
        }
        
        // 获取所有宠物数据
        PetDAO petDAO = new PetDAO();
        List<Pet> allPets = petDAO.getAllPets();
        %>
        
        <h3>所有宠物数据（共 <%= allPets.size() %> 条）</h3>
        
        <% if (allPets.isEmpty()) { %>
            <div class="alert alert-warning">数据库中没有宠物数据！</div>
        <% } else { %>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>名称</th>
                        <th>类型</th>
                        <th>年龄</th>
                        <th>性别</th>
                        <th>状态</th>
                        <th>图片URL</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Pet pet : allPets) { %>
                        <tr>
                            <td><%= pet.getId() %></td>
                            <td><%= pet.getName() %></td>
                            <td><%= pet.getType() %></td>
                            <td><%= pet.getAge() %></td>
                            <td><%= pet.getGender() %></td>
                            <td><%= pet.getStatus() %></td>
                            <td><%= pet.getImageUrl() %></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% } %>
        
        <h3>测试分页和筛选</h3>
        <% 
        // 测试分页和筛选
        List<Pet> filteredPets = petDAO.getFilteredPets(null, null, null, 1, 8);
        int totalPets = petDAO.getTotalFilteredPets(null, null, null);
        %>
        
        <p>总宠物数量：<%= totalPets %></p>
        <p>第一页宠物数量：<%= filteredPets.size() %></p>
        
        <% if (filteredPets.isEmpty()) { %>
            <div class="alert alert-warning">没有符合条件的宠物数据！</div>
        <% } else { %>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>名称</th>
                        <th>类型</th>
                        <th>年龄</th>
                        <th>性别</th>
                        <th>状态</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Pet pet : filteredPets) { %>
                        <tr>
                            <td><%= pet.getId() %></td>
                            <td><%= pet.getName() %></td>
                            <td><%= pet.getType() %></td>
                            <td><%= pet.getAge() %></td>
                            <td><%= pet.getGender() %></td>
                            <td><%= pet.getStatus() %></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% } %>
    </div>
</body>
</html> 