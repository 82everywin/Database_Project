<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.database_project.dto.AccommodationDto" %>
<%@ page import="com.example.database_project.dao.RoomDao" %>

<%
    int id = (int) session.getAttribute("OwnerID");
    if (id == -1) {
        response.sendRedirect("owner_login.jsp");
        return;
    }

    RoomDao roomDao = RoomDao.getInstance();
    List<AccommodationDto> accommodations = roomDao.getAccommodationByOwnerId(id);
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>숙소 정보</title>
    <script src="owner_form.js"></script>
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
<h1>숙소 기본정보</h1>
<button onclick="location.href='add_accommodation.jsp'">새로운 숙소 생성</button>
<br/>
<table>
    <tr>
        <th>객실 정보</th>
        <th>고유번호(AccommodationID)</th>
        <th>종류(Category)</th>
        <th>이름(AccommodationName)</th>
        <th>위치(Location)</th>
        <th>성급(Grade)</th>
        <th>별점(Rating)</th>
        <th>비고</th>
    </tr>
    <%
        for (AccommodationDto acc : accommodations) {
    %>
    <tr>
        <td>
            <button onclick="loadRoomInfo(<%= acc.getAccommodationId() %>)" >객실 정보보기</button>
            <button onclick="window.location.href='add_room.jsp?accommodationId=<%= acc.getAccommodationId() %>'">객실 추가</button>
        </td>
        <td><%= acc.getAccommodationId() %></td>
        <td><%= acc.getCategory() %></td>
        <td><%= acc.getAccommodationName() %></td>
        <td><%= acc.getLocation() %></td>
        <td><%= acc.getGrade() %></td>
        <td><%= acc.getRating()%></td>
        <td>
            <button onclick="editAccommodation(<%= acc.getAccommodationId() %>)">수정</button>
            <button onclick="deleteAccommodation(<%= acc.getAccommodationId()%>)">삭제</button>
        </td>
    </tr>
    <%
        }
    %>
</table>

<h1>숙소 객실정보</h1>

<table id="roomsTable">

</table>
<button onclick="location.href='owner_dashboard.jsp'">메인화면 이동</button>
<br/>

</body>
</html>

