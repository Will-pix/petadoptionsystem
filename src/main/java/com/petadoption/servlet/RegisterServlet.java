package com.petadoption.servlet;

import com.petadoption.dao.UserDAO;
import com.petadoption.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String role = request.getParameter("role");

        // 验证两次密码是否一致
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "两次输入的密码不一致");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        // 创建用户对象
        User user = new User();
        user.setUsername(username);
        user.setPassword(password); // 实际应用中应该对密码进行加密
        user.setEmail(email);
        user.setPhone(phone);
        user.setRole(role);
        user.setBanned(false);

        // 注册用户
        if (userDAO.register(user)) {
            // 注册成功，重定向到登录页面
            response.sendRedirect("login.jsp");
        } else {
            // 注册失败，可能是用户名已存在
            request.setAttribute("error", "注册失败，用户名可能已存在");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/register.jsp").forward(request, response);
    }
} 