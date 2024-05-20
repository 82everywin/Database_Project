package com.example.database_project.dao;

import com.example.database_project.DBManager;
import com.example.database_project.dto.AccommodationDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AccommodationDao {
    private static AccommodationDao instance = new AccommodationDao();

    public static AccommodationDao getInstance() {
        return instance;
    }

    public boolean insertAccommodation(AccommodationDto accommodation) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;


        String sql = "INSERT INTO " +
                "Accommodations (OwnerID, Category, AccommodationName, Location, Grade, Rating) VALUES (?, ?, ?, ?, ?, ?)";

        try {
            conn = DBManager.getConnection();
            if (conn == null) return false;

            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, accommodation.getOwnerId());
            pstmt.setString(2, accommodation.getCategory());
            pstmt.setString(3, accommodation.getAccommodationName());
            pstmt.setString(4, accommodation.getLocation());
            pstmt.setString(5, accommodation.getGrade());
            pstmt.setDouble(6, accommodation.getRating());
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

    public List<AccommodationDto> getAllAccommodations() {
        List<AccommodationDto> accommodations = new ArrayList<>();
        String query = "SELECT * FROM Accommodations";
        try (Connection conn = DBManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {
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
                accommodations.add(accommodation);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return accommodations;
    }

    public AccommodationDto getAccommodationById(int accommodationId) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM Accommodations WHERE AccommodationID= ? ";
        AccommodationDto accommodationDto = null;
        try {
            conn = DBManager.getConnection();
            if (conn == null) return accommodationDto;
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, accommodationId);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                accommodationDto = new AccommodationDto(
                        rs.getInt("AccommodationID"),
                        rs.getInt("OwnerID"),
                        rs.getString("Category"),
                        rs.getString("AccommodationName"),
                        rs.getString("Location"),
                        rs.getString("Grade"),
                        rs.getFloat("Rating")
                );
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
        return accommodationDto;
    }

    public boolean updateAccommodation(AccommodationDto accommodation) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "UPDATE Accommodations SET Category = ?, AccommodationName = ?, Location = ?, Grade = ? WHERE AccommodationID = ?";

        try {
            conn = DBManager.getConnection();
            if (conn == null) return false;
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, accommodation.getCategory());
            pstmt.setString(2, accommodation.getAccommodationName());
            pstmt.setString(3, accommodation.getLocation());
            pstmt.setString(4, accommodation.getGrade());
            pstmt.setInt(5, accommodation.getAccommodationId());
            pstmt.executeUpdate();
            return  true;
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

    public boolean updateAccommodationByAdmin(AccommodationDto accommodation) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "UPDATE Accommodations " +
                "SET OwnerId = ?, Category = ?, AccommodationName = ?, Location = ?, Grade = ? , Rating = ? " +
                "WHERE AccommodationID = ?";

        try {
            conn = DBManager.getConnection();
            if (conn == null) return false;
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, accommodation.getOwnerId());
            pstmt.setString(2, accommodation.getCategory());
            pstmt.setString(3, accommodation.getAccommodationName());
            pstmt.setString(4, accommodation.getLocation());
            pstmt.setString(5, accommodation.getGrade());
            pstmt.setFloat(6, accommodation.getRating());
            pstmt.setInt(7, accommodation.getAccommodationId());
            pstmt.executeUpdate();

            return true;
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
    public boolean deleteAccommodationById(int accommodationId) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "DELETE FROM Accommodations WHERE AccommodationID = ?";

        try {
            conn = DBManager.getConnection();
            if (conn == null)
                return false;
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, accommodationId);
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
