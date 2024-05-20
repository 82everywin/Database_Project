package com.example.database_project.dto;

import java.sql.Date;

public class ReservationDto {
    private int reservationId;
    private int roomId;
    private int userId;
    private Date checkInDate;
    private Date checkOutDate;
    private int guests;
    private String payment;


    private String roomType;
    private String accommodationname;
    private String userName;
    private String userEmail;
    private String userPhone;

    private int price;

    public ReservationDto(int reservationId, int roomId, int userId,  String userName, String accommodationname, String roomType, int price, Date checkInDate, Date checkOutDate, int guests, String payment) {
        this.reservationId = reservationId;
        this.roomId = roomId;
        this.userId = userId;
        this.price = price;
        this.accommodationname = accommodationname;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
        this.guests = guests;
        this.payment = payment;
        this.roomType = roomType;
        this.userName = userName;
    }

    public ReservationDto(int reservationId, int roomId, String roomType, Date checkInDate, Date checkOutDate, int guests, String payment, String userName, String userEmail, String userPhone) {
        this.reservationId = reservationId;
        this.roomId = roomId;
        this.roomType = roomType;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
        this.guests = guests;
        this.payment = payment;
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPhone = userPhone;
    }

    public ReservationDto(int reservationId, int roomId, int userId, Date checkInDate, Date checkOutDate, int guests, String payment) {
        this.reservationId = reservationId;
        this.roomId = roomId;
        this.userId = userId;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
        this.guests = guests;
        this.payment = payment;
    }

    public ReservationDto() {

    }

    public ReservationDto(int reservationId, Date checkInDate, Date checkOutDate, int guests, String payment) {
        this.reservationId = reservationId;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
        this.guests = guests;
        this.payment = payment;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public int getReservationId() {
        return reservationId;
    }

    public void setReservationId(int reservationId) {
        this.reservationId = reservationId;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public Date getCheckInDate() {
        return checkInDate;
    }

    public void setCheckInDate(Date checkInDate) {
        this.checkInDate = checkInDate;
    }

    public Date getCheckOutDate() {
        return checkOutDate;
    }

    public void setCheckOutDate(Date checkOutDate) {
        this.checkOutDate = checkOutDate;
    }

    public int getGuests() {
        return guests;
    }

    public void setGuests(int guests) {
        this.guests = guests;
    }

    public String getPayment() { return payment;}


    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getAccommodationname() {
        return accommodationname;
    }

    public void setAccommodationname(String accommodationname) {
        this.accommodationname = accommodationname;
    }
}

