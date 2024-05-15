<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.database_project.dao.AccommodationDao" %>
<%@ page import="com.example.database_project.dto.AccommodationDto" %>
<%
    int accommodationId = Integer.parseInt(request.getParameter("accommodationId"));
    AccommodationDao accommodationDao = AccommodationDao.getInstance();
    AccommodationDto accommodation = accommodationDao.getAccommodationById(accommodationId);

    if (accommodation == null) {
        response.sendRedirect("owner_rooms.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>정보 수정</title>
</head>
<body>
<h1>숙소 기본 정보 수정</h1>
<form action="update_accommodation.jsp" method="post">
    <input type="hidden" name="accommodationId" value="<%= accommodationId %>">
    <table>
        <tr>
            <td>종류(Category):</td>
            <td><input type="text" name="category" value="<%= accommodation.getCategory() %>"></td>
        </tr>
        <tr>
            <td>이름(AccommodationName):</td>
            <td><input type="text" name="name" value="<%= accommodation.getAccommodationName() %>"></td>
        </tr>
        <tr>
            <td>위치(Location):</td>
            <td><input type="text" name="location" value="<%= accommodation.getLocation() %>"></td>
        </tr>
        <% if ("호텔/리조트".equals(accommodation.getCategory())) { %>
        <tr>
            <td>성급(Grade):</td>
            <td><input type="text" name="grade" value="<%= accommodation.getGrade() %>" readonly></td>
        </tr>
        <% } %>
        <tr>
            <td>별점(Rating):</td>
            <td><input type="text" name="rating" value="<%= accommodation.getRating() %>" readonly></td>
        </tr>
        <tr>
            <td colspan="2"><button type="submit">수정하기 </button></td>
        </tr>
    </table>
</form>
</body>
</html>
