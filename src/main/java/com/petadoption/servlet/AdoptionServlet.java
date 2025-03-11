package com.petadoption.servlet;

import com.petadoption.dao.AdoptionApplicationDAO;
import com.petadoption.dao.PetDAO;
import com.petadoption.model.AdoptionApplication;
import com.petadoption.model.Pet;
import com.petadoption.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/adoption")
public class AdoptionServlet extends HttpServlet {
    private AdoptionApplicationDAO adoptionDAO = new AdoptionApplicationDAO();
    private PetDAO petDAO = new PetDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        if ("apply".equals(action)) {
            // 显示申请表单
            String petId = request.getParameter("petId");
            if (petId != null) {
                Pet pet = petDAO.getPetById(Integer.parseInt(petId));
                if (pet != null && "AVAILABLE".equals(pet.getStatus())) {
                    request.setAttribute("pet", pet);
                    request.getRequestDispatcher("/WEB-INF/jsp/adoption-form.jsp").forward(request, response);
                    return;
                }
            }
            response.sendRedirect("pets");
        } else if ("list".equals(action)) {
            // 显示申请列表
            List<AdoptionApplication> applications;
            if ("ADMIN".equals(user.getRole())) {
                // 管理员可以看到所有待处理的申请
                applications = adoptionDAO.getAllPendingApplications();
            } else {
                // 普通用户只能看到自己的申请
                applications = adoptionDAO.getApplicationsByAdopter(user.getId());
            }
            request.setAttribute("applications", applications);
            request.getRequestDispatcher("/WEB-INF/jsp/adoption-list.jsp").forward(request, response);
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

        if ("submit".equals(action)) {
            // 提交领养申请
            String petId = request.getParameter("petId");
            String livingCondition = request.getParameter("livingCondition");
            String adoptionReason = request.getParameter("adoptionReason");
            String contactInfo = request.getParameter("contactInfo");

            AdoptionApplication application = new AdoptionApplication();
            application.setPetId(Integer.parseInt(petId));
            application.setAdopterId(user.getId());
            application.setLivingCondition(livingCondition);
            application.setAdoptionReason(adoptionReason);
            application.setContactInfo(contactInfo);

            if (adoptionDAO.createApplication(application)) {
                response.sendRedirect("adoption?action=list");
            } else {
                request.setAttribute("error", "申请提交失败，请稍后重试");
                request.getRequestDispatcher("/WEB-INF/jsp/adoption-form.jsp").forward(request, response);
            }
        } else if ("process".equals(action) && "ADMIN".equals(user.getRole())) {
            // 处理领养申请（仅管理员）
            String applicationId = request.getParameter("applicationId");
            String status = request.getParameter("status");
            
            if (adoptionDAO.updateApplicationStatus(Integer.parseInt(applicationId), status)) {
                response.sendRedirect("adoption?action=list");
            } else {
                response.sendRedirect("adoption?action=list&error=处理失败");
            }
        }
    }
} 