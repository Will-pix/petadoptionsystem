package com.petadoption.dao;

import com.petadoption.model.Comment;
import com.petadoption.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CommentDAO {
    private UserDAO userDAO = new UserDAO();

    public List<Comment> getCommentsByPostId(int postId) {
        List<Comment> comments = new ArrayList<>();
        String sql = "SELECT * FROM comments WHERE post_id = ? ORDER BY create_time ASC";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, postId);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                comments.add(extractCommentFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return comments;
    }
    
    public boolean createComment(Comment comment) {
        String sql = "INSERT INTO comments (post_id, user_id, content) VALUES (?, ?, ?)";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, comment.getPostId());
            pstmt.setInt(2, comment.getUserId());
            pstmt.setString(3, comment.getContent());
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean deleteComment(int commentId, int userId) {
        String sql = "DELETE FROM comments WHERE id = ? AND user_id = ?";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, commentId);
            pstmt.setInt(2, userId);
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean adminDeleteComment(int commentId) {
        String sql = "DELETE FROM comments WHERE id = ?";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, commentId);
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    private Comment extractCommentFromResultSet(ResultSet rs) throws SQLException {
        Comment comment = new Comment();
        comment.setId(rs.getInt("id"));
        comment.setPostId(rs.getInt("post_id"));
        comment.setUserId(rs.getInt("user_id"));
        comment.setContent(rs.getString("content"));
        comment.setCreateTime(rs.getString("create_time"));
        
        // 加载用户信息
        comment.setUser(userDAO.getUserById(comment.getUserId()));
        
        return comment;
    }
} 