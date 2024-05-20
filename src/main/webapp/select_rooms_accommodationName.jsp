<%@ page import="java.sql.*" %>
<%@ page import="com.example.database_project.DBManager" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Rooms List</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid black;
            text-align: center;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        button {
            padding: 5px 10px;
            cursor: pointer;
        }
        a {
            text-decoration: none;
            color: inherit;
        }
    </style>
</head>
<body>
<h1>[관리자 모드] Rooms 조회</h1>
<a href="select_accommodations.jsp"><button>숙소 정보로 돌아가기</button></a><br>
<%
    int accommodationId = Integer.parseInt(request.getParameter("accommodationId"));
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        conn = DBManager.getConnection();

        String sql = "SELECT * FROM Rooms WHERE AccommodationID = "+ accommodationId;
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
%>
<table>
    <tr>
        <th>RoomID</th>
        <th>AccommodationID</th>
        <th>RoomType</th>
        <th>RoomCount</th>
        <th>Price</th>
        <th>Availability</th>
        <th>Actions</th>
    </tr>
    <%
        while (rs.next()) {
            int roomId = rs.getInt("RoomID");
    %>
    <tr>
        <td><%= roomId %></td>
        <td><%= rs.getInt("AccommodationID") %></td>
        <td><%= rs.getString("RoomType") %></td>
        <td><%= rs.getInt("RoomCount") %></td>
        <td><%= rs.getInt("Price") %></td>
        <td><%= rs.getBoolean("Availability") ? "Available" : "Not Available" %></td>
        <td>
            <a href="admin_edit_room.jsp?roomId=<%= roomId %>"><button type="button">수정</button></a>
            <a href="admin_delete_room.jsp?roomId=<%= roomId %>" onclick="return confirm('정말 삭제하시겠습니까?');"><button type="button">삭제</button></a>
        </td>
    </tr>
    <%
        }
    %>
</table>
<%
    } catch (Exception e) {
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
%>
</body>
</html>
