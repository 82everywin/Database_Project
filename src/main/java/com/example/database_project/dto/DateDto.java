package com.example.database_project.dto;

import java.sql.Date;

public class DateDto {

    private int availableDateId;
    private int roomid;
    private Date date;
    private Boolean isAvailable;

    public DateDto(int availableDateId, int roomid, Date date, boolean isAvailable) {
        this.availableDateId = availableDateId;
        this.roomid = roomid;
        this.date = date;
        this.isAvailable = isAvailable;
    }

    public DateDto(int availableDateId) {
        this.availableDateId = availableDateId;
    }

    public DateDto() {

    }

    public int getAvailableDateId() {
        return availableDateId;
    }

    public void setAvailableDateId(int availableDateId) {
        this.availableDateId = availableDateId;
    }

    public int getRoomid() {
        return roomid;
    }

    public void setRoomid(int roomid) {
        this.roomid = roomid;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public boolean getIsAvailable() {
        return isAvailable;
    }

    public void setAvailable(boolean available) {
        isAvailable = available;
    }
}
