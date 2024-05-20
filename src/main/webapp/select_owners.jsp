<%@ page import="java.sql.*" %>
<%@ page import="com.example.database_project.DBManager" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Users List</title>
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
<h1>[관리자 모드] Owners 조회</h1>
<a href="admin_login.jsp"><button>메인페이지로 돌아가기</button></a><br>
<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        conn = DBManager.getConnection();

        String sql = "SELECT * FROM Owners";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
%>
<table>
    <tr>
        <th>OwnerID</th>
        <th>OwnerName</th>
        <th>Password</th>
        <th>LicenseNum</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Actions</th>
    </tr>
    <%
        while (rs.next()) {
            String email = rs.getString("Email");
    %>
    <tr>
        <td><%= rs.getInt("OwnerID") %></td>
        <td><%= rs.getString("OwnerName") %></td>
        <td><%= rs.getString("Password") %></td>
        <td><%= rs.getString("LicenseNum")%></td>
        <td><%= email %></td>
        <td><%= rs.getString("Phone") %></td>
        <td>
            <a href="admin_edit_owner.jsp?email=<%= email %>"><button>수정</button></a>
            <a href="admin_delete_owner.jsp?email=<%= email %>"><button>삭제</button></a>
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
