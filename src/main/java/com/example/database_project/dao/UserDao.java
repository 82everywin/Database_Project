package com.example.database_project.dao;

import com.example.database_project.DBManager;
import com.example.database_project.dto.UserDto;

import java.sql.*;
public class UserDao {

    public static int USER_EXISTENT = 1;
    public static int USER_NONEXISTENT = 2;
    public static int USER_JOIN_SUCCESS = 3;
    public static int USER_LOGIN_SUCCESS = 4;
    public static int USER_LOGIN_FAIL = 5;
    private static UserDao instance = new UserDao();

    public static UserDao getInstance() {
        return instance;
    }
    public int insertUser(UserDto user) {
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;

        String query = "INSERT INTO Users(UserName, Password, Email, Phone) VALUES (?,?,?,?)";
        try {
            conn = DBManager.getConnection();

            if (conn == null) return rt;
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getEmail());
            pstmt.setString(4, user.getPhone());
            pstmt.executeUpdate();

            rt = USER_JOIN_SUCCESS;
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
        String query = "SELECT email FROM Users WHERE email = ?";

        try {
            conn = DBManager.getConnection();
            if (conn == null) return rt;
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();
            if (rs.next())
                rt = USER_EXISTENT;
            else
                rt = USER_NONEXISTENT;
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
        String query = "SELECT Password FROM Users WHERE email= ?";

        try {
            conn = DBManager.getConnection();

            if (conn == null) return rt;
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                if (pw.equals(rs.getString("Password")))
                    rt = USER_LOGIN_SUCCESS;
                else
                    rt = USER_LOGIN_FAIL;
            } else
                rt = USER_NONEXISTENT;
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


    public UserDto getUser(String email) {
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        UserDto user = null;

        String query = "SELECT * FROM Users WHERE email = ?";

        try {
            conn = DBManager.getConnection();

            if (conn == null) return user;

            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                user = new UserDto(rs.getInt("userid"),
                        rs.getString("username"),
                        rs.getString("password"),
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
        return user;
    }

    public boolean updateUser(UserDto user, String email) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "UPDATE users SET email = ?, username = ?, phone = ? WHERE email = ?";

        try {
            conn = DBManager.getConnection();
            if (conn == null)
                return false;

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getEmail());
            pstmt.setString(2, user.getUsername());
            pstmt.setString(3, user.getPhone());
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

    public boolean updatePassword(UserDto user, String email) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "UPDATE users SET Password = ? WHERE email = ?";

        try {
            conn = DBManager.getConnection();
            if (conn == null)
                return false;
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getPassword());
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

    public boolean deleteUser(String email) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String sql = "DELETE FROM Users WHERE email = ?";

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
