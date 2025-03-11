package com.petadoption.dao;

import com.petadoption.model.AdoptionApplication;
import com.petadoption.model.Pet;
import com.petadoption.model.User;
import com.petadoption.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdoptionApplicationDAO {
    private PetDAO petDAO = new PetDAO();
    private UserDAO userDAO = new UserDAO();

    public boolean createApplication(AdoptionApplication application) {
        String sql = "INSERT INTO adoption_applications (pet_id, adopter_id, status, living_condition, " +
                    "adoption_reason, contact_info) VALUES (?, ?, 'PENDING', ?, ?, ?)";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, application.getPetId());
            pstmt.setInt(2, application.getAdopterId());
            pstmt.setString(3, application.getLivingCondition());
            pstmt.setString(4, application.getAdoptionReason());
            pstmt.setString(5, application.getContactInfo());
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean updateApplicationStatus(int applicationId, String status) {
        String sql = "UPDATE adoption_applications SET status = ? WHERE id = ?";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, status);
            pstmt.setInt(2, applicationId);
            
            if (pstmt.executeUpdate() > 0) {
                // 如果申请被批准，更新宠物状态
                if ("APPROVED".equals(status)) {
                    AdoptionApplication app = getApplicationById(applicationId);
                    if (app != null) {
                        petDAO.updatePetStatus(app.getPetId(), "ADOPTED");
                    }
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public List<AdoptionApplication> getApplicationsByAdopter(int adopterId) {
        List<AdoptionApplication> applications = new ArrayList<>();
        String sql = "SELECT * FROM adoption_applications WHERE adopter_id = ? ORDER BY create_time DESC";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, adopterId);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                applications.add(extractApplicationFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return applications;
    }
    
    public List<AdoptionApplication> getApplicationsByPet(int petId) {
        List<AdoptionApplication> applications = new ArrayList<>();
        String sql = "SELECT * FROM adoption_applications WHERE pet_id = ? ORDER BY create_time DESC";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, petId);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                applications.add(extractApplicationFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return applications;
    }
    
    public List<AdoptionApplication> getAllPendingApplications() {
        List<AdoptionApplication> applications = new ArrayList<>();
        String sql = "SELECT * FROM adoption_applications WHERE status = 'PENDING' ORDER BY create_time DESC";
        
        try (Connection conn = DBUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                applications.add(extractApplicationFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return applications;
    }
    
    public AdoptionApplication getApplicationById(int id) {
        String sql = "SELECT * FROM adoption_applications WHERE id = ?";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return extractApplicationFromResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    private AdoptionApplication extractApplicationFromResultSet(ResultSet rs) throws SQLException {
        AdoptionApplication application = new AdoptionApplication();
        application.setId(rs.getInt("id"));
        application.setPetId(rs.getInt("pet_id"));
        application.setAdopterId(rs.getInt("adopter_id"));
        application.setStatus(rs.getString("status"));
        application.setLivingCondition(rs.getString("living_condition"));
        application.setAdoptionReason(rs.getString("adoption_reason"));
        application.setContactInfo(rs.getString("contact_info"));
        application.setCreateTime(rs.getString("create_time"));
        
        // 加载关联的宠物和领养人信息
        Pet pet = petDAO.getPetById(application.getPetId());
        User adopter = userDAO.getUserById(application.getAdopterId());
        application.setPet(pet);
        application.setAdopter(adopter);
        
        return application;
    }
} 