<%@ page import="java.sql.*" %>
<%@ page import="com.example.database_project.DBManager" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
    Integer userId = (Integer)session.getAttribute("userId");

    Connection conn = DBManager.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String searchType = request.getParameter("search_type");

    int accommodationId = -1;
    int roomId = -1;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>검색 결과</title>
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
<h1>검색 결과</h1>
<button onclick="location.href='main.jsp'">메인 페이지로 돌아가기</button>
<%
    try {
        if ("detail".equals(searchType)){
            StringBuilder sql = new StringBuilder("SELECT a.accommodationid, a.category, a.accommodationname, " +
                    "a.grade, a.rating, a.location, " +
                    "r.roomid, r.roomtype, r.count, r.roomcount, r.price, ad.date " +
                    "FROM Accommodations a " +
                    "JOIN Rooms r ON a.accommodationid = r.accommodationid " +
                    "LEFT JOIN AvailableDates ad ON r.roomid = ad.roomid " +
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
                        case "available_date":
                            String checkinDateStr = request.getParameter("checkin_date");
                            String checkoutDateStr = request.getParameter("checkout_date");
                            if (checkinDateStr != null && !checkinDateStr.isEmpty() && checkoutDateStr != null && !checkoutDateStr.isEmpty()) {
                                Date checkinDate = Date.valueOf(checkinDateStr);
                                Date checkoutDate = Date.valueOf(checkoutDateStr);
                                conditions.add(
                                        "ad.date BETWEEN ? AND ? " +
                                        "AND ad.isavailable = TRUE " +
                                        "AND NOT EXISTS (" +
                                        "SELECT 1 " +
                                        "FROM Reservations res " +
                                        "WHERE res.roomid = r.roomid " +
                                        "AND (" +
                                        "(res.checkindate BETWEEN ? AND ?) " +
                                        "OR " +
                                        "(res.checkoutdate BETWEEN ? AND ?) " +
                                        "OR " +
                                        "(? BETWEEN res.checkindate AND res.checkoutdate) " +
                                        "OR " +
                                        "(? BETWEEN res.checkindate AND res.checkoutdate)" +
                                        ")" +
                                        ")");
                                params.add(checkinDate);
                                params.add(checkoutDate);
                                params.add(checkoutDate);
                                params.add(checkinDate);
                                params.add(checkoutDate);
                                params.add(checkinDate);
                                params.add(checkoutDate);
                                params.add(checkinDate);
                            }
                            break;
                        case "guests":
                            String guestsStr = request.getParameter("guests");
                            if (guestsStr != null && !guestsStr.isEmpty()) {
                                int guests = Integer.parseInt(guestsStr);
                                conditions.add("r.count >= ?");
                                params.add(guests);
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

            if (choiceOrder.equals("price")) {
                sortColumn = "r.price";
                sortDirection = choiceHighLow.equals("asc") ? "ASC" : "DESC";
            } else if (choiceOrder.equals("rating")) {
                sortColumn = "a.rating";
                sortDirection = choiceHighLow.equals("asc") ? "ASC" : "DESC";
            }

            String sql = "SELECT a.accommodationid, a.category, a.accommodationname, a.grade, a.rating, a.location, " +
                    "r.roomId, r.roomtype, r.count, r.roomcount, r.price, ad.date " +
                    "FROM Accommodations a " +
                    "JOIN Rooms r ON a.accommodationid = r.accommodationid " +
                    "LEFT JOIN AvailableDates ad ON r.roomID = ad.roomID " +
                    "WHERE r.availability = TRUE " +
                    "AND ad.isavailable = TRUE " +
                    "ORDER BY " + sortColumn + " " + sortDirection;

            pstmt = conn.prepareStatement(sql);
        }

        rs = pstmt.executeQuery();

        boolean hasResults = rs.isBeforeFirst();  // 데이터가 있는지 확인
%>
<%
    if (hasResults) {
%>
        <table>
            <tr>
                <th>종류</th>
                <th>숙박업소 이름</th>
                <th>성급</th>
                <th>방 타입</th>
                <th>허용 인원</th>
                <th>예약 가능 일자</th>
                <th>잔여 객실 수</th>
                <th>가격</th>
                <th>위치</th>
                <th>평점</th>
                <th>예약</th>
            </tr>
            <%
                while (rs.next()) {
                    accommodationId = rs.getInt("accommodationid");
                    roomId = rs.getInt("roomid");
            %>
            <tr>
                <td><%= rs.getString("category") %></td>
                <td><%= rs.getString("accommodationname") %></td>
                <td><%= rs.getString("grade") != null ? rs.getString("grade") : "-" %></td>
                <td><%= rs.getString("roomtype") != null ? rs.getString("roomtype") : "-" %></td>
                <td><%= rs.getInt("count") %></td>
                <td><%= rs.getDate("date")%></td>
                <td><%= rs.getInt("roomcount") %></td>
                <td><%= rs.getString("price") %></td>
                <td><%= rs.getString("location") %></td>
                <td><%= rs.getDouble("rating") %></td>
                <td>
                    <a href="add_reservation.jsp?userId=<%= userId %>&accommodationId=<%= accommodationId %>&roomId=<%= roomId %>"><button>예약하기</button></a>
                </td>
            </tr>
            <%
                }
            %>
        </table>
    <%
    } else {
    %>
    <p>죄송합니다. 검색 조건과 일치하는 검색 결과가 존재하지 않습니다.</p>
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
</body>
</html>