package com.petadoption.model;

public class AdoptionApplication {
    private int id;
    private int petId;
    private int adopterId;
    private String status; // PENDING, APPROVED, REJECTED
    private String livingCondition;
    private String adoptionReason;
    private String contactInfo;
    private String createTime;
    
    // 扩展字段，用于显示关联信息
    private Pet pet;
    private User adopter;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPetId() {
        return petId;
    }

    public void setPetId(int petId) {
        this.petId = petId;
    }

    public int getAdopterId() {
        return adopterId;
    }

    public void setAdopterId(int adopterId) {
        this.adopterId = adopterId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getLivingCondition() {
        return livingCondition;
    }

    public void setLivingCondition(String livingCondition) {
        this.livingCondition = livingCondition;
    }

    public String getAdoptionReason() {
        return adoptionReason;
    }

    public void setAdoptionReason(String adoptionReason) {
        this.adoptionReason = adoptionReason;
    }

    public String getContactInfo() {
        return contactInfo;
    }

    public void setContactInfo(String contactInfo) {
        this.contactInfo = contactInfo;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public Pet getPet() {
        return pet;
    }

    public void setPet(Pet pet) {
        this.pet = pet;
    }

    public User getAdopter() {
        return adopter;
    }

    public void setAdopter(User adopter) {
        this.adopter = adopter;
    }
} 