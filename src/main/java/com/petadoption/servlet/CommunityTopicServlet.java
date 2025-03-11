package com.petadoption.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {
    "/scientific-feeding.jsp", 
    "/health-care.jsp", 
    "/behavior-training.jsp", 
    "/breed-introduction.jsp",
    "/post-detail.jsp",
    "/pet-experience.jsp"
})
public class CommunityTopicServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestURI = request.getRequestURI();
        String jspPage;
        
        if (requestURI.contains("scientific-feeding")) {
            jspPage = "/WEB-INF/jsp/scientific-feeding.jsp";
        } else if (requestURI.contains("health-care")) {
            jspPage = "/WEB-INF/jsp/health-care.jsp";
        } else if (requestURI.contains("behavior-training")) {
            jspPage = "/WEB-INF/jsp/behavior-training.jsp";
        } else if (requestURI.contains("breed-introduction")) {
            jspPage = "/WEB-INF/jsp/breed-introduction.jsp";
        } else if (requestURI.contains("post-detail")) {
            jspPage = "/WEB-INF/jsp/post-detail.jsp";
        } else if (requestURI.contains("pet-experience")) {
            jspPage = "/WEB-INF/jsp/pet-experience.jsp";
        } else {
            jspPage = "/WEB-INF/jsp/community.jsp";
        }
        
        request.getRequestDispatcher(jspPage).forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
} 