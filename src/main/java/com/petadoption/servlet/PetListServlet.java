package com.petadoption.servlet;

import com.petadoption.dao.PetDAO;
import com.petadoption.model.Pet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/pets")
public class PetListServlet extends HttpServlet {
    private PetDAO petDAO = new PetDAO();
    private static final int PAGE_SIZE = 8;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("detail".equals(action)) {
            // 显示宠物详情
            String idStr = request.getParameter("id");
            if (idStr != null && !idStr.trim().isEmpty()) {
                try {
                    int id = Integer.parseInt(idStr);
                    Pet pet = petDAO.getPetById(id);
                    if (pet != null) {
                        request.setAttribute("pet", pet);
                        request.getRequestDispatcher("/WEB-INF/jsp/pet-detail.jsp").forward(request, response);
                        return;
                    }
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                }
            }
            response.sendRedirect("pets");
        } else {
            // 显示宠物列表
            // 获取筛选参数
            String type = request.getParameter("type");
            String ageRange = request.getParameter("age");
            String gender = request.getParameter("gender");
            
            // 获取分页参数
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
            
            // 获取筛选后的宠物列表
            List<Pet> pets = petDAO.getFilteredPets(type, ageRange, gender, page, PAGE_SIZE);
            int totalPets = petDAO.getTotalFilteredPets(type, ageRange, gender);
            int totalPages = (int) Math.ceil((double) totalPets / PAGE_SIZE);
            
            // 设置请求属性
            request.setAttribute("pets", pets);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("type", type);
            request.setAttribute("age", ageRange);
            request.setAttribute("gender", gender);
            
            request.getRequestDispatcher("/WEB-INF/jsp/pet-list.jsp").forward(request, response);
        }
    }
} 