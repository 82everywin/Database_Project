package com.example.database_project.dao;

import com.example.database_project.DBManager;
import com.example.database_project.dto.DateDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DateDao {

    private static DateDao instance = new DateDao();

    public static DateDao getInstance() {
        return instance;
    }

    public boolean insertAvailableDate(DateDto availabledate) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBManager.getConnection();
            String sql = "INSERT INTO AvailableDates (RoomID, Date, IsAvailable) VALUES (?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, availabledate.getRoomid());
            pstmt.setDate(2, availabledate.getDate());
            pstmt.setBoolean(3, availabledate.getIsAvailable());
            int result = pstmt.executeUpdate();

            return result >0 ;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }


    public DateDto getAvailableDateById(int availableDateID) {
        DateDto availableDate = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM AvailableDates WHERE AvailableDateID = ?";

        try {
            conn = DBManager.getConnection();
            if (conn == null) return null;
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, availableDateID);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                availableDate = new DateDto(
                        rs.getInt("AvailableDateID"),
                        rs.getInt("RoomID"),
                        rs.getDate("Date"),
                        rs.getBoolean("IsAvailable")
                );
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
        return availableDate;
    }

    public boolean updateDate(DateDto date){
        Connection conn = null;
        PreparedStatement pstmt = null;

        String sql = "UPDATE AvailableDates SET RoomID = ?, Date = ?, IsAvailable = ? WHERE AvailableDateID = ?";

        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, date.getRoomid());
            pstmt.setDate(2, date.getDate());
            pstmt.setBoolean(3, date.getIsAvailable());
            pstmt.setInt(4, date.getAvailableDateId());
            int result =pstmt.executeUpdate();

            return result > 0 ;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public boolean deleteDateById(int availabledateId) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "DELETE FROM AvailableDates WHERE availabledateID = ?";

        try {
            conn = DBManager.getConnection();
            if (conn == null)
                return false;
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, availabledateId);
            int result = pstmt.executeUpdate();

            return result >0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }
}
