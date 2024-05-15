package com.example.database_project.dto;

public class AccommodationDto {
    private int accommodationId;
    private int ownerId;
    private String category;
    private String accommodationName;
    private String location;
    private String grade;
    private float rating;


    public AccommodationDto(int accommodationId, String category, String accommodationName, String location, String grade) {
        this.accommodationId = accommodationId;
        this.category = category;
        this.accommodationName = accommodationName;
        this.location = location;
        this.grade = grade;
    }

    public AccommodationDto(int accommodationId, int ownerId, String category, String accommodationName, String location, String grade, float rating) {
        this.accommodationId = accommodationId;
        this.ownerId = ownerId;
        this.category = category;
        this.accommodationName = accommodationName;
        this.location = location;
        this.grade = grade;
        this.rating = rating;
    }

    public AccommodationDto() {

    }

    public int getAccommodationId() {
        return accommodationId;
    }

    public void setAccommodationId(int accommodationId) {
        this.accommodationId = accommodationId;
    }

    public int getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(int ownerId) {
        this.ownerId = ownerId;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getAccommodationName() {
        return accommodationName;
    }

    public void setAccommodationName(String accommodationName) {
        this.accommodationName = accommodationName;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }
}
