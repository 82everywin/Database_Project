<%@ page import="java.sql.*" %>
<%@ page import="com.example.database_project.DBManager" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    Connection conn = DBManager.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String searchType = request.getParameter("search_type");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>검색 결과</title>
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
<button onclick="location.href='main.jsp'">메인 페이지로 돌아가기</button>
<%
    try {
        if ("detail".equals(searchType)){
            StringBuilder sql = new StringBuilder("SELECT a.category, a.accommodationname, " +
                    "a.grade, a.rating, a.location, " +
                    "r.roomtype, r.roomcount, r.price " +
                    "FROM Accommodations a " +
                    "JOIN Rooms r ON a.accommodationid = r.accommodationid " +
                    "WHERE r.availability = TRUE ");

            List<String> conditions = new ArrayList<>();
            List<Object> params = new ArrayList<>();

            String[] searchDetails = request.getParameterValues("search_detail");
            if (searchDetails != null) {
                for (String detail : searchDetails) {
                    switch (detail) {
                        case "location":
                            String location = request.getParameter("location");
                            if (location != null && !location.isEmpty()) {
                                conditions.add("a.location LIKE ?");
                                params.add("%" + location + "%");
                            }
                            break;
                        case "name":
                            String name = request.getParameter("name");
                            if (name != null && !name.isEmpty()) {
                                conditions.add("a.accommodationname LIKE ?");
                                params.add("%" + name + "%");
                            }
                            break;
                        case "category":
                            String category = request.getParameter("category");
                            if (category != null && !category.isEmpty()) {
                                conditions.add("a.category = ?");
                                params.add(category);
                            }
                            break;
                        case "price":
                            String minPriceStr = request.getParameter("min_price");
                            String maxPriceStr = request.getParameter("max_price");
                            if (minPriceStr != null && !minPriceStr.isEmpty() && maxPriceStr != null && !maxPriceStr.isEmpty()) {
                                int minPrice = Integer.parseInt(minPriceStr);
                                int maxPrice = Integer.parseInt(maxPriceStr);
                                conditions.add("r.price BETWEEN ? AND ?");
                                params.add(minPrice);
                                params.add(maxPrice);
                            }
                            break;
                        case "rating":
                            String ratingStr = request.getParameter("rating");
                            if (ratingStr != null && !ratingStr.isEmpty()) {
                                double rating = Double.parseDouble(ratingStr);
                                conditions.add("a.rating >= ?");
                                params.add(rating);
                            }
                            break;
                    }
                }
            }
            if (!conditions.isEmpty()) {
                sql.append(" AND ").append(String.join(" AND ", conditions));
            }

            pstmt = conn.prepareStatement(sql.toString());
            for (int i = 0; i < params.size(); i++) {
                pstmt.setObject(i + 1, params.get(i));
            }
        }

        else if("order".equals(searchType)){
            String choiceOrder = request.getParameter("choice_order");
            String choiceHighLow = request.getParameter("choice_high_low");

            if (choiceOrder == null || choiceOrder.isEmpty()) {
                choiceOrder = "price"; // 기본값 설정
            }

            if (choiceHighLow == null || choiceHighLow.isEmpty()) {
                choiceHighLow = "desc"; // 기본값 설정
            }

            String sortColumn = "";
            String sortDirection = "";

            if (choiceOrder.equals("price")){
                if(choiceHighLow.equals("asc")){
                    sortColumn = "r.price";
                    sortDirection = "ASC";
                }else{
                    sortColumn = "r.price";
                    sortDirection = "DESC";
                }
            }else{
                if(choiceHighLow.equals("asc")){
                    sortColumn = "a.rating";
                    sortDirection = "ASC";
                }else{
                    sortColumn = "a.rating";
                    sortDirection = "DESC";
                }
            }

            String sql = "SELECT a.category, a.accommodationname, a.grade, a.rating, a.location, " +
                    "r.roomtype, r.roomcount, r.price " +
                    "FROM Accommodations a " +
                    "JOIN Rooms r ON a.accommodationid = r.accommodationid " +
                    "WHERE r.availability = TRUE " +
                    "ORDER BY " + sortColumn + " " + sortDirection;

            pstmt = conn.prepareStatement(sql);
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
        <td><%= rs.getString("category") %></td>
        <td><%= rs.getString("accommodationname") %></td>
        <td><%= rs.getString("grade") != null ? rs.getString("grade") : "-" %></td>
        <td><%= rs.getString("roomtype") != null ? rs.getString("roomtype") : "-" %></td>
        <td><%= rs.getInt("roomcount") %></td>
        <td><%= rs.getString("price") %></td>
        <td><%= rs.getString("location") %></td>
        <td><%= rs.getDouble("rating") %></td>
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
