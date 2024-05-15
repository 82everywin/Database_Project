package com.example.database_project;
import java.sql.*;

public class DBManager {
    public static Connection getConnection() {
        try{
            String dbURL = "jdbc:mysql://localhost:3306/accommodationdb?characterEncoding=utf-8";
            String dbID = "202101568user";
            String dbPW = "202101568pw";
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(dbURL, dbID, dbPW);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}