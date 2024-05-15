<%@ page contentType="text/html;charset=UTF-8"  pageEncoding="utf-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.database_project.dto.AccommodationDto" %>
<%@ page import="com.example.database_project.dao.RoomDao" %>
<%
    int ownerId = (int) session.getAttribute("OwnerID");
    if (ownerId == -1) {
        response.sendRedirect("owner_login.jsp");
        return;
    }

    RoomDao roomDao = RoomDao.getInstance();
    List<AccommodationDto> accommodations = roomDao.getAccommodationByOwnerId(ownerId);

%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="owner_form.js"></script>
    <title>예약 정보</title>
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
<h1>숙소 목록</h1>
<table>
    <tr>
        <th>예약 정보</th>
        <th>종류(Category)</th>
        <th>이름(AccommodationName)</th>
        <th>위치(Location></th>
    </tr>
    <%
        for (AccommodationDto acc : accommodations) {
    %>
    <tr>
        <td><button onclick="loadReservationInfo(<%= acc.getAccommodationId() %>)" >에약 정보</button> </td>
        <td><%= acc.getCategory() %></td>
        <td><%= acc.getAccommodationName() %></td>
        <td><%= acc.getLocation() %></td>
    </tr>
    <%
        }
    %>
</table>


<h1>숙소 예약정보</h1>
<table id="reservationTable">
</table>

</body>
</html>
