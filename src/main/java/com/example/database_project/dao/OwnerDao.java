package com.example.database_project.dao;

import com.example.database_project.DBManager;
import com.example.database_project.dto.OwnerDto;
import com.example.database_project.dto.UserDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OwnerDao {
    public static int OWNER_EXISTENT = 1;
    public static int OWNER_NONEXISTENT = 2;
    public static int OWNER_JOIN_SUCCESS = 3;
    public static int OWNER_LOGIN_SUCCESS = 4;
    public static int OWNER_LOGIN_FAIL = 5;
    private static OwnerDao instance = new OwnerDao();

    public static OwnerDao getInstance() {
        return instance;
    }

    public int insertOwner(OwnerDto owner) {
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "INSERT INTO Owners(ownername, password, licensenum, email, phone) " +
                " VALUES (?,?,?,?,?)";
        try {
            conn = DBManager.getConnection();

            if (conn == null) return rt;

            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, owner.getOwnerName());
            pstmt.setString(2, owner.getPassword());
            pstmt.setString(3, owner.getLicenseNum());
            pstmt.setString(4, owner.getEmail());
            pstmt.setString(5, owner.getPhone());
            pstmt.executeUpdate();
            rt = OWNER_JOIN_SUCCESS;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return rt;
    }

    public int confirmId(String email) {
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String query = "SELECT email FROM Owners WHERE email = ?";

        try {
            conn = DBManager.getConnection();
            if (conn == null) return rt;
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();
            if (rs.next())
                rt = OWNER_EXISTENT;
            else
                rt = OWNER_NONEXISTENT;
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

        return rt;
    }


    public int confirmLogin(String email, String pw) {
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String query = "SELECT Password FROM Owners WHERE email= ?";

        try {
            conn = DBManager.getConnection();

            if (conn == null) return rt;
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                if (pw.equals(rs.getString("Password")))
                    rt = OWNER_LOGIN_SUCCESS;
                else
                    rt = OWNER_LOGIN_FAIL;
            } else
                rt = OWNER_NONEXISTENT;
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
        return rt;
    }


    public OwnerDto getOwner(String email) {
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        OwnerDto owner = null;

        String query = "SELECT * FROM Owners WHERE email = ?";

        try {
            conn = DBManager.getConnection();

            if (conn == null) return owner;
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                owner = new OwnerDto(rs.getInt("ownerid"),
                        rs.getString("ownerName"),
                        rs.getString("password"),
                        rs.getString("licenseNum"),
                        rs.getString("email"),
                        rs.getString("phone")
                );

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
        return owner;
    }

    public boolean updateOwner(OwnerDto owner, String email) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "UPDATE Owners SET email = ?, ownername = ?, phone = ? WHERE email = ?";

        try {
            conn = DBManager.getConnection();
            if (conn == null)
                return false;

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, owner.getEmail());
            pstmt.setString(2, owner.getOwnerName());
            pstmt.setString(3, owner.getPhone());
            pstmt.setString(4, email);
            return pstmt.executeUpdate() > 0 ;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public boolean updatePassword(OwnerDto owner, String email) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "UPDATE Owners SET Password = ? WHERE email = ?";

        try {
            conn = DBManager.getConnection();
            if (conn == null)
                return false;
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, owner.getPassword());
            pstmt.setString(2, email);

            return pstmt.executeUpdate() > 0 ;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }


    public boolean deleteOwner(String email) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "DELETE FROM Owners WHERE email = ?";

        try {
            conn = DBManager.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);

            return pstmt.executeUpdate() > 0;

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
}
