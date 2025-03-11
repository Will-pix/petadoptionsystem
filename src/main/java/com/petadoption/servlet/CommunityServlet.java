package com.petadoption.servlet;

import com.petadoption.dao.PostDAO;
import com.petadoption.dao.CommentDAO;
import com.petadoption.model.Post;
import com.petadoption.model.Comment;
import com.petadoption.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/community")
public class CommunityServlet extends HttpServlet {
    private PostDAO postDAO = new PostDAO();
    private CommentDAO commentDAO = new CommentDAO();
    private static final int PAGE_SIZE = 10;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String forum = request.getParameter("forum");
        
        // 处理进入特定板块的请求
        if (forum != null && !forum.isEmpty()) {
            switch (forum) {
                case "pet-experience":
                    request.getRequestDispatcher("/WEB-INF/jsp/pet-experience.jsp").forward(request, response);
                    return;
                case "pet-rescue":
                    request.getRequestDispatcher("/WEB-INF/jsp/pet-rescue.jsp").forward(request, response);
                    return;
                case "animal-protection":
                    request.getRequestDispatcher("/WEB-INF/jsp/animal-protection.jsp").forward(request, response);
                    return;
                case "pet-goods":
                    request.getRequestDispatcher("/WEB-INF/jsp/pet-goods.jsp").forward(request, response);
                    return;
                default:
                    break;
            }
        }
        
        if ("detail".equals(action)) {
            // 显示帖子详情
            String postId = request.getParameter("id");
            if (postId != null) {
                Post post = postDAO.getPostById(Integer.parseInt(postId));
                if (post != null) {
                    request.setAttribute("post", post);
                    request.getRequestDispatcher("/WEB-INF/jsp/post-detail.jsp").forward(request, response);
                    return;
                }
            }
            response.sendRedirect("community");
        } else {
            // 显示帖子列表
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
            
            List<Post> posts = postDAO.getAllPosts(page, PAGE_SIZE);
            int totalPosts = postDAO.getTotalPosts();
            int totalPages = (int) Math.ceil((double) totalPosts / PAGE_SIZE);
            
            request.setAttribute("posts", posts);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.getRequestDispatcher("/WEB-INF/jsp/community.jsp").forward(request, response);
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

        if ("post".equals(action)) {
            // 发布帖子
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String forum = request.getParameter("forum"); // 获取所属板块

            Post post = new Post();
            post.setUserId(user.getId());
            post.setTitle(title);
            post.setContent(content);
            
            // 如果有板块信息，保存到帖子中
            if (forum != null && !forum.isEmpty()) {
                post.setForum(forum);
            }

            if (postDAO.createPost(post)) {
                // 如果有指定板块，发布成功后返回该板块
                if (forum != null && !forum.isEmpty()) {
                    response.sendRedirect("community?forum=" + forum);
                } else {
                    response.sendRedirect("community");
                }
            } else {
                String errorMsg = "发布失败，请稍后重试";
                if (forum != null && !forum.isEmpty()) {
                    // 根据不同板块转发到不同页面
                    request.setAttribute("error", errorMsg);
                    request.getRequestDispatcher("/WEB-INF/jsp/" + forum + ".jsp").forward(request, response);
                } else {
                    request.setAttribute("error", errorMsg);
                    request.getRequestDispatcher("/WEB-INF/jsp/community.jsp").forward(request, response);
                }
            }
        } else if ("comment".equals(action)) {
            // 发表评论
            String postId = request.getParameter("postId");
            String content = request.getParameter("content");

            Comment comment = new Comment();
            comment.setPostId(Integer.parseInt(postId));
            comment.setUserId(user.getId());
            comment.setContent(content);

            if (commentDAO.createComment(comment)) {
                response.sendRedirect("community?action=detail&id=" + postId);
            } else {
                response.sendRedirect("community?action=detail&id=" + postId + "&error=评论失败");
            }
        } else if ("deletePost".equals(action)) {
            // 删除帖子
            String postId = request.getParameter("postId");
            boolean success = false;
            
            if ("ADMIN".equals(user.getRole())) {
                success = postDAO.adminDeletePost(Integer.parseInt(postId));
            } else {
                success = postDAO.deletePost(Integer.parseInt(postId), user.getId());
            }
            
            if (success) {
                response.sendRedirect("community");
            } else {
                response.sendRedirect("community?error=删除失败");
            }
        } else if ("deleteComment".equals(action)) {
            // 删除评论
            String commentId = request.getParameter("commentId");
            String postId = request.getParameter("postId");
            boolean success = false;
            
            if ("ADMIN".equals(user.getRole())) {
                success = commentDAO.adminDeleteComment(Integer.parseInt(commentId));
            } else {
                success = commentDAO.deleteComment(Integer.parseInt(commentId), user.getId());
            }
            
            if (success) {
                response.sendRedirect("community?action=detail&id=" + postId);
            } else {
                response.sendRedirect("community?action=detail&id=" + postId + "&error=删除失败");
            }
        }
    }
} 