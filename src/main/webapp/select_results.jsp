
<%@ page import="java.sql.*" %>
<%@ page import="com.example.database_project.DBManager" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
   Connection conn = DBManager.getConnection();
   PreparedStatement pstmt = null;
   ResultSet rs = null;

   String searchType = request.getParameter("search_type");
   String sortOrder = request.getParameter("sort_order");

   if (sortOrder == null || sortOrder.isEmpty()) {
        sortOrder = "price_desc"; // 기본값 설정
   }
   String sortColumn = "";
   String sortDirection = "";

   switch (sortOrder) {
        case "price_asc":
            sortColumn = "r.price";
            sortDirection = "ASC";
            break;
        case "price_desc":
            sortColumn = "r.price";
            sortDirection = "DESC";
            break;
        case "rating_asc":
            sortColumn = "a.rating";
            sortDirection = "ASC";
            break;
        case "rating_desc":
            sortColumn = "a.rating";
            sortDirection = "DESC";
            break;
   }
%>
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사용자 검색 결과</title>
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
    </style>
</head>
<body>
<h1>검색 결과</h1>
<%
    try {
            if ("price".equals(searchType)) {
                int minPrice = Integer.parseInt(request.getParameter("min_price"));
                int maxPrice = Integer.parseInt(request.getParameter("max_price"));

                String sql = "SELECT a.category, a.accommodationname, a.grade, a.rating, a.location, " +
                        "r.roomtype, r.roomcount, r.price " +
                        "FROM Accommodations a " +
                        "JOIN Rooms r ON a.accommodationid = r.accommodationid " +
                        "WHERE r.price BETWEEN ? AND ? AND a.visibility = TRUE " +
                        "ORDER BY " + sortColumn + " " + sortDirection;

                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, minPrice);
                pstmt.setInt(2, maxPrice);

            }
            else if ("location".equals(searchType)) {
                String location = request.getParameter("location");

                String sql = "SELECT a.category, a.accommodationname, a.grade, a.rating, a.location, " +
                        "r.roomtype, r.roomcount, r.price " +
                        "FROM Accommodations a " +
                        "JOIN Rooms r ON a.accommodationid = r.accommodationid " +
                        "WHERE (a.location LIKE ? OR a.accommodationname LIKE ?) AND a.visibility = TRUE " +
                        "ORDER BY " + sortColumn + " " + sortDirection;

                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, "%" + location + "%");

            }
            else if ("rating".equals(searchType)) {
                double rating = Double.parseDouble(request.getParameter("rating"));

                String sql = "SELECT a.category, a.accommodationname, a.grade, a.rating, a.location, " +
                        "r.roomtype, r.roomcount, r.price " +
                        "FROM Accommodations a " +
                        "JOIN Rooms r ON a.accommodationid = r.accommodationid " +
                        "WHERE a.rating >= ? AND a.visibility = TRUE" +
                        "ORDER BY " + sortColumn + " " + sortDirection;
                pstmt = conn.prepareStatement(sql);
                pstmt.setDouble(1, rating);
            }


            rs = pstmt.executeQuery();
    %>
        <table>
            <tr>
                <th>종류</th>
                <th>숙박업소 이름</th>
                <th>성급</th>
                <th>방 타입</th>
                <th>잔여 객실 수</th>
                <th>가격</th>
                <th>위치</th>
                <th>평점</th>
                <th>예약</th>
            </tr>
        <%
            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("category")%></td>
            <td><%= rs.getString("accommodationname") %></td>
            <td><%= rs.getString("grade") != null ? rs.getString("grade") : "-" %></td>
            <td><%= rs.getString("roomtype") != null ? rs.getString("roomtype") : "-" %></td>
            <td><%= rs.getInt("roomcount")%></td>
            <td><%= rs.getString("price")%></td>
            <td><%= rs.getString("location") %></td>
            <td><%= rs.getString("rating") != null ? rs.getDouble("rating") : "-" %></td>
            <td><button onclick="">예약하기</button></td>
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
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    %>
    </table>
</body>
</html>