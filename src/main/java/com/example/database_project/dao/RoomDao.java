package com.example.database_project.dao;

import com.example.database_project.DBManager;
import com.example.database_project.dto.AccommodationDto;
import com.example.database_project.dto.RoomDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class RoomDao {
    private static RoomDao instance = new RoomDao();

    public static RoomDao getInstance() {
        return instance;
    }

    public boolean insertRoom(RoomDto room) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "INSERT INTO Rooms (AccommodationID, RoomType, RoomCount, Price, Availability) VALUES (?, ?, ?, ?, ?)";

        try {
            conn = DBManager.getConnection();
            if (conn == null) return false;

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, room.getAccommodationId());
            pstmt.setString(2, room.getRoomType());
            pstmt.setInt(3, room.getRoomCount());
            pstmt.setInt(4, room.getPrice());
            pstmt.setBoolean(5, room.isAvailability());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

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

    public List<RoomDto> getRoomsByAccommodationId(int id) {
        List<RoomDto> rooms = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM Rooms WHERE AccommodationID = ?";

        try {
            conn = DBManager.getConnection();
            if (conn == null) return rooms;
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                RoomDto room = new RoomDto(
                        rs.getInt("RoomID"),
                        rs.getInt("AccommodationID"),
                        rs.getString("RoomType"),
                        rs.getInt("RoomCount"),
                        rs.getInt("Price"),
                        rs.getBoolean("Availability")
                );
                rooms.add(room);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null)
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try { if (pstmt != null)
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try { if (conn != null)
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return rooms;
    }


    public List<AccommodationDto> getAccommodationByOwnerId(int id) {
        List<AccommodationDto> accommodationDtoList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT a.AccommodationID, a.OwnerID, a.Category, a.AccommodationName, a.Location, a.Grade, a.Rating " +
                "FROM Accommodations a "+
                "WHERE a.OwnerID= ? ";

        try {
            conn = DBManager.getConnection();
            if (conn == null) return accommodationDtoList;
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            while (rs.next()) {
               AccommodationDto accommodation = new AccommodationDto(
                        rs.getInt("AccommodationID"),
                        rs.getInt("OwnerID"),
                        rs.getString("Category"),
                        rs.getString("AccommodationName"),
                        rs.getString("Location"),
                        rs.getString("Grade"),
                        rs.getFloat("Rating")
                );
                accommodationDtoList.add(accommodation);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null)
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try { if (pstmt != null)
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            try { if (conn != null)
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return accommodationDtoList;
    }

    public RoomDto getRoomById(int roomId) {
        RoomDto room = null;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM Rooms WHERE RoomID = ?";

        try {
            conn = DBManager.getConnection();
            if (conn == null) return null;
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, roomId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                room = new RoomDto(
                        rs.getInt("RoomID"),
                        rs.getInt("AccommodationID"),
                        rs.getString("RoomType"),
                        rs.getInt("RoomCount"),
                        rs.getInt("Price"),
                        rs.getBoolean("Availability")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
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
        return room;
    }

    public boolean updateRoom(RoomDto room) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "UPDATE Rooms SET RoomType = ?, RoomCount = ?, Price = ?, Availability = ? WHERE RoomID = ?";

        try {
            conn = DBManager.getConnection();
            if (conn == null) return false;
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, room.getRoomType());
            pstmt.setInt(2, room.getRoomCount());
            pstmt.setInt(3, room.getPrice());
            pstmt.setBoolean(4, room.isAvailability());
            pstmt.setInt(5, room.getRoomId());
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
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
        return false;
    }

    public boolean deleteRoom(int roomId) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "DELETE FROM Rooms WHERE RoomID = ?";

        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, roomId);
            return pstmt.executeUpdate() > 0 ;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
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
