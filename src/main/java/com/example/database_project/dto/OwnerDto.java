package com.example.database_project.dto;

public class OwnerDto {
    private int ownerId;
    private String ownerName;
    private String password;
    private String licenseNum;
    private String email;
    private String phone;

    public OwnerDto(int ownerId, String ownerName, String password, String licenseNum, String email, String phone) {
        this.ownerId = ownerId;
        this.ownerName = ownerName;
        this.password = password;
        this.licenseNum = licenseNum;
        this.email = email;
        this.phone = phone;
    }

    public OwnerDto() {

    }

    public int getOwnerId() {
        return ownerId;
    }

    public String getOwnerName() {
        return ownerName;
    }

    public String getPassword() {
        return password;
    }

    public String getLicenseNum() {
        return licenseNum;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public void setOwnerId(int ownerId) {
        this.ownerId = ownerId;
    }

    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setLicenseNum(String licenseNum) {
        this.licenseNum = licenseNum;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
