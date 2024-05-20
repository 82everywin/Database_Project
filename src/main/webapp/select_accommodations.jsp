<%@ page import="java.sql.*" %>
<%@ page import="com.example.database_project.DBManager" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Accommodations List</title>
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
<h1>[관리자 모드 ] Accommodations 조회</h1>
<a href="admin_login.jsp"><button>메인페이지로 돌아가기</button></a><br>
<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        conn = DBManager.getConnection();

        String sql = "SELECT * FROM Accommodations";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
%>
<table>
    <tr>
        <th>AccommodationID</th>
        <th>OwnerID</th>
        <th>Category</th>
        <th>AccommodationName</th>
        <th>Location</th>
        <th>Grade</th>
        <th>Rating</th>
        <th>Actions</th>
    </tr>
    <%
        while (rs.next()) {
            int accommodationID = rs.getInt("AccommodationID");
    %>
    <tr>
        <td><%= accommodationID %></td>
        <td><%= rs.getInt("OwnerID") %></td>
        <td><%= rs.getString("Category") %></td>
        <td><%= rs.getString("AccommodationName") %></td>
        <td><%= rs.getString("Location") %></td>
        <td><%= rs.getString("Grade") %></td>
        <td><%= rs.getBigDecimal("Rating") %></td>
        <td>
            <a href="admin_add_room.jsp?accommodationId=<%= accommodationID%>"><button>객실 정보 추가</button></a>
            <a href="select_rooms_accommodationName.jsp?accommodationId=<%=accommodationID%>"><button>객실 정보 보기</button></a>
            <a href="admin_edit_accommodation.jsp?accommodationId=<%= accommodationID %>"><button type="button">수정</button></a>
            <a href="admin_delete_accommodation.jsp?accommodationId=<%= accommodationID %>" onclick="return confirm('정말 삭제하시겠습니까?');"><button type="button">삭제</button></a>
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
