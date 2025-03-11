package com.petadoption.servlet;

import com.petadoption.dao.DonationDAO;
import com.petadoption.model.Donation;
import com.petadoption.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/donation")
public class DonationServlet extends HttpServlet {
    private DonationDAO donationDAO = new DonationDAO();
    private static final int PAGE_SIZE = 10;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("my".equals(action)) {
            // 显示我的捐赠记录
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            
            if (user == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            
            List<Donation> donations = donationDAO.getDonationsByUserId(user.getId());
            request.setAttribute("donations", donations);
            request.getRequestDispatcher("/WEB-INF/jsp/my-donations.jsp").forward(request, response);
        } else {
            // 显示捐赠列表
            int page = 1;
            String pageStr = request.getParameter("page");
            if (pageStr != null && !pageStr.trim().isEmpty()) {
                try {
                    page = Integer.parseInt(pageStr);
                    if (page < 1) page = 1;
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                }
            }
            
            List<Donation> donations = donationDAO.getAllDonations(page, PAGE_SIZE);
            int totalDonations = donationDAO.getTotalDonations();
            double totalAmount = donationDAO.getTotalAmount();
            int totalPages = (int) Math.ceil((double) totalDonations / PAGE_SIZE);
            
            request.setAttribute("donations", donations);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("totalAmount", totalAmount);
            request.getRequestDispatcher("/WEB-INF/jsp/donation.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        if ("donate".equals(action)) {
            // 提交捐赠
            try {
                double amount = Double.parseDouble(request.getParameter("amount"));
                String purpose = request.getParameter("purpose");
                String message = request.getParameter("message");

                if (amount <= 0) {
                    request.setAttribute("error", "捐赠金额必须大于0");
                    request.getRequestDispatcher("/WEB-INF/jsp/donation.jsp").forward(request, response);
                    return;
                }

                Donation donation = new Donation();
                donation.setUserId(user.getId());
                donation.setAmount(amount);
                donation.setPurpose(purpose);
                donation.setMessage(message);

                if (donationDAO.createDonation(donation)) {
                    response.sendRedirect("donation?action=my");
                } else {
                    request.setAttribute("error", "捐赠失败，请稍后重试");
                    request.getRequestDispatcher("/WEB-INF/jsp/donation.jsp").forward(request, response);
                }
            } catch (NumberFormatException e) {
                request.setAttribute("error", "捐赠金额格式不正确");
                request.getRequestDispatcher("/WEB-INF/jsp/donation.jsp").forward(request, response);
            }
        } else if ("updateStatus".equals(action) && "ADMIN".equals(user.getRole())) {
            // 更新捐赠状态（仅管理员可操作）
            try {
                int donationId = Integer.parseInt(request.getParameter("donationId"));
                String status = request.getParameter("status");
                
                if (donationDAO.updateDonationStatus(donationId, status)) {
                    response.sendRedirect("donation");
                } else {
                    response.sendRedirect("donation?error=更新状态失败");
                }
            } catch (NumberFormatException e) {
                response.sendRedirect("donation?error=参数错误");
            }
        }
    }
} 