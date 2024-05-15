package com.example.database_project.dto;

public class RoomDto {
    private int roomId;
    private int accommodationId;
    private String roomType;
    private int roomCount;
    private int price;
    private boolean availability;

    public RoomDto(int roomId, int accommodationId, String roomType, int roomCount, int price, boolean availability) {
        this.roomId = roomId;
        this.accommodationId = accommodationId;
        this.roomType = roomType;
        this.roomCount = roomCount;
        this.price = price;
        this.availability = availability;
    }

    public RoomDto(int roomId, String roomType, int roomCount, int price, boolean availability) {
        this.roomId = roomId;
        this.roomType = roomType;
        this.roomCount = roomCount;
        this.price = price;
        this.availability = availability;
    }

    public RoomDto() {

    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public int getAccommodationId() {
        return accommodationId;
    }

    public void setAccommodationId(int accommodationId) {
        this.accommodationId = accommodationId;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public int getRoomCount() {
        return roomCount;
    }

    public void setRoomCount(int roomCount) {
        this.roomCount = roomCount;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public boolean isAvailability() {
        return availability;
    }

    public void setAvailability(boolean availability) {
        this.availability = availability;
    }
}
