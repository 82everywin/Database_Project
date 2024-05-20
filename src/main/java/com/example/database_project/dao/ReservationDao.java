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

    public boolean insertReservation(ReservationDto reservation) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO " +
                "Reservations (RoomID, UserID, CheckInDate, CheckOutDate, Guests, Payment) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            conn = DBManager.getConnection();
            if (conn == null) return false;

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, reservation.getRoomId());
            pstmt.setInt(2, reservation.getUserId());
            pstmt.setDate(3,reservation.getCheckInDate());
            pstmt.setDate(4, reservation.getCheckOutDate());
            pstmt.setInt(5, reservation.getGuests());
            pstmt.setString(6, reservation.getPayment());
            int result  = pstmt.executeUpdate();

            return result > 0 ;

        }catch (SQLException e) {
            e.printStackTrace();
            return false;
        }finally {
                try {
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
        }
    }

    public List<ReservationDto> getAllReservations() {
        List<ReservationDto> reservations = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM Reservations ";

        try {
            conn = DBManager.getConnection();
            if (conn == null) return reservations;
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ReservationDto reservation = new ReservationDto(
                        rs.getInt("ReservationID"),
                        rs.getInt("RoomID"),
                        rs.getInt("UserID"),
                        rs.getDate("CheckInDate"),
                        rs.getDate("CheckOutDate"),
                        rs.getInt("Guests"),
                        rs.getString("Payment")
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
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return reservations;
    }

    public List<ReservationDto> getReservationsByUserId(int userId) {
        List<ReservationDto> reservations = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "SELECT r.ReservationID, a.AccommodationID, a.accommodationname, " +
                "r.RoomID, rm.RoomType, u.userID, u.UserName, " +
                "r.CheckInDate, r.CheckOutDate, r.Guests, r.Payment , rm.price "+
                "FROM Reservations r " +
                "JOIN Rooms rm ON r.RoomID = rm.RoomID " +
                "JOIN Accommodations a ON rm.AccommodationID = a.AccommodationID " +
                "JOIN Users u ON r.UserID = u.UserID " +
                "WHERE r.userId = ? ";

        try {
            conn = DBManager.getConnection();
            if (conn == null) return reservations;
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userId);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                while (rs.next()) {
                    ReservationDto reservation = new ReservationDto(
                            rs.getInt("ReservationID"),
                            rs.getInt("RoomID"),
                            rs.getInt("UserID"),
                            rs.getString("UserName"),
                            rs.getString("accommodationname"),
                            rs.getString("roomType"),
                            rs.getInt("price"),
                            rs.getDate("CheckInDate"),
                            rs.getDate("CheckOutDate"),
                            rs.getInt("Guests"),
                            rs.getString("Payment")
                    );
                    reservations.add(reservation);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reservations;
    }

    public int getUserIdByReservationId(int reservationId) {
        int userId = -1;
        String query = "SELECT UserID FROM Reservations WHERE ReservationID = ?";
        try (Connection conn = DBManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, reservationId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    userId = rs.getInt("UserID");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userId;
    }

    public ReservationDto getReservationByReservationId(int reservationId) {
        ReservationDto reservation = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "SELECT r.ReservationID, a.AccommodationID, a.accommodationname, " +
                "r.RoomID, rm.RoomType, u.UserID,u.UserName, " +
                "r.CheckInDate, r.CheckOutDate, r.Guests, r.Payment , rm.price "+
                "FROM Reservations r " +
                "JOIN Rooms rm ON r.RoomID = rm.RoomID " +
                "JOIN Accommodations a ON rm.AccommodationID = a.AccommodationID " +
                "JOIN Users u ON r.UserID = u.UserID " +
                "WHERE r.reservationId = ? ";

        try {
            conn = DBManager.getConnection();
            if (conn == null) return null;
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, reservationId);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                    reservation = new ReservationDto(
                            rs.getInt("ReservationID"),
                            rs.getInt("RoomID"),
                            rs.getInt("UserID"),
                            rs.getString("UserName"),
                            rs.getString("Accommodationname"),
                            rs.getString("roomType"),
                            rs.getInt("price"),
                            rs.getDate("CheckInDate"),
                            rs.getDate("CheckOutDate"),
                            rs.getInt("Guests"),
                            rs.getString("Payment")
                    );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reservation;
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

    public boolean updateReservation(ReservationDto reservation){
        Connection conn = null;
        PreparedStatement pstmt  = null;

        String sql = "UPDATE Reservations " +
                "SET CheckInDate = ?, CheckOutDate = ?, Guests = ?, Payment = ? WHERE ReservationID = ?";

        try {
                conn = DBManager.getConnection();
                if (conn == null) return false;
                pstmt = conn.prepareStatement(sql);
                pstmt.setDate(1, reservation.getCheckInDate());
                pstmt.setDate(2, reservation.getCheckOutDate());
                pstmt.setInt(3, reservation.getGuests());
                pstmt.setString(4, reservation.getPayment());
                pstmt.setInt(5, reservation.getReservationId());
                int result =  pstmt.executeUpdate();

                return result > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (pstmt != null) pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public boolean updateAdminReservation(ReservationDto reservation){
        Connection conn = null;
        PreparedStatement pstmt  = null;

        String sql = "UPDATE Reservations " +
                "SET roomId = ?, userId = ?, CheckInDate = ?, CheckOutDate = ?, Guests = ?, Payment = ? " +
                "WHERE ReservationID = ?";

        try {
            conn = DBManager.getConnection();
            if (conn == null) return false;
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,reservation.getRoomId());
            pstmt.setInt(2, reservation.getUserId());
            pstmt.setDate(3, reservation.getCheckInDate());
            pstmt.setDate(4, reservation.getCheckOutDate());
            pstmt.setInt(5, reservation.getGuests());
            pstmt.setString(6, reservation.getPayment());
            pstmt.setInt(7, reservation.getReservationId());
            int result =  pstmt.executeUpdate();

            return result > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (pstmt != null) pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try {
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    public boolean deleteReservation(int reservationId) throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "DELETE FROM Reservations WHERE ReservationID = ?";

        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, reservationId);

            int result =  pstmt.executeUpdate();

            return result > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return  false;
        } finally {
            try {
                if (pstmt != null) pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try { if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


}
