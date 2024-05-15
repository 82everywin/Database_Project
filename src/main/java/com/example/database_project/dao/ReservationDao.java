package com.example.database_project.dao;

import com.example.database_project.DBManager;
import com.example.database_project.dto.ReservationDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReservationDao {
    private static ReservationDao instance = new ReservationDao();

    public static ReservationDao getInstance() {
        return instance;
    }

    public List<ReservationDto> getReservationsByAccommodationId(int acc_Id) {
        List<ReservationDto> reservations = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT r.ReservationID," +
                "r.RoomID, rm.RoomType, u.UserName, u.Phone, u.Email, " +
                "r.CheckInDate, r.CheckOutDate, r.Guests, r.Payment "+
                "FROM Reservations r " +
                "JOIN Rooms rm ON r.RoomID = rm.RoomID " +
                "JOIN Accommodations a ON rm.AccommodationID = a.AccommodationID " +
                "JOIN Users u ON r.UserID = u.UserID " +
                "WHERE a.AccommodationID = ?";

        try {
            conn = DBManager.getConnection();
            if (conn == null) return reservations;
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, acc_Id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ReservationDto reservation = new ReservationDto(
                        rs.getInt("ReservationID"),
                        rs.getInt("RoomID"),
                        rs.getString("RoomType"),
                        rs.getDate("CheckInDate"),
                        rs.getDate("CheckOutDate"),
                        rs.getInt("Guests"),
                        rs.getString("Payment"),
                        rs.getString("UserName"),
                        rs.getString("Email"),
                        rs.getString("Phone")
                );
                reservations.add(reservation);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return reservations;
    }


}
