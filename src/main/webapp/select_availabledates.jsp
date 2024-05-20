<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.database_project.DBManager" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Available Dates</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<h1>[관리자 모드] Available Dates 조회</h1>
<a href="admin_login.jsp"><button>메인페이지로 돌아가기</button></a><br>
<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        conn = DBManager.getConnection();

        String sql = "SELECT * FROM AvailableDates";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
%>
<table>
    <tr>
        <th>AvailableDateID</th>
        <th>RoomID</th>
        <th>Date</th>
        <th>IsAvailable</th>
        <th>Actions</th>
    </tr>
    <%
            while (rs.next()) {
                int availableDateID = rs.getInt("AvailableDateID");
    %>
    <tr>
        <td><%= availableDateID %></td>
        <td><%= rs.getInt("RoomID") %></td>
        <td><%= rs.getDate("Date") %></td>
        <td><%= rs.getBoolean("IsAvailable")%></td>
        <td>
            <a href="admin_edit_availabledate.jsp?availabledateId=<%= availableDateID %>"><button type="button">수정</button></a>
            <a href="admin_delete_availabledate.jsp?availabledateId=<%= availableDateID %>" onclick="return confirm('정말 삭제하시겠습니까?');"><button type="button">삭제</button></a>
        </td>
    </tr>
    <%
            }
        } catch (Exception e) {
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
    %>
</table>
</body>
</html>
