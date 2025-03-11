package com.petadoption.dao;

import com.petadoption.model.Pet;
import com.petadoption.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PetDAO {
    
    public List<Pet> getAllPets() {
        List<Pet> pets = new ArrayList<>();
        String sql = "SELECT * FROM pets ORDER BY create_time DESC";
        
        try (Connection conn = DBUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                pets.add(extractPetFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pets;
    }
    
    public List<Pet> getAvailablePets() {
        List<Pet> pets = new ArrayList<>();
        String sql = "SELECT * FROM pets WHERE status = 'AVAILABLE' ORDER BY create_time DESC";
        
        try (Connection conn = DBUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                pets.add(extractPetFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pets;
    }
    
    public List<Pet> getFilteredPets(String type, String ageRange, String gender, int page, int pageSize) {
        List<Pet> pets = new ArrayList<>();
        StringBuilder sqlBuilder = new StringBuilder("SELECT * FROM pets WHERE status = 'AVAILABLE'");
        List<Object> params = new ArrayList<>();
        
        // 添加筛选条件
        if (type != null && !type.isEmpty()) {
            sqlBuilder.append(" AND type = ?");
            params.add(type);
        }
        
        if (gender != null && !gender.isEmpty()) {
            sqlBuilder.append(" AND gender = ?");
            params.add(gender);
        }
        
        if (ageRange != null && !ageRange.isEmpty()) {
            if ("0-1".equals(ageRange)) {
                sqlBuilder.append(" AND age < 1");
            } else if ("1-3".equals(ageRange)) {
                sqlBuilder.append(" AND age >= 1 AND age <= 3");
            } else if ("3-7".equals(ageRange)) {
                sqlBuilder.append(" AND age > 3 AND age <= 7");
            } else if ("7+".equals(ageRange)) {
                sqlBuilder.append(" AND age > 7");
            }
        }
        
        // 添加排序和分页
        sqlBuilder.append(" ORDER BY create_time DESC LIMIT ? OFFSET ?");
        params.add(pageSize);
        params.add((page - 1) * pageSize);
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sqlBuilder.toString())) {
            
            // 设置参数
            for (int i = 0; i < params.size(); i++) {
                pstmt.setObject(i + 1, params.get(i));
            }
            
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                pets.add(extractPetFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return pets;
    }
    
    public int getTotalFilteredPets(String type, String ageRange, String gender) {
        StringBuilder sqlBuilder = new StringBuilder("SELECT COUNT(*) FROM pets WHERE status = 'AVAILABLE'");
        List<Object> params = new ArrayList<>();
        
        // 添加筛选条件
        if (type != null && !type.isEmpty()) {
            sqlBuilder.append(" AND type = ?");
            params.add(type);
        }
        
        if (gender != null && !gender.isEmpty()) {
            sqlBuilder.append(" AND gender = ?");
            params.add(gender);
        }
        
        if (ageRange != null && !ageRange.isEmpty()) {
            if ("0-1".equals(ageRange)) {
                sqlBuilder.append(" AND age < 1");
            } else if ("1-3".equals(ageRange)) {
                sqlBuilder.append(" AND age >= 1 AND age <= 3");
            } else if ("3-7".equals(ageRange)) {
                sqlBuilder.append(" AND age > 3 AND age <= 7");
            } else if ("7+".equals(ageRange)) {
                sqlBuilder.append(" AND age > 7");
            }
        }
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sqlBuilder.toString())) {
            
            // 设置参数
            for (int i = 0; i < params.size(); i++) {
                pstmt.setObject(i + 1, params.get(i));
            }
            
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return 0;
    }
    
    public Pet getPetById(int id) {
        String sql = "SELECT * FROM pets WHERE id = ?";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return extractPetFromResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public boolean addPet(Pet pet) {
        String sql = "INSERT INTO pets (name, type, age, gender, breed, `character`, health, description, " +
                    "image_url, volunteer_id, found_location, found_time, status) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, pet.getName());
            pstmt.setString(2, pet.getType());
            pstmt.setInt(3, pet.getAge());
            pstmt.setString(4, pet.getGender());
            pstmt.setString(5, pet.getBreed());
            pstmt.setString(6, pet.getCharacter());
            pstmt.setString(7, pet.getHealth());
            pstmt.setString(8, pet.getDescription());
            pstmt.setString(9, pet.getImageUrl());
            pstmt.setInt(10, pet.getVolunteerId());
            pstmt.setString(11, pet.getFoundLocation());
            pstmt.setString(12, pet.getFoundTime());
            pstmt.setString(13, "AVAILABLE");
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean updatePetStatus(int petId, String status) {
        String sql = "UPDATE pets SET status = ? WHERE id = ?";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, status);
            pstmt.setInt(2, petId);
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    private Pet extractPetFromResultSet(ResultSet rs) throws SQLException {
        Pet pet = new Pet();
        pet.setId(rs.getInt("id"));
        pet.setName(rs.getString("name"));
        pet.setType(rs.getString("type"));
        pet.setAge(rs.getInt("age"));
        pet.setGender(rs.getString("gender"));
        pet.setBreed(rs.getString("breed"));
        pet.setCharacter(rs.getString("character"));
        pet.setHealth(rs.getString("health"));
        pet.setDescription(rs.getString("description"));
        pet.setImageUrl(rs.getString("image_url"));
        pet.setVolunteerId(rs.getInt("volunteer_id"));
        pet.setFoundLocation(rs.getString("found_location"));
        pet.setFoundTime(rs.getString("found_time"));
        pet.setStatus(rs.getString("status"));
        pet.setCreateTime(rs.getString("create_time"));
        return pet;
    }
}