package com.petadoption.servlet;

import com.petadoption.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/init-db")
public class InitDBServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        response.getWriter().println("<!DOCTYPE html>");
        response.getWriter().println("<html>");
        response.getWriter().println("<head>");
        response.getWriter().println("<title>初始化数据库 - 宠物领养系统</title>");
        response.getWriter().println("<link href='https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css' rel='stylesheet'>");
        response.getWriter().println("</head>");
        response.getWriter().println("<body>");
        response.getWriter().println("<div class='container mt-4'>");
        response.getWriter().println("<h2>初始化数据库</h2>");
        
        try {
            // 测试数据库连接
            try (Connection conn = DBUtil.getConnection()) {
                response.getWriter().println("<div class='alert alert-success'>数据库连接成功！</div>");
            } catch (SQLException e) {
                response.getWriter().println("<div class='alert alert-danger'>数据库连接失败：" + e.getMessage() + "</div>");
                throw e;
            }
            
            // 执行创建表的SQL脚本
            response.getWriter().println("<h3>执行创建表的SQL脚本</h3>");
            executeScript("/sql/create_tables.sql", response);
            
            // 执行插入宠物数据的SQL脚本
            response.getWriter().println("<h3>执行插入宠物数据的SQL脚本</h3>");
            executeScript("/sql/pet_data.sql", response);
            
            response.getWriter().println("<div class='alert alert-success mt-4'>数据库初始化成功！</div>");
            response.getWriter().println("<div class='mt-4'>");
            response.getWriter().println("<a href='pets' class='btn btn-primary'>返回领养中心</a>");
            response.getWriter().println("<a href='test-pets.jsp' class='btn btn-info ms-2'>查看数据</a>");
            response.getWriter().println("</div>");
        } catch (Exception e) {
            response.getWriter().println("<div class='alert alert-danger mt-4'>数据库初始化失败：" + e.getMessage() + "</div>");
            response.getWriter().println("<pre>");
            e.printStackTrace(response.getWriter());
            response.getWriter().println("</pre>");
            response.getWriter().println("<div class='mt-4'>");
            response.getWriter().println("<a href='pets' class='btn btn-primary'>返回领养中心</a>");
            response.getWriter().println("</div>");
        }
        
        response.getWriter().println("</div>");
        response.getWriter().println("</body>");
        response.getWriter().println("</html>");
    }
    
    private void executeScript(String scriptPath, HttpServletResponse response) throws IOException, SQLException {
        InputStream is = getServletContext().getResourceAsStream(scriptPath);
        if (is == null) {
            response.getWriter().println("<div class='alert alert-danger'>找不到脚本文件：" + scriptPath + "</div>");
            throw new IOException("找不到脚本文件：" + scriptPath);
        }
        
        BufferedReader reader = new BufferedReader(new InputStreamReader(is));
        StringBuilder sb = new StringBuilder();
        String line;
        List<String> statements = new ArrayList<>();
        
        while ((line = reader.readLine()) != null) {
            // 忽略注释和空行
            if (line.trim().startsWith("--") || line.trim().isEmpty()) {
                continue;
            }
            
            sb.append(line);
            
            // 如果行以分号结尾，表示一条完整的SQL语句
            if (line.trim().endsWith(";")) {
                statements.add(sb.toString());
                sb = new StringBuilder();
            }
        }
        
        reader.close();
        
        if (statements.isEmpty()) {
            response.getWriter().println("<div class='alert alert-warning'>脚本文件中没有SQL语句：" + scriptPath + "</div>");
            return;
        }
        
        response.getWriter().println("<div class='card mb-4'>");
        response.getWriter().println("<div class='card-header'>执行SQL语句</div>");
        response.getWriter().println("<div class='card-body'>");
        response.getWriter().println("<table class='table table-striped'>");
        response.getWriter().println("<thead><tr><th>SQL语句</th><th>结果</th></tr></thead>");
        response.getWriter().println("<tbody>");
        
        // 执行SQL语句
        try (Connection conn = DBUtil.getConnection();
             Statement stmt = conn.createStatement()) {
            
            for (String sql : statements) {
                response.getWriter().println("<tr>");
                response.getWriter().println("<td><code>" + sql.substring(0, Math.min(100, sql.length())) + (sql.length() > 100 ? "..." : "") + "</code></td>");
                
                try {
                    stmt.execute(sql);
                    response.getWriter().println("<td><span class='text-success'>成功</span></td>");
                } catch (SQLException e) {
                    response.getWriter().println("<td><span class='text-danger'>失败：" + e.getMessage() + "</span></td>");
                    throw e;
                }
                
                response.getWriter().println("</tr>");
            }
        }
        
        response.getWriter().println("</tbody>");
        response.getWriter().println("</table>");
        response.getWriter().println("</div>");
        response.getWriter().println("</div>");
    }
} 