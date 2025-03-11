package com.petadoption.dao;

import com.petadoption.model.Post;
import com.petadoption.model.Comment;
import com.petadoption.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDAO {
    private UserDAO userDAO = new UserDAO();
    private CommentDAO commentDAO = new CommentDAO();

    public List<Post> getAllPosts(int page, int pageSize) {
        List<Post> posts = new ArrayList<>();
        int offset = (page - 1) * pageSize;
        String sql = "SELECT p.*, (SELECT COUNT(*) FROM comments c WHERE c.post_id = p.id) as comment_count " +
                    "FROM posts p ORDER BY p.create_time DESC LIMIT ? OFFSET ?";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, pageSize);
            pstmt.setInt(2, offset);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                Post post = extractPostFromResultSet(rs);
                post.setCommentCount(rs.getInt("comment_count"));
                posts.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return posts;
    }
    
    // 获取特定板块的帖子
    public List<Post> getPostsByForum(String forum, int page, int pageSize) {
        List<Post> posts = new ArrayList<>();
        int offset = (page - 1) * pageSize;
        String sql = "SELECT p.*, (SELECT COUNT(*) FROM comments c WHERE c.post_id = p.id) as comment_count " +
                    "FROM posts p WHERE p.forum = ? ORDER BY p.create_time DESC LIMIT ? OFFSET ?";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, forum);
            pstmt.setInt(2, pageSize);
            pstmt.setInt(3, offset);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                Post post = extractPostFromResultSet(rs);
                post.setCommentCount(rs.getInt("comment_count"));
                posts.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return posts;
    }
    
    public int getTotalPosts() {
        String sql = "SELECT COUNT(*) FROM posts";
        try (Connection conn = DBUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    // 获取特定板块的帖子总数
    public int getTotalPostsByForum(String forum) {
        String sql = "SELECT COUNT(*) FROM posts WHERE forum = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, forum);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    public Post getPostById(int id) {
        String sql = "SELECT p.*, (SELECT COUNT(*) FROM comments c WHERE c.post_id = p.id) as comment_count " +
                    "FROM posts p WHERE p.id = ?";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                Post post = extractPostFromResultSet(rs);
                post.setCommentCount(rs.getInt("comment_count"));
                // 加载评论
                post.setComments(commentDAO.getCommentsByPostId(id));
                return post;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public boolean createPost(Post post) {
        String sql = "INSERT INTO posts (user_id, title, content, forum) VALUES (?, ?, ?, ?)";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, post.getUserId());
            pstmt.setString(2, post.getTitle());
            pstmt.setString(3, post.getContent());
            pstmt.setString(4, post.getForum()); // 添加forum字段
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean deletePost(int postId, int userId) {
        String sql = "DELETE FROM posts WHERE id = ? AND user_id = ?";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, postId);
            pstmt.setInt(2, userId);
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean adminDeletePost(int postId) {
        String sql = "DELETE FROM posts WHERE id = ?";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, postId);
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    private Post extractPostFromResultSet(ResultSet rs) throws SQLException {
        Post post = new Post();
        post.setId(rs.getInt("id"));
        post.setUserId(rs.getInt("user_id"));
        post.setTitle(rs.getString("title"));
        post.setContent(rs.getString("content"));
        post.setCreateTime(rs.getString("create_time"));
        
        // 获取forum字段（如果存在）
        try {
            post.setForum(rs.getString("forum"));
        } catch (SQLException e) {
            // 如果forum字段不存在，忽略错误
        }
        
        // 加载用户信息
        post.setUser(userDAO.getUserById(post.getUserId()));
        
        return post;
    }
} 