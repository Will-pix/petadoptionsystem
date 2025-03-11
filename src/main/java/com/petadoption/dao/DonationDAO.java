package com.petadoption.dao;

import com.petadoption.model.Donation;
import com.petadoption.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DonationDAO {
    private UserDAO userDAO = new UserDAO();

    public List<Donation> getAllDonations(int page, int pageSize) {
        List<Donation> donations = new ArrayList<>();
        int offset = (page - 1) * pageSize;
        String sql = "SELECT * FROM donations ORDER BY create_time DESC LIMIT ? OFFSET ?";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, pageSize);
            pstmt.setInt(2, offset);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                donations.add(extractDonationFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return donations;
    }
    
    public int getTotalDonations() {
        String sql = "SELECT COUNT(*) FROM donations";
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
    
    public double getTotalAmount() {
        String sql = "SELECT SUM(amount) FROM donations WHERE status = 'COMPLETED'";
        try (Connection conn = DBUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            if (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0.0;
    }
    
    public List<Donation> getDonationsByUserId(int userId) {
        List<Donation> donations = new ArrayList<>();
        String sql = "SELECT * FROM donations WHERE user_id = ? ORDER BY create_time DESC";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                donations.add(extractDonationFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return donations;
    }
    
    public boolean createDonation(Donation donation) {
        String sql = "INSERT INTO donations (user_id, amount, purpose, message, status) VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, donation.getUserId());
            pstmt.setDouble(2, donation.getAmount());
            pstmt.setString(3, donation.getPurpose());
            pstmt.setString(4, donation.getMessage());
            pstmt.setString(5, "PENDING");
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean updateDonationStatus(int donationId, String status) {
        String sql = "UPDATE donations SET status = ? WHERE id = ?";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, status);
            pstmt.setInt(2, donationId);
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    private Donation extractDonationFromResultSet(ResultSet rs) throws SQLException {
        Donation donation = new Donation();
        donation.setId(rs.getInt("id"));
        donation.setUserId(rs.getInt("user_id"));
        donation.setAmount(rs.getDouble("amount"));
        donation.setPurpose(rs.getString("purpose"));
        donation.setMessage(rs.getString("message"));
        donation.setCreateTime(rs.getString("create_time"));
        donation.setStatus(rs.getString("status"));
        
        // 加载用户信息
        donation.setUser(userDAO.getUserById(donation.getUserId()));
        
        return donation;
    }
} 